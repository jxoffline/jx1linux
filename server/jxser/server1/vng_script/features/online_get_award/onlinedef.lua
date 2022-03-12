Include("\\script\\misc\\eventsys\\type\\player.lua")

tbAccOnlineTime = tbAccOnlineTime or {}
tbAccOnlineTime.TSK_LAST_ONLINETIME = 2696
tbAccOnlineTime.TSK_SAVE_TIME = 2697
tbAccOnlineTime.DATE_END = 20160229

function tbAccOnlineTime:ConvertTMToTime(nDate)
	local nNowYear = (floor(nDate/10000));
	local nNowMon = floor(mod(nDate, 10000) / 100);
	local nNowDay = mod(nDate, 100);	
	--print("-----ConvertTMToTime - : "..Tm2Time(nNowYear, nNowMon, nNowDay))
	return Tm2Time(nNowYear, nNowMon, nNowDay);
end

function tbAccOnlineTime:OnLogin(bExchangeIn)
	if self:IsActive() ~= 1 then
		return
	end
----print("==============OnLogin==============")
	if bExchangeIn == 1 then
		return
	end
	local nLastLogInTime = GetTask(self.TSK_LAST_ONLINETIME)
	local nTodayTime = self:ConvertTMToTime(tonumber(GetLocalDate("%Y%m%d")));
	if(nTodayTime > nLastLogInTime) then
		SetTask(self.TSK_SAVE_TIME, 0)
		--print("-----OnLogin - TSK_SAVE_TIME: "..GetTask(self.TSK_SAVE_TIME))
	end
	SetTask(self.TSK_LAST_ONLINETIME, GetCurServerTime())
	--print("-----OnLogin - TSK_LAST_ONLINETIME: "..GetTask(self.TSK_LAST_ONLINETIME))
	SyncTaskValue(self.TSK_LAST_ONLINETIME)
end

function tbAccOnlineTime:OnUpdateTimeData()
	local nNowTime = GetCurServerTime()
	local nLastLogInTime = GetTask(self.TSK_LAST_ONLINETIME)
	local nTodayTime = self:ConvertTMToTime(tonumber(GetLocalDate("%Y%m%d")));
	if(nTodayTime <= nLastLogInTime) then
		SetTask(self.TSK_SAVE_TIME,GetTask(self.TSK_SAVE_TIME) +  (nNowTime - nLastLogInTime))
	else
		SetTask(self.TSK_SAVE_TIME, nNowTime - nTodayTime)
	end
	--print("-----OnUpdateTimeData - TSK_SAVE_TIME: "..GetTask(self.TSK_SAVE_TIME))
	SyncTaskValue(self.TSK_SAVE_TIME)
end

function tbAccOnlineTime:IsActive()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if nCurDate <= tbAccOnlineTime.DATE_END then
		return 1
	end
	return 0
end

function tbAccOnlineTime:OnLogout(bExchangeIn)
	if self:IsActive() ~= 1 then
		return
	end
----print("==============OnLogout==============")
	if(bExchangeIn == 1 or ST_GetOffliveState() == 1)then
		return
	end	
	self:OnUpdateTimeData()
end

function tbAccOnlineTime:OnOffline(bExchangeIn)
	if self:IsActive() ~= 1 then
		return
	end
----print("==============OnOffline==============")
	if(bExchangeIn == 1)then
		return
	end
	self:OnUpdateTimeData()
end

EventSys:GetType("OnLogin"):Reg(0, tbAccOnlineTime.OnLogin, tbAccOnlineTime)
EventSys:GetType("OnLogout"):Reg(0, tbAccOnlineTime.OnLogout, tbAccOnlineTime)
EventSys:GetType("OnOffline"):Reg(0, tbAccOnlineTime.OnOffline, tbAccOnlineTime)
