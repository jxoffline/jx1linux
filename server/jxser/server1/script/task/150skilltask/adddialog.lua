Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

local _TaskDetail = TaskDetailClass:NewFun("AddDialog", "Action")

function _TaskDetail:Exec(tbParam)
	local nDetailId = tbParam[1]
	local szOption = tbParam[2]
	local tbDailog = tbParam[3]
	tbDailog:AddOptEntry(szOption, self.pTask.GotoDetail, {self.pTask, nDetailId, {tbDailog}})
end