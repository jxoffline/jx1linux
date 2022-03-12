Include("\\script\\event\\springfestival08\\allbrother\\event.lua");	-- 
Include("\\script\\event\\BeiDouChuanGong\\zhizuochuangongwan.lua");	-- 
Include("\\script\\event\\other\\xunmashu\\dialog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua");			-- ¶àÖØ×ªÉú¶Ô»°
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\translife_4_ex.lua")
Include("\\script\\task\\metempsychosis\\translife_7.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "Xin chµo, t¹i h¹ lµ truyÒn nh©n cña B¾c §Èu M«n, ch¼ng hay c¸c h¹ cÇn g×?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog:AddOptEntry("Ta muèn trïng sinh", zhuansheng_help_method);
	tbDailog:AddOptEntry("NhËn kÜ n¨ng sau khi trïng sinh 7 ", GetSkillAfterTS7);
	tbDailog:AddOptEntry("NhiÖm vô tø h¶i giai huynh ®Ö", allbrother_0801_main);
	tbDailog:AddOptEntry("LuyÖn tiªn ®an truyÒn c«ng", BeiDouChuanGong_main, {1});
	tbDailog:AddOptEntry("T×m kiÕm B¾c §Èu Tr­êng Sinh ThuËt", beidou_translife_main);
	tbDailog:AddOptEntry("Ta muèn häc kü n¨ng ChiÕn ý Thiªn Thu", beidou_learn_specialskill);
	
	if tbXunMaShu0903:IsActDate() then
		tbDailog:AddOptEntry("Ho¹t ®éng [B¶o r­¬ng thÇn bÝ]", tbXunMaShu0903.DialogMain_Box, {tbXunMaShu0903});
		tbDailog:AddOptEntry("B¾c §Èu ThuÇn M· ThuËt", tbXunMaShu0903.DialogMain_Horse, {tbXunMaShu0903});
	end
	
	tbDailog:Show();
end