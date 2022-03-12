Include("\\script\\misc\\eventsys\\type\\player.lua")
function OnOffline()
	EventSys:GetType("OnOffline"):OnPlayerEvent(0, PlayerIndex)
end