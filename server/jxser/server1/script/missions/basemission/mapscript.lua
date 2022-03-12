Include("\\script\\maps\\newworldscript_default.lua")

Include("\\script\\missions\\basemission\\dungeon.lua")

function OnNewWorld(szParam)
	local nMapId = SubWorldIdx2ID(SubWorld)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		OnNewWorldDefault(szParam)
		NewWorld(11, 3143, 5065)
	else
		OnNewWorldDefault(szParam)
		local nPlayerIndex = PlayerIndex
		local nPak = usepack(pDungeon.nPak)
		CallPlayerFunction(nPlayerIndex, pDungeon.OnEnterMap, pDungeon)
		usepack(nPak)
	end
	
end


function OnLeaveWorld(szParam)	
	local nMapId = SubWorldIdx2ID(SubWorld)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		OnLeaveWorldDefault(szParam)
	else
		OnLeaveWorldDefault(szParam)
		local nPlayerIndex = PlayerIndex
		local nPak = usepack(pDungeon.nPak)
		CallPlayerFunction(nPlayerIndex, pDungeon.OnLeaveMap, pDungeon)
		usepack(nPak)
	end
end