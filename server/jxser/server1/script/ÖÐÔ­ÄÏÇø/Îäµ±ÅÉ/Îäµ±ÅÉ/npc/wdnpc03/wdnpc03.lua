--description: Îäµ±ÅÉÒ¶¼ÌÃÀ¡¡Îäµ±10¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	if allbrother_0801_CheckIsDialog(12) == 1 then
		allbrother_0801_FindNpcTaskDialog(12)
		return 0;
	end
	UTask_wd = GetTask(5)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	G_TASK:OnMessage("Vâ §ang", tbDailog, "DialogWithNpc")
	if (UTask_wd == 10*256+20) then 
		SetTask(5, 10*256+50)
		AddNote("T¹i chç cña DiÖp TiÕp MÜ häc ®­îc §¹o §øc Kinh ")
		Msg2Player("T¹i chç cña DiÖp TiÕp MÜ häc ®­îc §¹o §øc Kinh ")
		tbDailog.szTitleMsg = "<npc>«§¹o §øc Kinh»Theo nh­ tæ s­ §¹o Gi¸o L·o Tö, quyÓn ®Çu tiªn cña §¹o Kinh cã 37 ch­¬ng, quyÓn sau §øc Kinh cã 44 ch­¬ng"
		tbDailog:AddOptEntry("Ch­¬ng 1 ", ch1)
		tbDailog:AddOptEntry("Ch­¬ng 25 ", ch2)
		tbDailog:AddOptEntry("Ch­¬ng 33 ", ch3)
		tbDailog:AddOptEntry("Ch­¬ng 41 ", ch4)
		tbDailog:AddOptEntry("Ch­¬ng 42 ", ch5)
	elseif (UTask_wd == 10*256+50) then 
		tbDailog.szTitleMsg = "<npc>Néi dung cña <§¹o §øc Kinh> b¸t ®¹i tinh th©m, kh«ng ph¶i lµ cã thÓ lÜnh ngé trong mét kho¶ng thêi gian ng¾n, ng­¬i h·y häc thuéc 5 ch­¬ng tr­íc ®i."
		tbDailog:AddOptEntry("Ch­¬ng 1 ", ch1)
		tbDailog:AddOptEntry("Ch­¬ng 25 ", ch2)
		tbDailog:AddOptEntry("Ch­¬ng 33 ", ch3)
		tbDailog:AddOptEntry("Ch­¬ng 41 ", ch4)
		tbDailog:AddOptEntry("Ch­¬ng 42 ", ch5)
	elseif (UTask_wd < 10*256+20) and (GetFaction() == "wudang") then								--ÉÐÎ´½Ó10¼¶ÈÎÎñ
		tbDailog.szTitleMsg = "<npc>Kh«ng biÕt«§¹o §øc Kinh», sao trë thµnh ®Ö tö cña Vâ §ang?"
	elseif (UTask_wd >= 20*256) and (GetFaction() == "wudang") then					--ÒÑ¾­Íê³É10¼¶ÈÎÎñ£¬ÉÐÎ´³öÊ¦
		tbDailog.szTitleMsg = "<npc>H«m nay ng­¬i ®· häc«§¹o §øc Kinh»ch­a?"
	elseif (UTask_wd >= 70*256) then							--ÒÑ¾­³öÊ¦
		tbDailog.szTitleMsg = "<npc>Khi ta cßn trÎ nh­ ng­¬i, còng lµ mét ®¹i tr­îng phu khoÎ m¹nh, ®Õn nay míi biÕt trêi cao ®Êt réng, ng­¬i tuy lµ ®Ö tö xuÊt s­ cña bæn ph¸i, nh­ng còngkh«ng ®­îc xem th­êng ng­êi kh¸c."
	else
		tbDailog.szTitleMsg = "<npc>«§¹o §øc Kinh»Theo nh­ tæ s­ §¹o Gi¸o L·o Tö, quyÓn ®Çu tiªn cña §¹o Kinh cã 37 ch­¬ng, quyÓn sau §øc Kinh cã 44 ch­¬ng. TÊt c¶ cã h¬n 5000 ch÷, no­ng néi dung th× b¸c ®¹i tinh th©m."
	end
	tbDailog:Show() 
end;

function ch1()
	Talk(1,"","§¹o kh¶ ®¹o, phi th­êng ®¹o, danh kh¶ danh, phi th­êng danh.")
end;

function ch2()
	Talk(1,"","Nh©n ph¸p ®i¹, ®Þa ph¸p thiªn, thiªn ph¸p ®¹o, ®¹o ph¸p tù nhiªn.")
end;

function ch3()
	Talk(1,"","TrÝ nh©n gi¶ trÝ, tù trÝ gi¶ minh, th¾ng nh©n gi¶ h÷u lùc, tù th¾ng gi¶ c­êng.")
end;

function ch4()
	Talk(1,"","§¹i ph­¬ng v« ngung, ®¹i khÝ v·n thµnh, ®¹i ©m hy thanh, ®¹i t­îng v« h×nh.")
end;

function ch5()
	Talk(1,"","§¹o sinh nhÊt, nhÊt sinh nhÞ, nhÞ sinh tam, tam sinh v¹n vËt.")
end;
