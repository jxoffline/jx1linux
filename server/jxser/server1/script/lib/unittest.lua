-- µ¥Ôª²âÊÔ¿ò¼Ü wangbin 2010.5.25
Include("\\script\\lib\\common.lua")

TestCase = {
	name = "TestCase",
	fail = 0
}

function TestCase:setUp()
end

function TestCase:tearDown()
end

function TestCase:new(name, derived)
	local obj = clone(TestCase)
	if (derived) then
		extend(obj, derived)
	end
	if (name) then
		obj.name = name
	else
		obj.name = "UnknownTest"
	end
	return obj
end

function TestCase:runCase(name, func)
	self.fail = 0
	self:setUp()
	func(self)
	self:tearDown()
	if (self.fail == 0) then
		return 1
	else
		return nil
	end
end

function TestCase:isTestFunction(name, func)
	if (type(name) == "string" and
		strlen(name) > 4 and
		type(func) == "function" and
		strsub(name, 1, 4) == "test") then
		return 1
	else
		return 0
	end
end

function TestCase:run()
	local count = 0
	local error = 0
	for key, func in self do
		if (self:isTestFunction(key, func) == 1) then
			if (not self:runCase(key, func)) then
				error = error + 1
			end
			count = count + 1
		end
	end
	print(format("%s: %d error(s) in %d test(s)", self.name, error, count))
	return error == 0
end

function TestCase:assert(exp, msg)
	if (not exp) then
		local inf = getinfo(3, "Sl")
		if (msg) then
			print(format("ASSERT fail %s(%d): %s", inf.source, inf.currentline, msg))
		else
			print(format("ASSERT fail %s(%d)", inf.source, inf.currentline))
		end
		self.fail = self.fail + 1
	end
end

function TestCase:assertEquals(exp1, exp2, msg)
	self:assert(exp1 == exp2, msg)
end

function TestCase:assertTrue(exp, msg)
	self:assert(exp ~= nil, msg)
end

function TestCase:assertFalse(exp, msg)
	self:assert(exp == nil, msg)
end

TestSuite = {}

function TestSuite:new(name)
	local tb = TestCase:new(name, TestSuite)
	tb.m_Cases = {}
	return tb
end

function TestSuite:add(case)
	tinsert(self.m_Cases, case)
end

function TestSuite:run()
	local total_count = getn(self.m_Cases)
	local error_count = 0
	if (total_count > 0) then
		print(format("In TestSuite[%s]:", self.name))
		for i = 1, total_count do
			local case = self.m_Cases[i]
			if (not case:run()) then
				error_count = error_count + 1
			end
		end
	end
	print(format("%s: %d error(s) in %d case(s)", self.name, error_count, total_count))
	return error_count == 0
end

FibonacciTest = TestCase:new("FibonacciTest")

function FibonacciTest:testFibonacci()
	local cases = {{0, 0}, {1, 1}, {2, 1}, {3, 2}, {4, 3}}
	for i = 1, getn(cases) do
		local res = fib(cases[i][1])
		self:assertTrue(cases[i][2] == res)
		self:assertFalse(cases[i][2] == res + 1)
	end
end

function fib(n)
	if (n == 0) then
		return 0
	elseif (n <= 2) then
		return 1
	else
		return fib(n - 1) + fib(n - 2)
	end
end

Money = {m_Amount = 0}

function Money:new(amount)
	local tb = clone(Money)
	tb.m_Amount = amount
	return tb
end

function Money:times(n)
	local tb = clone(self)
	tb.m_Amount = tb.m_Amount * n
	return tb
end

function Money:equal(money)
	return money.m_Amount == self.m_Amount
end

MoneyTest = {}

function MoneyTest:new()
	local tb = TestCase:new("MoneyTest", MoneyTest)
	tb.m_Money = 0
	return tb
end

function MoneyTest:setUp()
	self.m_Money = Money:new(100)
end

function MoneyTest:tearDown()
end

function MoneyTest:testEqualsss()
	local m1 = Money:new(100)
	self:assertTrue(m1:equal(self.m_Money))

	local m2 = Money:new(0)
	self:assertFalse(m2:equal(self.m_Money))
end

function MoneyTest:testTimes()
	local m1 = Money:new(10)
	self:assertTrue(self.m_Money:equal(m1:times(10)))
end

suite = TestSuite:new("MyTestSuite")
suite:add(FibonacciTest)
suite:add(MoneyTest:new())
suite:run()
