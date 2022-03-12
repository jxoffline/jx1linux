Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")

local _TaskDetail = TaskDetailClass:NewFun("PlotDialogue", "Action")

function _TaskDetail:Exec(tbParam)
	local nAddStepNum = tbParam[1]
	local nTaskId = tbParam[2]
	local nDialogId = tbParam[3]
	local szTaskName = tbParam[4]
	local nGotoDetailId = tbParam[5]
	G_TASK:Talk(szTaskName, nGotoDetailId, nAddStepNum, nTaskId, 1, nDialogId)
	return 1
end
