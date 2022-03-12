Include("\\script\\missions\\dangboss\\dangbaossclass.lua")
function OnDeath(nNpcIndex)
	return tbDangBoss:PlayerOnDeath(nNpcIndex)
end