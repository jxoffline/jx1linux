Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\activitysys\\config\\2\\snowman_battle.lua")
function OnDeath(nNpcIndex)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	
	local nKillerIndex = NpcIdx2PIdx(nNpcIndex)
	if nKillerIndex <= 0 then
		return
	end
	pDungeon:PlayerDeath(nKillerIndex)
end