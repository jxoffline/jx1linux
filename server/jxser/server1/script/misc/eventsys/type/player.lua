Include("\\script\\misc\\eventsys\\eventsys.lua")

local pEventType =  EventSys:NewType("OnLogin")
function pEventType:GetDelayCount()
	return getn(self.MapEvnent)	
end


local pLogoutEventType =  EventSys:NewType("OnLogout")
EventSys:NewType("OnPlayerLevelUp")
EventSys:NewType("OnOffline")

EventSys:NewType("OnEnterTrapPoint")

EventSys:NewType("OnMoneyChange")
EventSys:NewType("OnChannelChat")
EventSys:NewType("OnAddTitle")
EventSys:NewType("OnUseItem")