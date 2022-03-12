Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\activitysys\\config\\2\\snowman_battle.lua")
function OnDeath(nNpcIndex)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	
	if PlayerIndex and PlayerIndex > 0 then
	pDungeon:SnowmanDeath(nNpcIndex)
	end
end
