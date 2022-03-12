Include("\\script\\misc\\eventsys\\eventsys.lua")


function OnDeath(nLastDamageNpcIndex)
	EventSys:OnPlayerEvent(PlayerIndex, "OnPlayerDeath", SubWorldIdx2MapCopy(SubWorld))
end

