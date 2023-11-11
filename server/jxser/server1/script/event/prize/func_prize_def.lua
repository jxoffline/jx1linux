OPEN_WINDOW = 0
GET_PRIZE = 1

tbFuncPrize = {}

tbFuncPrize.TSK_STATE = 4030
tbFuncPrize.TSK_TIME = 4031

tbFuncPrize.TIME_OFFSET = 0

tbFuncPrize.STATE_BIT_SONGJIN = 0
tbFuncPrize.STATE_BIT_CHUANGUAN = 1
tbFuncPrize.STATE_BIT_YANDIBAOZANG = 2
tbFuncPrize.STATE_BIT_FENGLINGDU = 3
tbFuncPrize.STATE_BIT_TIANLUTREE = 4
tbFuncPrize.STATE_BIT_AWARDED = 5
tbFuncPrize.STATE_BIT_DAYS = 6
tbFuncPrize.STATE_BIT_DAYS_LEN = 8

tbFuncPrize.TASK_FINISH_COUNT = 2
tbFuncPrize.BAG_LIMIT = 10
tbFuncPrize.ONE_DAY = 3600 * 24

function tbFuncPrize:GetCurTime() 
	local nCurTime = GetCurServerTime()
	nYear = tonumber(FormatTime2String("%Y", nCurTime))
	nMonth = tonumber(FormatTime2String("%m", nCurTime))
	nDay = tonumber(FormatTime2String("%d", nCurTime))
	local nHour = tonumber(GetServerDate("%H")) 
	if nHour < self.TIME_OFFSET then 
		return Tm2Time(nYear, nMonth, nDay, self.TIME_OFFSET) - 24 * 3600 
	else 
		return Tm2Time(nYear, nMonth, nDay, self.TIME_OFFSET) 
	end
end

function tbFuncPrize:CalcUpdateTask()
	local nCurTime = self:GetCurTime()
	local nTime = GetTask(self.TSK_TIME)
	local nDays = GetBitTask(self.TSK_STATE, self.STATE_BIT_DAYS, self.STATE_BIT_DAYS_LEN)
	local nDiff = nCurTime - nTime
	if nDiff == self.ONE_DAY then --隔天了 判断昨天是否完成了任务
		nDays = nDays + 1
	elseif nDiff == 0 then
		return 
	else	--昨天也没做任务 一切从头开始算
		nDays = 1
	end
	if self:CheckFinish() ~= 1 then
		nDays = 1
	end
	return nDays, nCurTime
end

function tbFuncPrize:CheckFinish()
	if self:GetFinishTaskCount() >= self.TASK_FINISH_COUNT then
		return 1
	end
end

function tbFuncPrize:GetFinishTaskCount()
	local nCount = 0
	local tbTaskState = {0, 0, 0, 0, 0}
	for i = 0, 4 do
		tbTaskState[i+1] =  GetBitTask(self.TSK_STATE, i, 1)
		nCount = nCount + tbTaskState[i+1]
	end
	return nCount, tbTaskState[1], tbTaskState[2], tbTaskState[3], tbTaskState[4], tbTaskState[5]
end