Include("\\script\\missions\\battle\\manager.lua")

function get_battle_data(szKey)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if not pDungeon.pBattle then
		return
	end
	local Data = pDungeon.pBattle.Data
	return Data:GetPLData(GetName(), szKey)
end
function set_battle_data(szKey, nValue)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if not pDungeon.pBattle then
		return
	end
	local Data = pDungeon.pBattle.Data
	Data:SetPLData(GetName(), szKey, nValue)
end

function check_queue()
	local szName = GetName()
	local pPrevBattle = BattleManagerPlayer[szName]
	if pPrevBattle then
		local bRet = pPrevBattle:IsInPlaying(szName)
		if bRet then
			return Talk(1, "",  format("Ng≠¨i Æang Î trong %d chi’n tr≠Íng", pPrevBattle.nId))
		else
			return Talk(1, "", format("Ng≠¨i Æang trong %d chi’n tr≠Íng chu»n bﬁ.", pPrevBattle.nId))
		end
	end
end