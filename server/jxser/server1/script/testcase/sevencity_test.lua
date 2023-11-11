Include("\\script\\lib\\unittest.lua")
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\testcase\\lib\\mockplayer.lua")

function Test()
	local suite = TestSuite:new("SevenCityTestSuite")
	suite:add(EntranceTest:New())
	suite:add(BattleTest:New())
	suite:add(BattleWorldTest:New())
	suite:add(ConditionTest:New())
	suite:add(WorldLifeTest:New())
	suite:add(SignupTest:New())
	suite:add(BattleWorldDataTest:New())
	suite:add(MonsterTest:New())
	suite:add(TrapTest:New())
	suite:add(MapInfoTest:New())
	suite:add(MonsterCreateTest:New())
	suite:run()
end

MockCityManager = {m_ViceroyList = {}}

function MockCityManager:AppointViceroy(city, tong)
	self.m_ViceroyList[city] = tong
end

function MockCityManager:GetViceroy(city)
	return self.m_ViceroyList[city]
end

function MockCityManager:IsViceroy(tong)
	for i = 1, getn(self.m_ViceroyList) do
		if (tong == self.m_ViceroyList[i]) then
			return 1
		end
	end
	return 0
end

MonsterCreateTest = {}

function MonsterCreateTest:New()
	return TestCase:new("MonsterCreateTest", MonsterCreateTest)
end

function MonsterCreateTest:setUp()
end

function MonsterCreateTest:tearDown()
end

function MonsterCreateTest:testCreate()
	local fields = BattleWorld:GetFieldList()
	self:assertTrue(getn(fields) == 0)
	BattleWorld:Create()
	fields = BattleWorld:GetFieldList()
	local count = BattleWorld:GetFieldCount()
	self:assertTrue(getn(fields) == count and count > 0)
	for i = 1, getn(fields) do
		local field = fields[i]
		local monster = field.m_Monster
		self:assertTrue(monster ~= nil and monster.m_NpcIndex > 0)
		self:assertTrue(monster.m_TimerId == 0)
		BattleWorld:Start()
		self:assertTrue(field.m_Monster.m_TimerId > 0)
		self:assertTrue(field.m_Monster == monster)
		self:assertTrue(field.m_Monster.m_NpcIndex == monster.m_NpcIndex)
		BattleWorld:Close()
		self:assertTrue(field.m_Monster ~= nil)
		self:assertTrue(field.m_Monster.m_TimerId == 0)
		self:assertTrue(BattleWorld:GetFieldCount() == count)
	end
	BattleWorld:Destroy()
end

-- 入场测试
EntranceTest = {}

function EntranceTest:New()
	local tb = TestCase:new("EntranceTest", EntranceTest)
	return tb
end

function EntranceTest:setUp()
	BattleWorld:Create()
	BattleWorld:Start()
	self.m_Player = MockPlayer:New(1)
	self.m_Player:DisabledUseTownP(0)
	self.m_Player:DisabledUseHeart(0)
end

function EntranceTest:tearDown()
	BattleWorld:Close()
	BattleWorld:Destroy()
	self.m_Player:DisabledUseTownP(1)
	self.m_Player:DisabledUseHeart(1)
end

function EntranceTest:testBattleWorldExists()
	self:assertTrue(BattleWorld ~= nil)
end

function EntranceTest:testEnterOk()
	local player = self.m_Player
	player:SetTong("tong1")
	local w1, x1, y1 = player:GetWorldPos()
	for _, mapid in BATTLE_LIST do
		-- local mapid = BATTLE_LIST[i]
		local field = BattleWorld:FindField(mapid)
		self:assertTrue(field ~= nil)
		self:assertTrue(player:GetDisabledUseTownP() == 0)
		self:assertTrue(player:GetDisabledUseHeart() == 0)
		
		player:SetTmpCamp(0)
		self:assertTrue(player:GetTmpCamp() == 0)
		field:Enter(player)

		local state = player.m_SkillState
		self:assertTrue(state ~= nil)
		self:assertTrue(state.Id == 963)
		self:assertTrue(state.Level == 1)
		self:assertTrue(state.Type == 0)
		self:assertTrue(state.Time == 18 * 3)
		self:assertEquals(player:GetProtectTime(), 3 * 18)
		self:assertTrue(player:GetDisabledUseTownP() == 1)
		self:assertTrue(player:GetDisabledUseHeart() == 1)
		self:assertTrue(field:GetWarriorCount() == 1)
		self:assertTrue(player:GetForbidEnmity() == 1)

		self:assertTrue(player:GetLogoutRV() == 1)
		self:assertTrue(player:GetFightState() == 1)
		local camp = player:GetTmpCamp()
		self:assertTrue(camp ~= nil and camp ~= 0 and camp ~= CAMP_MONSTER)
		self:assertTrue(player:GetPunish() == 0)
		self:assertTrue(player:GetDeathScript() == SCRIPT_WARRIORDEATH)

		field:Leave(player)

		self:assertTrue(field:GetWarriorTimer(player) == nil)
		self:assertTrue(player:GetDisabledUseTownP() == 0)
		self:assertTrue(player:GetDisabledUseHeart() == 0)
		self:assertTrue(player:GetTmpCamp() == 0)
		self:assertTrue(player:GetDeathScript() == "")
		self:assertTrue(player:GetForbidEnmity() == 0)
	end
end

function EntranceTest:testFieldNotOpen()
	BattleWorld:Destroy()
	local player = MockPlayer:New(PlayerIndex)
	for _, mapid in BATTLE_LIST do
		self:assertTrue(BattleWorld:FindField(mapid) == nil)
	end
end

-- 测试trap点
TrapTest = {}

function TrapTest:New()
	return TestCase:new("TrapTest", TrapTest)
end

function TrapTest:setUp()
	BattleWorld:Create()
end

function TrapTest:tearDown()
	BattleWorld:Destroy()
end

function TrapTest:testTransfer()
	local fields = BattleWorld:GetFieldList()
	local gates = BattleWorld.m_GateList
	local player = MockPlayer:New(1)
	player:SetName("player1")
	for i = 1, getn(fields) do
		local field = fields[i]
		for j = 1, getn(gates) do
			local inf = gates[j]
			if (field.m_MapId ~= inf.MapId and getn(inf.PosList) > 0) then
				-- 跨服
				local mapid = inf.MapId
				inf.MapId = 9999
				field:Enter(player)
				self:assertTrue(field:InField(player) == 1)
				BattleWorld:Trap(player, field.m_MapId, j)
				self:assertTrue(field:InField(player) == 0)
				local w, x, y = player:GetWorldPos()
				self:assertTrue(self:InPosList(x, y, inf.PosList) == 1)
				inf.MapId = mapid
			end
		end
	end
end

function TrapTest:InPosList(x, y, list)
	local i = 1
	for i = 1, getn(list) do
		if (x == (list[i][1] / 32) and y == (list[i][2] / 32)) then
			return 1
		end
	end
	return 0
end

function TrapTest:QueryMapTrap(mapid, x, y, ret)
	local scriptid, param = QueryMapTrap(mapid, x, y)
	if (scriptid) then
		local tb = BattleWorld.m_GateList[param]
		if (tb) then
			ret.Script = scriptid
			ret.MapId = tb.MapId
			ret.PosList = tb.PosList
		end
	end
end

function TrapTest:LoadPosList(file)
	local tb = {}
	if (TabFile_Load(file, file) ~= 0) then
		local count = TabFile_GetRowCount(file)
		if (count >= 2) then
			for i = 2, count do
				local x = tonumber(TabFile_GetCell(file, i, 1))
				local y = tonumber(TabFile_GetCell(file, i, 2))
				tinsert(tb, {x, y})
			end
		end
	end
	return tb
end

-- 比较两个list，如果相等返回1，否则返回0
function TrapTest:CmpList(list1, list2)
	if (getn(list1) ~= getn(list2)) then
		return 0
	end
	local i = 1
	for i = 1, getn(list1) do
		local p1 = list1[i]
		local p2 = list2[i]
		if (p1[1] ~= p2[1] or p1[2] ~= p2[2]) then
			return 0
		end
	end
	return 1
end

function TrapTest:testTrap()
	local map_list = {
		FIELD_CHENGDU,		-- 成都战场(926)
		FIELD_BIANJING,		-- 汴京战场(927)
		FIELD_DALI,			-- 大理战场(928)
		FIELD_FENGXIANG,	-- 凤翔战场(929)
		FIELD_LINAN, 		-- 临安战场(930)
		FIELD_XIANGYANG,	-- 襄阳战场(931)
		FIELD_YANGZHOU,		-- 扬州战场(932)
	}
	local ret = {}
	for i = 1, getn(map_list) do
		for j = 1, getn(map_list) do
			if (i ~= j) then
				local src = map_list[i]
				local dst = map_list[j]
				for k = 1, 3 do
					local gate_file = format("\\settings\\maps\\missions\\sevencity\\gate%d_%d_%d.txt", k, src, dst)
					local trap_file = format("\\settings\\maps\\missions\\sevencity\\trap%d_%d_%d.txt", k, src, dst)
					local gate_list = self:LoadPosList(gate_file)
					local trap_list = self:LoadPosList(trap_file)
					self:assertEquals(getn(gate_list) > 0, getn(trap_list) > 0)
					for l = 1, getn(trap_list) do
						local x = trap_list[l][1]
						local y = trap_list[1][2]
						self:QueryMapTrap(src, x, y, ret)
						self:assertTrue(ret.MapId == dst)
						self:assertTrue(self:CmpList(gate_list, ret.PosList) == 1,
							format("traptest[%d=>%d]", src, dst))
					end
				end
			end
		end
	end
end

-- 测试城战
BattleTest = {}

function BattleTest:New()
	local tb = TestCase:new("BattleTest", BattleTest)
	return tb
end

function BattleTest:setUp()
	BattleWorld:Create()
end

function BattleTest:tearDown()
	BattleWorld:Destroy()
end

function BattleTest:testExpTimer()
	local player = MockPlayer:New(1)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(field.m_FightState == 0)
		self:assertTrue(field:InField(player) == 0)
		field:Enter(player)
		self:assertTrue(field:InField(player) == 1)
		self:assertTrue(field:GetTimerId(player) == nil)
		field:Start()
		self:assertTrue(field:GetTimerId(player) > 0)
		field:Leave(player)
		self:assertTrue(field:GetTimerId(player) == nil)
		self:assertTrue(field:InField(player) == 0)
	end
end

function BattleTest:testTongCamp()
	local player = MockPlayer:New(1)
	local tong = player:GetTong()
	self:assertTrue(tong ~= nil)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		field:Enter(player)
		local camp = player:GetTmpCamp()
		local tongcamp = BattleWorld:FindTongCamp(tong) 
		local camptong = BattleWorld:FindCampTong(camp)
		self:assertTrue(camptong ~= nil)
		self:assertTrue(tongcamp == camp)
		self:assertTrue(camptong == tong)
		field:Leave(player)
		camp = player:GetTmpCamp()
		self:assertTrue(camp == 0)
		tongcamp = BattleWorld:FindTongCamp(tong) 
		camptong = BattleWorld:FindCampTong(tongcamp)
		self:assertTrue(camptong == tong)
	end
end

-- 测试进入地图后的战斗状态
function BattleTest:testFightStateAfterEntering1()
	local player = MockPlayer:New(1)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		player:SetFightState(0)
		local field = fields[i]
		self:assertTrue(field.m_FightState == 0)
		self:assertTrue(player:GetFightState() == 0)
		field:Enter(player)
		self:assertTrue(field.m_FightState == 0)
		self:assertTrue(player:GetFightState() == 0)
	end
end

-- 测试进入地图后的战斗状态
function BattleTest:testFightStateAfterEntering2()
	local player = MockPlayer:New(1)
	local fields = BattleWorld:GetFieldList()
	BattleWorld:Start()
	for i = 1, getn(fields) do
		player:SetFightState(0)
		local field = fields[i]
		self:assertTrue(field.m_FightState == 1)
		self:assertTrue(player:GetFightState() == 0)
		field:Enter(player)
		self:assertTrue(field.m_FightState == 1)
		self:assertTrue(player:GetFightState() == 1)
	end
end

-- 测试进入地图后的战斗状态
function BattleTest:testFightStateAfterEntering3()
	local player = MockPlayer:New(1)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		player:SetFightState(0)
		local field = fields[i]
		self:assertTrue(field.m_FightState == 0)
		self:assertTrue(player:GetFightState() == 0)
		BattleWorld:Start()
		self:assertTrue(field.m_FightState == 1)
		self:assertTrue(player:GetFightState() == 0)
		field:Enter(player)
		self:assertTrue(field.m_FightState == 1)
		self:assertTrue(player:GetFightState() == 1)
		BattleWorld:Close()
	end
end

-- 测试战绩
function BattleTest:testStandings()
	local player = MockPlayer:New(1)
	local tong = "tong_test"
	player:SetTong(tong)
	player:SetName("player1")
	local camp = BattleWorld:RegisterCamp(tong)
	player:SetTmpCamp(camp)
	local new = BattleWorld:GetStandings(player:GetName(0))
	local old = clone(new)
	self:assertTrue(old.KillWarriorCount == 0)
	self:assertTrue(old.KillMonsterCount == 0)
	local name = player:GetName()
	BattleWorld:AddKillWarriorCount(name, 1)
	BattleWorld:AddKillWarriorCount(name, 2)
	BattleWorld:AddKillMonsterCount(name)
	self:assertTrue(new.KillWarriorCount == old.KillWarriorCount + 3)
	self:assertTrue(new.KillMonsterCount == old.KillMonsterCount + 1)
	
	fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:GetWinner(field.m_MapId) == nil)
	end

	BattleWorld:Start()
	new = BattleWorld:GetStandings(player:GetName())
	self:assertEquals(tong, BattleWorld:FindCampTong(player:GetTmpCamp()))
	self:assertTrue(new.KillWarriorCount == 0)
	self:assertTrue(new.KillMonsterCount == 0)

	local enemy = MockPlayer:New(2)
	local count_killwarrior = 0
	local count_killmonster = 0
	fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		new = BattleWorld:GetStandings(player:GetName())
		field:Login(player)
		field:Login(enemy)
		
		local tb = clone(new)
		field:KillWarrior(player, enemy)
		self:assertTrue(new.KillWarriorCount == tb.KillWarriorCount + 1)
		self:assertTrue(BattleWorld:GetWinner(field.m_MapId) == nil)
		field:KillMonster(player)
		self:assertTrue(new.KillMonsterCount == tb.KillMonsterCount + 1)
		self:assertTrue(BattleWorld:GetWinner(field.m_MapId) == nil)
		count_killwarrior = count_killwarrior + new.KillWarriorCount
		count_killmonster = count_killmonster + new.KillMonsterCount
		
		field:Logout(player)
		field:Logout(enemy)
	end
	
	BattleWorld:Close()
	fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:GetWinner(field.m_MapId) == tong)
	end
	new = BattleWorld:GetStandings(player:GetName())
	self:assertTrue(count_killwarrior == old.KillWarriorCount + getn(fields))
	self:assertTrue(count_killmonster == old.KillMonsterCount + getn(fields))
end

function BattleTest:testLogin()
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		BattleWorld:Start()
		local player = MockPlayer:New(1)
		local field = fields[i]

		local count = 0
		local _x = 0
		local _y = 0
		for i = 1, 100 do
			field:Login(player)
			local w, x, y = player:GetWorldPos()
			self:assertTrue(w == field.m_MapId)
			if (_x == 0 or _y == 0) then
				_x = x
				_y = y
			end
			if (x ~= _x or y ~= _y) then
				count = count + 1
			end
			field:Logout(player)
		end
		self:assertTrue(count > 0)
		BattleWorld:Close()
	end
end

function BattleTest:testLogout()
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		BattleWorld:Start()
		local player = MockPlayer:New(1)
		local field = fields[i]

		field:Login(player)
		field:Logout(player)
		local w, x, y = player:GetWorldPos()
		local outpos = MAP_INFO[field.m_MapId].OutPos
		self:assertTrue(w == outpos[1] and x == outpos[2] and y == outpos[3])
		BattleWorld:Close()
	end
end

function BattleTest:testBattleClose()
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		BattleWorld:Start()
		local player = MockPlayer:New(1)
		local field = fields[i]

		field:Login(player)
		BattleWorld:Close()
		local outpos = MAP_INFO[field.m_MapId].OutPos
		w, x, y = player:GetWorldPos()
		self:assertTrue(w == outpos[1] and x == outpos[2] and y == outpos[3])
	end
end

function BattleTest:testBattleStart()
	local fieldlist1 = BattleWorld:GetFieldList()
	self:assertTrue(getn(fieldlist1) > 0)
	for i = 1, getn(fieldlist1) do
		local player = MockPlayer:New(i)
		local field = fieldlist1[i]
		self:assertTrue(field ~= nil)
		field:Enter(player)
		self:assertTrue(field:GetFightState() == 0)
		-- 测试龙柱
		self:assertTrue(field.m_Monster ~= nil)
	end
	BattleWorld:Start()

	-- 测试战场玩家
	local fieldlist2 = BattleWorld:GetFieldList()
	self:assertTrue(getn(fieldlist2) > 0)
	for i = 1, getn(fieldlist2) do
		local field = fieldlist2[i]
		self:assertTrue(field == fieldlist1[i])
		-- 测试龙柱
		self:assertTrue(field.m_Monster ~= nil)
		local monster_idx = field.m_Monster.m_NpcIndex
		self:assertTrue(monster_idx > 0)
		local script, _ = GetNpcScript(monster_idx)
		self:assertEquals(script, SCRIPT_MONSTERDEATH)
		self:assertTrue(field.m_Monster.m_TimerId > 0)
		local monster_camp = field.m_Monster:GetCamp()
		self:assertTrue(monster_camp == CAMP_MONSTER)
		self:assertTrue(field:GetFightState() == 1)

		local playerlist = field:GetWarriorList()
		for j = 1, getn(playerlist) do
			local warrior = playerlist[j]
			self:assertTrue(warrior:GetFightState() == 1)
			self:assertTrue(warrior:GetTmpCamp() ~= monster_camp)
		end
	end
	
	BattleWorld:Close()
	local fieldlist3 = BattleWorld:GetFieldList()
	self:assertTrue(getn(fieldlist3) > 0)
	for i = 1, getn(fieldlist2) do
		local field = fieldlist3[i]
		self:assertTrue(field:GetWarriorCount() == 0)
		self:assertTrue(field:GetFightState() == 0)
	end
end

function BattleTest:testKillMonster()
	BattleWorld:Start()
	local player = MockPlayer:New(1)
	local fields = BattleWorld:GetFieldList()
	BattleWorld:SetWarriorTong(player:GetName(), "tong1")
	for i = 1, getn(fields) do
		local field = fields[i]
		local monster = field.m_Monster
		local monster_camp = monster:GetCamp()
		player:SetTmpCamp(monster_camp + 1)
		field:KillMonster(player)
		self:assertTrue(monster:GetCamp() == player:GetTmpCamp())
		-- 龙柱重生
		self:assertTrue(monster.m_NpcIndex > 0)
		self:assertTrue(monster.m_TimerId > 0)
	end
end

function BattleTest:testTimeScore()
	BattleWorld:Start()
	local player = MockPlayer:New(1)
	local fields = BattleWorld:GetFieldList()
	local name = player:GetName()
	for i = 1, getn(fields) do
		local standings = BattleWorld:GetStandings(name)
		local field = fields[i]
		local score = BattleWorld:GetTimeScore(name)
		self:assertTrue(score == standings.TimeScore)
		local exp = player:GetStackExp()
		self:assertTrue(field:GetWarriorTimer(player) == nil)

		field:Enter(player)

		local timerid = field:GetWarriorTimer(player)
		self:assertTrue(timerid > 1)
		TimerList:OnTime(timerid)
		self:assertTrue(player:GetStackExp() == exp + TIMEAWARD_EXP)
		self:assertTrue(BattleWorld:GetTimeScore(name) == score + TIMEAWARD_SCORE)
		self:assertTrue(standings.TimeScore == score + TIMEAWARD_SCORE)
		
		field:Leave(player)
		
		self:assertTrue(field:GetWarriorTimer(player) == nil)
		self:assertTrue(TimerList:FindTimer(timerid) == nil)
	end
end

function BattleTest:testTongWarriorCountInField()
	local player1 = MockPlayer:New(1)
	local player2 = MockPlayer:New(2)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		local tong = "tong1"
		player1:SetTong(tong)
		player2:SetTong(tong)
		self:assertEquals(field:GetTongWarriorCount(tong), 0)
		field:Enter(player1)
		self:assertEquals(field:GetTongWarriorCount(tong), 1)
		field:Enter(player2)
		self:assertEquals(field:GetTongWarriorCount(tong), 2)
		field:Leave(player1)
		self:assertEquals(field:GetTongWarriorCount(tong), 1)
		field:Leave(player2)
		self:assertEquals(field:GetTongWarriorCount(tong), 0)
	end
end

WorldLifeTest = {}
function WorldLifeTest:New()
	return TestCase:new("WorldLifeTest", WorldLifeTest)
end

function WorldLifeTest:testGetFieldCount()
	self:assertTrue(BattleWorld:GetFieldCount() == 0)
	BattleWorld:Create()
	self:assertTrue(BattleWorld:GetFieldCount() > 0)
	BattleWorld:Destroy()
	self:assertTrue(BattleWorld:GetFieldCount() == 0)
end

BattleWorldTest = {}

function BattleWorldTest:New()
	local tb = TestCase:new("BattleWorldTest", BattleWorldTest)
	return tb
end

function BattleWorldTest:setUp()
	BattleWorld:Create()
	BattleWorld:Start()
end

function BattleWorldTest:tearDown()
	BattleWorld:Close()
	BattleWorld:Destroy()
end

function BattleWorldTest:testTrapCount()
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		local count = GetMapTrapCount(field.m_MapId)
		self:assertTrue(count > 0)
	end
end

function BattleWorldTest:testSyncTongWarriorCount()
	local tong = "tong1"
	local count = 0
	BattleWorld:SyncTongWarriorCount(tong, count)
	self:assertEquals(BattleWorld:GetTongWarriorCount(tong), count)
	count = 100
	BattleWorld:SyncTongWarriorCount(tong, count)
	self:assertEquals(BattleWorld:GetTongWarriorCount(tong), count)
	BattleWorld:Close()
	BattleWorld:Start()
	self:assertEquals(BattleWorld:GetTongWarriorCount(tong), 0)
end

function BattleWorldTest:testWinnerTong()
	BattleWorld.m_CityManager = MockCityManager
	local player = MockPlayer:New(1)
	player:SetTmpCamp(100)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		field:Enter(player)
		field:KillMonster(player)
		local city = MAP_INFO[field.m_MapId].CityIndex
		self:assertTrue(city ~= nil)
		MockCityManager:AppointViceroy(city, "")
		field:Close()
		local monster_camp = field.m_Monster:GetCamp()
		self:assertTrue(monster_camp, 100)
		local tong = BattleWorld:FindCampTong(monster_camp)
		self:assertTrue(player:GetTong(), tong)
		self:assertTrue(MockCityManager:GetViceroy(city) == tong)
	end	
end

BattleWorldDataTest = {}

function BattleWorldDataTest:New()
	return TestCase:new("BattleWorldDataTest", BattleWorldDataTest)
end

function BattleWorldDataTest:testNoWinner()
	BattleWorld:Create()
	BattleWorld:Start()
	BattleWorld:Close()
	local fields = BattleWorld:GetFieldList()
	self:assertTrue(getn(fields) > 0)
	for i = 1, getn(fields) do
		local mapid = fields[i].m_MapId
		self:assertTrue(BattleWorld:GetWinner(mapid) == "")
	end
	BattleWorld:Destroy()
end

function BattleWorldDataTest:testWarriorTong()
	local player = MockPlayer:New(1)
	local name = "player1"
	player:SetName(name)
	player:SetTong("tong1")
	self:assertTrue(BattleWorld:GetWarriorTong(name) == nil)
	self:assertTrue(BattleWorld:CheckWarriorTongChange(name, player:GetTong()) == 0)
	local new_tong = "tong2"
	BattleWorld:SetWarriorTong(name, new_tong)
	self:assertTrue(BattleWorld:GetWarriorTong(name) == new_tong)
	self:assertTrue(BattleWorld:CheckWarriorTongChange(name, player:GetTong()) == 1)
	BattleWorld:Create()
	self:assertTrue(BattleWorld:GetWarriorTong(name) == nil)
	self:assertTrue(BattleWorld:CheckWarriorTongChange(name, player:GetTong()) == 0)
	BattleWorld:Destroy()
end

ConditionTest = {}

function ConditionTest:New()
	return TestCase:new("ConditionTest", ConditionTest)
end

function ConditionTest:setUp()
	local player = MockPlayer:New(1)
	player:SetName("player1")
	local tong = "tong1"
	player:SetTong(tong)
	player:SetLevel(90)
	player:SetJoinTongTime(7 * 24 * 60)
	self.m_Player = player
	BattleWorld:Create()
	BattleWorld:Start()
	BattleWorld:SyncSignup(tong)
end

function ConditionTest:tearDown()
	self.m_Player = nil
	BattleWorld:Close()
	BattleWorld:Destroy()
end

function ConditionTest:testNoSignup()
	local fields = BattleWorld:GetFieldList()
	local tong = self.m_Player:GetTong()
	local err = {}
	for i = 1, getn(fields) do
		local field = fields[i]
		BattleWorld.m_SignupList[tong] = nil
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
		BattleWorld:SyncSignup(tong)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 1)
	end
end

function ConditionTest:testTongChange()
	local name = self.m_Player:GetName()
	local new_tong = "tong2"
	self:assertTrue(new_tong ~= self.m_Player:GetTong())
	BattleWorld:SetWarriorTong(name, new_tong)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:CheckWarriorTongChange(name, self.m_Player:GetTong()) == 1)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
	end
end

function ConditionTest:testBattleState()
	local fields = BattleWorld:GetFieldList()
	local err = {}
	for i = 1, getn(fields) do
		local field = fields[i]
		BattleWorld.m_State = STATE_INIT
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
		BattleWorld.m_State = STATE_STARTSIGNUP
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
		BattleWorld.m_State = STATE_CLOSESIGNUP
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
		BattleWorld.m_State = STATE_CLOSEWAR
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
		BattleWorld.m_State = STATE_PREPARING
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player, err) == 1)
		BattleWorld.m_State = STATE_STARTWAR
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player, err) == 1)
	end
end

function ConditionTest:testConditionOk()
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 1)
		self.m_Player:SetJoinTongTime(7 * 24 * 60)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 1)
		self.m_Player:SetJoinTongTime(8 * 24 * 60)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 1)
	end
end

function ConditionTest:testNoTong()
	self.m_Player:SetTong("")
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
	end
end

function ConditionTest:testLowLevel()
	self.m_Player:SetLevel(89)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
	end
end

function ConditionTest:testNewTongMember()
	self.m_Player:SetJoinTongTime(6 * 24 * 60)
	self:assertTrue(self.m_Player:GetJoinTongTime() == 6 * 24 * 60)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		local field = fields[i]
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
	end
end

function ConditionTest:testFieldTongWarrior()
	local fields = BattleWorld:GetFieldList()
	local tong = self.m_Player:GetTong()
	local err = {}
	for i = 1, getn(fields) do
		local field = fields[i]
		field:SetTongWarriorCount(tong, 0)
		local res = BattleWorld:CheckPermission(field.m_MapId, self.m_Player, err)
		self:assertTrue(res == 1)
		if (res ~= 1) then
			print(err.Msg)
		end
		field:SetTongWarriorCount(tong, PARAM_LIST.FIELD_TONGMEMBER - 1)
		res = BattleWorld:CheckPermission(field.m_MapId, self.m_Player, err)
		self:assertTrue(res == 1)
		if (res ~= 1) then
			print(err.Msg)
		end
		field:SetTongWarriorCount(tong, PARAM_LIST.FIELD_TONGMEMBER)
		self:assertEquals(field:GetTongWarriorCount(tong), PARAM_LIST.FIELD_TONGMEMBER)
		res = BattleWorld:CheckPermission(field.m_MapId, self.m_Player, err)
		self:assertTrue(res == 0)
		if (res ~= 0) then
			print(err.Msg)
		end
		self.m_Player:SetTong("tong2")
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
		self.m_Player:SetTong(tong)
	end
end

function ConditionTest:testWorldTongWarrior()
	local fields = BattleWorld:GetFieldList()
	local tong = self.m_Player:GetTong()
	for i = 1, getn(fields) do
		local field = fields[i]
		BattleWorld:SyncTongWarriorCount(tong, 0)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 1)
		BattleWorld:SyncTongWarriorCount(tong, PARAM_LIST.WORLD_TONGMEMBER - 1)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 1)
		BattleWorld:SyncTongWarriorCount(tong, PARAM_LIST.WORLD_TONGMEMBER)
		self:assertTrue(BattleWorld:CheckPermission(field.m_MapId, self.m_Player) == 0)
	end
end

SignupTest = {}

function SignupTest:New()
	return TestCase:new("SignupTest", SignupTest)
end

function SignupTest:setUp()
	local player = MockPlayer:New(1)
	self.m_Player = player
	player:SetName("player1")
	player:SetTong("tong1")
	player:OwnCash(SIGNUP_MONEY)
	player:OwnTiaozhanlingCount(SIGNUP_TIAOZHANLINGCOUNT)
	player:SetTongMaster(player:GetName())
	
	BattleWorld.m_CityManager = MockCityManager
	-- MockCityManager:AppointViceroy(1, player:GetTong())
	
	self.m_State = BattleWorld.m_State
	BattleWorld.m_State = STATE_STARTSIGNUP
	BattleWorld:StartSignup()
end

function SignupTest:tearDown()
	BattleWorld.m_State = self.m_State
end

function SignupTest:testDefaultOk()
	local tong = self.m_Player:GetTong()
	local err = {}
	self:assertTrue(BattleWorld:CheckSignup(tong) == 0)
	self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 1)
	self:assertTrue(BattleWorld:CheckSignup(tong) == 1)
	BattleWorld:Create()
	BattleWorld:Start()
	BattleWorld:Close()
	self:assertTrue(BattleWorld:CheckSignup(tong) == 0)
	BattleWorld:Destroy()
end

function SignupTest:testWrongState()
	local err = {}
	local tong = self.m_Player:GetTong()
	for i = STATE_INIT, STATE_CLOSEWAR do
		if (i ~= STATE_STARTSIGNUP) then
			BattleWorld.m_State = i
			self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 0)
			self:assertTrue(BattleWorld:CheckSignup(tong) == 0)
		end
	end
end

function SignupTest:testNotTongMaster()
	local err = {}
	self.m_Player:SetTongMaster(nil)
	self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 0)
	self:assertTrue(BattleWorld:CheckSignup(self.m_Player:GetTong()) == 0)
end

function SignupTest:testViceroy()
	local err = {}
	local tong = self.m_Player:GetTong()
	for i = 1, 7 do
		BattleWorld.m_CityManager:AppointViceroy(i, tong)
		BattleWorld:StartSignup()
		self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 0)
		self:assertTrue(BattleWorld:CheckSignup(tong) == 0)
	end
end

function SignupTest:testSignupDone()
	local tong = self.m_Player:GetTong()
	BattleWorld.m_SignupList[tong] = 1
	local err = {}
	self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 0)
	self:assertTrue(BattleWorld:CheckSignup(tong) == 1)
end

function SignupTest:testNoEnoughMoney()
	local money = self.m_Player:GetCash()
	self.m_Player:OwnCash(money - 1)
	local tong = self.m_Player:GetTong()
	local err = {}
	self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 0)
	self:assertTrue(BattleWorld:CheckSignup(tong) == 0)
end

function SignupTest:testNoEnoughTiaozhanling()
	local count = self.m_Player:GetTiaozhanlingCount()
	self.m_Player:OwnTiaozhanlingCount(count - 1)
	local tong = self.m_Player:GetTong()
	local err = {}
	self:assertTrue(BattleWorld:Signup(self.m_Player, err) == 0)
	self:assertTrue(BattleWorld:CheckSignup(tong) == 0)
end

MonsterTest = {}

function MonsterTest:New()
	return TestCase:new("MonsterTest", MonsterTest)
end

function MonsterTest:setUp()
	BattleWorld:Create()
	BattleWorld:Start()
end

function MonsterTest:tearDown()
	BattleWorld:Close()
	BattleWorld:Destroy()
end

-- 测试龙柱死亡和定时器到时
function MonsterTest:testDownAndTimeout()
	local killer = MockPlayer:New(1)
	killer:SetName("MonsterKiller")
	killer:SetTmpCamp(100)
	local fields = BattleWorld:GetFieldList()
	for i = 1, getn(fields) do
		fields[i]:Enter(killer)
		local monster = fields[i].m_Monster
		local npcidx1 = monster.m_NpcIndex
		self:assertTrue(GetNpcKind(npcidx1) == 0)
		self:assertTrue(npcidx1 ~= nil and npcidx1 > 0)
		self:assertTrue(monster:GetCamp() > 0 and monster:GetCamp() ~= killer:GetTmpCamp())
		local id1 = monster.m_TimerId
		self:assertTrue(TimerList:FindTimer(id1) ~= nil)
		self:assertTrue(id1 ~= nil and id1 > 0)

		monster:Down(killer)
		local npcidx2 = monster.m_NpcIndex
		self:assertTrue(GetNpcKind(npcidx2) == 0)
		self:assertTrue(npcidx2 ~= nil and npcidx2 > 0 and npcidx2 ~= npcidx1)
		local id2 = monster.m_TimerId
		self:assertTrue(TimerList:FindTimer(id2) ~= nil)
		self:assertTrue(id2 ~= nil and id2 > 0 and id2~= id1)
		self:assertTrue(monster:GetCamp() > 0 and monster:GetCamp() == killer:GetTmpCamp())
		
		monster:OnTime()
		local npcidx3 = monster.m_NpcIndex
		self:assertTrue(GetNpcKind(npcidx3) == 3)
		self:assertTrue(npcidx3 ~= nil and npcidx3 > 0 and npcidx3 ~= npcidx2)
		self:assertTrue(TimerList:FindTimer(id2) == nil)
		self:assertTrue(monster.m_TimerId == 0)
		fields[i]:Leave(killer)
	end
end

MapInfoTest = {}

function MapInfoTest:New()
	return TestCase:new("MapInfoTest", MapInfoTest)
end

function MapInfoTest:testInfoOk()
	local count = 0
	for key, info in MAP_INFO do
		self:assertTrue(info.CityIndex)
		self:assertTrue(info.Name)
		self:assertTrue(info.CityName)
		self:assertTrue(info.OutPos)
		self:assertTrue(info.MonsterPos)
		count = count + 1
	end
	self:assertTrue(count == 7)
end
