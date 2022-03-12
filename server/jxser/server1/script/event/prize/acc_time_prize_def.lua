
tbAccTimePrize = {}
tbAccTimePrize.TSK_RECORD_TIME    = 4032						--上次记录时间
tbAccTimePrize.TSK_ACC_TIME    = 4033						--当日累积时间
tbAccTimePrize.TSK_HAVE_AWARD  = 4034						--已领的奖励

tbAccTimePrize.ONE_DAY = 3600 --3600
SEND_ACC_TIME = 1
CHANGE_VISIBILITY = 2


function tbAccTimePrize:GetMorningTime(nTime)
	local nDate = FormatTime2Date(nTime)
	local nYear = nDate/10000
	local nMonth = mod(nDate, 10000) / 100
	local nDay = mod(nDate, 100)
	return Tm2Time(nYear, nMonth, nDay, 0)
end

function tbAccTimePrize:IsSameDay(nTime1, nTime2)
	local nDate1 = FormatTime2Date(nTime1)
	local nDate2 = FormatTime2Date(nTime2)
	return nDate1 == nDate2
end

function tbAccTimePrize:GetCurAccTime()
	local nRecordTime = GetTask(self.TSK_RECORD_TIME)
	local nCurTime = GetCurServerTime()
	if nRecordTime == 0 then
		nRecordTime = nCurTime
	end
	local nDiff = nCurTime - nRecordTime
	
	if self:IsSameDay(nRecordTime, nCurTime) ~= 1 then 
		return nCurTime - self:GetMorningTime(nCurTime)
	else
		return nDiff + GetTask(self.TSK_ACC_TIME)	
	end
	
end
