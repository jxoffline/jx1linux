Include("\\script\\misc\\timeline\\head.lua")

if not tbTimeEventClass then
	tbTimeEventClass = tbBaseClass:new()
	
	tbTimeEventClass.strType = "BaseTimeEventType"
	tbTimeEventClass.tbData = {}
	tbTimeEventClass.strName = "BaseTimeEvent"
end

function tbTimeEventClass:_init(tbEventData)
	if not tbEventData then
		return 
	end
	for i,j in tbEventData do
		self[i] = j
	end
end

--加载
function tbTimeEventClass:Load()
	return 0;
end

--据据事件当天还剩多久 负数是事件已经过期 单位:天
function tbTimeEventClass:GetEventLeftDay()
	return 0;
end

--据据事件当天还剩多久 负数是事件已经过期 单位:秒
function tbTimeEventClass:GetEventLeftTime()
	return 0;
end

--获取事件的日期20100512
function tbTimeEventClass:GetEventDay()
	return 0;
end

--获取事件的时间time_t
function tbTimeEventClass:GetEventTime()
	return 0;
end

--20100512
function tbTimeEventClass:ConvertTMToTime(nDate)
	local nNowYear = (floor(nDate/10000));
	local nNowMon = floor(mod(nDate, 10000) / 100);
	local nNowDay = mod(nDate, 100);
	return Tm2Time(nNowYear, nNowMon, nNowDay);
end

--time_t
function tbTimeEventClass:ConvertTimeToTM(nTime)
	local tbTM = Time2Tm(nTime);
	return tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];
end
