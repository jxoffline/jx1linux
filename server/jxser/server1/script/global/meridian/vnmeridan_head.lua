Include("\\script\\vng_lib\\bittask_lib.lua")
tbVnMeridanHead = {}
tbVnMeridanHead.nTSK_DAILY_RESET = 3072
tbVnMeridanHead.nMAX_MERIDAN_TSK_IDX = 1
tbVnMeridanHead.nMAX_EXP_EXCHANGE_TSK_IDX = 2
tbVnMeridanHead.tbBitTask = {
	{
		nTaskID = 3071, --Max meridan use per day
		nStartBit = 1,
		nBitCount = 14,
		nMaxValue = 200000
	},
	{
		nTaskID = 3071, --Max exp exchange per day
		nStartBit = 15,
		nBitCount = 10,
		nMaxValue = 500
	}
}

function tbVnMeridanHead:ResetTaskDaily()
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if nCurDate ~= GetTask(self.nTSK_DAILY_RESET) then
		SetTask(self.nTSK_DAILY_RESET, nCurDate)
		%tbVNG_BitTask_Lib:setBitTask(self.tbBitTask[1], 0)
		%tbVNG_BitTask_Lib:setBitTask(self.tbBitTask[2], 0)
	end
end

function tbVnMeridanHead:AddTaskDaily(nTsk_Idx, nCount)
	self:ResetTaskDaily()
	local tbTempBitTSK = self.tbBitTask[nTsk_Idx]
	%tbVNG_BitTask_Lib:addTask(tbTempBitTSK, nCount)
end

function tbVnMeridanHead:CheckTaskLimit(nTsk_Idx)
	self:ResetTaskDaily()
	local tbTempBitTSK = self.tbBitTask[nTsk_Idx]
	if %tbVNG_BitTask_Lib:IsMaxValue(tbTempBitTSK) == 1 then
		return 0
	end
	return 1
end

function tbVnMeridanHead:GetDailyTaskCount(nTsk_Idx)
	self:ResetTaskDaily()
	local tbTempBitTSK = self.tbBitTask[nTsk_Idx]
	return %tbVNG_BitTask_Lib:getBitTask(tbTempBitTSK)
end

function tbVnMeridanHead:SetDailyTaskCount(nTsk_Idx, nCount)
	self:ResetTaskDaily()
	local tbTempBitTSK = self.tbBitTask[nTsk_Idx]
	%tbVNG_BitTask_Lib:setBitTask(tbTempBitTSK, nCount)
end