-- Æß³Ç´óÕ½ wangbin 2010.5.12
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\lib\\toplist.lua")
Include("\\script\\missions\\sevencity\\head.lua")
IncludeLib("FILESYS")
IncludeLib("TASKSYS")

REMOTE_SCRIPT = "\\script\\mission\\sevencity\\protocol.lua"
CityManager = {}
function CityManager:AppointViceroy(city, tong)
	AppointViceroy(city, tong)
end

function CityManager:GetViceroy(city)
	local tong, _ = GetCityOwner(city)
	return tong
end

function CityManager:IsViceroy(tong)
	if (tong) then
		for city = 1, 7 do
			if (self:GetViceroy(city) == tong) then
				return 1
			end
		end
	end
	return 0
end

WAR_TIME = 3600		-- Æß³Ç´óÕ½Ê±¼ä£¨Ãë£©
STATE_INIT 			= 0
STATE_STARTSIGNUP	= 1
STATE_CLOSESIGNUP	= 2
STATE_PREPARING		= 3
STATE_STARTWAR		= 4
STATE_CLOSEWAR		= 5

BattleWorld = {
	m_CityManager = CityManager,
	m_CampIndex = CAMP_MONSTER + 1,
	m_FieldList = {},
	m_Tong2Camp = {},
	m_Camp2Tong = {},
	m_TongWarriorCount = {},	-- °ï»áÃû=>²Î¼Ó³ÇÕ½µÄ°ï»áÈËÊý
	m_TrapFlag = 0,
	m_Standings = {},			-- Íæ¼ÒÕ½¼¨±í£¬Ë÷ÒýÎªÍæ¼ÒÃû×Ö£¬±íÏî½á¹¹Îª{KillWarriorCount, KillMonsterCount, TimeScore}
	m_TopList = nil,			-- Ç°Ê®ÃûÍæ¼Ò
	m_SignupList = {},			-- ±¨Ãû°ï»á
	m_WarriorTong = {},			-- Íæ¼ÒÃû=>Ð§Á¦°ï»á
	m_State = STATE_INIT,		-- ×´Ì¬
	m_GateList = {},
	m_MapGates = {},
	m_StartTime = 0,
}

function BattleWorld:SetTopList(toplist)
	self.m_TopList = toplist
end

function BattleWorld:CheckSignup(tong)
	if (not tong or
		not self.m_SignupList or
		not self.m_SignupList[tong]) then
		return 0
	else
		return 1
	end
end

function BattleWorld:GetWarriorTong(name)
	return self.m_WarriorTong[name]
end

function BattleWorld:SetWarriorTong(name, tong)
	self.m_WarriorTong[name] = tong
end

function BattleWorld:CheckWarriorTongChange(name, tong)
	local working_tong = self.m_WarriorTong[name]
	if (not working_tong or working_tong == tong) then
		return 0
	else
		return 1
	end
end

function BattleWorld:LogAction(action, player)
	-- ÈÕÖ¾
	local _, _, world = player:GetPos()
	WriteLog(format("[SEVENCITY %s]\t%s\t%s\t%s\t%s\t%s\t%s\t%d\t%s\t%s",
		action,
		GetLocalDate("%H:%M"),		-- Ê±¼ä
		GetLocalDate("%d/%m/%Y"),	-- ÈÕÆÚ
		GetServerName(),			-- ·þÎñÆ÷Ãû×Ö
		player:GetAccount(),		-- ÕÊºÅ
		player:GetName(),			-- ½ÇÉ«Ãû
		player:GetFaction(),		-- ÃÅÅÉ
		player:GetLevel(),			-- µÈ¼¶
		player:GetTong(),			-- °ï»á
		SubWorldName(world)))		-- ³ÇÊÐ
end

function BattleWorld:SignupCost(player, tong, err)
	if (player:GetTiaozhanlingCount() < SIGNUP_TIAOZHANLINGCOUNT or
		player:GetCash() < SIGNUP_MONEY) then
		err.Msg = format(
			"B¸o danh cÇn <color=red>%d<color> ng©n l­îng vµ <color=red>%d<color> khiªu chiÕn lÖnh.",
			SIGNUP_MONEY,
			SIGNUP_TIAOZHANLINGCOUNT)
	elseif (player:ApplyReduceTiaozhanlingCount(SIGNUP_TIAOZHANLINGCOUNT) == 0) then
		err.Msg = format(
			"Ng­¬i cã ch¾c ®· mang ®ñ <color=red>%d<color> khiªu chiÕn lÖnh?",
			SIGNUP_TIAOZHANLINGCOUNT)
	else
		player:Pay(SIGNUP_MONEY)
		self.m_SignupList[tong] = 1
		-- Í¬²½Ðí¿É°ï»á
		self:NotifySignup(tong)
		player:Say(format("Chóc mõng bang héi <color=red>%s<color> ®· b¸o danh thµnh c«ng!", tong))
		-- ÈÕÖ¾
		self:LogAction("signup", player)
		return 1
	end
	return 0
end

function BattleWorld:Signup(player, err)
	local tong = player:GetTong()
	if (self.m_State ~= STATE_STARTSIGNUP) then
		err.Msg = "HiÖn t¹i kh«ng thÓ b¸o danh."
	elseif (player:GetTongMaster() ~= player:GetName()) then
		err.Msg = "ChØ cã bang chñ míi cã thÓ b¸o danh."
	elseif (self.m_CityManager:IsViceroy(tong) == 1) then
		err.Msg = "Bang héi ®· chiÕm ®­îc thµnh kh«ng cÇn b¸o danh."
	elseif (self.m_SignupList[tong] ~= nil) then
		err.Msg = "Bang héi cña c¸c h¹ ®· b¸o danh råi."
	elseif (self:SignupCost(player, tong, err) == 1) then
		return 1
	end
	return 0
end

function BattleWorld:NotifySignup(tong)
	local buff = ObjBuffer:New()
	buff:Push(tong)
	RemoteExecute(
		REMOTE_SCRIPT,
		"Protocol:Signup",
		buff.m_Handle)
	buff:Destroy()
end

function BattleWorld:SyncSignup(tong)
	self.m_SignupList[tong] = 1
end

function BattleWorld:StartSignup()
	self.m_SignupList = {}
	self.m_State = STATE_STARTSIGNUP
	AddLocalCountNews("ThÊt thµnh ®¹i chiÕn b¾t ®Çu b¸o danh, xin mêi ch­ vÞ bang chñ h·y nhanh chãng b¸o danh, bang chiÕm thµnh kh«ng cÇn b¸o danh.", 5)
end

function BattleWorld:CloseSignup()
	self.m_State = STATE_CLOSESIGNUP
	AddLocalCountNews("B¸o danh thÊt thµnh ®¹i chiÕn ®· kÕt thóc", 3)
end

function BattleWorld:LoadMap()
	local map_list = {
		FIELD_CHENGDU,		-- ³É¶¼Õ½³¡(926)
		FIELD_BIANJING,		-- ãê¾©Õ½³¡(927)
		FIELD_DALI,			-- ´óÀíÕ½³¡(928)
		FIELD_FENGXIANG,	-- ·ïÏèÕ½³¡(929)
		FIELD_LINAN, 		-- ÁÙ°²Õ½³¡(930)
		FIELD_XIANGYANG,	-- ÏåÑôÕ½³¡(931)
		FIELD_YANGZHOU,		-- ÑïÖÝÕ½³¡(932)
	}
	for i = 1, getn(map_list) do
		local src = map_list[i]
		for j = 1, getn(map_list) do
			local dst = map_list[j]
			if (src ~= dst) then
				self:LoadTrapList(src, dst)
			end
		end
	end
end

function BattleWorld:Create()
	self.m_TopList = {}
	self.m_FieldList = {}
	self.m_Tong2Camp = {}
	self.m_Camp2Tong = {}
	self.m_CampIndex = CAMP_MONSTER + 1
	self.m_Standings = {}			-- Íæ¼ÒÕ½¼¨±í
	self.m_WarriorTong = {}
	self.m_State = STATE_PREPARING
	for _, mapid in BATTLE_LIST do
		if (mapid ~= nil and SubWorldID2Idx(mapid) >= 0) then
			self.m_FieldList[mapid] = BattleField:New(mapid)
		end
	end
	if (self.m_TrapFlag == 0) then
		self.m_MapGates = {}
		self:LoadMap()
		self.m_TrapFlag = 1
	end
	AddLocalCountNews("ThÊt thµnh ®¹i chiÕn s¾p b¾t ®Çu, mäi ng­êi h·y chuÈn bÞ", 5)
end

function BattleWorld:Destroy()
	if (self.m_FieldList ~= nil) then
		for _, field in self.m_FieldList do
			if (field ~= nil) then
				field:Destroy()
			end
		end
	end
	self.m_FieldList = nil
	self.m_Tong2Camp = nil
	self.m_Camp2Tong = nil
	self.m_CampIndex = CAMP_MONSTER + 1
	self.m_Standings = nil		-- Õ½¼¨±í
end

-- ¿ªÊ¼³ÇÕ½
function BattleWorld:Start()
	for _, field in self.m_FieldList do
		if (field ~= nil) then
			field:Start()
		end
	end
	self.m_TongWarriorCount = {}
	self.m_Standings = {}				-- Íæ¼ÒÕ½¼¨±í
	self.m_TopList = {}					-- Ç°Ê®ÃûÍæ¼Ò
	AddLocalCountNews("ThÊt thµnh ®¹i chiÕn ®· ®­îc b¾t ®Çu", 3)
	self.m_State = STATE_STARTWAR
	self.m_StartTime = GetLocalTime()
end

-- ½áÊø³ÇÕ½
function BattleWorld:Close()
	if (not self.m_FieldList) then
		return
	end
	WriteLog("[SEVENCITY]close begin...")
	self.m_StartTime = 0
	for _, field in self.m_FieldList do
		if (field ~= nil) then
			-- ¹Ø±ÕÕ½³¡
			field:Close()
		end
	end
	self.m_State = STATE_CLOSEWAR
	self.m_SignupList = {}
	AddLocalCountNews("ThÊt thµnh ®¹i chiÕn ®· kÕt thóc!", 1)
	WriteLog("[SEVENCITY]close end...")
end

function BattleWorld:GetTopList()
	return self.m_TopList
end

function BattleWorld:ClearStandings(name)
	self.m_Standings[name] = nil
end

function BattleWorld:GetStandings(name)
	local tb = self.m_Standings[name]
	if (not tb) then
		tb = {}
		self.m_Standings[name] = tb
		tb.KillWarriorCount = 0		-- É±µÐÊý
		tb.KillMonsterCount = 0		-- »÷ÆÆÁúÖùÊý
		tb.TimeScore = 0			-- Ê±¼ä»ý·Ö
	end
	return tb
end

function BattleWorld:AddKillWarriorCount(name, add)
	local tb = self:GetStandings(name)
	tb.KillWarriorCount = tb.KillWarriorCount + add
end

function BattleWorld:AddKillMonsterCount(name)
	local tb = self:GetStandings(name)
	tb.KillMonsterCount = tb.KillMonsterCount + 1
end

function BattleWorld:AppointViceroy(city, tong)
	self.m_CityManager:AppointViceroy(city, tong)
end

function BattleWorld:SyncTongWarriorCount(tong, count)
	self.m_TongWarriorCount[tong] = count
end

function BattleWorld:GetTongWarriorCount(tong)
	local count = self.m_TongWarriorCount[tong]
	if (not count) then
		return 0
	else
		return count
	end
end

function BattleWorld:GetTimeScore(name)
	local tb = self:GetStandings(name)
	return tb.TimeScore
end

function BattleWorld:AddTimeScore(name, add)
	local tb = self:GetStandings(name)
	tb.TimeScore = tb.TimeScore + add
end

function BattleWorld:FindTongCamp(tong)
	return self.m_Tong2Camp[tong]
end

function BattleWorld:FindCampTong(camp)
	return self.m_Camp2Tong[camp]
end

function BattleWorld:NewCamp()
	local camp = self.m_CampIndex
	self.m_CampIndex = self.m_CampIndex + 1
	return camp
end

function BattleWorld:RegisterCamp(tong)
	local camp = self.m_Tong2Camp[tong]
	if (not camp) then
		camp = self:NewCamp()
		self.m_Tong2Camp[tong] = camp
		self.m_Camp2Tong[camp] = tong
	end
	return camp
end

function BattleWorld:GetFieldList()
	local tb = {}
	if (self.m_FieldList) then
		for _, field in self.m_FieldList do
			if (field ~= nil) then
				tinsert(tb, field)
			end
		end
	end
	return tb
end

function BattleWorld:GetFieldCount()
	if (not self.m_FieldList) then
		return 0
	else
		local count = 0
		for _, field in self.m_FieldList do
			if (field) then
				count = count + 1
			end
		end
		return count
	end
end

function BattleWorld:Log(msg)
	WriteLog(msg)
	-- DEBUG
	print(msg)
end

-- ½øÈëÆäËûÕ½³¡
function BattleWorld:Trap(player, src, index)
	local info = self.m_GateList[index]
	if (info == nil or info.MapId == nil) then
		self:Log(format("[ERROR SEVENCITY]gatelist[%d] is null", index))
		return
	elseif (info.PosList == nil) then
		self:Log(format("[ERROR SEVENCITY]gatelist of map(%d) not found", info.MapId))
		return
	elseif (getn(info.PosList) == 0) then
		self:Log(format("[ERROR SEVENCITY]gatelist of map(%d) is empty", info.MapId))
		return
	end

	local field_src = self:FindField(src)
	if (not field_src) then
		self:Log(format("[ERROR SEVENCITY]trap fail: source map(%d) not found", src))
		return
	end
	local pos = info.PosList[random(1, getn(info.PosList))]
	local x = floor(pos[1] / 32)
	local y = floor(pos[2] / 32)
	field_src:Leave(player)
	player:NewWorld(info.MapId, x, y)

	local field_dst = self:FindField(info.MapId)
	if (field_dst) then
		field_dst:Enter(player)
	end
end

function BattleWorld:LoadPosition(file, tb)
	if (TabFile_Load(file, file) == 0) then
		return
	end
	local count = TabFile_GetRowCount(file)
	if (count < 2) then
		return
	end
	for i = 2, count do
		local x = tonumber(TabFile_GetCell(file, i, 1))
		local y = tonumber(TabFile_GetCell(file, i, 2))
		tinsert(tb, {x, y})
	end
end

function BattleWorld:LoadTrapList(src, dst)
	for id = 1, 3 do
		self:LoadTrap(src, dst, id)
	end
end

function BattleWorld:LoadTrap(src, dst, id)
	local gate_file = format("\\settings\\maps\\missions\\sevencity\\gate%d_%d_%d.txt", id, src, dst)
	local gate_list = {}
	local script = FileName2Id("\\script\\missions\\sevencity\\trap.lua")
	self:LoadPosition(gate_file, gate_list)
	if (getn(gate_list) == 0) then
		return
	end
	local trap_file = format("\\settings\\maps\\missions\\sevencity\\trap%d_%d_%d.txt", id, src, dst)
	local trap_list = {}
	self:LoadPosition(trap_file, trap_list)
	for i = 1, getn(trap_list) do
		local x = trap_list[i][1]
		local y = trap_list[i][2]
		local index = getn(self.m_GateList) + 1
		local tb = {}
		tb.MapId = dst
		tb.PosList = gate_list
		self.m_GateList[index] = tb	
		AddMapTrap(src, x, y, script, index)

		local gates = self.m_MapGates[dst]
		if (not gates) then
			gates = {}
			self.m_MapGates[dst] = gates
		end
		tinsert(gates, gate_list)
	end
	print(format("[LOADED]TRAP[%d=>%d]", src, dst))
end

function BattleWorld:FindField(mapid)
	if (not self.m_FieldList) then
		return nil
	else
		return self.m_FieldList[mapid]
	end
end

function BattleWorld:CheckPermission(mapid, player, err)
	local tong = player:GetTong()
	local field = self:FindField(mapid)
	if (not field) then
		if (err) then
			err.Msg = "ChiÕn tr­êng vÉn ch­a më, t¹m thêi kh«ng thÓ vµo."
		end
		self:Log(format("[ERROR SEVENCITY]map(%d) not exist", mapid))
		return 0
	elseif (field:GetTongWarriorCount(tong) >= PARAM_LIST.FIELD_TONGMEMBER) then
		if (err) then
			err.Msg = "ChiÕn tr­êng tiÒn ph­¬ng ®· ®ñ ng­êi, xin h·y t×m chiÕn tr­êng kh¸c thö xem cã cÇn chi viÖn hay kh«ng."
		end
		return 0
	end
	return self:CheckMapPermission(player, err)
end

function BattleWorld:CheckMapPermission(player, err)
	local tong = player:GetTong()
	local msg = ""
	if (self.m_State ~= STATE_PREPARING and self.m_State ~= STATE_STARTWAR) then
		msg = "HiÖn t¹i kh«ng thÓ vµo chiÕn tr­êng."
	elseif (player:GetLevel() < 90) then
		msg = "<color=red>Ng­êi ch¬i cÊp 90 vµ cÊp 90 trë lªn<color> míi ®­îc tham gia ThÊt Thµnh §¹i ChiÕn."
	elseif (tong == nil or tong == "") then
		msg = "Thµnh viªn bang héi míi cã thÓ tham gia thÊt thµnh ®¹i chiÕn."
	elseif (self:CheckWarriorTongChange(player:GetName(), tong) == 1) then
		msg = "Ng­¬i ®· ph¶n bang kh«ng thÓ tiÕn vµo chiÕn tr­êng."
	elseif (player:GetJoinTongTime() < 24 * 60) then
		msg = "Gia nhËp bang héi<color=red> 1 ngµy hoÆc 1 ngµy trë lªn míi ®­îc tham gia ThÊt Thµnh §¹i ChiÕn."
	elseif (self.m_CityManager:IsViceroy(tong) == 0 and
			self.m_SignupList[tong] == nil) then
		msg = "Bang héi chiÕm thµnh hoÆc ®· b¸o danh míi cã thÓ tham gia thÊt thµnh ®¹i chiÕn"
	elseif (self:GetTongWarriorCount(tong) >= PARAM_LIST.WORLD_TONGMEMBER) then
		msg = "Sè ng­êi tham chiÕn cña quý bang ®· ®Õn møc cao nhÊt, h·y ®îi l¸t n÷a tham gia l¹i nhÐ."
	else
		return 1
	end
	if (err) then
		err.Msg = msg
	end
	return 0
end

function BattleWorld:SyncWarriorStandings(param, result)
	if (result == 0 or not self.m_Standings) then
		return
	end
	local buff = ObjBuffer:New(result)
	if (buff:IsEmpty() == 1) then
		return
	end
	local name = buff:Pop()
	local info = buff:Pop()
	local tb = self:GetStandings(name)
	tb.KillWarriorCount = tb.KillWarriorCount + info.KillWarriorCount
	tb.KillMonsterCount = tb.KillMonsterCount + info.KillMonsterCount
	tb.TimeScore = tb.TimeScore + info.TimeScore
end

-- Íæ¼Ò´«ÈëÕ½³¡
function BattleWorld:Transfer(player, nMapId)
	local gates = BattleWorld.m_MapGates[nMapId]
	if (not gates or getn(gates) == 0) then
		return
	end
	local pos = gates[1][1]
	local x = floor(pos[1] / 32)
	local y = floor(pos[2] / 32)
	local field = BattleWorld:FindField(nMapId)
	if (field) then
		field:Enter(player)
	end
	player:NewWorld(nMapId, x, y)
end

BattleField = {
	m_List = {},
	m_CurWarriorCount = 0,
	m_FightState = 0
}

function BattleField:New(mapid)
	local tb = clone(BattleField)
	tb.m_TimerList = {}
	tb.m_MapId = mapid
	tb.m_Monster = Monster:New(mapid, MAP_INFO[mapid].MonsterPos)
	tb.m_TongWarriorCount = {}	-- °ï»áÃû=>¸Ã³¡µØµÄ°ï»áÈËÊý
	return tb
end

function BattleField:Destroy()
	if (self.m_Monster ~= nil) then
		self.m_Monster:Destroy()
		self.m_Monster = nil
	end
	for _, id in self.m_TimerList do
		TimerList:DelTimer(id)
	end
	self.m_TimerList = nil
end

function BattleField:GetWarriorCount()
	return self.m_CurWarriorCount
end

function BattleField:GetFightState()
	return self.m_FightState
end

function BattleField:SetTongWarriorCount(tong, count)
	self.m_TongWarriorCount[tong] = count
end

function BattleField:GetTongWarriorCount(tong)
	local count = self.m_TongWarriorCount[tong]
	if (not count) then
		return 0
	else
		return count
	end
end

function BattleField:AddTongWarriorCount(tong)
	local count = self.m_TongWarriorCount[tong]
	if (not count) then
		count = 1
	else
		count = count + 1
	end
	self.m_TongWarriorCount[tong] = count
end

function BattleField:DelTongWarriorCount(tong)
	local count = self.m_TongWarriorCount[tong]
	if (not count or count <= 0) then
		WriteLog(format("[ERROR SEVENCITY]bad warrior count in field[%s]", MAP_INFO[self.m_MapId].Name))
		return
	end
	self.m_TongWarriorCount[tong] = count - 1
end

function BattleField:OnTime(index)
	local player = self.m_List[index]
	if (not player) then
		return 0
	end
	local now = GetLocalTime()
	if (BattleWorld.m_StartTime == 0 or now - BattleWorld.m_StartTime > WAR_TIME + 300) then
		WriteLog(format("[ERROR SEVENCITY]OnTime fail: field(%d), player(%s)",
			self.m_MapId,
			player:GetName()))
		return 0
	end
	-- Close award exp - Created by TinhPN - 20110425
	--player:AddStackExp(TIMEAWARD_EXP)
	--player:Msg2Player(format("C¸c h¹ nhËn %d kinh nghiÖm céng dån", TIMEAWARD_EXP))
	local score = TIMEAWARD_SCORE
	local name = player:GetName()
	BattleWorld:AddTimeScore(name, score)
	player:Msg2Player(format("C¸c h¹ nhËn ®­îc %d thêi gian tÝch lòy.", score))
	self:NotifyTimeScore(name, score)
	return 1
end

function BattleField:GetWarriorTimer(player)
	return self.m_TimerList[player.m_PlayerIndex]
end

-- Íæ¼Ò´«ÈëÕ½³¡
function BattleField:Login(player)
	local gates = BattleWorld.m_MapGates[self.m_MapId]
	if (not gates or getn(gates) == 0) then
		return 0
	end
	local gate = gates[random(1, getn(gates))]
	if (getn(gate) == 0) then
		return 0
	end
	local pos = gate[random(1, getn(gate))]
	local x = floor(pos[1] / 32)
	local y = floor(pos[2] / 32)
	if (player:NewWorld(self.m_MapId, x, y) == 0) then
		return 0
	else
		self:Enter(player)
		return 1
	end
end

-- Íæ¼Ò´«³öÕ½³¡
function BattleField:Logout(player, dead)
	self:Leave(player)
	if (dead ~= nil and dead == 1) then
		local mapid, x, y = player:RevID2WXY(player:GetPlayerRev())
		if (mapid > 0) then
			player:NewWorld(mapid, x / 32, y / 32)
			return
		end
	end
	local outpos = MAP_INFO[self.m_MapId].OutPos
	player:NewWorld(outpos[1], outpos[2], outpos[3])
end

function BattleField:GetTimerId(player)
	return self.m_TimerList[player.m_PlayerIndex]
end

function BattleField:AddExpTimer(player)
	local id = self.m_TimerList[player.m_PlayerIndex]
	if (id ~= nil and id > 0) then
		TimerList:DelTimer(id)
	end
	id = TimerList:AddTimer(self, PARAM_LIST.EXPTIMER_INTERVAL, player.m_PlayerIndex)
	self.m_TimerList[player.m_PlayerIndex] = id
end

function BattleField:DelExpTimer(player)
	local id = self.m_TimerList[player.m_PlayerIndex]
	if (id ~= nil and id > 0) then
		TimerList:DelTimer(id)
		self.m_TimerList[player.m_PlayerIndex] = nil
	end
end

function BattleField:InField(player)
	if (not self.m_List[player.m_PlayerIndex]) then
		return 0
	else
		return 1
	end
end

function BattleField:NotifyClose()
	local buff = ObjBuffer:New()
	buff:Push(self.m_MapId)
	RemoteExecute(REMOTE_SCRIPT, "Protocol:Close", buff.m_Handle)
	buff:Destroy()
end

function BattleField:NotifyTimeScore(name, score)
	local buff = ObjBuffer:New()
	buff:Push(name)
	buff:Push(score)
	RemoteExecute(REMOTE_SCRIPT, "Protocol:TimeScore", buff.m_Handle)
	buff:Destroy()
	BattleWorld:Log(format("[SEVENCITY]%s add timescore(%d)", name, score))
end

function BattleField:NotifyWarriorKill(name)
	local buff = ObjBuffer:New()
	buff:Push(name)
	RemoteExecute(REMOTE_SCRIPT, "Protocol:WarriorKill", buff.m_Handle)
	buff:Destroy()
end

function BattleField:NotifyMonsterDown(name)
	local buff = ObjBuffer:New()
	buff:Push(self.m_MapId)
	buff:Push(name)
	RemoteExecute(REMOTE_SCRIPT, "Protocol:MonsterDown", buff.m_Handle)
	buff:Destroy()
end

function BattleField:NotifyEmploy(name, tong)
	local buff = ObjBuffer:New()
	buff:Push(name)
	buff:Push(tong)
	RemoteExecute(REMOTE_SCRIPT, "Protocol:Employ", buff.m_Handle)
	buff:Destroy()
end

function BattleField:NotifyEnter(name)
	local buff = ObjBuffer:New()
	buff:Push(name)
	RemoteExecute(
		REMOTE_SCRIPT,
		"Protocol:Enter",
		buff.m_Handle,
		"BattleWorld:SyncWarriorStandings")
	buff:Destroy()
end

function BattleField:NotifyLeave(name)
	local buff = ObjBuffer:New()
	buff:Push(name)
	RemoteExecute(REMOTE_SCRIPT, "Protocol:Leave", buff.m_Handle)
	buff:Destroy()
end

function BattleField:Enter(player)
	self.m_List[player.m_PlayerIndex] = player
	self.m_CurWarriorCount = self.m_CurWarriorCount + 1
	player:SetFightState(self.m_FightState)
	player:SetLogoutRV(1)
	player:SetPunish(0)
	player:SetDeathScript(SCRIPT_WARRIORDEATH)
	player:ForbidEnmity(1)
	player:SetFightState(self.m_FightState)
	player:DisabledUseTownP(1)
	player:DisabledUseHeart(1)
	
	-- ÉèÖÃ±£»¤Ê±¼ä
	player:SetProtectTime(18 * 3)
	player:AddSkillState(963, 1, 0, 18 * 3)

	-- ÒÔ×¢²áµÄ°ï»áÃûÎª×¼£¬·ÀÖ¹Íæ¼ÒÖÐÍ¾°ï»á±ä¸üµ¼ÖÂ»ìÂÒ
	local name = player:GetName()
	local tong = BattleWorld:GetWarriorTong(name)
	if (not tong) then
		tong = player:GetTong()
		BattleWorld:SetWarriorTong(name, tong)
		self:NotifyEmploy(name, tong)
	end
	self:NotifyEnter(name)

	self:AddTongWarriorCount(tong)
	local camp = BattleWorld:RegisterCamp(tong)
	player:SetTmpCamp(camp)

	-- Èç¹ûÕ½¶·ÒÑ¾­¿ªÊ¼£¬ÔòÆô¶¯¶¨Ê±Æ÷
	if (self.m_FightState == 1) then
		self:AddExpTimer(player)
	end
end

function BattleField:Leave(player)
	if (self.m_List[player.m_PlayerIndex] ~= nil) then
		self.m_List[player.m_PlayerIndex] = nil
	end
	if (self.m_CurWarriorCount > 0) then
		self.m_CurWarriorCount = self.m_CurWarriorCount - 1
	end

	-- É¾³ý¶¨Ê±Æ÷
	self:DelExpTimer(player)

	-- Àë¿ªÕ½³¡Ê±²»ÄÜÖ±½Ó»ñÈ¡°ï»áÃû×Ö£¬ÒòÎªÍæ¼Ò¿ÉÄÜÖÐÍ¾ÍË³ö°ï»á
	local name = player:GetName() or ""
	local tong = BattleWorld:GetWarriorTong(name) or ""
	if (name ~= "" and tong ~= "") then
		self:DelTongWarriorCount(tong)
		BattleWorld:ClearStandings(name)
		self:NotifyLeave(name)
	else
		WriteLog(format("[ERROR SEVENCITY]leave fail: field(%d), name(%s), tong(%s)",
			self.m_MapId,
			name,
			tong))
	end

	player:SetTmpCamp(0)
	player:SetDeathScript("")
	player:ForbidEnmity(0)
	player:SetFightState(0)
	player:DisabledUseTownP(0)
	player:DisabledUseHeart(0)
end

function BattleField:GetWarriorList()
	local tb = {}
	for _, player in self.m_List do
		if (player ~= nil) then
			tinsert(tb, player)
		end
	end
	return tb
end

function BattleField:Start()
	self.m_FightState = 1
	for _, player in self.m_List do
		if (player ~= nil) then
			player:SetFightState(1)
			self:AddExpTimer(player)
		end
	end
	if (self.m_Monster) then
		self.m_Monster:StartTimer()
	end
	local msg = format("ThÊt thµnh ®¹i chiÕn [%s] ®· b¾t ®Çu!", MAP_INFO[self.m_MapId].Name)
	AddLocalNews(msg)
end

function BattleField:Close()
	WriteLog(format("[SEVENCITY]close field(%d) begin...", self.m_MapId))
	local pos = MAP_INFO[self.m_MapId].OutPos
	local players = self:GetWarriorList()
	for i = 1, getn(players) do
		local player = players[i]
		if player.m_PlayerIndex > 0 then
			local szName = player:GetName()
			local tb = BattleWorld:GetStandings(szName)
			if	(tb.KillWarriorCount + tb.TimeScore) >= 10 then	-- Æß³Ç´óÕ½»ý·Ö´óÓÚ10Ê±»ñµÃ»îÔ¾Öµ½±Àø
				DynamicExecuteByPlayer(player.m_PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "qichengdazhan")
			end
		end
		self:Logout(player)
	end
	self.m_FightState = 0
	if (self.m_Monster) then
		self.m_Monster:CloseTimer()
	end
	-- ÉèÖÃÕ¼³Ç°ï£ºÁúÖùÕóÓª¶ÔÓ¦µÄ°ï»á¾ÍÊÇÕ¼³Ç°ï»á
	local camp = self.m_Monster:GetCamp()
	local tong = BattleWorld:FindCampTong(camp)
	if (tong ~= nil) then
		BattleWorld:Log(format("[SEVENCITY]tong(%s) win field(%d)", tong, self.m_MapId))
	else
		BattleWorld:Log(format("[SEVENCITY]none win field(%d)", self.m_MapId))
	end
	WriteLog(format("[SEVENCITY]close field(%d) end...", self.m_MapId))
end

function BattleField:KillWarrior(killer, killed)
	local killed_name = killed:GetName()
	local killer_name = killer:GetName()
	killer:Msg2Player(format("Ng­¬i ®· ®¸nh b¹i %s!", killed_name))
	killer:Msg2Player("§¹i hiÖp ®· nhËn 1 ®iÓm giÕt ®Þch")
	killed:Msg2Player(format("Ng­¬i ®· bÞ %s ®¸nh b¹i!", killer_name))
	BattleWorld:AddKillWarriorCount(killer_name, 1)
	self:NotifyWarriorKill(killer_name)
end

function BattleField:KillMonster(killer)
	local killer_name = killer:GetName()
	BattleWorld:AddKillMonsterCount(killer_name)
	self.m_Monster:Down(killer)
	self:NotifyMonsterDown(killer_name)
	AddGlobalNews(format("%s ph¸ vì long trô cña %s!",
		killer_name,
		MAP_INFO[self.m_MapId].Name))
	-- ÈÕÖ¾
	BattleWorld:LogAction("killdragon", killer)
end

-- ÁúÖù¶¨Ê±Æ÷
MonsterTimerList = {}

function MonsterTimerList:OnTime(index, id)
	local field = BattleWorld:FindField(index)
	if (field ~= nil and field.m_Monster ~= nil) then
		field.m_Monster:OnTime()
	end
	return 0
end

-- ÁúÖù
Monster = {}

function Monster:New(mapid, pos)
	local obj = clone(Monster)
	obj.m_Camp = CAMP_MONSTER
	obj.m_DownTimerId = 0	-- ÁúÖùÎÞµÐ¶¨Ê±Æ÷
	obj.m_ScoreTimerId = 0	-- ÁúÖù»ý·Ö¶¨Ê±Æ÷
	obj.m_MapId = mapid
	obj.m_Pos = pos
	obj:CreateNpc("Long Trô")
	return obj
end

function Monster:Destroy()
	if (self.m_NpcIndex > 0) then
		DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_DownTimerId > 0) then
		TimerList:DelTimer(self.m_DownTimerId)
		self.m_DownTimerId = 0
	end
	self:CloseScoreTimer()
end

function Monster:OnTime(nIndex)
	if (nIndex == 1) then
		-- ÎÞµÐ£º±ä³É¶Ô»°NPC
		if (self.m_NpcIndex > 0) then
			DelNpc(self.m_NpcIndex)
			self.m_NpcIndex = 0
		end
		local world = SubWorldID2Idx(self.m_MapId)
		local index = AddNpc(530, 10, world, self.m_Pos[1], self.m_Pos[2], 1, name, 1, 3)
		if (index > 0) then
			SyncNpc(index)
			SetTmpCamp(self.m_Camp, index)
			self.m_NpcIndex = index
		else
			BattleWorld:Log("[ERROR SEVENCITY]failed to create dialog monster(%d)", self.m_MapId)
		end
		self.m_DownTimerId = 0
	elseif (nIndex == 2) then
		local buff = ObjBuffer:New()
		buff:Push(self.m_MapId)
		RemoteExecute(
			REMOTE_SCRIPT,
			"Protocol:AddScore",
			buff.m_Handle)
		buff:Destroy()
		self.m_ScoreTimerId = 0
	end
	return 0
end

function Monster:GetCamp()
	return self.m_Camp
end

function Monster:Down(killer)
	self.m_Camp = killer:GetTmpCamp()
	if (self.m_NpcIndex > 0) then
		DelNpc(self.m_NpcIndex)
		self:CloseTimer()
		self.m_NpcIndex = 0
		local name = killer:GetName()
		local tong = BattleWorld:GetWarriorTong(name)
		local msg = format("[%s] long trô bÞ bang héi %s %s ph¸ vì!",
						MAP_INFO[self.m_MapId].Name,
						tong,
						name)
		AddGlobalNews(msg)
		killer:Msg2Player(format("[%s] C¸c h¹ ®· ph¸ vì long trô!", MAP_INFO[self.m_MapId].Name))
		self:CreateNpc(format("Long trô [%s]", tong))
		self:StartTimer()
		self:CloseScoreTimer()
		self:StartScoreTimer()
	end
end

function Monster:StartScoreTimer()
	self.m_ScoreTimerId = TimerList:AddTimer(self, PARAM_LIST.TIMEOUT_SCORE, 2)
end

function Monster:CloseScoreTimer()
	if (self.m_ScoreTimerId > 0) then
		TimerList:DelTimer(self.m_ScoreTimerId)
		self.m_ScoreTimerId = 0
	end
end

function Monster:StartTimer()
	self.m_DownTimerId = TimerList:AddTimer(self, PARAM_LIST.TIMEOUT_MONSTER, 1)
end

function Monster:CloseTimer()
	if (self.m_DownTimerId > 0) then
		TimerList:DelTimer(self.m_DownTimerId)
		self.m_DownTimerId = 0
	end
end

function Monster:CreateNpc(name)
	local world = SubWorldID2Idx(self.m_MapId)
	local index = AddNpc(530, 10, world, self.m_Pos[1], self.m_Pos[2], 1, name, 1)
	if (index > 0) then
		SyncNpc(index)
		SetTmpCamp(self.m_Camp, index)
		SetNpcDeathScript(index, SCRIPT_MONSTERDEATH)
		self.m_NpcIndex = index
		return 1
	else
		BattleWorld:Log("[ERROR SEVENCITY]failed to create monster(%d)", self.m_MapId)
		return 0
	end
end
