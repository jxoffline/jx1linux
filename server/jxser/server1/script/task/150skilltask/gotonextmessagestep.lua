Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("GotoNextMessageStep", "Action")

function _TaskDetail:Exec(tbParam)
	local nAddStepNum = tbParam[1]
	local nTaskId = tbParam[2]
	local nBase = self.pTask.m_nBase
	self.pTask:AddStep(nAddStepNum, nTaskId, nBase)
	return 1
end