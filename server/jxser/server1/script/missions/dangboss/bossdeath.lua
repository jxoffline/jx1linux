Include("\\script\\missions\\dangboss\\dangbaossclass.lua")
function OnDeath(nNpcIndex)
	return tbDangBoss:BossOnDeath(nNpcIndex)
end