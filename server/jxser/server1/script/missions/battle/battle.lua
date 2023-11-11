Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\missions\\battle\\data.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\battle\\lib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")


PLAYER_COUNT_DIFFERENCE = 5
CAMP_PLAYER_MAX_COUNT = 150
NEED_PLAYER_COUNT = 100
MIN_NEED_PLAYER_COUNT = 10

MIN_POINT_LIMIT = 1000


DRAW_POINT = 900
WIN_POINT = 1200
LOSE_POINT = 600


SIGNUP_STATE = 1
PREPARE_STATE = 2
RUN_STATE = 3
OVER_STATE = 4
CHANNEL_ID = {[CAMP_SONG]=9, [CAMP_KIM]=10}
SIGNUP_FRAME = 15 * 60 *18

TICKET = {szName = "LÖnh Bµi Tèng Kim Liªn Server",tbProp = {6,1,3307,-1},nCount = 1}


BattleClass = {}

function BattleClass:new(nId, pManager)
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb:_init(nId, pManager)
	return tb
end

function BattleClass:InitChannel()
	self.szChannel = {}
	for k, v in CHANNEL_ID do
		 local szId = format("%s trËn thø %d", CAMP_NAME[k], self.nId)
		self.szChannel[k] = szId
		CreateChannel(szId, v)
	end
end

function BattleClass:_init(nId, pManager)
	self.nState = SIGNUP_STATE
	self.tbWaiting = {}
	self.tbWaiting[CAMP_SONG] = %List.new()
	self.tbWaiting[CAMP_KIM] = %List.new()
	self.tbPlaying = {}
	self.tbPlaying[CAMP_SONG] = %Hash.new()
	self.tbPlaying[CAMP_KIM] = %Hash.new()
	self.Name2Camp = {}
	self.PayUserList = {}
	self.nId = nId
	self.pManager = pManager
	self.tbSignUpPos = pManager.tbSignUpPos
	self.Data = BattleData:new()	
	self:InitChannel()
	self.pRule = nil
	self.nTimerId = TimerList:AddTimer(self, SIGNUP_FRAME)
end

function BattleClass:OnTime()
	
	if %List.size(self.tbWaiting[CAMP_SONG]) < MIN_NEED_PLAYER_COUNT or %List.size(self.tbWaiting[CAMP_KIM]) < MIN_NEED_PLAYER_COUNT then
		return 1
	end
	if self:Run() then
		self.nTimerId = nil
		return 0
	else
		return 1
	end
end

function BattleClass:ProcWaiting()
	--ÈÃÁ½¸öÕóÓªÈËÊýÏàµÈ
	local nCurSong = %Hash.size(self.tbPlaying[CAMP_SONG])
	local nCurKim = %Hash.size(self.tbPlaying[CAMP_KIM])
	local flag = 1
	while flag do
		flag = nil
		local nWaitingSong = %List.size(self.tbWaiting[CAMP_SONG])
		local nWaitingKim = %List.size(self.tbWaiting[CAMP_KIM])
	
		if nCurSong < CAMP_PLAYER_MAX_COUNT and nWaitingSong > 0  then
			self:Waiting2Playing(1, CAMP_SONG)
			flag = 1
		end
		if nCurKim < CAMP_PLAYER_MAX_COUNT and nWaitingKim > 0 then
			self:Waiting2Playing(1, CAMP_KIM)
			flag = 1
		end		
		nCurSong = %Hash.size(self.tbPlaying[CAMP_SONG])
		nCurKim = %Hash.size(self.tbPlaying[CAMP_KIM])
	end
end

function BattleClass:Waiting2Playing(nCount, nCamp)
	if nCount <= 0 then
		return
	end
	for i=1, nCount do
		local szName = %List.pop(self.tbWaiting[nCamp])
		if not szName or szName == "" then
			break
		end
		self:EnterMap(szName, nCamp)
	end
end

function BattleClass:CancelWaiting(szName)
	%List.del(self.tbWaiting[CAMP_SONG], szName)
	%List.del(self.tbWaiting[CAMP_KIM], szName)
end

function BattleClass:LeaveMap(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, NewWorld, unpack(self.tbSignUpPos))
	end
end

function BattleClass:AskEnterMap(szName, nCamp)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return
	end
	if not self.pRule then
		return
	end
	local szTitle = format("TrËn thø %d Tèng kim b¾t ®Çu, cã muèn ®i vµo chiÕn tr­êng kh«ng", self.nId)
	local tbOpt = 
	{
		{"Muèn", self.EnterMap, {self, szName, nCamp}},
		{"Chän l¹i", DynamicExecuteByPlayer, {nPlayerIndex, "\\script\\missions\\battle\\protocol_gs.lua", "dialog", 1}},
		{"Rêi khái ®éi ngò"},
	}
	 
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle, tbOpt)
	return 1
end

function BattleClass:EnterMap(szName, nCamp)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return
	end
	if not self.pRule then
		return
	end
	
	self.Name2Camp[szName] = nCamp
	local nMapId, nX, nY = self.pRule:GetEnterPos(nCamp)
	CallPlayerFunction(nPlayerIndex, NewWorld, nMapId, nX, nY)
	return 1
end

function BattleClass:JoinPlaying(szName)
	local nCamp = self.Name2Camp[szName]
	if nCamp then
		%Hash.add(self.tbPlaying[nCamp], szName, 1)
		self.Data:ClearUIData(szName)
		self:SyncCampSize()
		self.Data:NewPlayer(szName, nCamp)
		
		local nPlayerIndex = SearchPlayer(szName)
		if nPlayerIndex > 0 then
			EnterChannel(PlayerIndex, self.szChannel[nCamp])
		end
		return 1
	end
end

function BattleClass:GetPlayerCamp(szName)
	return self.Name2Camp[szName]
end

function BattleClass:CheckLimit()
	local tbProp = {6,1,3307,-1}
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) >= nCount then
		return 1
	end
end

function BattleClass:ClearPlayerData(szName)
	self.Data:ClearData(szName)
	local nCamp = self.Name2Camp[szName]
	self.Name2Camp[szName] = nil
	self.PayUserList[szName] = nil
	if nCamp then
		%Hash.del(self.tbPlaying[nCamp], szName)
	end
	self:CancelWaiting(szName)
end

function BattleClass:IsInPlaying(szName)
	local nCamp = self.Name2Camp[szName]
	if nCamp then
		return %Hash.get(self.tbPlaying[nCamp], szName)
	end
end

function BattleClass:QuitPlaying(szName)
	local nCamp = self.Name2Camp[szName]
	if nCamp then
		%Hash.del(self.tbPlaying[nCamp], szName)
		self.Data:ClearUIData(szName)
		self:SyncCampSize()
		local nPlayerIndex = SearchPlayer(szName)
		if nPlayerIndex > 0 then
			LeaveChannel(nPlayerIndex, self.szChannel[nCamp])
		end
		self.Name2Camp[szName] = nil
		self:ProcWaiting()
	end
end

function BattleClass:JoinWaiting(szName, nCamp)	
	
	self:CancelWaiting(szName)
	local nCurSong = %Hash.size(self.tbPlaying[CAMP_SONG]) + %List.size(self.tbWaiting[CAMP_SONG])
	local nCurKim = %Hash.size(self.tbPlaying[CAMP_KIM]) + %List.size(self.tbWaiting[CAMP_KIM])
	-- ÕóÓª±¨ÃûÈËÊýÉÏÏÞÌáÊ¾
	if (nCamp == CAMP_SONG and nCurSong >= CAMP_PLAYER_MAX_COUNT) or
	 		(nCamp == CAMP_KIM and nCurKim >= CAMP_PLAYER_MAX_COUNT) then
		Talk(1, "", format("Sè ng­êi trong trËn doanh ®¬n ®Êu dung n¹p nhiÒu nhÊt lµ %d ng­êi, mêi gia nhËp n¬i kh¸c hoÆc tham gia trËn kh¸c.", CAMP_PLAYER_MAX_COUNT))
		return 
	end
	
	if (nCamp == CAMP_SONG and nCurSong - nCurKim >= PLAYER_COUNT_DIFFERENCE) or
			(nCamp == CAMP_KIM and nCurKim - nCurSong >= PLAYER_COUNT_DIFFERENCE) then
		Talk(1, "", format("Qu©n sè t¹i qu©n danh nµy ®· qu¸ nhiÒu ( chªnh lÖch nhau kh«ng ®­îc qu¸ %d ng­êi ), ng­¬i cã thÓ chän mét qu©n doanh kh¸c ®Ó gia nhËp.", PLAYER_COUNT_DIFFERENCE))
		return 
	end
	
	if not self.PayUserList[szName] then
		local tbProp = %TICKET.tbProp
		local nCount = %TICKET.nCount
		if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) >= nCount then
			ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
			self.PayUserList[szName] = 1
		else
			Talk(1, "", format("CÇn %d c¸i %s míi ®­îc b¸o danh", nCount, %TICKET.szName))
			return
		end
	end
	
	if nCamp == CAMP_SONG or nCamp == CAMP_KIM then
		%List.push(self.tbWaiting[nCamp], szName)
	end
	if self.nState ~= SIGNUP_STATE then
		self:ProcWaiting()
	else
		local nWaitingSong = %List.size(self.tbWaiting[CAMP_SONG])
		local nWaitingKim = %List.size(self.tbWaiting[CAMP_KIM])
		local nCount = nWaitingSong + nWaitingKim
		if nCount >= NEED_PLAYER_COUNT and abs(nWaitingSong - nWaitingKim) <= PLAYER_COUNT_DIFFERENCE  then
			if self:Run() and self.nTimerId then
				TimerList:DelTimer(self.nTimerId)
				self.nTimerId = nil
			end
			
		end
	end
	return 1
end

function BattleClass:GetInfo()
	local tbInfo = {
		nCount1 = %Hash.size(self.tbPlaying[CAMP_SONG]),
		nWaiting1 = %List.size(self.tbWaiting[CAMP_SONG]),
		nCount2 = %Hash.size(self.tbPlaying[CAMP_KIM]),
		nWaiting2 = %List.size(self.tbWaiting[CAMP_KIM]),
		nState = self.nState,
		nId = self.nId
	}
--	if self.nTimerId and self.nState == SIGNUP_STATE then
--		tbInfo.nLastTime = TimerList:GetRestTime(self.nTimerId)
--	elseif self.pRule and self.nState == PREPARE_STATE then
--		tbInfo.nLastTime = self.pRule.nRestTime - RUNNING_TIME
--	elseif self.pRule and self.nState == RUN_STATE then
--		tbInfo.nLastTime = self.pRule.nRestTime
--	end
	return tbInfo
end

function BattleClass:Run()
	if self.pRule then
		return
	end
	local pDungeonType = DungeonType["Tèng Kim liªn server"]
	if not pDungeonType then
		error("lost rule why?")
		return
	end
	self.pRule = pDungeonType:new_rule(self)
	if self.pRule then
		self:ProcWaiting()
		self.nState = PREPARE_STATE
		self.pManager:CreateBattle()
		return 1
	end
end
function BattleClass:Judge()
	local nSongPoint = self.Data:GetCampPoint(CAMP_SONG)
	local nKimPoint = self.Data:GetCampPoint(CAMP_KIM)
	if nSongPoint == nKimPoint then
		return 0
	elseif nSongPoint > nKimPoint then
		return CAMP_SONG
	else
		return CAMP_KIM
	end
end

function BattleClass:CancelAllWaiting(nCamp, szReason)
	for i=1, %List.size(self.tbWaiting[nCamp]) do
		local szName = %List.pop(self.tbWaiting[nCamp])
		self.pManager:SetPrevId(szName, nil)
		local nPlayerIndex = SearchPlayer(szName)
		if szReason and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, Msg2Player, szReason)
		end
	end
end

function BattleClass:OnBattleFinish(nCamp, nWinCamp)
	for szName, pData in %Hash.pairs(self.tbPlaying[nCamp]) do
		self.pManager:SetPrevId(szName, nil)
		local nPlayerIndex = SearchPlayer(szName)
		if pData and nPlayerIndex > 0 then
			if CallPlayerFunction(nPlayerIndex, self.Data.GetPLData, self.Data, szName, "TOTALPOINT") >= MIN_POINT_LIMIT then
				local nExtPoint = 0
				if nWinCamp == 0 then
					nExtPoint = DRAW_POINT
				elseif nCamp == nWinCamp then
					nExtPoint = WIN_POINT
				else
					nExtPoint = LOSE_POINT	
				end
				CallPlayerFunction(nPlayerIndex, Msg2Player, format("Ng­¬i nhËn ®­îc %d ®iÓm cèng hiÕn liªn server.", nExtPoint))
				CallPlayerFunction(nPlayerIndex, self.Data.AddTotalPoint, self.Data, szName, nExtPoint)
			end
			CallPlayerFunction(nPlayerIndex, Msg2Player, "Tèng Kim kÕt thóc")
			self:LeaveMap(szName)
		end
	end
end

function BattleClass:OnClose()
	local nWinCamp = self:Judge()
	
	if nWinCamp == 0 then
		Msg2Map(self.pRule.nMapId, format("KÕt qu¶ hßa"))
	else
		Msg2Map(self.pRule.nMapId, format("%s th¾ng lîi", CAMP_NAME[nWinCamp]))
	end
	
	self.pManager:DeleteBattle(self.nId)
	
	for k, nCamp in {CAMP_SONG, CAMP_KIM} do
		self:CancelAllWaiting(nCamp, "Tèng Kim ®· kÕt thóc, xin h·y chän l¹i ®éi ngò")
		self:OnBattleFinish(nCamp, nWinCamp)
	end
	
end

function BattleClass:GetPlayer()
	local tbPlayerIndex = {}
	for k, nCamp in {CAMP_SONG, CAMP_KIM} do
		for szName, pData in %Hash.pairs(self.tbPlaying[nCamp]) do
			local nPlayerIndex = SearchPlayer(szName)
			if pData and nPlayerIndex > 0 then
				tinsert(tbPlayerIndex, nPlayerIndex)
			end
		end
	end
	return tbPlayerIndex
end

function BattleClass:SyncCampSize()
	local nSize1 = %Hash.size(self.tbPlaying[CAMP_SONG])
	local nSize2 = %Hash.size(self.tbPlaying[CAMP_KIM])
	self.Data:SyncCampSize(nSize1, nSize2, self:GetPlayer())
	
	
end


	

TestBattleClass = {}
for k, v in BattleClass do
	TestBattleClass[k] = v
end
function TestBattleClass:_init()
	
	self.tbWaiting = {}
	self.tbWaiting[CAMP_SONG] = %List.new()
	self.tbWaiting[CAMP_KIM] = %List.new()
	self.tbPlaying = {}
	self.tbPlaying[CAMP_SONG] = %Hash.new()
	self.tbPlaying[CAMP_KIM] = %Hash.new()
end
function TestBattleClass:Waiting2Playing(nCount, nCamp)
	local szName = %List.pop(self.tbWaiting[nCamp])
	%Hash.add(self.tbPlaying[nCamp], szName, 1)
end

function TestBattleClass:TestProcWaiting(Id, tbTestData)
	self:_init()
	for i=1, tbTestData[1] do
		%Hash.add(self.tbPlaying[CAMP_SONG], "A"..i, 1)
	end
	for i=1, tbTestData[2] do
		%Hash.add(self.tbPlaying[CAMP_KIM], "B"..i, 1)
	end
	for i=1, tbTestData[3] do
		%List.push(self.tbWaiting[CAMP_SONG], "AA"..i)
	end
	for i=1, tbTestData[4] do
		%List.push(self.tbWaiting[CAMP_KIM], "BB"..i)
	end
	
	self:ProcWaiting()
	local nCurSong = %Hash.size(self.tbPlaying[CAMP_SONG])
	local nCurKim = %Hash.size(self.tbPlaying[CAMP_KIM])
	local nWaitingSong = %List.size(self.tbWaiting[CAMP_SONG])
	local nWaitingKim = %List.size(self.tbWaiting[CAMP_KIM])
	local nRe = (tbTestData[5] == nCurSong and tbTestData[6] == nCurKim and tbTestData[7] == nWaitingSong and tbTestData[8] == nWaitingKim)
	if not nRe then
		print("nCurKim/nCurKim", nCurSong, nCurKim)
		print("nWaitingSong/nWaitingKim", nWaitingSong, nWaitingKim)
	end
	print(Id, "Result", nRe)
end

TestBattleClass.tbTestDataList =
{
	--{Ä¿Ç°ËÎÈËÊý,Ä¿Ç°½ðÈËÊý,µÈ´ýËÎÈËÊý,µÈ´ý½ðÈËÊý,½á¹ûËÎ,½á¹û½ð,½á¹ûµÈËÎ,½á¹ûµÈ½ð},
	{50,30,0,0,50,30,0,0},
	{50,30,50,0,50,30,50,0},
	{50,30,50,20,55,50,45,0},
	{10,10,1,0,11,10,0,0},
	{10,10,0,1,10,11,0,0},
	{150,150, 1,2,150,150,1,2},
	{15,10,1,0,15,10,1,0},
	{15,10,0,1,15,11,0,0},
	{10,15,1,0,11,15,0,0},
	{10,15,0,1,10,15,0,1},
	{10,10,1,1,11,11,0,0},
	{0, 0, 30,50, 30,35,0,15},
	{0, 0, 30,34, 30,34,0,0},
	{0, 0, 30,19, 24,19,6,0},
	{0, 0, 30,0, 5,0,25,0},
	{150,149, 1,2,150,150,1,1},
	{150,149, 1,0,150,149,1,0},
}

function TestBattleClass:RunTest()
	for i=1, getn(self.tbTestDataList) do
		TestBattleClass:TestProcWaiting(i, self.tbTestDataList[i])
	end
end



--TestBattleClass:RunTest()

