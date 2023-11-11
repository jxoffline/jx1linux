Include("\\script\\misc\\timeline\\timeevent.lua")
Include("\\script\\misc\\timeline\\timelinemanager.lua")

if not refTE then
	refTE = tbTimeEventClass:new({});
	refTE.strType = "RefTimeEvent";
	refTE.tbData = {};
	refTE.strName = "RefTimeEvent";
	refTE.strRefTimeLineName = "";--在配置表中必填
	refTE.tbRefTL = nil;
	refTE.nRefEventTime = 0;
	refTE.bBeginOrEnd = 0; 	--时间线的开始或结束, 0 是以时间线开始的日期作为nRefEventTime; 1是以时间线结束的日期作为nRefEventTime
							--在配置表中必填
end

function refTE:Load()
	if (self.strRefTimeLineName == nil or type(self.strRefTimeLineName) ~= "string" or self.strRefTimeLineName == "") then
		return 0;
	end
	
	return 1;
end

function refTE:DelayLoad()
	if (self.strRefTimeLineName == nil or type(self.strRefTimeLineName) ~= "string" or self.strRefTimeLineName == "") then
		return 0;
	end
	
	local tbTL = tbTimeLineManager:GetTimeLine(self.strRefTimeLineName);
	
	if (tbTL == nil) then
		return 0;
	end
	
	self.tbRefTL = tbTL;
	if (self.bBeginOrEnd == 0) then
		self.nRefEventTime = tbTL:GetOpenTime();
	else
		self.nRefEventTime = tbTL:GetEndTime();
	end
	
	return 1;
end

--据据事件当天还剩多久 负数是事件已经过期 单位:天
function refTE:GetEventLeftDay()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	return self:GetEventLeftTime()/(24 * 60 * 60);
end

--据据事件当天还剩多久 负数是事件已经过期 单位:秒
function refTE:GetEventLeftTime()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	local nToday = tonumber(GetLocalDate("%Y%m%d"));
	local nNow = self:ConvertTMToTime(nToday);
	return self.nRefEventTime - nNow;
end

--获取事件的日期20100512
function refTE:GetEventDay()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	return self:ConvertTimeToTM(self.nRefEventTime);
end

--获取事件的时间time_t
function refTE:GetEventTime()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	return self.nRefEventTime;
end

tbTimeLineManager:RegEventTemplete(refTE);
