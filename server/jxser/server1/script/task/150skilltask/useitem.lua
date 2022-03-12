Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("UseItem", "Message")

function _TaskDetail:Exec(tbParam)
	local tbItem1 = tbParam[1]
	local tbItem2 = tbParam[2]
	local szFunName = tbParam[3]
	if self.szName ~= szFunName then
		return 
	end
	for i = 1, 6 do
		if tbItem1.tbProp[i] ~= tbItem2.tbProp[i] then
			return
		end
	end
	return 1
end