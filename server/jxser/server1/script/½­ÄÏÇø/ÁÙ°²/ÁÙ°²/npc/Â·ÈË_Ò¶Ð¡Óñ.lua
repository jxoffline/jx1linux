-- ÁÙ°²¡¡Â·ÈË¡¡Ò¶Ð¡Óñ
-- by£ºDan_Deng(2003-09-16)

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
	if (GetSex() == 0) then
		tbDailog.szTitleMsg = "<npc>C«ng tö, tiÓu n÷ lµ ng­êi ch­a xuÊt c¸c, ng­êi cø theo ta hoµi nh­ vËy, rèt cuéc lµ cã ý g×? NÕu nh­ ®Ó cho mÉu n­¬ng ta biÕt ®­îc, th× rÊt phiÒn phøc."
	else
		tbDailog.szTitleMsg = "<npc>TiÓu muéi, muéi cã chuyÖn g× sao?"
	end
	G_TASK:OnMessage("Thiªn NhÉn", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end;
