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



local varControl = {}

local Control = function(nBaseLevel, szType, hook)
	if hook == "return" then
		nBaseLevel = nBaseLevel + 1
	end
	local t = getinfo(nBaseLevel)
	local szFile = t.source
	local nLine = t.currentline
	local szFuncName = t.name
	local nRet = 1
	if szType == "s" then
		%varControl.bForce = 1
	elseif szType == "n" then
		%varControl.source = szFile
		%varControl.name = szFuncName
	elseif szType == "f" then
		%varControl.source = szFile
		%varControl.name = szFuncName
		%varControl.hook = "return"
	elseif szType == "c" then
		setlinehook()
		setcallhook()
	else
		nRet = nil
	end
	return nRet
end

local Query = function(nBaseLevel, szType, tbVarLocal, hook)
	if strfind(szType, "p .+") then
		local _,_, szExp = strfind(szType, "p (.+)")
		local tbExp = %ParseExp(szExp)
		print(szExp.." = ",  %GetExpValue(tbExp, nBaseLevel + 1, tbVarLocal) ) 
	elseif szType == "bt" then
		%ShowStack(nBaseLevel+1, 10, hook)
	elseif strfind(szType, "set .+=.+") then
		local _,_, szExp, szValue = strfind(szType, "set (.+)%s*=%s*(.+)")
		local varValue = dostring("return "..szValue)
		local tbExp = %ParseExp(szExp)
		if not %SetExpValue(tbExp, nBaseLevel + 1, tbVarLocal, varValue) then
			print("error expression")
		end
	elseif strfind(szType, "break (.-):(%d+)") then
		local _,_,szFile, nLineNo =  strfind(szType, "break (.-):(%d+)")
		addtrap(szFile, nLineNo)
	else
		dostring(szType)	
	end
end

local ProcCmd = function(nBaseLevel, hook)
	local tbVarLocal = %GetLocalVariable(nBaseLevel + 1) --获得断点所在层局部变量
	local szCmd = %_read_()
	while not %Control(nBaseLevel + 1, szCmd, hook) do
		if szCmd == nil then
			exit()
		end
		%Query(nBaseLevel + 1, szCmd, tbVarLocal, hook)
		szCmd = %_read_()
	end
end


local NeedStop = function(nLevel, hook)
	local t = getinfo(nLevel)

	if t.what == "C" then
		return
	end
	
	if %varControl.bForce == 1 then
		%varControl.bForce = nil
		return 1
	elseif t.source == %varControl.source and t.name == %varControl.name then
		if not %varControl.hook or %varControl.hook == hook then
			%varControl.hook = nil
			%varControl.source = nil
			%varControl.name = nil
			return 1
		end
	end
end

local CallHook = function(hook)
	
	local nBreakLevel = 2 

	if %NeedStop(nBreakLevel + 1, hook) then
		%ShowStack(nBreakLevel + 1, 1, hook)
		%ProcCmd(nBreakLevel + 1, hook)		
	end
end

local Hook = function(hook)
	setcallhook(%CallHook)
	setlinehook(%CallHook)
	local nBreakLevel = 2 --指断点所在的层
	%ShowStack(nBreakLevel + 1, 1, hook)
	%ProcCmd(nBreakLevel + 1, hook)
end



function LuaDebug()
	
	setbreakpointhook(%Hook)
end

function LuaUnDebug()
	
	setbreakpointhook()
end