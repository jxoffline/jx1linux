Include("\\script\\misc\\timeline\\timeevent.lua")
Include("\\script\\misc\\timeline\\timelinemanager.lua")

if not fixTE then
	fixTE = tbTimeEventClass:new({});
	fixTE.strType = "FixTimeEvent";
	fixTE.tbData = {};
	fixTE.strName = "FixTimeEvent";
	fixTE.nEventDate = 0;		--在配置表中必填
	fixTE.nEventTime = 0;
end

function fixTE:Load()	
	if (self.nEventDate == nil or type(self.nEventDate) ~= "number" or self.nEventDate == 0) then
		return 0;
	end
	
	self.nEventTime = self:ConvertTMToTime(self.nEventDate);
	return 1;
end

--据据事件当天还剩多久 负数是事件已经过期 单位:天
function fixTE:GetEventLeftDay()
	return self:GetEventLeftTime()/(24 * 60 * 60);
end

--据据事件当天还剩多久 负数是事件已经过期 单位:秒
function fixTE:GetEventLeftTime()
	local nToday = tonumber(GetLocalDate("%Y%m%d"));
	local nNow = self:ConvertTMToTime(nToday);
	return self.nEventTime - nNow;
end

--获取事件的日期20100512
function fixTE:GetEventDay()
	return self.nEventDate;
end

--获取事件的时间time_t
function fixTE:GetEventTime()
	return self.nEventTime;
end

tbTimeLineManager:RegEventTemplete(fixTE);
