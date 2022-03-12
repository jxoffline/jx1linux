Include("\\script\\lib\\common.lua")

TaskList = {
	m_Tasks = {}
}

function TaskList:RegisterTask(id, task)
	self.m_Tasks[id] = task
end

function TaskList:CreateTask(id)
	local task = self.m_Tasks[id]
	if (task ~= nil) then
		return clone(task)
	else
		return nil
	end
end
