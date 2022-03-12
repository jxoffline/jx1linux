Include("\\script\\misc\\timeline\\head.lua")

if not tbTimeLineClass then
	tbTimeLineClass = tbBaseClass:new()
	
	tbTimeLineClass.strType = "BaseTimeLineType";
	tbTimeLineClass.tbData = {};
	tbTimeLineClass.strName = "BaseTimeLine";
	tbTimeLineClass.tbBeginEvent = nil;
	tbTimeLineClass.tbEndEvent = nil;
	tbTimeLineClass.nBeginDayLimit = 0; -- 据开始事件多少天 时间线开启
	tbTimeLineClass.nEndDayLimit = 0; -- 据结束事件多少天 时间线关闭
	tbTimeLineClass.strBeginEventType = "";
	tbTimeLineClass.strEndEventType = "";
	tbTimeLineClass.strBeginEventName = "";
	tbTimeLineClass.strEndEventName = "";
end

function tbTimeLineClass:_init(tbTimeLineData)
	if not tbTimeLineData then
		return 
	end
	for i,j in tbTimeLineData do
		self[i] = j
	end
end

--加载
function tbTimeLineClass:Load()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.Load) == "function" and self.tbBeginEvent:Load() ~= 1) then
		return 0;
	end
	
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.Load) == "function" and self.tbEndEvent:Load() ~= 1) then
		return 0;
	end
	
	return 1;
end

--是否开启了
function tbTimeLineClass:IsBegin()
	-- 如果没有设定时间线开始和结束事件 默认自动开启
	if (self.tbBeginEvent == nil and self.tbEndEvent == nil) then
		return 1;
	end
	
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbEndEvent:GetEventLeftDay();
		-- 如果关闭了
		if ((nEventLeftDay + self.nEndDayLimit) <= 0) then
			return 0;
		end
	end
	
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbBeginEvent:GetEventLeftDay();
		-- 如果开启了
		if ((nEventLeftDay + self.nBeginDayLimit) <= 0) then
			return 1;
		else
			return 0;
		end
	end
	
	return 1;
end

--是否关闭了
function tbTimeLineClass:IsEnd()
	if (self:IsBegin() == 0) then
		return 1;
	else
		return 0;
	end
end

--据开启还剩多久,如果已经开始则为负数是已经开启多久
function tbTimeLineClass:GetOpenLeftDay()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbBeginEvent:GetEventLeftDay();
		return nEventLeftDay + self.nBeginDayLimit;
	end
	
	return 0;
end

--据开启还剩多久,如果已经开始则为负数是已经开启多久
function tbTimeLineClass:GetOpenLeftTime()
	return self:GetOpenLeftDay()*24*60*60;
end

--获取开启的日期20100512
function tbTimeLineClass:GetOpenDay()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventTime) == "function") then
		local nOpenTime = self.tbBeginEvent:GetEventTime() + self.nBeginDayLimit*24*60*60;
		return self:ConvertTimeToTM(nOpenTime);
	end
	
	return 0;
end

--获取开启的时间time_t
function tbTimeLineClass:GetOpenTime()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventTime) == "function") then
		return self.tbBeginEvent:GetEventTime() + self.nBeginDayLimit*24*60*60;
	end
	
	return 0;
end

--获取关闭的日期20100512
function tbTimeLineClass:GetEndDay()
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventTime) == "function") then
		local nEndTime = self.tbEndEvent:GetEventTime() + self.nEndDayLimit*24*60*60;
		return self:ConvertTimeToTM(nEndTime);
	end
	
	return 0;
end

--获取关闭的时间time_t
function tbTimeLineClass:GetEndTime()
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventTime) == "function") then
		local nEndTime = self.tbEndEvent:GetEventTime() + self.nEndDayLimit*24*60*60;
		return nEndTime;
	end
	
	return 0;
end

--据关闭还剩多久,如果已经关闭则为负数是已经关闭了多久
function tbTimeLineClass:GetEndLeftDay()
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbEndEvent:GetEventLeftDay();
		return nEventLeftDay + self.nEndDayLimit;
	end
	
	-- 不会关闭
	return 1;
end

--据关闭还剩多久,如果已经关闭则为负数是已经关闭了多久
function tbTimeLineClass:GetEndLeftTime()
	return self:GetEndLeftDay()*24*60*60;
end

--20100512
function tbTimeLineClass:ConvertTMToTime(nDate)
	local nNowYear = (floor(nDate/10000));
	local nNowMon = floor(mod(nDate, 10000) / 100);
	local nNowDay = mod(nDate, 100);
	return Tm2Time(nNowYear, nNowMon, nNowDay);
end

function tbTimeLineClass:ConvertTimeToTM(nTime)
	local tbTM = Time2Tm(nTime);
	return tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];
end