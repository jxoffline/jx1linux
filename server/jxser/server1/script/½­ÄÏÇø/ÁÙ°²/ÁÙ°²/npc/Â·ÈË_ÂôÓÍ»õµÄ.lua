-- 临安　路人　卖油货的
-- by：Dan_Deng(2003-09-16)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Th玭g bao c鑙! Du t筩 c鑙! Cng kh雐 oa ch c du t筩 c鑙."
	G_TASK:OnMessage("Thi猲 Nh蒼", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
