Include("\\script\\task\\150skilltask\\taskdetail.lua")

local _TaskDetail = TaskDetailClass:NewFun("DropItem", "Action")

function _TaskDetail:Exec(tbParam)
	local tbAward = tbParam[1]
	local nNpcIndex = tbParam[2]
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Nhi÷m vÙ c p 150 r¨i ra")
	return 
end