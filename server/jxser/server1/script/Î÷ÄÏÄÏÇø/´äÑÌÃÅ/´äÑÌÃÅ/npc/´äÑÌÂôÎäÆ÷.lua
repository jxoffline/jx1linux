--´äÑÌÃÅ Âô±øÆ÷µÄµÜ×Ó¶Ô»°
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) or (GetLastFactionNumber() == 5) then
		local nNpcIndex = GetLastDiagNpc();
		local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end

		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<npc>C«ng phu cña bæn m«n quan träng lµ biÕn ho¸ kh«n l­êng, kh«ng nh­ nh÷ng vâ c«ng t©m th­êng kh¸c."
		tbDailog:AddOptEntry("Giao dÞch", yes)
		tbDailog:AddOptEntry("Kh«ng giao dÞch", no)
		G_TASK:OnMessage("Thóy Yªn", tbDailog, "DialogWithNpc")
		tbDailog:Show()
	else
		Talk(1,"","M«n chñ cã lÖnh, binh khÝ cña bæn m«n chØ dµnh cho tû muéi ®ång m«n.")
	end
end;

function yes()
Sale(66)
end;

function no()
end;
