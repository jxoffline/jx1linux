Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
Include("\\script\\lib\\log.lua")
--Phong v©n l÷nh bµi - ghi nhÀn sË l«n hoµn thµnh nhi÷m vÙ V‚ l©m minh chÒ - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")

function pActivity:IsOpen()
	return 1;
end

function pActivity:Init()
	%tbKillDailyTask:Init();
	%tbGatherDailyTask:Init();
	%tbTalkDailyTask:Init();
end

function pActivity:AcceptKillTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbKillDailyTask:AcceptTask();
end

function pActivity:AcceptTalkTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbTalkDailyTask:AcceptTask();
end

function pActivity:AcceptGatherTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbGatherDailyTask:AcceptTask();
end

function pActivity:CompletKillTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbKillDailyTask:CompleteTask() == 1) then
		--Phong v©n l÷nh bµi - ghi nhÀn sË l«n hoµn thµnh nhi÷m vÙ V‚ l©m minh chÒ - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "KillTask");
		--Thay ÆÊi ph«n th≠Îng nhi÷m vÙ gi’t qu∏i hµng ngµy - Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Hoµn thµnh nhi÷m vÙ hµng ngµy(%s) nhÀn Æ≠Óc %d c∏i %s", "Nhi÷m vÙ S∏t qu∏i ", 15000000, "kinh nghi÷m "));
		Talk(1,"",format("%s, Ng≠¨i qu∂ lµ mÈt vﬁ Æπi hi÷p. ß©y lµ m„n quµ nh· ta t∆ng cho ng≠¨i, mong h∑y nhÀn l y. Ngµy mai g∆p lπi nh–.", GetSex() == 1 and "Chﬁ " or "Ca Ca"));
		
	end
end

function pActivity:CompletTalkTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbTalkDailyTask:CompleteTask() == 1) then
		--Phong v©n l÷nh bµi - ghi nhÀn sË l«n hoµn thµnh nhi÷m vÙ V‚ l©m minh chÒ - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "TalkTask");
		--Thay ÆÊi ph«n th≠Îng nhi÷m vÙ ÆËi thoπi hµng ngµy - Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Hoµn thµnh nhi÷m vÙ hµng ngµy(%s) nhÀn Æ≠Óc %d c∏i %s", "Nhi÷m vÙ ßËi thoπi ", 15000000, "kinh nghi÷m "));
		Talk(1,"",format("%s, Ng≠¨i qu∂ lµ mÈt vﬁ Æπi hi÷p. ß©y lµ m„n quµ nh· ta t∆ng cho ng≠¨i, mong h∑y nhÀn l y. Ngµy mai g∆p lπi nh–.", GetSex() == 1 and "Chﬁ " or "Ca Ca"));
		
	end
end

function pActivity:CompletGatherTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbGatherDailyTask:CompleteTask() == 1) then
		--Phong v©n l÷nh bµi - ghi nhÀn sË l«n hoµn thµnh nhi÷m vÙ V‚ l©m minh chÒ - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "GatherTask");
		--Thay ÆÊi ph«n th≠Îng nhi÷m vÙ thu thÀp hµng ngµy - Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 10000000}, format("Hoµn thµnh nhi÷m vÙ hµng ngµy(%s) nhÀn Æ≠Óc %d c∏i %s", "Nhi÷m vÙ thu thÀp", 10000000, "kinh nghi÷m "));
		Talk(1,"",format("%s, Ng≠¨i qu∂ lµ mÈt vﬁ Æπi hi÷p. ß©y lµ m„n quµ nh· ta t∆ng cho ng≠¨i, mong h∑y nhÀn l y. Ngµy mai g∆p lπi nh–.", GetSex() == 1 and "Chﬁ " or "Ca Ca"));
		
	end
end

function pActivity:TalkToNpc()
	%tbTalkDailyTask:TalkToNpc();
end