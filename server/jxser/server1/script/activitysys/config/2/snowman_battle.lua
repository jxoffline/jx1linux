Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\item\\forbiditem.lua")
Include("\\script\\activitysys\\config\\2\\head.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

SnowmanBattleGame = Dungeon:new_type("snowman battle")
SnowmanBattleGame.nPak = curpack()
SnowmanBattleGame.nMaxPlayer = 150

SnowmanBattleGame.TEMPLATE_MAP_ID = 986
SnowmanBattleGame.nRound = 0
SnowmanBattleGame.tbSnowmanId = {
	[1] = 1330,
	[2] = 1329,
}

SnowmanBattleGame.tbForbitItemType = 
{
	"CALLNPC",
	"TRANSFER",
}

SnowmanBattleGame.nBattleTime = 30 * 60

SnowmanBattleGame.GAME_STATE_NOT_START	= 0
SnowmanBattleGame.GAME_STATE_STARTED	= 1
SnowmanBattleGame.GAME_STATE_END			= 2
SnowmanBattleGame.nTime = 0

SnowmanBattleGame.nBattleState = 0
SnowmanBattleGame.tbPoint = {
	["snowman"] = 10,
	["player"] = 50,
	["special_player"] = 200
}

function SnowmanBattleGame:StartBattle()
	if self.nBattleState ~= self.GAME_STATE_NOT_START then
		return
	end
	
	ClearMapNpc(self.nMapId)
	ClearMapTrap(self.nMapId)
	
	self.nBattleState = self.GAME_STATE_STARTED
	self.tbPlayerList = {}
	self.tbPlayerCount = {[1]=0, [2]=0}
	self.tbSnowmanCount = {[1]=0, [2]=0}
	self.tbCampPoint = {[1]=0, [2]=0}

	local szScriptFile = "\\script\\activitysys\\config\\2\\snowman_script.lua"
	
	
	self:AddSnowman(1, self.tbSnowmanId[1], "Ng≠Íi Tuy’t Tˆ Sæc", "\\settings\\activitysys\\2\\snowman_pos_1.txt", szScriptFile)
	self:AddSnowman(2, self.tbSnowmanId[2], "Ng≠Íi Tuy’t Hoµng Sæc", "\\settings\\activitysys\\2\\snowman_pos_2.txt", szScriptFile)
	
	self:AddTimer(self.nBattleTime * 18, self.OnTime, {self})
	self:AddTimer(60 * 18, self.OnBroadcast, {self})
end

function SnowmanBattleGame:OnEnterMap()
	if self.nBattleState ~= self.GAME_STATE_STARTED then
		print("ERROR!!Player Can enter when the battle is not started.")
	end
	
	local nCamp,nType = pActivity:SB_GetPlayerCamp()
	if nCamp ~= 1 and nCamp ~= 2 then
		NewWorld(176, 1449, 3263)
		return
	end
	
	pActivity:SB_ChangeToSnowman()

	SetTmpCamp(nCamp)
	SetLogoutRV(1)
	SetFightState(1)
	SetPKFlag(1)
	ForbidEnmity(1)
	LeaveTeam()
	DisabledUseTownP(1)
	ForbidChangePK(1)
	DisabledUseHeart(1)
	SetCreateTeam(0)
	
	SetDeathScript("\\script\\activitysys\\config\\2\\player_script.lua")
	AddSkillState(963, 1, 0, 3 * 18)
	SetProtectTime(3*18)
	
	
	local szName = GetName()
	self.tbPlayerList[szName] = 1
	
	self.tbPlayerCount[nCamp] = self.tbPlayerCount[nCamp] + 1
	if self.tbPlayerCount[nCamp] == self.nMaxPlayer then
		local hParam = OB_Create()
		ObjBuffer:PushObject(hParam, nCamp)
		ObjBuffer:PushObject(hParam, 1)
		RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua", "SnowmanBattle:SetPlayerLimit", hParam)
		OB_Release(hParam)
	end
end

function SnowmanBattleGame:OnLeaveMap()
	local nCamp,nType = pActivity:SB_GetPlayerCamp()
	if nCamp ~= 1 and nCamp ~= 2 then
		return
	end
	
	ForbidEnmity(0)
	SetPKFlag(0)
	SetFightState(0)
	SetTmpCamp(0)
	DisabledUseTownP(0)
	ForbidChangePK(0)
	SetDeathScript("")
	DisabledUseHeart(0)
	SetCreateTeam(1)
	
	local szName = GetName()
	self.tbPlayerList[szName] = nil
	
	self.tbPlayerCount[nCamp] = self.tbPlayerCount[nCamp] - 1
	if self.tbPlayerCount[nCamp] == self.nMaxPlayer - 1 then
		local hParam = OB_Create()
		ObjBuffer:PushObject(hParam, nCamp)
		ObjBuffer:PushObject(hParam, 0)
		RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua", "SnowmanBattle:SetPlayerLimit", hParam)
		OB_Release(hParam)
	end
end

function SnowmanBattleGame:KinckOutAllPlayer()
	for szName, nFlag in self.tbPlayerList do
		local nPlayerIndex = SearchPlayer(szName)
		if nFlag and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, NewWorld, 176, 1449, 3263)
		end
	end
end

function SnowmanBattleGame:AddSnowman(nCamp, nNpcId, szName, szPosFile, szScriptFile)
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	if nMapIndex < 0 then
		return
	end
	
	local nRow = GetTabFileHeight(szPosFile)
	if nRow < 1 then
		return
	end
	local tbPos = {}
	for i=1, nRow do
		local nX = GetTabFileData(szPosFile, i + 1, 1) * 32
		local nY = GetTabFileData(szPosFile, i + 1, 2) * 32
		local nNpcIndex = AddNpcEx(nNpcId, 95, random(0,4), nMapIndex, nX, nY, 1, szName, 0)
		if nNpcIndex > 0 then
			self.tbSnowmanCount[nCamp] = self.tbSnowmanCount[nCamp] + 1
			SetNpcParam(nNpcIndex, 1, nCamp)
			SetNpcScript(nNpcIndex, szScriptFile)
			SetTmpCamp(nCamp, nNpcIndex)
		end
	end
end

function SnowmanBattleGame:PlayerDeath(nKiller)
	local nCamp,nType = pActivity:SB_GetPlayerCamp()
	
	local szType = "player"
	if nType == 2 then
		szType = "special_player"
	end
	
	local nKillerCamp = CallPlayerFunction(nKiller, pActivity.SB_GetPlayerCamp, pActivity)
	if nKillerCamp == nCamp then
		print(format("[SnowmanBattle]ERROR: Players in the same camp can attack each other!!!!"))
		return
	end
	
	if self.tbPoint[szType] then
		CallPlayerFunction(nKiller, pActivity.AddTask, pActivity, %TSK_POINT, self.tbPoint[szType])
		CallPlayerFunction(nKiller, Msg2Player, format("Ng≠¨i Æ∑ k›ch s∏t ng≠Íi ch¨i phe ÆËi ph≠¨ng, nhÀn Æ≠Óc %d Æi”m t›ch lÚy.", self.tbPoint[szType]))
		self.tbCampPoint[nKillerCamp] = self.tbCampPoint[nKillerCamp] + self.tbPoint[szType]
	end
	
end

function SnowmanBattleGame:SnowmanDeath(nNpcIndex)
	local nNpcCamp = GetNpcParam(nNpcIndex, 1)
	local nCamp,_ = pActivity:SB_GetPlayerCamp()
	
	if nNpcCamp == 0 then
		return
	end
	
	pActivity:AddTask(%TSK_POINT, self.tbPoint["snowman"])
	self.tbCampPoint[nCamp] = self.tbCampPoint[nCamp] + self.tbPoint["snowman"]
	Msg2Player(format("Ng≠¨i Æ∑ k›ch s∏t Ng≠Íi Tuy’t ÆËi ph≠¨ng, nhÀn Æ≠Óc %d Æi”m t›ch lÚy", self.tbPoint["snowman"]))
	
	PlayerFunLib:GetItem(%tbSB_Award["KillSnowman"], 1, %EVENT_LOG_TITLE, "KillSnowman")
	
	self.tbSnowmanCount[nNpcCamp] = self.tbSnowmanCount[nNpcCamp] - 1
	if self.tbSnowmanCount[nNpcCamp] == 0 then
		Msg2Map(self.nMapId, format("<color=yellow>%s Ng≠Íi Tuy’t bﬁ ti™u di÷t. <color>", pActivity.tbCampName[nNpcCamp]))
		local nWin = 1
		if nNpcCamp == 1 then
			nWin = 2
		end
		self:BattleEnd(nWin)
		return
	end
	Msg2Map(self.nMapId, format("<color=yellow>%s Ng≠Íi Tuy’t cﬂn d≠ lπi %d. <color>", pActivity.tbCampName[nNpcCamp], self.tbSnowmanCount[nNpcCamp]))
end

function SnowmanBattleGame:BattleEnd(nWin)
	if self.nBattleState ~= self.GAME_STATE_STARTED then
		return
	end
	self.nBattleState = self.GAME_STATE_END
	
	local szMsg = format("<color=yellow>TrÀn Tuy’t Nh©n ßπi Chi’n nµy k’t thÛc, %s ng≠Íi ch¨i giµnh Æ≠Óc thæng lÓi! %s Æi”m t›ch lÚy lµ %d, %s Æi”m t›ch lÚy lµ %d. <color>",
			pActivity.tbCampName[nWin], pActivity.tbCampName[1], self.tbCampPoint[1], pActivity.tbCampName[2], self.tbCampPoint[2])
	Msg2Map(self.nMapId, szMsg)
	
	self:SaveResult(nWin)
	self:KinckOutAllPlayer()
	
	local hParam = OB_Create()
	RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua", "SnowmanBattle:GameEnd", hParam)
	OB_Release(hParam)
	
	ClearMapNpc(self.nMapId)
	self:free()
end

function SnowmanBattleGame:SaveResult(nWin)
	local hParam = OB_Create()
	ObjBuffer:PushObject(hParam, nWin)
	ObjBuffer:PushObject(hParam, self.tbCampPoint[1])
	ObjBuffer:PushObject(hParam, self.tbCampPoint[2])
	RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua", "SnowmanBattle:SaveResult", hParam)
	OB_Release(hParam)
end

function SnowmanBattleGame:OnTime()
	local nWin = 1
	if self.tbCampPoint[1] < self.tbCampPoint[2] then
		nWin = 2
	elseif self.tbCampPoint[1] == self.tbCampPoint[2] then
		nWin = random(1, 2)
	end
	self:BattleEnd(nWin)
end

function SnowmanBattleGame:SetForbitItem()
	local szMapType = self.szDungeonType
	set_MapType(self.TEMPLATE_MAP_ID, szMapType)
		
	for i=1, getn(self.tbForbitItemType) do		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end

function SnowmanBattleGame:OnBroadcast()
	self.nTime = self.nTime + 1
	local szMsg = format("<color=yellow>TrÀn chi’n Æ∑ ti’n hµnh Æ≠Óc %d phÛt, %s Æi”m t›ch lÚy lµ %d, %s Æi”m t›ch lÚy lµ %d. <color>",
		self.nTime, pActivity.tbCampName[1], self.tbCampPoint[1], pActivity.tbCampName[2], self.tbCampPoint[2])
	Msg2Map(self.nMapId, szMsg)
	
	for szName,nFlag in self.tbPlayerList do
		local nPlayerIndex = SearchPlayer(szName)
		if nFlag and nPlayerIndex > 0 then
			local nPoint = CallPlayerFunction(nPlayerIndex, pActivity.GetTask, pActivity, %TSK_POINT)
			CallPlayerFunction(nPlayerIndex, Msg2Player, format("<color=yellow>ßi”m t›ch lÚy hi÷n tπi lµ %d. <color>", nPoint))
		end
	end
	
	return 60*18
end

function SnowmanBattleGame:_Init()
	self:SetForbitItem()
	DynamicExecute("\\script\\item\\heart_head.lua", "add_forbit_templatemap", self.TEMPLATE_MAP_ID)

	if SubWorldID2Idx(176) >= 0 then --÷ª‘⁄¡Ÿ∞≤À˘‘⁄µƒGS…Í«Î
		PreApplyDungeonMap(self.TEMPLATE_MAP_ID, 0, 0)
	end
	
end

function StartNewBattle(hParam, hResult)
	if SubWorldID2Idx(176) < 0 then --÷ª‘⁄¡Ÿ∞≤À˘‘⁄µƒGSø™∆Ù
		return
	end
	
	local nRound = ObjBuffer:PopObject(hParam)
	local GameInstant = SnowmanBattleGame:new_dungeon(SnowmanBattleGame.TEMPLATE_MAP_ID)
	if GameInstant and GameInstant.nMapId and GameInstant.nMapId > 0 then
		GameInstant.nRound = nRound
		GameInstant:StartBattle()
		ObjBuffer:PushObject(hResult, GameInstant.nMapId)
	else
		ObjBuffer:PushObject(hResult, -1)
	end
end

AutoFunctions:Add(SnowmanBattleGame._Init, SnowmanBattleGame)