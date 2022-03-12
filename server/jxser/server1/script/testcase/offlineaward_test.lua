Include("\\script\\lib\\unittest.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\offlineaward.lua")
Include("\\script\\testcase\\lib\\mockplayer.lua")

function Test()
	local suite = TestSuite:new("OfflineAwardTestSuite")
	suite:add(OfflineAwardTest:New())
	suite:add(OfflineTimeTest:New())
	suite:run()
end

OfflineTimeTest = {}

function OfflineTimeTest:New()
	return TestCase:new("OfflineTimeTest", OfflineTimeTest)
end

function OfflineTimeTest:setUp()
	local player = Player:New(PlayerIndex)
	self.m_OfflineLowTime = player:GetOfflineLowTime()	-- 离线领奖时间
	self.m_OfflineAdvTime = player:GetOfflineAdvTime()	-- 离线时间
	self.m_Player = player
end

function OfflineTimeTest:tearDown()
	self.m_Player:SetOfflineLowTime(self.m_OfflineLowTime)
	self.m_Player:SetOfflineAdvTime(self.m_OfflineAdvTime)
end

function OfflineTimeTest:testGetAndSetLastOfflineTime()
	local time1 = Tm2Time(2010, 5, 30, 16, 3)
	self.m_Player:SetLastOfflineTime(time1)
	self:assertEquals(self.m_Player:GetLastOfflineTime(), time1)
	local tb = Time2Tm(time1)
	self:assertTrue(tb[1] == 2010 and tb[2] == 5 and tb[3] == 30)
	self:assertTrue(tb[4] == 16 and tb[5] == 3 and tb[6] == 0)
end

function OfflineTimeTest:testGetAndSetLastLogoutTime()
	local time1 = Tm2Time(2010, 5, 30, 16, 3)
	self.m_Player:SetLastLogoutTime(time1)
	self:assertEquals(self.m_Player:GetLastLogoutTime(), time1)
	local tb = Time2Tm(time1)
	self:assertTrue(tb[1] == 2010 and tb[2] == 5 and tb[3] == 30)
	self:assertTrue(tb[4] == 16 and tb[5] == 3 and tb[6] == 0)
end

function OfflineTimeTest:testOfflineTime()
	local time1 = Tm2Time(2010, 5, 30, 16)
	local time2 = Tm2Time(2010, 5, 31, 0)
	self:assertTrue(OfflineAward:CalcOfflineTime(time1, time2) == 8 * 60)
	local time3 = Tm2Time(2010, 5, 30, 6)
	self:assertTrue(OfflineAward:CalcOfflineTime(time3, time2) == 18 * 60)
	local time4 = Tm2Time(2010, 5, 30, 5)
	self:assertTrue(OfflineAward:CalcOfflineTime(time4, time2) == 18 * 60)
	local time5 = Tm2Time(2010, 5, 30, 18)
	self:assertTrue(OfflineAward:CalcOfflineTime(time5, time2) == 6 * 60)
	self:assertEquals(OfflineAward:CalcOfflineTime(time1, Tm2Time(2010, 5, 31, 16)), (16 + 8) * 60)
	self:assertEquals(OfflineAward:CalcOfflineTime(time1, Tm2Time(2010, 5, 31, 15)), (15 + 8) * 60)
	self:assertEquals(OfflineAward:CalcOfflineTime(time1, Tm2Time(2010, 5, 31, 19)), (18 + 8) * 60)
	
	local t6 = Tm2Time(2010, 8, 5, 2, 2, 9)
	local t7 = Tm2Time(2010, 8, 5, 2, 2, 19)
	local t8 = Tm2Time(2010, 8, 5, 2, 3, 10)
	self:assertEquals(OfflineAward:CalcOfflineTime(t6, t7), 0)
	self:assertEquals(OfflineAward:CalcOfflineTime(t6, t8), 1)
end

OfflineAwardTest = {}

function OfflineAwardTest:New()
	return TestCase:new("OfflineAwardTest", OfflineAwardTest)
end

function OfflineAwardTest:setUp()
	local player = MockPlayer:New(1)
	player:SetLevel(90)
	player:SetOfflineAdvTime(62)
	self.m_Player = player
end

function OfflineAwardTest:tearDown()
	self.m_Player = nil
end

function OfflineAwardTest:testCheckCondition()
	self:assertTrue(OfflineAward:CheckCondition(self.m_Player) == 1)
	self.m_Player:SetLevel(49)
	self:assertTrue(OfflineAward:CheckCondition(self.m_Player) == 0)
	self.m_Player:SetTransLifeCount(0)
	self:assertTrue(self.m_Player:IsTransLife() == 0)
	self.m_Player:SetTransLifeCount(1)
	self:assertTrue(self.m_Player:IsTransLife() == 1)
	self:assertTrue(OfflineAward:CheckCondition(self.m_Player) == 1)
end

function OfflineAwardTest:testPlayerLogin()
	self.m_Player:SetOfflineLowTime(0)
	self.m_Player:SetOfflineAdvTime(0)
	local time1 = Tm2Time(2010, 6, 1, 0, 0)
	local time2 = Tm2Time(2010, 6, 1, 16, 0)
	self.m_Player:SetLastOfflineTime(time1)
	self.m_Player:SetLoginTime(time2)
	OfflineAward:Login(self.m_Player)
	local add = OfflineAward:CalcOfflineTime(time1, time2)
	self:assertEquals(add, 16 * 60)
	self:assertEquals(self.m_Player:GetOfflineLowTime(), add)
	self:assertEquals(self.m_Player:GetOfflineAdvTime(), add)
end

function OfflineAwardTest:testUseJiutianyunyou()
	local player = self.m_Player
	self:assertTrue(player:GetOfflineAdvTime() > 60)
	player.m_StackExp = 0
	local exp = player.m_StackExp
	local type = AWARDTYPE_JIUTIANYUNYOU
	local pill = PILL_LIST[type]
	local count = player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4])
	player:AddItemIntoEquiproom(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 1)
	self:assertEquals(player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4]), count + 1)
	local time = player:GetOfflineAdvTime()
	apply_usepill(player, type, 1)
	self:assertEquals(player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4]), count)
	local award = OfflineAward:CalcExp(type, 60, player:GetLevel(), player:GetTransLifeCount())
	self:assertEquals(player.m_StackExp, award, format("stackexp:%d, award:%d", player.m_StackExp, award))
	self:assertEquals(player:GetOfflineAdvTime(), time - 60)
end

function OfflineAwardTest:testUseWuzhoulingkong()
	local player = self.m_Player
	player.m_StackExp = 0
	local type = AWARDTYPE_WUZHOULINGKONG
	local pill = PILL_LIST[type]
	local count = player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4])
	player:AddItemIntoEquiproom(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 1)
	self:assertEquals(player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4]), count + 1)
	local time = player:GetOfflineAdvTime()
	apply_usepill(player, type, 1)
	self:assertEquals(player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4]), count)
	local award = OfflineAward:CalcExp(type, 60, player:GetLevel(), player:GetTransLifeCount())
	self:assertEquals(player.m_StackExp, award, format("stackexp:%d, award:%d", player.m_StackExp, award))
	self:assertEquals(player:GetOfflineAdvTime(), time - 60)
end

function OfflineAwardTest:testUseSihaixiaoyao()
	local player = self.m_Player
	player.m_StackExp = 0
	local type = AWARDTYPE_SIHAIXIAOYAO
	local pill = PILL_LIST[type]
	local count = player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4])
	player:AddItemIntoEquiproom(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4], 1)
	self:assertEquals(player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4]), count + 1)
	local time = player:GetOfflineAdvTime()
	apply_usepill(player, type, 1)
	self:assertEquals(player:CalcEquiproomItemCount(pill.ID[1], pill.ID[2], pill.ID[3], pill.ID[4]), count)
	local award = OfflineAward:CalcExp(type, 60, player:GetLevel(), player:GetTransLifeCount())
	self:assertEquals(player.m_StackExp, award, format("stackexp:%d, award:%d", player.m_StackExp, award))
	self:assertEquals(player:GetOfflineAdvTime(), time - 60)
end

function OfflineAwardTest:testExp()
	local types = {
		AWARDTYPE_FREE,
		AWARDTYPE_SIHAIXIAOYAO,
		AWARDTYPE_WUZHOULINGKONG,
		AWARDTYPE_JIUTIANYUNYOU
	}
	local level = 1, 200 do
		for i = 1, getn(types) do
			for tran_count = 0, 5 do
				local type = types[i]
				local exp = OfflineAward:CalcExp(type, 1, level, tran_count)
				local index = 1
				local award = 0
				if (level >= 151) then
					index = tran_count + 3
				elseif (level >= 131) then
					index = 2
				elseif (level >= 50) then
					index = 1
				else
					index = 0					
				end
				if (index > 0) then
					award = AWARDEXP_LIST[type][index]
				end
				self:assertEquals(exp, award)
			end
		end
	end
end
