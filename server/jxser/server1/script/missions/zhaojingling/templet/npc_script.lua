Include("\\script\\misc\\eventsys\\eventsys.lua")
function main()
	local nNpcIndex = GetLastDiagNpc()
	EventSys:OnEvent("OnDialog", nNpcIndex)
end

function OnTime(nNpcIndex, nTimeOut)
	
	EventSys:OnEvent("OnNpcTime", nNpcIndex, nTimeOut)
end

function OnDeath(nLastDamageNpcIndex)
	EventSys:OnEvent("OnNpcDeath", nLastDamageNpcIndex)
end