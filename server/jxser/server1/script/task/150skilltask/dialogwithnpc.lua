Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("DialogWithNpc", "Message")

function _TaskDetail:Exec(tbParam)
	local szFunName = tbParam[3]
	if self.szName ~= szFunName then
		return 
	end
	local nNpcIndex = GetLastDiagNpc()
	if nNpcIndex == nil or nNpcIndex <= 0 then
		return 
	end
	 
	local szNpcName = GetNpcName(nNpcIndex)
	if szNpcName == nil then
		return
	end
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local szTmpName = tbParam[1]
	if szTmpName == nil or szTmpName ~= szNpcName then
		return
	end
	return 1
end