-- 基础IO函数
local _read_ = function() 
	local nPakIdx = 0
	if usepack then
		nPakIdx  = usepack(0)
	end
	write("--------------------\n")
	write("Debug>>>: ")
	local szBuff = read()
	if usepack then
		usepack(nPakIdx)
	end
	return szBuff
end
-- 基础IO函数
local _write_ = function(...)
	local nPakIdx = 0
	if usepack then
		 nPakIdx  = usepack(0)
	end
	call(write,arg)
	if usepack then
		usepack(nPakIdx)
	end
end

-------------------
local Match = function(szExp , szRegx)
	if szExp then
		local _, _, szBuff, szOther = strfind(szExp, szRegx)
		return szBuff, szOther
	end
end

local ParseExp = function (szExp)
	if not szExp then return end
	local tbExp = {}
	local szOp = nil
	local szVar = nil
	while (szExp) do
		szVar, szExp = %Match(szExp,  "([a-zA-Z0-9_]+)(.*)")
		if szVar then
			tinsert(tbExp, szVar)
		end
		szOp, szExp =  %Match(szExp, "([%.%+%-%*/%[])(.*)")
		if szOp then
			tinsert(tbExp, szOp)
		end
	end
	return tbExp
end

---------debug 相关的函数--------------------------

local GetVar = function(szVar, nLevel, tbLocal)
	local tmp = tonumber(szVar)
	if not tmp then
		if tbLocal[szVar] then
			_, tmp = getlocal(nLevel, tbLocal[szVar] )	
		end
	end
	if not tmp then
		tmp = getglobal(szVar)
	end
	return tmp
end	

local calcExp = function(op, v, tmp, nLevel, tbLocal)
	if op == "." then
		return v[tmp]	
	elseif op == "[" and tonumber(tmp)  then
		return v[tonumber(tmp)]
	elseif op == "+" then
		return v + %GetVar(tmp, nLevel + 1, tbLocal)
	elseif op == "-" then
		return v - %GetVar(tmp, nLevel + 1, tbLocal)
	elseif op == "*" then
		return v * %GetVar(tmp, nLevel + 1, tbLocal)
	elseif op == "/" then
		return v / %GetVar(tmp, nLevel + 1, tbLocal)
	else
		return
	end
	
end

local  GetExpValue = function(tbExp, nLevel, tbLocal)
	local v = %GetVar( tbExp[1], nLevel + 1, tbLocal)
	local op = nil
	
	for i=2, getn(tbExp) - 1, 2 do
		if not v then
			return nil
		end
		op = tbExp[i]
		if op then
			v = %calcExp(op, v, tbExp[i + 1], nLevel + 1, tbLocal)
		else
			return v
		end
	end
	return v
end

local SetExpValue = function(tbExp, nLevel, tbLocal, varValue)
	local nCount = getn(tbExp)
	if nCount == 1 then
		local nHook = tbLocal[tbExp[1]]
		if not nHook then
			return
		end
		setlocal(nLevel, nHook, varValue)
	elseif nCount > 1 then
		local szKey = tbExp[nCount]
		tremove(tbExp, nCount )
		szKey = tonumber(szKey) or szKey
		local tb = %GetExpValue(tbExp, nLevel+1, tbLocal)
		tb[szKey] = varValue
	else
		return 
	end
	return 1
end

local GetLocalVariable = function (nLevel)
	local tbLocal = {}	
	local i = 1
	local k,v = getlocal(nLevel, i)
	while k do 
		tbLocal[k] = i
		i = i + 1
		k,v = getlocal(nLevel, i)
	end
	return tbLocal
end



CurCmd = ""

local TmpBreak= {}

local Break = {}



local IsAtBreakPoint = function (info)
	for i=1, getn(%Break) do
		local pBreak = %Break[i]
		if pBreak.currentline or info.currentline == -1 then
			local nFlag = 1
			for k,v in pBreak do		
				if v ~= info[k] then
					nFlag = nil
					break
				end
			end
			if nFlag then
				return 1
			end
		end
	end
end


local NeedStop = function(nLevel, varType)
	local t=getinfo(nLevel)
	if %IsAtBreakPoint(t) then
		return 1
	end
	if CurCmd == "c" then
		return
	end
	local source = t.source or ""
	local name = t.name or ""
	if CurCmd == "s" then
		return 1
	end
	if (CurCmd == "s" or CurCmd == "n") and %TmpBreak[source] and %TmpBreak[source][name] then
		return 1
	end
end


local ShowCurStack = function (nBaseLevel, hook)
	local t=getinfo(nBaseLevel)
	local nCurline = t.currentline
	local szSource = t.source
	if hook == "call" then
		nCurline = t.linedefined
	elseif hook == "return" then
		local t2 = getinfo(nBaseLevel + 1)
		nCurline = t2.currentline
		szSource = t2.source
	end
	
	local szMsg = format(" %s ",type(hook) ~= "number" and hook or "")
	
	if t.what ~= "main" then
		szMsg = szMsg..t.what.." function "
	else
		szMsg = szMsg..t.what.." "
	end
		
	if t.name then
		szMsg = szMsg.."'"..t.name.."'"
	end
	szMsg = szMsg.."\n\t\t"
	szMsg = szMsg.."["..szSource.."]"
	szMsg = szMsg.."("..nCurline..")"
	return szMsg
end

local ShowStack = function (nBaseLevel, nCount, hook)
	print("\nbreak in stack traceback:")
	
	nCount = nCount or 10
	for i=nBaseLevel, nBaseLevel + nCount - 1 do
		local t=getinfo(i)
		if t then
			local szMsg = format("\t%d:", i - nBaseLevel + 1)
			if i == nBaseLevel then
				szMsg = szMsg..%ShowCurStack(i + 1, hook)
			else
				szMsg = szMsg..%ShowCurStack(i + 1)
			end
			print(szMsg)
		end
		
	end
end


local ProcCmd = function(nBaseLevel, hook)
	local tbVarLocal = %GetLocalVariable(nBaseLevel + 1) --获得断点所在层局部变量
	
	local szCmd = %_read_()

	while szCmd ~= "c"  and szCmd ~= "s" and szCmd ~= "n" and szCmd ~= "finish" do
		
		if szCmd == nil then
			exit()
		end
		
		if strfind(szCmd, "p .+") then
			local _,_, szExp = strfind(szCmd, "p (.+)")
			local tbExp = %ParseExp(szExp)
			print(szExp.." = ",  %GetExpValue(tbExp, nBaseLevel + 1, tbVarLocal) ) 
			
		elseif szCmd == "bt" then
			%ShowStack(nBaseLevel+1, 10, hook)
		elseif strfind(szCmd, "set .+=.+") then
			local _,_, szExp, szValue = strfind(szCmd, "set (.+)%s*=%s*(.+)")
			local varValue = dostring("return "..szValue)
			local tbExp = %ParseExp(szExp)
			if not %SetExpValue(tbExp, nBaseLevel + 1, tbVarLocal, varValue) then
				print("error expression")
			end
		
		elseif strfind(szCmd, "break (.-):(%d+)") then
			local _,_,szFile, nLineNo =  strfind(szCmd, "break (.-):(%d+)")
			
			tinsert(%Break, {source = szFile, currentline = tonumber(nLineNo)})
		else
			dostring(szCmd)	
		end
		
		szCmd = %_read_()
	end
	
	CurCmd = szCmd
	
	if CurCmd == "finish" then
		local t = getinfo(nBaseLevel)
		if %TmpBreak[t.source] then
			%TmpBreak[t.source][t.name] = nil
		end
	end
	
end



local Hook = function (hook)
	
	local nBreakLevel = 2 --指断点所在的层
	
	if CurCmd ~= "n" and hook == "call" then
		local t = getinfo(nBreakLevel)
		local source = t.source or ""
		local name = t.name or ""
		%TmpBreak[source] = %TmpBreak[source] or {}
		%TmpBreak[source][name] = 1
		
	elseif CurCmd ~= "n" and hook == "return" then
		local t = getinfo(nBreakLevel)
		local source = t.source or ""
		local name = t.name or ""
		%TmpBreak[source] = %TmpBreak[source] or {}
		%TmpBreak[source][name] = nil
		
	end
	if not %NeedStop(nBreakLevel + 1, hook) then
		return
	end
	%ShowStack(nBreakLevel + 1, 1, hook)
	%ProcCmd(nBreakLevel + 1, hook)
end 





function LuaDebug()
	setlinehook(%Hook)
	setcallhook(%Hook)
end

function LuaUnDebug()
	setlinehook()
	setcallhook()
end

function SetLineBreak(szFile, nLineNo)
	
	tinsert(%Break, {source = szFile, currentline = nLineNo})
end

function SetCallBreak(szFile, szFunc)
	
	tinsert(%Break, {source = szFile, name = szFunc})	
	CurCmd = "n"
end

SCB = SetCallBreak
SLB = SetLineBreak

