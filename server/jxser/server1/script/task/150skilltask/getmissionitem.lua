Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _TaskDetail = TaskDetailClass:NewFun("GetMissionItem", "Action")

function _TaskDetail:Exec(tbParam)
	local tbAward = tbParam[1]
	tbAwardTemplet:GiveAwardByList(tbAward, "NhiÖm vô ®èi tho¹i kü n¨ng cÊp 150 nhËn ®­îc ®¹o cô")
	return 1
end