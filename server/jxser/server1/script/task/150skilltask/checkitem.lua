Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

local _TaskDetail = TaskDetailClass:NewFun("CheckItem", "Condition")

function _TaskDetail:Exec(tbParam)
	local tbItemList = tbParam[1]
	for i = 1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local nCount = tbItem.nCount or 1
		local nItemCount = CalcItemCount(3, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], -1)
		if nItemCount < nCount then
			Msg2Player("Kh«ng cã ®¹o cô nhiÖm vô")
			return
		end
	end
	return 1
end
