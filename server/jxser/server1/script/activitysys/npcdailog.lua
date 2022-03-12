
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
--tinhpn 20100706: Vo Lam Minh Chu
Include("\\script\\bonusvlmc\\fucmain.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
--20120620 - Bá dßng chän tai Minh Chñ
--	if (szNpcName == "Minh Chñ - ThÈmTh¨ngY") then 
--		tbDailog.szTitleMsg = "DÜ vâ häc chÊn nhiÕp thiªn h¹!"
--		tbDailog:AddOptEntry("Phóc lîi Vâ L©m Minh Chñ", VLMC_main)
--	end
	if (szNpcName == "Minh chñ -  *Nh­ ý*") then 
		tbDailog.szTitleMsg = "DÜ vâ häc chÊn nhiÕp thiªn h¹!"
		tbDailog:AddOptEntry("Phóc lîi Vâ L©m Minh Chñ", VLMC_main)
	end
	--µ¯³ö¶Ô»°¿ò
	tbDailog:Show()
	
end