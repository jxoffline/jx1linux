-------------------------------------------------------------------------
-- FileName		:	messenger_baoxiangtask.lua
-- Author		:	daizejun
-- CreateTime	:	2011-03-24 
-- Desc			:   千宝库关卡开宝箱任务相关工具函数脚本
-------------------------------------------------------------------------
--Include("\\script\\task\\tollgate\\messenger\\qianbaoku\\messenger_baoxiangtask.lua")--开宝箱工具函数
Include("\\script\\task\\newtask\\newtask_head.lua") --调用 nt_getTask 同步变量到客户端的类

nBaoXiangTotal = 9--总共的宝箱个数
nOpendRequire = 5--任务需要开箱个数


--获取随机的宝箱号码和顺序
function get_task_order()
	local tbSel = {}
	local tbResult = {}
	local nResult = 0
	local i = 1
	while i <= %nOpendRequire do
		local nTmp = random(1,%nBaoXiangTotal)
		if not tbSel[nTmp] then
			tbSel[nTmp] = i
			tbResult[i] = nTmp
			nResult = nResult * 10 + nTmp
			i = i + 1
		end
	end
	
	return nResult,tbResult
end

--将开箱序号转换成字符串
function get_task_string(nCode)
	local szRet = ""
	local nCount = 0
	if nCode then
		while(nCode > 0) do
			local nDigit = mod(nCode, 10)
			nCode = floor(nCode/10)
			if 0==nCount then
				szRet = format("%d",nDigit)
			else
				szRet = format("%d,%s",nDigit,szRet)
			end
			nCount = nCount+1
		end
	end
	return szRet,nCount
end

--打开一个箱子
function add_task_step(nDigit)
	if (not nDigit) or nDigit < 1 or nDigit > %nBaoXiangTotal then
		return
	end
	Uworld1202 = nt_getTask(1202)
	if Uworld1202 >= pow(10, %nOpendRequire) then
		return
	end
	Uworld1202 = Uworld1202 * 10 + nDigit;
	nt_setTask(1202, Uworld1202)
	return check_task_state()
end

--乘方运算
function pow(nBase, nFang)
	local nRet = 1
	for i=1,nFang do
		nRet = nRet * nBase
	end
	return nRet
end

--检查任务状态
function check_task_state()
	local Uworld1201 = nt_getTask(1201)--任务开箱序号
	local Uworld1202 = nt_getTask(1202)--已开箱序号
	local _,n1202DigitCount = get_task_string(Uworld1202)
	if Uworld1201==0 or n1202DigitCount > %nOpendRequire then
		return--任务失败
	elseif Uworld1201==Uworld1202 then
		return 30--任务成功
	elseif floor(Uworld1201/pow(10,%nOpendRequire-n1202DigitCount)) == Uworld1202 then
		return 20--任务可以继续进行
	else
		return 0--任务失败
	end
end

function get_task_daily(nTaskIdx)
	if not nTaskIdx then
		return
	end
	local nTaskValue = nt_getTask(nTaskIdx)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		nt_setTask(nTaskIdx, nTaskValue)
	end
	
	return mod(nTaskValue, 256)
end

function set_task_daily(nTaskIdx, nValue)
	if not nTaskIdx then
		return
	end
	if not nValue then
		nValue = 1
	end
	if nValue >= 256 then
		return
	end

	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nTaskValue = nCurDate * 256 + nValue;
	
	nt_setTask(nTaskIdx, nTaskValue)
	
	return nValue
end

function add_task_daily(nTaskIdx, nAdd)
	if not nTaskIdx or not nAdd then
		return
	end
	local nTaskValue = nt_getTask(nTaskIdx)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	local nValue = 0;
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		nt_setTask(nTaskIdx, nTaskValue)
	else
		nValue = mod(nTaskValue, 256)
	end
	
	nValue = nValue + nAdd
	if nValue < 0 or nValue >= 256 then
		return 
	end
	
	nTaskValue = nTaskValue + nAdd
	nt_setTask(nTaskIdx, nTaskValue)
	
	return nValue
end

