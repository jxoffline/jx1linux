Include("\\script\\lib\\file.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\missions\\battle\\battle.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

FRAME2TIME = 18
PREPARE_TIME = 0 * 60
RUNNING_TIME = 60 * 60
MINUTE_TIME = 60
TEMPLATE_MAP_ID = {970,971}
MAX_STAY_TIME = 3 * 60

CAMP2AREA = 
{
	[CAMP_SONG] = 1,
	[CAMP_KIM] = 2
}

NPC_INFO = 
{
	{1, "doctornpc", 55, "Qu©n Nhu quan (Tèng)", "\\script\\missions\\battle\\npc\\doctor.lua"},
	{2, "doctornpc", 49, "Kim Quèc Qu©n nhu quan", "\\script\\missions\\battle\\npc\\doctor.lua"},
	{1, "symbolnpc", 629, "", "", 1},
	{2, "symbolnpc", 630, "", "", 1},
	{1, "depositobj", 625, "R­¬ng chøa ®å", "\\script\\battles\\openbox.lua"},
	{2, "depositobj", 625, "R­¬ng chøa ®å", "\\script\\battles\\openbox.lua"},
}

local Rule = Dungeon:new_type("Tèng Kim liªn server")

function Rule:new_rule(pBattle)
	
	local nTemplateMapId = %TEMPLATE_MAP_ID[random(1, getn(%TEMPLATE_MAP_ID))]
	return self:new_dungeon(nTemplateMapId, {pBattle})
end



function Rule:_init(pBattle)
	self.pBattle = pBattle
	self:AddTimer(PREPARE_TIME * FRAME2TIME, self.NextState, {self})
	self.nRestTime = (PREPARE_TIME + RUNNING_TIME)
	self:AddTimer(MINUTE_TIME * FRAME2TIME, self.Report, {self})
	
	for i=1, getn(NPC_INFO) do
		self:AddNpc(unpack(NPC_INFO[i]))
	end
	
	ClearMapTrap(self.nMapId)
	for nAreaId=1, 2 do
		self:AddMapTrap(nAreaId, "hometrap")
		self:AddMapTrap(nAreaId, "centertohometrap")
		self:AddMapTrap(nAreaId, "centertrap")
	end
	pBattle.Data:InitData(self.nMapId)
	pBattle.Data:SetRestTime(self.nRestTime)
	
	local tbInfo = 
	{
		szBattleName = "Tèng Kim liªn server",
		szMissionName = "D¹ng thøc Cõu s¸t",
		szMissionDesc = "Bèi c¶nh: n¨m 1160 C«ng Nguyªn, Kim chñ Hoµng Nhan L­îng v× muèn thùc hiÖn m­u ®å giÖt Tèng, tËp trung ®¹i qu©n, tiÕn vÒ phÝa Nam, qu©n Kim dÇn x©m chiÕm miÒn Nam, chiÕm lÜnh thµnh T­¬ng D­¬ng, më ra mét cuéc chiÕn tranh tµn khèc, b¶o vª thµnh T­¬ng D­¬ng v« cïng gian khæ. <enter><enter><color=yellow>. Ph­¬ng thøc chiÕn ®Êu: Trong chiÕn tr­êng, ng­êi ch¬i h¹ ®­îc nhiÒu kÎ dÞch sÏ ghi diÓm cho bªn ®ã.Bªn nµo ®iÓm cao h¬n lµ th¾ng. <enter> trong chiÕn tr­êng kh«ng cã NPC chiÕn ®Êu.",
		szMiniMap = format("TrËn thø %d", pBattle.nId),
	}	
	pBattle.Data:SetGameInfo(tbInfo)
	return 1
end
function Rule:Report()
	self.nRestTime = self.nRestTime - MINUTE_TIME
	self.pBattle.Data:SetRestTime(self.nRestTime)
	if self.pBattle.nState == RUN_STATE then
		local nSongPoint = self.pBattle.Data:GetCampPoint(CAMP_SONG)
		local nKimPoint = self.pBattle.Data:GetCampPoint(CAMP_KIM)
		Msg2Map(self.nMapId, format("§iÓm sè hiÖn t¹i cña bªn Tèng: %d, §iÓm sè bªn Kim: %d", nSongPoint, nKimPoint))
		self:CheckStayTime()
	end
	
	if self.nRestTime == 0 then
		return 0
	else
		return MINUTE_TIME * FRAME2TIME
	end
end

local str2point = function(str)
	local m = strfind(str,",")
	local x = tonumber(strsub(str,0,m-1))
	local y = tonumber(strsub(str,m+1))
	return x,y
end
function Rule:AddNpc(nAreaId, szKey, nNpcId, szNpcName, szLuaFile, bFile)
	if bFile ~= 1 then
		local szPoint = self:GetMapData(nAreaId, szKey)
		local nX, nY = %str2point(szPoint)
		NpcFunLib:AddObjNpc(szNpcName, nNpcId, {{self.nMapId, nX ,nY}}, szLuaFile )
	else
		local szFile = self:GetMapData(nAreaId, szKey)
		local nCount = GetTabFileHeight(szFile)
		for nRow=1, nCount do 
			local nX = tonumber(GetTabFileData(szFile, nRow + 1, 1))
			local nY = tonumber(GetTabFileData(szFile, nRow + 1, 2))
			NpcFunLib:AddObjNpc(szNpcName, nNpcId, {{self.nMapId, nX/32 ,nY/32}}, szLuaFile)
		end	
	end
end
function Rule:AddMapTrap(nAreaId, szKey)
	local szFile = self:GetMapData(nAreaId, szKey)
	local nCount = %GetTabFileHeight(szFile)
	local szLuaFile = format("\\script\\missions\\battle\\trap\\%s.lua", szKey)
	for nRow=1, nCount do 
		local nX = tonumber(GetTabFileData(szFile, nRow + 1, 1))
		local nY = tonumber(GetTabFileData(szFile, nRow + 1, 2))
		AddMapTrap(self.nMapId, nX, nY, szLuaFile, nAreaId)	
	end
end

function Rule:GetRandomAPos(nAreaId, szKey)
	local nPak = usepack(self.nPak)
	local szPosFile = self:GetMapData(nAreaId, szKey)
	local nX, nY = GetRandomAData(szPosFile)
	usepack(nPak)
	return nX, nY
end

function Rule:GetMapData(nAreaId, szKey)
	local szMapFile = GetMapInfoFile(self.nMapId)
	local szData = GetIniFileData(szMapFile, "Area_"..nAreaId, szKey);
	return szData
end

function Rule:NextState()
	if not self.pBattle then
		return 0
	end
	if self.pBattle.nState == PREPARE_STATE then
		self.pBattle.nState = RUN_STATE
		Msg2Map(self.nMapId, "Cuéc chiÕn b¾t ®Çu")
		self:RefreshStayTime()
		return RUNNING_TIME * FRAME2TIME
	elseif self.pBattle.nState == RUN_STATE then
		self.pBattle.nState = OVER_STATE
		self:close()
		return 0
	else
		self:close()
		return 0
	end
end


function Rule:OnEnterMap()
	local szName = GetName()
	if self.pBattle then
		if self.pBattle:JoinPlaying(szName) then
			local nCamp = self.pBattle:GetPlayerCamp(szName)
			SetCurCamp(nCamp)
			SetTmpCamp(nCamp)
			local nMapId, nX, nY = self:GetEnterPos(nCamp)
			SetTempRevPos(nMapId, nX * 32, nY * 32)
		else
			return self.pBattle:LeaveMap(szName)
		end
		self.pBattle.Data:RefreshStayTime(szName)
	end
	ForbidEnmity(1)
	SetPKFlag(1)
	SetFightState(0)
	SetTaskTemp(200, 1)
	SetPunish(0)
	DisabledStall(1)
	LeaveTeam()
	SetCreateTeam(0)
	DisabledUseTownP(1)
	ForbidChangePK(1)
	SetDeathScript("\\script\\missions\\battle\\playerdeath.lua")
end
function Rule:OnLeaveMap()
	local szName = GetName()
	if self.pBattle then
		local nCamp = self.pBattle:GetPlayerCamp(szName)
		if nCamp then
			LeaveChannel(PlayerIndex, format("%s trËn thø %d", CAMP_NAME[nCamp], self.pBattle.nId))
		end
		self.pBattle:QuitPlaying(szName)
		local nMapId, nX, nY = unpack(self.pBattle.tbSignUpPos)
		SetTempRevPos(nMapId, nX, nY)
	end
	ForbidEnmity(0)
	SetPKFlag(0)
	SetFightState(0)
	SetCurCamp(GetCamp())
	SetTmpCamp(0)
	SetTaskTemp(200, 0)
	SetPunish(1)
	DisabledStall(0)
	SetCreateTeam(1)
	DisabledUseTownP(0)
	ForbidChangePK(0)
	SetDeathScript("")
end
function Rule:RefreshStayTime()
	for k, nCamp in {CAMP_SONG, CAMP_KIM} do
		for szName, pData in %Hash.pairs(self.pBattle.tbPlaying[nCamp]) do
			self.pBattle.Data:RefreshStayTime(szName)
		end
	end
end

function Rule:CheckStayTime()
	for k, nCamp in {CAMP_SONG, CAMP_KIM} do
		for szName, pData in %Hash.pairs(self.pBattle.tbPlaying[nCamp]) do
			local nPlayerIndex = SearchPlayer(szName)
			if pData and nPlayerIndex > 0 then
				local nFightState = CallPlayerFunction(nPlayerIndex, GetFightState)
				if nFightState == 0 and self.pBattle.Data:GetStayTime(szName) >= %MAX_STAY_TIME then
					local nCamp = self.pBattle:GetPlayerCamp(szName)
					local _, nX, nY = self:GetCenterPos(nCamp)
					if nX and nY then
						CallPlayerFunction(nPlayerIndex, Msg2Player, "<color=pink>Ng­¬i kh«ng thÓ tiÕp tôc ë l¹i HËu Doanh. ")
						CallPlayerFunction(nPlayerIndex, SetPos, nX, nY)
						CallPlayerFunction(nPlayerIndex, SetFightState, 1)
					end
				end
			end
		end
	end
end

function Rule:close()
	ClearMapTrap(self.nMapId)
	DeleteChannel(format("%s trËn thø %d", CAMP_NAME[CAMP_SONG], self.pBattle.nId))
	DeleteChannel(format("%s trËn thø %d", CAMP_NAME[CAMP_KIM], self.pBattle.nId))
	if self.pBattle then
		self.pBattle:OnClose()
	end
	self:free()
end

function Rule:GetEnterPos(nCamp)
	local nPak = usepack(self.nPak)
	local nX, nY = self:GetRandomAPos(CAMP2AREA[nCamp], "homepos")
	usepack(nPak)
	return self.nMapId, nX/32,nY/32
end

function Rule:GetCenterPos(nCamp)
	local nPak = usepack(self.nPak)
	local nX, nY = self:GetRandomAPos(CAMP2AREA[nCamp], "hometocenterpos")
	usepack(nPak)
	return self.nMapId, nX/32,nY/32
end

function Rule:PreApplyMap()
	for i=1, getn(TEMPLATE_MAP_ID) do
		PreApplyDungeonMap(TEMPLATE_MAP_ID[i], 0, 0)
	end
end


local nTripMode = GetTripMode()
if nTripMode == 2 then
	
AutoFunctions:Add(Rule.PreApplyMap, Rule)

end


