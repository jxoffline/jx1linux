Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\vng_script\\events\\traogiai\\vng_toolaward.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "Ta cã thÓ gióp g× cho c¸c h¹ ?"
	if (szNpcName == "Sø Gi¶ Trao Th­ëng") then 
		tbDailog.szTitleMsg = "Ta phô tr¸ch ph¸t th­ëng cho c¸c nh©n sÜ trong thiªn h¹. CÇn g× cø ®Õn t×m ta."	
		VngToolAward:AddDialog(tbDailog, szNpcName)	
	end	
	tbDailog:Show()	
end