Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>§· nhiÒu n¨m qua, ta chØ thÊy toµn lµ nh÷ng ng­êi lªn ®¶o, nh­ng ch­a thÊy mét ai luËn kiÕm thµnh c«ng ®Ó rêi ®¶o, ®¹i hiÖp ng­¬i thËt lµ h÷u t×nh råi."
	G_TASK:OnMessage("NguyÖt Ca §¶o", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end