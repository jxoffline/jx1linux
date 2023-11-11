Include("\\script\\lib\\unittest.lua")
Include("\\script\\lib\\toplist.lua")

function Test()
	local suite = TestSuite:new("JingliTestSuite")
	suite:add(TopListTest:New())
	suite:run()
end

TopListTest = {}

function TopListTest:New()
	return TestCase:new("TopListTest", TopListTest)
end

function TopListTest:setUp()
	self.m_TopList = TopList:New(3)
end

function TopListTest:tearDown()
	self.m_TopList = nil
end

function TopListTest:Cmp(list1, list2)
	if (list1 == list2) then
		return 1
	elseif (not list1 or not list2) then
		return 0
	elseif (getn(list1) ~= getn(list2)) then
		return 0
	else
		local count = getn(list1)
		for i = 1, count do
			local t1 = list1[i]
			local t2 = list2[i]
			if (t1[1] ~= t2[1] or t1[2] ~= t2[2]) then
				return 0
			end
		end
		return 1
	end
end

function TopListTest:test1()
	self.m_TopList:Set("name1", 1)
	self.m_TopList:Set("name2", 3)
	self.m_TopList:Set("name3", 2)
	local list1 = self.m_TopList:GetList()
	local list2 = {{"name2", 3}, {"name3", 2}, {"name1", 1}}
	self:assertTrue(list1 ~= nil and getn(list1) == 3)
	self:assertTrue(self:Cmp(list1, list2) == 1)
end

function TopListTest:test2()
	self.m_TopList:Set("name1", 1)
	self.m_TopList:Set("name2", 3)
	self.m_TopList:Set("name3", 2)
	self.m_TopList:Set("name3", 12)
	local list1 = self.m_TopList:GetList()
	local list2 = {{"name3", 12}, {"name2", 3}, {"name1", 1}}
	self:assertTrue(list1 ~= nil and getn(list1) == 3)
	self:assertTrue(self:Cmp(list1, list2) == 1)
	for i = 1, getn(list1) do
		local tb = list1[i]
		print(format("[%d]%s:%d", i, tb[1], tb[2]))
	end
end

function TopListTest:test3()
	self.m_TopList:Set("name2", 3)
	self.m_TopList:Set("name3", 2)
	local list1 = self.m_TopList:GetList()
	local list2 = {{"name2", 3}, {"name3", 2}}
	self:assertTrue(list1 ~= nil and getn(list1) == 2)
	self:assertTrue(self:Cmp(list1, list2) == 1)
end
