Include("\\script\\missions\\battle\\battle.lua")
Include("\\script\\missions\\battle\\scoring.lua")

function OnDeath(nNpcIndex)
	local nMapId = GetWorldPos()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if not pDungeon.pBattle then
		return
	end
	
	local Data = pDungeon.pBattle.Data
	
	local nKillerIndex = NpcIdx2PIdx(nNpcIndex)
	if nKillerIndex <= 0 then
		return
	end
	local szKiller = CallPlayerFunction(nKillerIndex, GetName)
	local szDead = GetName()
	local nKillerCamp = Data:GetPLData(szKiller, "BATTLECAMP")
	local nDeadCamp = Data:GetPLData(szDead, "BATTLECAMP")
	local nKillerRank = Data:GetPLData(szKiller, "CURRANK")
	local nDeadRank = Data:GetPLData(szDead, "CURRANK")
	if nKillerCamp == nDeadCamp then
		return
	end
	Data:AddPLData(szKiller, "KILLPLAYER", 1)
	Data:AddPLData(szDead, "BEKILLED", 1)
	Data:SetPLData(szDead, "SERIESKILL", 0)
	Data:RefreshStayTime(szDead)
	local nScores = ScoringClass:GetScores(nKillerRank, nDeadRank)
	
	if ScoringClass:ValidCombo(nKillerRank, nDeadRank) then
		
		local nCurCombo = Data:GetPLData(szKiller, "SERIESKILL")
		nCurCombo = nCurCombo + 1
		Data:SetPLData(szKiller, "SERIESKILL", nCurCombo)
		if Data:GetPLData(szKiller, "MAXSERIESKILL") < nCurCombo then
			Data:SetPLData(szKiller, "MAXSERIESKILL", nCurCombo)
		end
		if mod(nCurCombo, COMBO_COUNT) == 0 then
			nScores = nScores + COMBO_EXT_SCORES
			CallPlayerFunction(nKillerIndex, Msg2Player, "<color=yellow>Ng­¬i nhËn ®­îc 3 ®iÓm liªn tr¶m"..COMBO_EXT_SCORES)
		end
	end
	Data:AddTotalPoint(szKiller, nScores)
	Data:AddCampPoint(nKillerCamp, nScores)
	local nCurRank = ScoringClass:CalcTitle(Data:GetPLData(szKiller, "TOTALPOINT"))
	Data:SetPLData(szKiller, "CURRANK", nCurRank)
	local szMsg = format("%s[%s]%s®· ®¸nh b¹i%s[%s]%s",
		CAMP_NAME[nKillerCamp],
		TITLE[nKillerRank],
		szKiller,
		CAMP_NAME[nDeadCamp],
		TITLE[nDeadRank],
		szDead)
	Msg2Map(nMapId, szMsg)
	BT_BroadSelf()
	local nLadderNo = CallPlayerFunction(nKillerIndex, BT_SortLadder)
	local tbPlayerIndex = pDungeon.pBattle:GetPlayer()
	pDungeon.pBattle.Data:SyncLadder(nLadderNo - 1, tbPlayerIndex)
	CallPlayerFunction(nKillerIndex, BT_BroadSelf)
end