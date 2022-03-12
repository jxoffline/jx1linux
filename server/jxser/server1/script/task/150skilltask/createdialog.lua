Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("CreateDialog", "Action")

function _TaskDetail:Exec(tbParam)
	local tbPreDialog = nil
	if tbParam ~= nil then
		tbPreDialog = tbParam[3] -- 外部参数
	end
	
		
	local tbDailog = DailogClass:new()
	local szTitle = tbParam[1]
	local tbOption = tbParam[2]
	
	tbDailog.szTitleMsg = szTitle

	for i = 1, getn(tbOption) do
		local tbTmpOption = tbOption[i]
		tbDailog:AddOptEntry(tbTmpOption[2], self.pTask.GotoDetail, {self.pTask, tbTmpOption[1], {tbDailog}})
	end
	
	tbDailog.pPreDailog = tbPreDialog
	tbDailog:Show()
	return 1
end