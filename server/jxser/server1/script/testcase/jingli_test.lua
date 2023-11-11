Include("\\script\\lib\\unittest.lua")
Include("\\script\\global\\jingli.lua")

function Test()
	local suite = TestSuite:new("JingliTestSuite")
	suite:add(HunyuanPotionTest:New())
	suite:add(JingliTest:New())
	suite:add(DlgTest:New())
	suite:add(EntranceTest:New())
	suite:add(ConditionTest:New())
	suite:run()
end

HunyuanPotionTest = {
	m_Tasks = {}
}

function HunyuanPotionTest:New()
	local tb = TestCase:new("HunyuanPotionTest", HunyuanPotionTest)
	return tb
end

function HunyuanPotionTest:setUp()
	HunyuanPotionTest.m_Tasks = {}
	self.m_OldGetTask = GetTask
	self.m_OldSetTask = SetTask
	GetTask = HunyuanPotionTest.GetTask
	SetTask = HunyuanPotionTest.SetTask
	self.m_Player = Player:New(PlayerIndex)
	self.m_Potion = HunyuanPotion:New(self.m_Player)
	self.m_Energy = GetEnergy()
	self.m_OldSay = Say
	Say = Cancel
end

function HunyuanPotionTest:tearDown()
	GetTask = self.m_OldGetTask
	SetTask = self.m_OldSetTask
	HunyuanPotionTest.m_Tasks = {}
	SetEnergy(self.m_Energy)
	Say = self.m_OldSay
end

function HunyuanPotionTest.GetTask(id)
	local value = HunyuanPotionTest.m_Tasks[id]
	if (not value) then
		value = 0
	end
	return value
end

function HunyuanPotionTest.SetTask(id, value)
	HunyuanPotionTest.m_Tasks[id] = value
end

function HunyuanPotionTest:testTask()
	self:assertTrue(self.m_Player:GetTask(100) == 0)
	self.m_Player:SetTask(100, 200)
	self:assertTrue(HunyuanPotionTest.m_Tasks[100] == 200)
	self:assertTrue(self.m_Player:GetTask(100) == 200)
	self.m_Player:SetTask(100, 0)
	self:assertTrue(self.m_Player:GetTask(100) == 0)
	
	self.m_Player:SetTask(1000, 20000)
	local task = self.m_Player:GetTask(1000)
	self:assertEquals(task, 20000)
	self.m_Player:SetTask(1000, 0)
	task = self.m_Player:GetTask(1000)
	self:assertEquals(task, 0)
end

function HunyuanPotionTest:testEncodeAndDecode()
	self.m_Potion:EncodeRefiningTask(123, 1, 100)
	local count, flag, time = self.m_Potion:DecodeRefiningTask()
	self:assertEquals(count, 123)
	self:assertEquals(flag, 1)
	self:assertEquals(time, 100)

	self.m_Potion:EncodeRefiningTask(0, 0, 0)
	count, flag, time = self.m_Potion:DecodeRefiningTask()
	self:assertEquals(count, 0)
	self:assertEquals(flag, 0)
	self:assertEquals(time, 0)
	
	self.m_Potion:EncodeDateTask(123, 100)
	local count, time = self.m_Potion:DecodeDateTask()
	self:assertEquals(count, 123)
	self:assertEquals(time, 100)
end

function HunyuanPotionTest:testCurrentDateRefineCount()
	local count1 = self.m_Potion:GetCurrentDateRefineCount(010412)
	self:assertTrue(count1 == 0)
	
	self.m_Potion:AddCurrentDateRefineCount(010412)
	local count2 = self.m_Potion:GetCurrentDateRefineCount(010412)
	self:assertTrue(count2 == count1 + 1)

	self.m_Potion:AddCurrentDateRefineCount(010412)
	local count3 = self.m_Potion:GetCurrentDateRefineCount(010412)
	self:assertTrue(count3 == count2 + 1)

	local count4 = self.m_Potion:GetCurrentDateRefineCount(010413)
	self:assertTrue(count4 == 0)

	self.m_Potion:AddCurrentDateRefineCount(010413)
	local count5 = self.m_Potion:GetCurrentDateRefineCount(010413)
	self:assertTrue(count5 == 1)
	
	self.m_Potion:ClearCurrentDateRefineCount()
	local count6 = self.m_Potion:GetCurrentDateRefineCount(010412)
	local count7 = self.m_Potion:GetCurrentDateRefineCount(010413)
	self:assertTrue(count6 == 0)
	self:assertTrue(count7 == 0)
end

function HunyuanPotionTest:testRefineDate()
	self:assertTrue(self.m_Potion:GetRefineDate() == 0)
	self.m_Potion:SetRefineDate(010412)
	self:assertTrue(self.m_Potion:GetRefineDate() == 010412)
end

function HunyuanPotionTest:testFinishedCount()
	self:assertTrue(self.m_Potion:GetFinishedCount() == 0)
	self.m_Potion:AddFinishedCount()
	self:assertTrue(self.m_Potion:GetFinishedCount() == 1)
	self.m_Potion:AddFinishedCount()
	self.m_Potion:AddFinishedCount()
	self:assertTrue(self.m_Potion:GetFinishedCount() == 3)
	self.m_Potion:ReduceFinishedCount()
	self:assertTrue(self.m_Potion:GetFinishedCount() == 2)
	self.m_Potion:ClearFinishedCount()
	self:assertTrue(self.m_Potion:GetFinishedCount() == 0)
end

function HunyuanPotionTest:testRefiningTime()
	self:assertTrue(self.m_Potion:GetRefiningTime() == 0)
	self.m_Potion:AddRefiningTime(1)
	self:assertTrue(self.m_Potion:GetRefiningTime() == 1)
	self.m_Potion:AddRefiningTime(1)
	self.m_Potion:AddRefiningTime(2)
	self:assertTrue(self.m_Potion:GetRefiningTime() == 4)
	self.m_Potion:ClearRefiningTime()
	self:assertTrue(self.m_Potion:GetRefiningTime() == 0)
end

function HunyuanPotionTest:testRefiningFlag()
	self.m_Potion:SetRefiningFlag(0)
	self:assertTrue(self.m_Potion:GetRefiningFlag() == 0)
	self.m_Potion:SetRefiningFlag(1)
	self:assertTrue(self.m_Potion:GetRefiningFlag() == 1)
end

function HunyuanPotionTest:testEnergy()
	local energy = GetEnergy()
	SetEnergy(0)
	self:assertTrue(GetEnergy() == 0)
	AddEnergy(100)
	self:assertTrue(GetEnergy() == 100)
	ReduceEnergy(13)
	self:assertTrue(GetEnergy() == 100 - 13)
	SetEnergy(0)
	self:assertTrue(GetEnergy() == 0)
	SetEnergy(energy)
	self:assertTrue(GetEnergy() == energy)
end

function HunyuanPotionTest:testUse()
	local energy = self.m_Player:GetEnergy()
	self:assertTrue(self.m_Potion:Use() == 1)
	self:assertTrue(self.m_Player:GetEnergy() == energy + 100)
	self:assertTrue(self.m_Potion:Use() == 1)
	self:assertTrue(self.m_Player:GetEnergy() == energy + 200)
	
	energy = 2000000000 - 99
	self.m_Player:SetEnergy(energy)
	self:assertTrue(self.m_Potion:Use() == 0)
	self:assertTrue(self.m_Player:GetEnergy() == energy)
	
	self.m_Player:SetEnergy(0)
	DynamicExecute("\\script\\item\\hunyuanlinglu.lua", "Use", self.m_Player.m_PlayerIndex)
	self:assertTrue(self.m_Player:GetEnergy() == 100)
end

JingliTest = {}
function JingliTest:New()
	return TestCase:new("JingliTest", JingliTest)
end

function JingliTest:setUp()
	self.m_OldAddTimer = AddTimer
	self.m_OldDelTimer = DelTimer
	self.m_OldSay = Say
	Say = Cancel
	AddTimer = JingliTest.AddTimer
	DelTimer = JingliTest.DelTimer
	self.m_Player = Player:New(PlayerIndex)
	self.m_Object = Jingli:New(self.m_Player)
	self.m_Potion = self.m_Object.m_Potion
end

function JingliTest:tearDown()
	AddTimer = self.m_OldAddTimer 
	DelTimer = self.m_OldDelTimer
	Say = self.m_OldSay
	self.m_Object:Destroy()
end

function JingliTest.AddTimer(timeout, callback, param)
	return 1
end

function JingliTest.DelTimer()
end

function JingliTest:CalcLingluCount()
	return CalcEquiproomItemCount(
		ITEM_HUNYUANLINGLU[1],
		ITEM_HUNYUANLINGLU[2],
		ITEM_HUNYUANLINGLU[3],
		ITEM_HUNYUANLINGLU[4])
end

function JingliTest:testTimerList()
	local jingli = JingliList:Find(PlayerIndex)
	if (jingli) then
		jingli:Destroy()
	end
	local count = JingliList:GetCount()
	self:assertEquals(JingliList:GetCount(), count)
	local jingli = Jingli:New(Player:New(PlayerIndex))
	self:assertEquals(JingliList:GetCount(), count + 1)
	local x, y = JingliList:OnTime(PlayerIndex)
	self:assertTrue(x == jingli.m_Timeout)
	self:assertTrue(y == PlayerIndex)
	jingli:Destroy()
	self:assertEquals(JingliList:GetCount(), count)
end

function JingliTest:testSuccess()
	self.m_Object.m_Potion:ClearFinishedCount()
	self:assertTrue(self.m_Object.m_Potion:GetFinishedCount() == 0)
	ThrowAllItem()
	self:assertTrue(self:CalcLingluCount() == 0)
	for i = 1, 3000 do
		self.m_Object:Success()
	end
	self:assertTrue(self.m_Object.m_Potion:GetFinishedCount() == 0)
	self:assertTrue(self:CalcLingluCount() == 3000)
	self.m_Object:Success()
	self.m_Object:Success()
	self:assertTrue(self.m_Object.m_Potion:GetFinishedCount() == 2)
	self:assertTrue(self:CalcLingluCount() == 3000)
end

function JingliTest:testOnTime()
	ThrowAllItem()
	self:assertTrue(self:CalcLingluCount() == 0)
	self.m_Object:ClearRefining()
	self:assertTrue(self.m_Object:GetTime() == 0)
	self.m_Potion:SetRefiningFlag(1)
	
	local count = 0
	while (self.m_Object:OnTime() > 0) do
		count = count + 1
		self:assertTrue(self.m_Object:GetTime() == count)
	end
	self:assertTrue(count == 59)
	self:assertTrue(self.m_Object:GetTime() == 0)
	self:assertTrue(self:CalcLingluCount() == 1)
	self:assertEquals(self.m_Potion:GetRefiningFlag(), 0)
end

DlgTest = {}
function DlgTest:New()
	return TestCase:new("DlgTest", DlgTest)
end

function DlgTest:setUp()
	self.m_Player = Player:New(PlayerIndex)
	self.m_Potion = HunyuanPotion:New(self.m_Player)
	self.m_OldSay = Say
	Say = Cancel
	ThrowAllItem()
end

function DlgTest:tearDown()
	self.m_Potion = nil
	Say = self.m_OldSay
	ThrowAllItem()
end

function DlgTest:CalcLingluCount()
	return CalcEquiproomItemCount(
		ITEM_HUNYUANLINGLU[1],
		ITEM_HUNYUANLINGLU[2],
		ITEM_HUNYUANLINGLU[3],
		ITEM_HUNYUANLINGLU[4])
end

function DlgTest:testGetFail1()
	local count = self:CalcLingluCount()
	self.m_Potion:ClearFinishedCount()
	dlg_get()
	self:assertEquals(self.m_Potion:GetFinishedCount(), 0)
	self:assertEquals(self:CalcLingluCount(), 0)
end

function DlgTest:testGetFail2()
	self.m_Potion:ClearFinishedCount()
	self.m_Potion:AddFinishedCount()
	-- 用其他物品塞满背包
	for i = 1, 60 do
		AddItem(6,1,71,1,0,0,0)
	end
	self:assertEquals(self:CalcLingluCount(), 0)
	dlg_get()
	self:assertEquals(self.m_Potion:GetFinishedCount(), 1)
	self:assertEquals(self:CalcLingluCount(), 0)
end

function DlgTest:testGetSucccess()
	self.m_Potion:ClearFinishedCount()
	self.m_Potion:AddFinishedCount()
	dlg_get()
	self:assertEquals(self.m_Potion:GetFinishedCount(), 0)
	self:assertEquals(self:CalcLingluCount(), 1)
end

EntranceTest = {}

function EntranceTest:New()
	local tb = TestCase:new("EntranceTest", EntranceTest)
	tb.m_Player = Player:New(PlayerIndex)
	tb.m_Potion = HunyuanPotion:New(tb.m_Player)
	return tb
end

function EntranceTest:setUp()
	local obj = JingliList:Find(self.m_Player.m_PlayerIndex)
	if (obj) then
		obj:Destroy()
	end
end

function EntranceTest:tearDown()
end

function EntranceTest:testEnterWorld()
	self.m_Potion:SetRefiningFlag(0)
	WorldEntrance(self.m_Player.m_PlayerIndex, 1)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
	
	self.m_Potion:SetRefiningFlag(1)
	WorldEntrance(self.m_Player.m_PlayerIndex, 1)
	local obj = JingliList:Find(self.m_Player.m_PlayerIndex)
	self:assertTrue(obj ~= nil)
	obj:Destroy()
end

function EntranceTest:testEnter()
	self.m_Potion:SetRefiningFlag(0)
	local count = self.m_Potion:GetCurrentDateRefineCount(nil)
	Enter(self.m_Player, self.m_Potion)
	self:assertTrue(self.m_Potion:GetCurrentDateRefineCount(nil) == count)

	self.m_Potion:SetRefiningFlag(1)
	count = self.m_Potion:GetCurrentDateRefineCount(nil)
	Enter(self.m_Player, self.m_Potion)
	self:assertTrue(self.m_Potion:GetCurrentDateRefineCount(nil) == count)
end

function EntranceTest:testLeaveWorld()
	local obj = Jingli:New(self.m_Player, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) ~= nil)
	WorldEntrance(self.m_Player.m_PlayerIndex, 0)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)

	WorldEntrance(self.m_Player.m_PlayerIndex, 0)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end

ConditionTest = {}

function ConditionTest:New()
	local tb = TestCase:new("ConditionTest", Player)
	-- mock player
	extend(tb, ConditionTest)
	tb.m_PlayerIndex = PlayerIndex
	tb.m_Player = Player:New(PlayerIndex)
	tb.m_Potion = HunyuanPotion:New(tb.m_Player)
	return tb
end

function ConditionTest:setUp()
	self.m_Level = 90
	self.m_IsCharged = 1
	self.m_Potion:ClearRefiningTime()
	self.m_Potion:ClearFinishedCount()
	self.m_Potion:SetRefiningFlag(0)
	self.m_Potion:ClearCurrentDateRefineCount()
	self.m_Player:AddItemIntoEquipmentBox(
		ITEM_YUGUAN[1],
		ITEM_YUGUAN[2],
		ITEM_YUGUAN[3],
		ITEM_YUGUAN[4],
		ITEM_YUGUAN[5],
		ITEM_YUGUAN[6])
	local obj = JingliList:Find(self.m_Player.m_PlayerIndex)
	if (obj) then
		obj:Destroy()
	end
end

function ConditionTest:tearDown()
	self.m_Potion:ClearRefiningTime()
	self.m_Potion:ClearFinishedCount()
	self.m_Potion:SetRefiningFlag(0)
	self.m_Potion:ClearCurrentDateRefineCount()
	self.m_Player:ConsumeEquiproomItem(
		1,
		ITEM_YUGUAN[1],
		ITEM_YUGUAN[2],
		ITEM_YUGUAN[3],
		ITEM_YUGUAN[4])
	local obj = JingliList:Find(self.m_Player.m_PlayerIndex)
	if (obj) then
		obj:Destroy()
	end
end

function ConditionTest:GetLevel()
	return self.m_Level
end

function ConditionTest:IsCharged()
	return self.m_IsCharged
end

function ConditionTest:GetSex()
	return self.m_Sex
end

function ConditionTest:Say(...)
end

function ConditionTest:testSuccess()
	local obj = JingliList:Find(self.m_Player.m_PlayerIndex)
	self:assertFalse(obj)
	self:assertTrue(self.m_Potion:GetCurrentDateRefineCount(nil) == 0)
	refine(self, self.m_Potion)
	obj = JingliList:Find(self.m_Player.m_PlayerIndex)
	self:assertTrue(obj ~= nil)
	self:assertTrue(self.m_Potion:GetCurrentDateRefineCount(nil) == 1)
end

function ConditionTest:testFail1()
	-- 等级条件不符
	self.m_Level = 10
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)

	self.m_Level = 89
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end

function ConditionTest:testFail2()
	-- 充值条件不符
	self.m_IsCharged = 0
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end

function ConditionTest:testFail3()
	-- 已经在炼制混元灵露
	self.m_Potion:SetRefiningFlag(1)
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end

function ConditionTest:testFail4()
	-- 超过次数限制
	self:assertTrue(self.m_Potion:GetCurrentDateRefineCount(nil) == 0)
	self.m_Potion:AddCurrentDateRefineCount(nil)
	self:assertTrue(self.m_Potion:GetCurrentDateRefineCount(nil) == 1)
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end

function ConditionTest:testFail5()
	-- 已有炼制好的混元灵露未领取
	self.m_Potion:AddFinishedCount(1)
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end

function ConditionTest:testFail6()
	-- 没有玉罐
	while (self.m_Player:ConsumeEquiproomItem(
			1,
			ITEM_YUGUAN[1],
			ITEM_YUGUAN[2],
			ITEM_YUGUAN[3],
			ITEM_YUGUAN[4]) == 1) do
	end
	refine(self, self.m_Potion)
	self:assertTrue(JingliList:Find(self.m_Player.m_PlayerIndex) == nil)
end
