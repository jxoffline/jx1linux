Include("\\script\\missions\\datusha\\area.lua")
Include("\\script\\missions\\datusha\\timerlist.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\lib\\coordinate.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TIMER")
MAP_ID = 896
PREPARE_TIME = 10 * 60
CLOSE_AREA_TIME = 3 * 60
PREPARE_COUNTING_DOWN = 1
FORECAST_TIME = 2 * 60
CLOSE_COUNTING_DOWN = 15
TOTAL_TIME = 40 * 60

TSK_TOTAL_SCORES_DATA = 2590
TSK_TOTAL_SCORES = 2591
TSK_FINAL_AWARD = 2592
MIN_PLAYER_COUNT = 2
PLAYER_LIFE_COUNT = 5
LadderId = 10269
AreaName = 
{
	[1] = "Kû", [4] = "DuyÖn",  [7] = "Thanh ", 
	[2] = "Tõ", [5] = "D­¬ng",  [8] = "Kinh", 
	[3] = "Dù", [6] = "l­¬ng ",  [9] = "Ung", 
}

DaTuShaClass = Dungeon:new_type("Lo¹n ChiÕn Cöu Ch©u Cèc")

DaTuShaClass.Scores = {}
DaTuShaClass.Rank = {}
DaTuShaClass.LastMan = {}



function DaTuShaClass:_init()
	DaTuShaClass.LastMan = {}
	DaTuShaClass.Scores = {}
	DaTuShaClass.Rank = {}
	self.IsClosing = nil
	self.nState = 1
	self.tbPlayer = {}
	self.nCloseAreaCount = 0
	self.nCampCount = 0
	self.nSurvivorCount = 0
	self:CreateCloseSequence()
	self:InitArea(self.nMapId, "\\settings\\maps\\tianxingku\\room.txt")
	self:InitTimeList()
	
	ClearMapObj(self.nMapId)
	ClearMapNpcWithName(self.nMapId, " ")
	ClearMapNpcWithName(self.nMapId, "Thèng lÜnh Cöu Ch©u Cèc")
	
	
	local tmp = AreaClass:new("", self.nMapId, 51168, 103200, 55680, 110560)
	
	tmp:ChangeState(1)
   
	
	
	local tbNpc = {szName = "Thèng lÜnh Cöu Ch©u Cèc", nNpcId = 1411, nLevel = 95, szScriptPath = "\\script\\missions\\datusha\\tongshuai_npc.lua"}
	local tbPoint = getndata("\\settings\\maps\\tianxingku\\buy.txt", 62);
	for i=1, getn(tbPoint) do
		basemission_CallNpc(tbNpc, self.nMapId, tbPoint[i][1], tbPoint[i][2])
	end
	return 1
end

function DaTuShaClass:InitTimeList()
	self.TimerList = DaTuShaTimer:new()
	self.TimerList:Add(60 * 18, self.OnTime, {self, {nTime = 0,nLost = 60}})
end

function DaTuShaClass:OnTime(TIME)
	TIME.nTime= TIME.nTime + TIME.nLost
	local nTime = TIME.nTime
	if nTime < PREPARE_TIME then
		self.nState = 1
	elseif nTime >= PREPARE_TIME and nTime < TOTAL_TIME then
		if self.nState == 1 then
			Msg2Map(self.nMapId, "B¸t ®Çu chÝnh thøc tû vâ! X«ng lªn nµo!")
			self:BeginDatusha()
		end
		self.nState = 2
	elseif nTime >= TOTAL_TIME then
		self.nState = 3
	end
	if self.nState == 1 then
		TIME.nLost = self:PrepareState(nTime)
		 
	elseif self.nState == 2 then
		TIME.nLost = self:RunState(nTime - PREPARE_TIME)
	elseif self.nState == 3 then
		self:close()
		TIME.nLost = 0
	end
	return TIME.nLost * 18
end

function DaTuShaClass:BeginDatusha()
	
	for szName, tbData in self.tbPlayer do
		local nPlayerIndex = SearchPlayer(szName)
		if tbData and nPlayerIndex > 0 then
			if self.nSurvivorCount < MIN_PLAYER_COUNT then				
				CallPlayerFunction(nPlayerIndex, tbAwardTemplet.Give, tbAwardTemplet, {nExp_tl = 5e6}, 1, {"Lo¹n ChiÕn Cöu Ch©u Cèc","PhÇn th­ëng an ñi"})
				CallPlayerFunction(nPlayerIndex, NewWorld, unpack(tbData.tbSignUpPos))
				CallPlayerFunction(nPlayerIndex, Msg2Player, "Xin l­îng thø, do nh©n sè b¸o danh qu¸ Ýt, cuéc thi lÇn nµy bÞ hñy bá.")
			else
				CallPlayerFunction(nPlayerIndex, SetFightState, 1)
				DaTuShaClass.Scores[szName] = 0
			end
		end
	end
end

function DaTuShaClass:PrepareState(nTime)	
	local nRemainTime = PREPARE_TIME - nTime
	if mod(nTime, 60) == 0 and nRemainTime > 60 then
		Msg2Map(self.nMapId, format("Kho¶ng c¸ch b¾t ®Çu ho¹t ®éng cßn %d gi©y, xin c¸c ch­ vÞ cao thñ chuÈn bÞ.", nRemainTime))
		return 60
	elseif nRemainTime <= 10 or nRemainTime == 60 then
		Msg2Map(self.nMapId, format("Kho¶ng c¸ch b¾t ®Çu ho¹t ®éng cßn %d gi©y, xin c¸c ch­ vÞ cao thñ chuÈn bÞ.", nRemainTime))	
		return 1
	elseif nRemainTime < 60 then
		return 1
	else
		return 60
	end 
end

function DaTuShaClass:RunState(nTime)
	local nModTime = mod(nTime, 3*60)
	if nModTime >= 2 * 60 then
		self:Forecast(3*60 - nModTime)
	end
	
	if nTime > 0 and nModTime == 0 then
		self:AreaClose()
	end
	if mod(nTime, 60 * 5) == 0 then
		self:CallNpc()
	end
	if mod(nTime, 60) == 0 then
		self:ReportPersonInfo()
	end
	
	
	return 15
end

function DaTuShaClass:ReportPersonInfo()
	local tbData = self:SortRank()
	for i=1, getn(tbData) do
		local szName = tbData[i][1]
		local pData = tbData[i][3]
		local nPlayerIndex = SearchPlayer(szName)
		if pData and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, Msg2Player,format("§iÓm tÝch lòy: %d", pData.nScores))
			CallPlayerFunction(nPlayerIndex, Msg2Player,format("XÕp h¹ng: h¹ng thø %d", i ))
			CallPlayerFunction(nPlayerIndex, Msg2Player,format("Sè lÇn phôc sinh cßn l¹i: %d", pData.nLife))
		end
		
	end
end

function DaTuShaClass:CallNpc()
	
	
	ClearMapNpcWithName(self.nMapId, " ")
	
	local tbNpc = {szName = " ", nNpcId = 1409, nLevel = 95, pCallBack = function (self, nNpcIndex) ForbitSyncName(nNpcIndex, 1) end, }
	local tbPoint = getndata("\\settings\\maps\\tianxingku\\npc.txt", 100);
	for i=1, getn(tbPoint) do
		basemission_CallNpc(tbNpc, self.nMapId, tbPoint[i][1], tbPoint[i][2])
	end
	
end

function DaTuShaClass:Forecast(nTime)	
	local nAreaId = self.tbCloseSequence[self.nCloseAreaCount + 1]
	if nAreaId and self.tbArea[nAreaId] then
		local szMsg =format("<color=yellow>[%s]<color>Khu", self.tbArea[nAreaId].szName)
		szMsg = format("%s s¾p<color=yellow>%d<color> gi©y sau sÏ ®ãng, xin c¸c ch­ vÞ rêi khái khu vùc nµy!", szMsg, nTime)
		Msg2Map(self.nMapId, szMsg)
	end	
end

function DaTuShaClass:AreaClose()
	self.nCloseAreaCount = self.nCloseAreaCount + 1
	local nAreaId = self.tbCloseSequence[self.nCloseAreaCount]
	if self.tbArea[nAreaId] then
		local szMsg =format("<color=yellow>[%s]<color>", self.tbArea[nAreaId].szName)
		szMsg = format("%s khu  ®ãng l¹i", szMsg, nTime)
		Msg2Map(self.nMapId, szMsg)
		self.tbArea[nAreaId]:ChangeState(1)
	end
	for i=1, getn(self.tbArea) do
		local pArea = self.tbArea[i]
		if pArea.nState == 1 then
			self:ProcPlayerInArea(pArea)
		end
	end
end


function DaTuShaClass:CreateCloseSequence()
	self.tbCloseSequence = {}
	for i=1, 9 do
		self.tbCloseSequence[i] = i
	end
	for i=1, 9 do
		local nId1 = random(1,9)
		local nId2 = random(1,9)
		self.tbCloseSequence[nId1], self.tbCloseSequence[nId2] = self.tbCloseSequence[nId2], self.tbCloseSequence[nId1] 
	end
end

function DaTuShaClass:ProcPlayerInArea(pArea)
	for szName, tbData in self.tbPlayer do
		local nPlayerIndex = SearchPlayer(szName)
		if tbData and nPlayerIndex > 0 then
			local nX, nY, nMapIndex = CallPlayerFunction(nPlayerIndex, GetPos)
			local nMapId = SubWorldIdx2ID(nMapIndex)
			if pArea:IsInArea(nMapId, nX, nY) then
				CallPlayerFunction(nPlayerIndex, NewWorld, unpack(tbData.tbSignUpPos))
			end
		end
	end
end

function DaTuShaClass:InitArea(nMapId, szFile)
	self.tbArea = {}
	if TabFile_Load(szFile, szFile) == 0 then
		print(format("[%s]\t Load setting file is fail", "datusha mission"))
		return 0;
	end

	local nCount = TabFile_GetRowCount(szFile)
	
	if nCount < 17 then
		print(format("[%s]\t Load setting file is error", "datusha mission"))
		return 0
	end
	for i=1, 3 do
		for j=1, 3 do
			local nId1 = 1+(i-1)*4 + j
			local nId2 = 6+(i-1)*4 + j
			local x1	= tonumber(TabFile_GetCell(szFile, nId1, "TRAPX"))
			local y1	= tonumber(TabFile_GetCell(szFile, nId1, "TRAPY"))
			local x2	= tonumber(TabFile_GetCell(szFile, nId2, "TRAPX"))
			local y2	= tonumber(TabFile_GetCell(szFile, nId2, "TRAPY"))
			local nAreaId = (i-1) * 3 + j
			self.tbArea[nAreaId] = AreaClass:new(AreaName[nAreaId], nMapId, x1, y1, x2, y2)
		end
	end
end

function DaTuShaClass:OnEnterMap()

	self.nCampCount = self.nCampCount + 1
	local pData = self.tbPlayer[GetName()]
	if not pData then
		return NewWorld(176,1660,3266)
	end
	
	self.nSurvivorCount = self.nSurvivorCount + 1
	pData.nLife = PLAYER_LIFE_COUNT
	pData.nScores = 0	
	pData.nTotalScores = GetPlayerTotalScores()
	
	ForbitSyncName(PIdx2NpcIdx(PlayerIndex), 1)
	ForbitTalk(1)
	ForbitSyncAura(1)
	DisabledUseTownP(1)
	SetDeathType(-1)
	ForbitTrade(0)
	DisabledStall(1)
	ForbidEnmity( 1 )
	SetLogoutRV(1)
	if self.nState == 1 then
		SetFightState(0)
	elseif self.nState == 2 then
		SetFightState(1)
	end
	SetPunish(0)
	SetTmpCamp(self.nCampCount)
	ChangeOwnFeature( 0,0,1373)
	SetDeathScript("\\script\\missions\\datusha\\playerdeath.lua")
end

function DaTuShaClass:OnLeaveMap()
	self.nSurvivorCount = self.nSurvivorCount - 1
	local tbProp = {6,1,1714,-1}
	
	ConsumeItem(-1, CalcItemCount(-1,tbProp[1], tbProp[2],tbProp[3],tbProp[4]),tbProp[1], tbProp[2],tbProp[3],tbProp[4]);
	
	local szName = GetName()
	local pData = self.tbPlayer[szName]
	if pData then
		SetTempRevPos(unpack(pData.tbSignUpPos))
		SetPlayerTotalScores(pData.nTotalScores)
		Ladder_NewLadder(LadderId, szName, pData.nTotalScores, 1);
	end
	self.tbPlayer[szName] = nil
	
	
	ForbitSyncName(PIdx2NpcIdx(PlayerIndex),0)
	ForbitTalk(0)
	ForbitSyncAura(0)
	DisabledUseTownP(0)
	SetDeathType(0)
	ForbitTrade(0)
	DisabledStall(0)
	ForbidEnmity(0)
	--SetLogoutRV(0)
	SetFightState(0)
	SetPunish(1)
	SetCreateTeam(0);
	SetTmpCamp(0)
	RestoreOwnFeature()
	SetDeathScript("")
	
	TM_StopTimer(105)
	
	if self.nState == 2 and self.IsClosing == nil and (self.nCloseAreaCount == getn(self.tbArea) or self.nSurvivorCount < 2) then
		self:close()
	end
end

function DaTuShaClass:close()
	self.IsClosing = 1
	self.TimerList:Clear()
	self:SortRank()
	
	if self.nSurvivorCount == 1 then
		for szName, pData in self.tbPlayer do
			local nPlayerIndex = SearchPlayer(szName)
			if pData and nPlayerIndex > 0 then	
				DaTuShaClass.LastMan.szName = szName
				CallPlayerFunction(nPlayerIndex, Msg2Player, "Xin chóc mõng ®¹i hiÖp ®· trë thµnh dòng sü cuèi cïng.")
			end
		end
	end
	
	for szName, pData in self.tbPlayer do
		local nPlayerIndex = SearchPlayer(szName)
		if pData and nPlayerIndex > 0 then		
			CallPlayerFunction(nPlayerIndex, NewWorld, unpack(pData.tbSignUpPos))
		end
	end
	ClearMapObj(self.nMapId)
	ClearMapNpcWithName(self.nMapId, " ")
	ClearMapNpcWithName(self.nMapId, "Thèng lÜnh Cöu Ch©u Cèc")
	self:free()
end

function DaTuShaClass:GotoDaTuSha()
	local nPosX, nPosY = getadata("\\settings\\maps\\tianxingku\\npc.txt", 2, 15);
	NewWorld(self.nMapId, floor(nPosX/32), floor(nPosY/32))
end

function DaTuShaClass:Open()
	if SubWorldID2Idx(MAP_ID) >= 0 then
		DaTuShaClass:new(MAP_ID)
	end
end

local Cmp = function(a, b)
	return a[2] > b[2]
end
function DaTuShaClass:SortRank()
	DaTuShaClass.Rank = {}
	for szName, nScores in DaTuShaClass.Scores do
		local pData = self.tbPlayer[szName]
		if pData then
			DaTuShaClass.Scores[szName] = pData.nScores
		end
		tinsert(DaTuShaClass.Rank, {szName, nScores, pData})
	end
	sort(DaTuShaClass.Rank, %Cmp)
	return DaTuShaClass.Rank
end

function ModifData(szKey, nValue)
	local nPak = usepack(DaTuShaClass.nPak)
	setglobal(szKey, nValue)
	usepack(nPak)
end

function GetPlayerTotalScores()
	local nCurData = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(TSK_TOTAL_SCORES_DATA) == nCurData then
		return GetTask(TSK_TOTAL_SCORES)
	else
		return 0
	end
end

function SetPlayerTotalScores(nValue)
	local nCurData = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(TSK_TOTAL_SCORES_DATA) ~= nCurData then
		SetTask(TSK_TOTAL_SCORES_DATA, nCurData)
	end
	SetTask(TSK_TOTAL_SCORES, nValue)
end