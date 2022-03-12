Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("KillNpc", "Message")

function _TaskDetail:Exec(tbParam)
	local szFunName = tbParam[3]
	if self.szName ~= szFunName then
		return 
	end
	local szNpcName = tbParam[1]
	local nNpcIndex = tbParam[2]
	if GetNpcName(nNpcIndex) == szNpcName then
		return 1
	end
	return
end