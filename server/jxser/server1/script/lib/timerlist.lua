-- 定时器 wangbin 2010.5.25
TimerList = {
	m_Index = 1,
	m_List = {}
}

-- 超时触发timer:OnTime(param)，如果该函数返回1则定时器继续等待触发，返回0则定时器结束。
-- timeout 单位为帧
function TimerList:AddTimer(timer, timeout, param)
	local index = self.m_Index
	local id = AddTimer(timeout, "TimerList:OnTime", index)
	self.m_List[index] = {
		m_Pack = curpack(),
		m_TimerId = id,
		m_Timer = timer, 
		m_Param = param,
		m_Timeout = timeout
	}
	self.m_Index = self.m_Index + 1
	return index
end

function TimerList:DelTimer(index)
	local tb = self.m_List[index]
	if (tb ~= nil) then
		DelTimer(tb.m_TimerId)
		self.m_List[index] = nil
	end
end

function TimerList:SuspendTimer(index)
	local tb = self.m_List[index]
	if (tb ~= nil) then
		SuspendTimer(tb.m_TimerId)
	end
end

function TimerList:ResumeTimer(index)
	local tb = self.m_List[index]
	if (tb ~= nil) then
		ResumeTimer(tb.m_TimerId)
	end
end

function TimerList:FindTimer(index)
	return self.m_List[index]
end

function TimerList:OnTime(index)
	local tb = self.m_List[index]
	if (not tb) then
		return 0
	end
	if (not tb.m_Timer) then
		self.m_List[index] = nil
		return 0
	end
	local pack = usepack(tb.m_Pack)
	local res = tb.m_Timer:OnTime(tb.m_Param, index)
	usepack(pack)
	if (res == 1) then
		return tb.m_Timeout, index
	else
		self.m_List[index] = nil
		return 0
	end
end
