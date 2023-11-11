--description: ÌÆÃÅÌÆ²»È¾ 30¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-13)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>TÕ Tæ §×nh nµy lµ n¬i tÕ liÖt tæ liÖt t«ng cña bæn ph¸i, phµm lµ ng­êi th­êng ®õng cã mµ bĞn m·ng vµo ®©y!"
	G_TASK:OnMessage("§­êng M«n", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", main2)
	tbDailog:Show() 
end

function main2()
	UTask_tm = GetTask(2)
	Uworld123 = GetTask(123)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then		-- ÌÆÃÅÃÅÅÉÈÎÎñ
		if (UTask_tm == 30*256) and (GetLevel() >= 30) then		--30¼¶ÈÎÎñÆô¶¯
			Talk(3, "L30_get", "<color=Red>phßng Háa khİ<color> cña <color=Red>§­êng V©n<color> s­ thóc thËt ®¸ng th­¬ng. Hai n¨m tr­íc cã mét g· lai lŞch bÊt minh b¾t cãc TiÓu Xuyªn, ®øa con ®éc nhÊt cña «ng, muèn Ğp «ng giao ra Bİ kiÕp <color=Red>'Háa Khİ Phæ'<color> cña bæn m«n.", "§­êng V©n s­ thóc kh«ng d¸m quay l­ng l¹i víi m«n quy. KÕt qu¶ lµ ngµy thø 2 g· kia ®­a tíi c¸nh tay cña TiÓu Xuyªn. S­ thóc chØ cã ®øa con trai nµy, nh­ng l¹i kh«ng thÓ giao 'Háa Khİ phæ' cho chóng ®­îc. Nµo ngê, l¹i ®æi lÊy thi thÓ cña TiÓu Xuyªn. S­ thóc ®au ®ín tét cïng, thÒ nhÊt ®Şnh ph¶i tr¶ mèi thï s©u ®Ëm!", "Nh­ng v× §­êng V©n s­ thóc tiÕt lé §­êng M«n Bİ kiÕp, nªn ph¶i chŞu sù trõng ph¹t cña m«n quy c¶ ®êi kh«ng thÓ rêi khái §­êng M«n nöa b­íc. Thï hËn kia e r»ng kiÕp nµy kh«ng thÓ tr¶ ®­îc!")
		elseif (UTask_tm == 30*256+50) then
			Talk(2, "", "T¹i h¹ ®· t×m ®­îc tªn thæ phØ b¾t cãc con trai cña §­êng V©n s­ thóc, ®o¹t vÒ <color=Red> 'Háa Khİ Phæ'<color>.", " Tèt l¾m,<color=Red>§­êng V©n<color> s­ thóc nhÊt ®Şnh sÏ c¶m thÊy an ñi phÇn nµo. H·y giao <color=Red> 'Háa Khİ Phæ'<color>cho «ng Êy. ¤ng ta ë trong <color=Red>phßng Háa khİ<color>.")
			Msg2Player("VÒ phßng tÕ tæ t×m §­êng BÊt NhiÔm, ®­îc biÕt §­êng V©n s­ thóc ®ang ë Háa Khİ phßng. ")
			SetTask(2,30*256+60)
		elseif (UTask_tm == 30*256+60) then
			Talk(1, "", "§­êng V©n s­ thóc nhÊt ®Şnh sÏ c¶m thÊy an ñi phÇn nµo. H·y ®Õn <color=Red>phßng Háa khİ<color> nãi víi «ng Êy tin mõng nµy!")
		elseif (UTask_tm > 30*256) and (UTask_tm < 40*256) then					--ÒÑ¾­½Óµ½30¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,""," Ta ®· ©m thÇm dß la, tªn thæ phØ ®ã d­êng nh­ th­êng xuÊt hiÖn ë <color=Red>B¹ch V©n ®éng<color> phİa §«ng Thanh Thµnh s¬n.")
		elseif (UTask_tm >= 40*256) then					--ÒÑ¾­Íê³É30¼¶ÈÎÎñ£¬±¾ÃÅµÜ×Ó
			Skill150Dialog("Ng­¬i cã thÓ gióp §­êng V©n s­ thóc xãa ®i nçi oan khuÊt. Xem ra, ta thËt kİnh nÓ ng­¬i!")
		else		
			Skill150Dialog("TÕ Tæ §×nh nµy lµ n¬i tÕ liÖt tæ liÖt t«ng cña bæn ph¸i, phµm lµ ng­êi th­êng ®õng cã mµ bĞn m·ng vµo ®©y!")
		end
	elseif (Uworld123 == 10) then											-- ÌÆÃÅ90¼¶¼¼ÄÜÈÎÎñ
		Say("Cã thÓ thay ta chuyÓn mét bøc th­ kh«ng?",2,"Tu©n lÖnh!/Uworld123_get","ThËt ¸y n¸y, m«n chñ võa míi gäi ta qua chç «ng Êy. /L30_get_no")
	elseif (Uworld123 == 20) and (HaveItem(379) == 0) then		-- ÌÆ²»È¾ÈÎÎñ£¬µÀ¾ß¶ªÁË
		Talk(1,"","Ng­¬i thËt lµ….., th­ cßn ch­a cÇm ®· véi v· ch¹y ®i!")
		AddEventItem(379)
		Msg2Player("NhËn l¹i th­ cña §­êng BÊt NhiÔm ")
	elseif (Uworld123 == 30) and (HaveItem(380) == 1) then		-- ÌÆ²»È¾ÈÎÎñ£¬¿ª´ò
		Talk(3,"Uworld123_step2","Ha ha…Qu¶ nhiªn diÖu kÕ! SÏ khiÕn §­êng nhÊt TrÇn chÕt còng kh«ng cã ®Êt dung th©n!","Hö…? Ng­¬i lµ ai? Sao kh«ng ph¶i lµ A Tµi?","Ng­¬i ®· nghe thÊy ®iÒu bİ mËt, muèn sèng còng kh«ng ®­îc, h·y xem chiªu cña ta ®©y!")
	elseif (Uworld123 == 40) then											-- Ã»´òÍê£¬¼ÌĞø´ò
		Talk(1,"Uworld123_step2","§õng ch¹y! H·y coi ®©y!")
	elseif (Uworld123 == 50) then
		if (GetSex() == 0) then
			sexstr = "§¹i hiÖp "
		else
			sexstr = "N÷ hiÖp"
		end
		Talk(8,"Uworld123_step3","C«ng tö hµ tÊt ph¶i lo l¾ng. Tuy ta kh«ng th©n víi c«ng tö nh­ng còng ch¼ng viÖc g× lµm háng chuyÖn cña c«ng tö. ","Ng­¬i. Ng­¬i. ","C«ng tö th©n lµ thiÕu chñ §­êng Gia B¶o. Ta tuy bÊt tµi nh­ng kh«ng gióp c«ng tö ch¼ng lÏ ®i gióp ng­êi ngoµi. ","Kh«ng sai, ®óng nh­ vŞ anh hïng nµy nãi, xin cho hái cao danh quİ t¸nh? ","T¹i h¹ "..GetName().."TiÖn thÓ. ","µ, Ra vËy "..GetName()..sexstr.."Nghe danh ®· l©u, nh­ng kh«ng ngê lÇn ®Çu gÆp mÆt l¹i trong hoµn c¶nh nµy. ","§¹i hiÖp ®· ñng hé t¹i h¹ nh­ vËy, kh«ng biÕt cã thÓ gióp ta mang quyÓn s¸ch nµy trao cho §oan Méc DuÖ ®­îc ch¨ng? QuyÓn s¸ch nµy ®èi víi t¹i h¹ lµ mÊu chèt thuËn lîi ®Ó n¾m gi÷ §­êng M«n. Sù viÖc v« cïng träng ®¹i, kh«ng thÓ nhê v¶ ng­êi kh¸c ®­îc. ","ChuyÖn nhá, giao cho ta ®­îc råi. ")
	elseif (Uworld123 == 60) and (HaveItem(377) == 0) then		-- ÃØóÅ¶ªÁË
		if (GetSex() == 0) then
			Talk(1,"","§¹i hiÖp quªn mang Bİ kiÕp ®i råi!")
		else
			Talk(1,"","N÷ hiÖp quªn mang Bİ kiÕp ®i råi!")
		end
		AddEventItem(377)
		Msg2Player("LÊy l¹i bİ kİp §­êng m«n ")
	elseif (Uworld123 == 70) or (Uworld123 == 75) then			-- ÈÎÎñÍê³É
		Talk(1,"Uworld123_prise","Ha ha ha. Ta sÏ ®îi tin mõng cña ng­¬i. ThËt lßng c¶m ¬n ng­¬i!")
	elseif (Uworld123 >= 10) and (Uworld123 < 80) then		-- ÌÆ²»È¾ÈÎÎñ½øĞĞÖĞ
		Talk(1,"","ChuyÖn ta nãi ng­¬i mau lµm ngay ®i, kh«ng viÖc g× th× ®õng l·ng phİ thêi gian!")
	elseif (GetTask(51) >= 90) then		-- Ò»³¾¡°Ï´ÇåÔ©Çü¡±ÈÎÎñÖ®ºó£¬¶Ô»°¸Ä±ä
		Talk(1,"","T¹i sao cuèi cïng h¾n l¹i ®­îc sñng ¸i, cßn ta th× bŞ ®èi xö tÖ b¹c? Qu¶ thËt bÊt c«ng!")
	elseif (Uworld123 >= 80) then									-- ÌÆ²»È¾ÈÎÎñÒÑ¾­Íê³É
		Talk(1,"","ChuyÖn lÇn nµy thËt nhê c«ng cña ng­¬i, khi ta trë thµnh m«n chñ nhÊt ®Şnh sÏ kh«ng quªn c«ng lao cña ng­¬i!")
	elseif (UTask_tm >= 70*256) then							--ÒÑ¾­³öÊ¦
		Skill150Dialog("Ta lu«n muèn ra ®i nh­ng cha ta kh«ng ®ång ı.")
	else
		Skill150Dialog("TÕ Tæ §×nh nµy lµ n¬i tÕ liÖt tæ liÖt t«ng cña bæn ph¸i, phµm lµ ng­êi th­êng ®õng cã mµ bĞn m·ng vµo ®©y!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("§­êng M«n", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get()
--	DelItem(42)							--·ÀÖ¹ÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ß
	Say(" §­êng V©n s­ thóc tõng nãi bÊt luËn lµ ai, chØ cÇn cã thÓ gióp «ng tr¶ mèi thï giÕt con, lÊy vÒ <color=Red> Háa Khİ Phæ<color>, «ng sÏ mang nÆng ¬n s©u!", 2, "Gióp «ng ta b¸o thï. /L30_get_yes", "Ta kh«ng quan t©m!/L30_get_no")
end;

function L30_get_yes()
	Talk(1,""," Ta ®· ©m thÇm dß la, tªn thæ phØ ®ã d­êng nh­ th­êng xuÊt hiÖn ë <color=Red>B¹ch V©n ®éng<color> phİa §«ng Thanh Thµnh s¬n.")
	SetTask(2, 30*256+20)
	AddNote("GÆp §­êng BÊt NhiÔm ë tõ ®­êng ( 514, 318) , nhËn <color=Red>nhiÖm vô Háa Khİ Phæ<color>, gióp §­êng V©n s­ thóc ®o¹t 'Háa Khİ Phæ' vÒ. ")
	Msg2Player("NhËn nhiÖm vô 'Háa Khİ Phæ', gióp §­êng V©n s­ thóc ®o¹t 'Háa Khİ Phæ' vÒ. ")
end;

function Uworld123_get()
	Talk(1,"","Tèt! Mau kİp thay ta trao bøc th­ nµy ®Õn BiÖn Kinh cho B¹ch C«ng Tö. §i sím vÒ sím!")
	SetTask(123,20)
	Msg2Player("NhËn nhiÖm vô: Thay §­êng BÊt NhiÔm ®em th­ ®Õn trao cho B¹ch c«ng tö. ")
	AddEventItem(379)
	Msg2Player("NhËn ®­îc th­ cña §­êng BÊt NhiÔm ")
end

function Uworld123_step2()
	DelItem(380)
	SetTask(123,40)
	SetFightState(1)
	NewWorld(229,1616,3195)
end

function Uworld123_step3()
	AddEventItem(377)
	SetTask(123,60)
	Msg2Player("LÊy ®­îc bİ kİp §­êng M«n. ")
end

function Uworld123_prise()
	AddRepute(10)
	Earn(20000)
	if (GetTask(123) == 70) then			-- ²»ÊÇ±¾ÃÅ
		SetTask(123,245)
	else
		SetTask(123,255)
	end
	Msg2Player("NhiÖm vô hoµn thµnh, b¹n sÏ ®­îc th­ëng 20000 l­îng, thanh thÕ cña b¹n t¨ng 10 ®iÓm. ")
	AddNote("NhiÖm vô hoµn thµnh, b¹n sÏ ®­îc th­ëng 20000 l­îng, thanh thÕ cña b¹n t¨ng 10 ®iÓm. ")
end

function L30_get_no()
end;
