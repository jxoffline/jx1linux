Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local TSK_LV150_SKILL = 2885
	local YUEGEDAO_150SKILL_TASKSTATE = 14
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	local nTaskStep = floor(GetTask(TSK_LV150_SKILL)/100)
	if nTaskStep < YUEGEDAO_150SKILL_TASKSTATE then
		tbDailog.szTitleMsg = "<npc>NÕu nh­ ®¹i hiÖp kh«ng hÒ run sî, th× h·y ph©n tµi cao thÊp víi t¹i h¹ ®i, lµ ®Ó vang danh thiªn h¹, luyÖn ®­îc tuyÖt kü hay lµ sÏ bÞ giam cÇm t¹i ®©y, th× do trrËn chiÕn nµy quyÕt ®Þnh."
	else
		tbDailog.szTitleMsg = "<npc>NÕu nh­ h÷u duyªn th× vÉn cã thÓ gÆp l¹i, cßn kh«ng duyªn th× vÉn cã c¸i ®Ó nhí ®Õn nhau, ®¹i hiÖp h·y rêi ®¶o ®i, con ®­êng giang hå tõ nay vÒ sau xin h·y b¶o träng."
	end
	G_TASK:OnMessage("NguyÖt Ca §¶o", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end