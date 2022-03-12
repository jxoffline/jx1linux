Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

local _TaskDetail = TaskDetailClass:NewFun("ConsumeItem", "Action")

function _TaskDetail:Exec(tbParam)
	local tbItemList = tbParam[1]
	for i = 1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local nCount = tbItem.nCount or 1
		ConsumeItem(-1, nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
	end
	return 1
end