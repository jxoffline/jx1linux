-- 系统启动时自动运行的函数 wangbin 2010.12.10
AutoFunctions = {
	m_Functions = {}
}

function AutoFunctions:Add(func, param)
	if (func ~= nil) then
		local tb = {}
		tb.Func = func
		tb.Param = param
		tb.Pack = curpack()
		tinsert(self.m_Functions, tb)
	end
end

function AutoFunctions:Run()
	for i = 1, getn(self.m_Functions) do
		local tb = self.m_Functions[i]
		local pack = usepack(tb.Pack)
		tb.Func(tb.Param)
		usepack(pack)
	end
end
