IncludeLib("BATTLE")
IncludeLib("TITLE")
Include("\\script\\trip\\define.lua")

BattleData = {}

PL_DATA = 
{
	TOTALPOINT = {1, 751},
	KILLPLAYER = {2,702},
	KILLNPC = {3, 703},	
	BEKILLED = {4, 704},
	MAXSERIESKILL = {13, 713},		--Íæ¼ÒÕû¸öÕ½¾ÖµÄ×î´óÁ¬Õ¶Êý
	SERIESKILL = {14, 714},			--Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý
	CURRANK = {27, 727},
	BATTLECAMP = {43, 743},
	--BATTLEPOINT = {47, 747},	--¼ÇÂ¼Íæ¼Ò±¾Õ½ÒÛµÄ×Ü»ý·Ö£¬×Ü»ý·ÖÊÇÍæ¼ÒËù²Î¼ÓµÄ¸÷³¡Õ½¾ÖµÄ»ý·Ö×ÜºÍ, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
}
GAME_DATA = 
{
	
	MAP_ID = 4,
	RESTTIME = 8,
}

CAMP_SONG = 1
CAMP_KIM = 2
CAMP_NAME = {[CAMP_SONG] = "Phe Tèng", [CAMP_KIM] = "Phe Kim"}
TITLE = {"<color=white>Binh SÜ<color>", "<color=0xa0ff>HiÖu óy<color>", "<color=0xff>Thèng LÜnh<color>", "<color=yellow>Phã T­íng<color>", "<bclr=red>§¹i T­íng<bclr><color>"}
TITLE_EFFECT = 
{
	[CAMP_SONG] = {89,90,91,92,93},
	[CAMP_KIM] = {94,95,96,97,98},
}

function BattleData:NewPlayer(szName, nCamp)
	
	--self:ClearUIData(szName)
	if not self.tbPlayer[szName] then
		self.tbPlayer[szName]  = {}
		for k, v in PL_DATA do
			self:SetPLData(szName, k, 0)
		end
	else
		for k, v in PL_DATA do
			self:SetPLData(szName, k, self.tbPlayer[szName][k])
		end
	end
	self:SetPLData(szName, "BATTLECAMP", nCamp)
	self:SetPLData(szName, "CURRANK", 1)
	self:SyncData(szName)
	self:RefreshStayTime(szName)
	return self.tbPlayer[szName]
end

function BattleData:ClearData(szName)
	if not self.tbPlayer[szName] then
		return
	end
	for k, v in %PL_DATA do
		if k ~= "BATTLECAMP" then			
			self.tbPlayer[szName][k] = 0
		end
	end
	self.tbPlayer[szName].nStayTime = nil
end

function BattleData:GetStayTime(szName)
	local nNowTime = GetGameTime()
	if not self.tbPlayer[szName] then
		return nNowTime
	end
	return self.tbPlayer[szName].nStayTime or nNowTime
end

function BattleData:RefreshStayTime(szName)
	if self.tbPlayer[szName] then
		self.tbPlayer[szName].nStayTime = GetGameTime()
	end
end

function BattleData:AddTotalPoint(szName, nPoint)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local tbEquip = CallPlayerFunction(nPlayerIndex, GetAllEquipment)
		local nMaskIndex = tbEquip[12]
		local nAddPoint = nPoint
		if nMaskIndex > 0 then
			local szKey = format("%d,%d,%d", GetItemProp(nMaskIndex))
			if szKey == "0,11,482" then
				nAddPoint = floor(nPoint * 3)
			elseif szKey == "0,11,446" or szKey == "0,11,450" then
				nAddPoint = floor(nPoint * 1.5)
			elseif szKey == "0,11,447" then
				nAddPoint = floor(nPoint * 2)
			end
		end
		self:AddPLData(szName, "TOTALPOINT", nAddPoint)
		self:SetTotalPoint(szName, self:GetTotalPoint(szName) + nAddPoint)
	end	
end

function BattleData:GetTotalPoint(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 0
	end
	return CallPlayerFunction(nPlayerIndex, GetTask, %TSK_TRIP_BATTLE_POINT)
end

function BattleData:SetTotalPoint(szName, nPoint)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	CallPlayerFunction(nPlayerIndex, SetTask, %TSK_TRIP_BATTLE_POINT, nPoint)
end

function BattleData:GetPLData(szName, szKey)
	local pPlayer = self.tbPlayer[szName]
	if not pPlayer then
		return 0
	end
	if not szKey then
		return pPlayer
	end
	return pPlayer[szKey]
end

function BattleData:SetPLData(szName, szKey, nValue)
	local pPlayer = self.tbPlayer[szName]
	if not pPlayer then
		return 0
	end
	if not szKey then
		return pPlayer
	end
	local tbDataId = PL_DATA[szKey]
	if not tbDataId then
		return 0
	end
	if szKey == "CURRANK" then
		self:RemoveTitle(szName)
	end
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex,  BT_SetData, tbDataId[1], nValue)
	end
	pPlayer[szKey] = nValue
	if szKey == "CURRANK" then
		self:ActiveTitle(szName)
	end
end

function BattleData:ActiveTitle(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	local nCamp = self:GetPLData(szName, "BATTLECAMP")
	local nCurRank = self:GetPLData(szName, "CURRANK")
	if nCamp and nCurRank and TITLE_EFFECT[nCamp] then
		local nTitleEffectId = TITLE_EFFECT[nCamp][nCurRank]
		if nTitleEffectId then
			CallPlayerFunction(nPlayerIndex, Title_AddTitle, nTitleEffectId, 0, 9999999)
			CallPlayerFunction(nPlayerIndex, Title_ActiveTitle, nTitleEffectId)
		end
	end
end

function BattleData:RemoveTitle(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	local nCamp = self:GetPLData(szName, "BATTLECAMP")
	local nCurRank = self:GetPLData(szName, "CURRANK")
	if nCamp and nCurRank and TITLE_EFFECT[nCamp] then
		local nTitleEffectId = TITLE_EFFECT[nCamp][nCurRank]
		if nTitleEffectId then
			CallPlayerFunction(nPlayerIndex, Title_RemoveTitle, nTitleEffectId)
			CallPlayerFunction(nPlayerIndex, Title_ActiveTitle, 0)
		end
	end
end

function BattleData:AddPLData(szName, szKey, nValue)
	local nCurValue = self:GetPLData(szName, szKey)
	self:SetPLData(szName, szKey, nCurValue + nValue)
end

function BattleData:GetCampPoint(nCamp)
	if self.tbCampPoint[nCamp] then
		return self.tbCampPoint[nCamp]
	else
		return 0
	end
end
function BattleData:AddCampPoint(nCamp, nValue)
	if self.tbCampPoint[nCamp] then
		self.tbCampPoint[nCamp] = self.tbCampPoint[nCamp] + nValue
	end
end

function BattleData:_init()	
	self.tbPlayer = {}
	self.tbCampPoint = {}
	self.tbCampPoint[CAMP_SONG] = 0
	self.tbCampPoint[CAMP_KIM] = 0
	
end

function BattleData:SyncCampSize(nSize1, nSize2, tbPlayerIndex)
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SendMemberCount(nSize1, nSize2, tbPlayerIndex)
	self:UseMapIdx(nMapIndex)
end

function BattleData:SetRestTime(nRestTime)
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SetGameData(GAME_DATA.RESTTIME, nRestTime)
	self:UseMapIdx(nMapIndex)
end

function BattleData:InitData(nMapId)
	self.nMapId = nMapId
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SetGameData(GAME_DATA.MAP_ID, nMapId)
	for k, v in PL_DATA do
		if v and v[1] and v[2] then
			BT_SetType2Task(v[1], v[2])
		end
	end	
	BT_SetView(PL_DATA.TOTALPOINT[1])
	BT_SetView(PL_DATA.KILLPLAYER[1])
	BT_SetView(PL_DATA.BEKILLED[1])
	BT_SetView(PL_DATA.MAXSERIESKILL[1])	
	self:UseMapIdx(nMapIndex)
end

function BattleData:new()
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb:_init()
	return tb
end

function BattleData:SyncLadder(nLadderNo, tbPlayerIndex)
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	BT_SendLadderNo(nLadderNo, tbPlayerIndex)
	self:UseMapIdx(nMapIndex)
end

function BattleData:ClearUIData(szName)
	self:RemoveTitle(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
		CallPlayerFunction(nPlayerIndex, BT_ClearPlayerData)
		CallPlayerFunction(nPlayerIndex, BT_LeaveBattle)
		self:UseMapIdx(nMapIndex)
	end
end

function BattleData:UseMapIdx(nMapIndex)
	local nCurMapIndex = SubWorld
	SubWorld = nMapIndex
	return nCurMapIndex
end

function BattleData:SetGameInfo(tbInfo)
	
	local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))
	if tbInfo then
		BT_SetBattleName(tbInfo.szBattleName)
		BT_SetMissionName(tbInfo.szMissionName)
		BT_SetMissionDesc(tbInfo.szMissionDesc)
		self.szMiniMap = tbInfo.szMiniMap
	end
	self:UseMapIdx(nMapIndex)
end

function BattleData:SyncData(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local nMapIndex = self:UseMapIdx(SubWorldID2Idx(self.nMapId))		
		CallPlayerFunction(nPlayerIndex, BT_ChangeMiniMap,self.nMapId, self.szMiniMap)
		CallPlayerFunction(nPlayerIndex, BT_BroadGameData)
		CallPlayerFunction(nPlayerIndex, BT_BroadBattleDesc)
		CallPlayerFunction(nPlayerIndex, BT_ViewBattleStart)
		CallPlayerFunction(nPlayerIndex, BT_BroadView)
		CallPlayerFunction(nPlayerIndex, BT_BroadSelf)
		for i=1, 10 do
			self:SyncLadder(i-1, {nPlayerIndex})
		end
		self:UseMapIdx(nMapIndex)
	end
end