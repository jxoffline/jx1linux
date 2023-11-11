Include("\\script\\missions\\battle\\battle.lua")
Include("\\script\\missions\\battle\\manager.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")


function get_rule()
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	return pDungeon
end

function get_battle()
	local pDungeon = get_rule()
	if not pDungeon then
		return
	end
	return pDungeon.pBattle
end

function get_pl_data(szKey)
	local pBattle = get_battle()
	if not pBattle then
		return
	end
	return pBattle.Data:GetPLData(GetName(), szKey)
end

function set_pl_data(szKey, var)
	local pBattle = get_battle()
	if not pBattle then
		return
	end
	return pBattle.Data:SetPLData(GetName(), szKey, var)
end
function add_camp_point(nCamp, nPoint)
	local pBattle = get_battle()
	if not pBattle then
		return
	end
	pBattle.Data:AddCampPoint(nCamp, nPoint)
end

function open_battle(nId)
	
	local nMapId = GetWorldPos()
	local pManager = BattleManagerList[nMapId]

	if not pManager then
		return
	end
	local pBattle = pManager:GetBattle(nId)
	if not pBattle then
		Msg2Player("no battle")
		return
	end
	pBattle:Run()
end

function open_battle(nId)
	
	local nMapId = GetWorldPos()
	local pManager = DungeonList[nMapId]

	if not pManager then
		return
	end
	local pBattle = pManager:GetBattle(nId)
	if not pBattle then
		Msg2Player("no battle")
		return
	end
	pBattle:Run()
end

function close_battle()
	
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]

	if not pDungeon then
		return
	end
	pDungeon:close()
end