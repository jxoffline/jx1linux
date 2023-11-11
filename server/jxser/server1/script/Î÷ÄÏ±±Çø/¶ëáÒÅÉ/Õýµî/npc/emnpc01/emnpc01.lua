--description: ¶ëáÒÅÉÇåÏşÊ¦Ì«£¨¶ëáÒÈëÃÅÈÎÎñ¡¢50¼¶ÈÎÎñ¡¢³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ£©
--author: yuanlan	
--date: 2003/3/6
--update: Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--update: Dan_Deng(2003-07-24), ¼Ó¡°ÖØ·µÃÅÅÉ¡±ÈÎÎñ
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- Update£ºDan_Deng(2003-10-27)ÎªÖØ·µÊ¦ÃÅÈÎÎñ¼ÓÈëÈ¡ÏûÈÎÎñ¹¦ÄÜ£¬ÒÔ¼°ÓëĞÂÃÅÅÉ¶ÔÓ¦
-- update: xiaoyang(2004\4\19) ¶ëáÒ90¼¶ÈÎÎñ

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×."
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 4) then
		tbDailog:AddOptEntry("Häc kü n¨ng cÊp 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
	local UTask_em = GetTask(1)
	local nFactID = GetLastFactionNumber();

	if (UTask_em == 70*256) and (GetFaction() == "emei") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_em == 70*256) and (GetTask(6) >= 5*256) and (GetTask(6) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(6,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_em == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(1,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_em == 80*256 and nFactID == 4 and GetCamp() == 1 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("emei");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_em == 70*256 and nFactID == 4 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(4)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_em = GetTask(1)
	local Uworld125 = GetTask(125)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),1) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","Bæn ph¸i tuy lµ phËn n÷ l­u, nh­ng chuyÖn Quèc gia h­ng vong kh«ng thÓ ®øng ngoµi. Xin håi ®¸p víi §éc C« minh chñ, Nga Mi tu©n theo sù s¾p xÕp cña ng­êi!")
		Uworld40 = SetBit(GetTask(40),1,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			check_skill()
		elseif ((UTask_em == 60*256+50) and (HaveItem(24) == 1)) then		--ÄÃµ½ÑÌÓñÖ¸»·£¬³öÊ¦ÈÎÎñÍê³É
			DelItem(24)
			Talk(1,"L60_prise","Ng­¬i ®· lÊy ®­îc TrÊn Ph¸i chi B¶o vÒ cho bæn ph¸i, c«ng lao thËt kh«ng nhá! Víi n¨ng lùc vµ trİ tuÖ cña ng­¬i ®· cã thÓ thuËn lîi xuÊt s­! Tõ nay hµnh tÈu giang hå ph¶i gi÷ th©n trong s¹ch, h·y nhí lÊy!")
		elseif (UTask_em == 60*256) and (GetLevel() >= 50) then		--³öÊ¦ÈÎÎñÆô¶¯
			DelItem(24)
			Say("Yªn Ngäc ChØ hoµn<color=Red> lµ tİn vËt cña Ch­ëng m«n, lµ trÊn ph¸i chi b¶o cña s­ tæ bæn ph¸i truyÒn l¹i. Nh­ng mÊy n¨m tr­íc, bæn ph¸i cã mét ph¶n ®å <color=Red>Thanh Hßa<color>. Bµ ta lµ s­ tû cña thÇy, bëi kh«ng hµi lßng ta lµm ch­ëng m«n nªn ®· lÊy trém <color=Red>Yªn Ngäc ChØ hoµn<color>, ng­¬i cã b»ng lßng gióp bæn ph¸i ®o¹t <color=Red>Yªn Ngäc ChØ hoµn<color> vÒ kh«ng?" , 2, "§ång ı!/L60_get_yes", "Sî kh«ng lµm næi /L60_get_no")
		elseif (UTask_em == 50*256+80) then													--50¼¶ÈÎÎñÍê³É
			L50_prise()
		elseif ((UTask_em == 50*256+50) or (UTask_em == 50*256+60)) and (HaveItem(23) == 0) then
			AddEventItem(23)
			Talk(1,"","Danh tiÕng vâ c«ng cña ng­¬i ngµy mét cao, qu¶ lµ r­êng cét cña bæn ph¸i. Tõ nay hµnh sù kh«ng ®­îc tïy tiÖn. Kim Cang Kinh nµy ph¶i lu«n mang theo m×nh!")
		elseif (UTask_em == 50*256) and (GetLevel() >= 50) then		--50¼¶ÈÎÎñÆô¶¯
			DelItem(23)
			Say("Ta víi <color=Red>Tİn H¶i ®¹i s­<color> trô tr× <color=Red>Tİn T­íng tù<color> cã quan hÖ tri giao. Tİn T­íng tù ®­îc x©y dùng trong nh÷ng n¨m ®¹i nghiÖp Tïy D¹ng §Õ, ®Õn nay ®· 555 n¨m. §Ó mõng ngµy Tİn T­íng tù thµnh lËp, ta ®©y chuÈn bŞ mét bé PhËt m«n chİ b¶o <color=Red>'Kim TuyÕn Tó T­îng Kim Cang Kinh'<color>®Ó lµm quµ chóc mõng. Ng­¬i b»ng lßng gióp ta tÆng phÇn quµ nµy chø?", 2, "§ång ı!/L50_get_yes", "Sî kh«ng lµm næi /L50_get_no")
		elseif (UTask_em > 50*256) and (UTask_em < 60*256) then								--ÒÑ¾­½Óµ½50¼¶ÈÎÎñ£¬ÉĞÎ´Íê³ÉµÄÆÕÍ¨¶Ô»°
			Talk(1,"","TÆng ®­îc 'Kim Cang Kinh' ch­a?")
		elseif (UTask_em > 60*256) and (UTask_em < 70*256) then				-- ³öÊ¦ÈÎÎñÖĞµÄÆÕÍ¨¶Ô»°
			Talk(1,"","<color=Red>Yªn Ngäc ChØ hoµn<color> lµ trÊn ph¸i chi b¶o l­u l¹c bªn ngoµi. Nghe nãi gÇn ®©y <color=Red>Thanh Hßa<color> ®ang ë <color=Red>Tr­êng Giang Nguyªn ®Çu<color>, ng­¬i ph¶i hÕt mùc cÈn thËn!")
		else
			Talk(1,"","Ng· PhËt tõ bi! §· nhËp m«n ph¸i ta, ph¶i nghiªm thñ m«n quy, mong ng­¬i chuyªn t©m tu luyÖn, ®õng phô lßng kú väng cña ta!")
		end
--	elseif (UTask_em == 5*256+70) and (HaveItem(17) == 1) and (GetSeries() == 2) and (GetCamp() == 0) then		--ÄÃµ½°×ÓñÈçÒâ£¬ÈëÃÅÈÎÎñÍê³É
--		enroll_prise()
	elseif (Uworld125 == 20) and (HaveItem(388) == 1)then
		Talk(7,"Uworld125_lose","Chµo s­ th¸i….","C¸c h¹ lµ...?","T¹i h¹ nhËn nhiÖm vô cña Tiªu Bµ Bµ mang th¸nh vËt V« Tù Thiªn Th­ trao tr¶ l¹i cho Nga Mi.","ThËt hay l¾m! Nµo ngê mÊy tr¨m n¨m sau, thÇn c«ng cña s­ tæ n¨m x­a ®· trë vÒ víi Nga Mi. Nµy vŞ b»ng h÷u, xin ®a t¹ ng­¬i!","Kh«ng cÇn kh¸ch s¸o!","§©y lµ LÖnh tiÔn Ch­ëng m«n tèi c¸o cña Nga Mi. H·y cÇm lÖnh tiÔn ®i Thµnh §« t×m Tiªu Bµ Bµ nhËn thï lao. Sau nµy quay vÒ Nga Mi, cã thÓ dïng lÖnh tiÔn ®iÒu ®éng tÊt c¶ lùc l­îng cña ta.","§a t¹ s­ th¸i!.")
   elseif (Uworld125 == 30) and (HaveItem(389) == 0)then
   	Talk(1,"","H·y yªn t©m, Nga Mi ta ®¸p øng ®iÒu kiÖn cña ng­¬i quyÕt kh«ng hèi hËn. LÖnh bµi ®©y!")
   	AddEventItem(389)
		Msg2Player("LÊy ®­îc lÖnh tiÔn cña Nga Mi ")
   elseif (Uworld125 == 40) then
		Talk(5,"Uworld125_finish","S­ th¸i t×m t¹i h¹ gÊp thÕ, kh«ng biÕt cã chuyÖn chi?","NhiÒu ®Ö tö m«n h¹ ta v× luyÖn V« Tù Thiªn Th­ mµ kinh m¹ch ®¶o lén, th©n chŞu träng th­¬ng.","Sao? Kh«ng thÓ nµo. Ta ch­a hÒ ®éng ®Õn mËt cÊp.","§iÒu nµy ta biÕt. ChuyÖn x¶y ra khi mang mËt cÊp trªn ng­êi. S­ tæ luyÖn s¸ch nµy dùa vµo tµi n¨ng trêi cho vµ søc m¹nh néi lùc. Nh­ng chØ ng­êi nµo cã duyªn míi cã thÓ lÜnh ngé.","Hãa ra nh­ thÕ.")
--	elseif (GetTask(6) == 5*256+10) then		-- ×ªÅÉÖÁ´äÑÌÃÅ
--		Say("ÇåÏşÊ¦Ì«£º±¾ÃÅÃÅ¹æËäÈ»²»½û×ªÍ¶ËûÅÉ£¬µ«²»¿ÉÒÔ´ø×ß±¾ÃÅÈÎºÎÎäÒÕ¡£ÄãÕæµÄ´òËãÒªÍ¶Èë´äÑÌÃÅ£¿",2,"²»´í£¬ÎÒÒâÒÑ¾ö/defection_yes","²»£¬ÎÒ»¹ÊÇ²»¸ÄÍ¶ÁË/defection_no")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_em == 70*256) and (GetTask(6) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(5,"return_sele","S­ phô ","Con l¹i trë lªn nói ch¬i n÷a h¶? ","D¹, qu¶ thËt con nhí nh÷ng ngµy th¸ng trªn nói v« cïng. ","õ, ta còng lu«n nhí ®Õn nh÷ng ngµy con ë trªn nói, chíp m¾t mét c¸i mµ con ®· xuèng nói råi. ","giang hå hiÓm ¸c, kh«ng thÓ l­êng hÕt mäi ®iÒu. ThËt ra b©y giê con mong muèn ®­îc ë l¹i trªn nói. ")
	elseif (GetCamp() == 4) and ((UTask_em == 70*256+10) or (UTask_em == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("§· chuÈn bŞ ®ñ 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
	elseif (Uworld125 > 20) and (Uworld125 < 40)then
   	Talk(1,"","Nga Mi vµ c¸c h¹ vÉn cßn chót duyªn phËn, sau nµy mong gióp ®ì thªm.")
	elseif (UTask_em < 10*256) and (GetSeries() == 2) then 								--ÉĞÎ´ÈëÃÅ
		Talk(1,"","§Õn h«m nay, Nga Mi ta ®· cã h¬n 100 n¨m thu nhËn ®«ng ®¶o ®Ö tö, më réng thiÖn duyªn, bÊt luËn cã nhËp m«n hay kh«ng, ®· lªn nói xem nh­ ng­êi cã duyªn.")
	elseif (UTask_em == 70*256) then								--³öÊ¦µÜ×Ó£¨¿¼ÂÇÖØ·µÃÅÅÉµÄ¼æÈİ£©
		Talk(1,"","Ng­¬i ®· xuÊt s­, tõ nay hµnh tÈu giang hå ph¶i nhí gi÷ th©n trong s¹ch!")
	else														-- ·Ç¶ëáÒÅÉ¶Ô»°
		Talk(1,"","Tuy Nga Mi ta lµ phËn n÷ l­u, nh­ng quyÕt kh«ng ®øng sau c¸c ®¹i m«n ph¸i kh¸c.")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(92) == -1) then
--		AddMagic(92)					--·ğĞÄ´ÈÓÓ
--		Msg2Player("ÄãÑ§»áÁË¡°·ğĞÄ´ÈÓÓ¡±")
--		Say("ÇåÏşÊ¦Ì«£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°·ğĞÄ´ÈÓÓ¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	elseif  (HaveMagic(252) == -1) then
--		AddMagic(252)					--·ğ·¨ÎŞ±ß
--		Msg2Player("ÄãÑ§»áÁË¡°·ğ·¨ÎŞ±ß¡±")
--		Say("ÇåÏşÊ¦Ì«£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°·ğ·¨ÎŞ±ß¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("L¹i muèn h¹ s¬n du ngo¹n sao?",2,"D¹ v©ng, xin s­ phô cho phĞp /goff_yes","Kh«ng, ta tù thÊy c«ng phutËp luyÖn vÉn ch­a ®ñ. /no")
--	end
end

----------------- ÖØ·µÊ¦ÃÅÏà¹Ø ------------------
function goff_yes()				-- ÖØ·µºóµÄ×ÔÓÉ³öÈë£¨³ö£©
	Talk(1,"","Tèt! §i mét ngµy ®µng häc mét sµng kh«n.")
	SetTask(1,70*256)
	AddNote("Rêi khái Nga Mi ph¸i, l¹i ngao du giang hå. ")
	Msg2Player("B¹n rêi khái Nga Mi ph¸i, l¹i ngao du giang hå ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ×ªÅÉ£¬ÊÕ»ØÔ­ÃÅÅÉÎä¹¦¼¼ÄÜ
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=80; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Æ®Ñ©´©ÔÆ
	i=101;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÖÎÁÆÊõ
	i=77; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¶ëáÒ½£·¨
	i=79; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¶ëáÒÕÆ·¨
	i=81; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Çï·çÒ¶
	i=82; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ËÄÏóÍ¬¹é
	i=83; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÍûÔÂ
	i=84; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ·çÓêÆ®Ïã
	i=85; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ò»Ò¶ÖªÇï
	i=86; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Á÷Ë®
	i=87; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ±ùĞÄ¾ö
	i=88; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ²»Ãğ²»¾ø
	i=89; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÃÎµû
	i=91; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ·ğ¹âÆÕÕÕ
	i=93; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ´Èº½ÆÕ¶É
	i=252;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ·ğ·¨ÎŞ±ß
	i=92; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ·ğĞÄ´ÈÓÓ
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(6,5*256+20)
	SetTask(1,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(74)
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200 ®iÓm! ")
		AddRepute(-200)
	end
	AddNote("Thanh HiÓu S­ Th¸i ®· phÕ bá vâ c«ng, lÊy l¹i danh hiÖu Th¸nh n÷ Kim §Ønh, th«ng b¸o víi thiªn h¹ lµ ®· ®uæi ng­¬i ra khái Nga Mi. Ng­¬i cã thÓ gia nhËp vµo Thóy Yªn m«n råi. ")
	Msg2Player("Thanh HiÓu S­ Th¸i ®· phÕ bá vâ c«ng, lÊy l¹i danh hiÖu Th¸nh n÷ Kim §Ønh, th«ng b¸o víi thiªn h¹ lµ ®· ®uæi ng­¬i ra khái Nga Mi. Ng­¬i cã thÓ gia nhËp vµo Thóy Yªn m«n råi. ")
	Talk(1,"KickOutSelf","Nµo ngê vâ c«ng n¨m x­a ta ®İch th©n truyÒn d¹y cho ng­¬i, nay ng­¬i l¹i muèn phÕ truÊt. ThËt lµ thÕ sù tr¸i ngang!")
end

function defection_no()
	AddNote("Ng­¬i bá ı ®Şnh gia nhËp Thóy Yªn ph¸i. ")
	Msg2Player("Ng­¬i bá ı ®Şnh gia nhËp Thóy Yªn ph¸i. ")
	SetTask(6,1*256)			-- ÎªÆóÍ¼ÅÑÊ¦×ö¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
end

function return_sele()
	Say("Ng­¬i ®· cã thµnh ı, ta kh«ng nì chèi tõ!",2,"§a t¹ s­ phô /return_yes","Th«i kh«ng cÇn ®©u/return_no")
end;

function return_yes()				-- ÖØ·µµÄ¼ì²é
	Talk(3,"","§a t¹ s­ phô! §Ö tö phiªu b¹t giang hå còng dµnh dôm ®­îc chót ng©n l­îng, kh«ng biÕt s­ m«n cã cÇn kh«ng?"," Nµo ngê ng­¬i l¹i cã lßng nh­ vËy, thÕ th× quyªn gãp 50000 ng©n l­îng tu söa Nga Mi s¬n lé nhĞ!","D¹! §Ó ®Ö tö chuÈn bŞ! ")
	SetTask(1,70*256+20)
	AddNote("Gãp 50 ngµn l­îng b¹c ®Ó tu söa l¹i con ®­êng lªn nói Nga Mi, sÏ ®­îc quay vÒ s­ m«n. ")
	Msg2Player("Gãp 50 ngµn l­îng b¹c ®Ó tu söa l¹i con ®­êng lªn nói Nga Mi, sÏ ®­îc quay vÒ s­ m«n. ")
end;

function return_no()
	Talk(2,"","Giang hå kh«ng ®­êng vÒ, lu«n cÇn tù m×nh x«ng tíi, ®a t¹ mü ı cña s­ phô!","Kh«ng sao ®©u, nÕu muèn quay l¹i, Nga Mi ta lóc nµo còng réng më!")
end;

function return_complete()			-- ÖØ·µ³É¹¦
	if (GetCash() >= 50000) then
		Talk(1,"","§­îc! §©y 5 v¹n l­îng ®· nhËn ®­îc. Ng­¬i ®­îc phong lµ Kim §Ønh Th¸nh N÷ cña bæn ph¸i, hy väng ng­¬i cè g¾ng gióp bæn ph¸i ph¸t d­¬ng quang ®¹i.")
		Pay(50000)
		SetTask(1,80*256)
		SetFaction("emei")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(64)
--		if (HaveMagic(252) == -1) then
--			AddMagic(88)
--			AddMagic(91)
--			AddMagic(282)
--			AddMagic(252)
		add_em(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n häc ®­îc tuyÖt häc trÊn ph¸i: PhËt Ph¸p V« Biªn, Vâ C«ng BÊt DiÖt BÊt TuyÖtt, PhËt Quang Phæ ChiÕu, Thanh ¢m Ph¹n X­íng. ")
--		end
		AddNote("§· quay vÒ Nga Mi ph¸i, ®øng trong hµng ngò ")
		Msg2Player(GetName().."§­îc phong thµnh Kim §Ønh Th¸nh N÷, l¹i quay vÒ Nga Mi ph¸i. ")
	else
		Talk(2,"","D­êng nh­ ng­¬i kh«ng cã ®em nhiÒu tiÒn theo ","A. Xin lçi, ta ®i lÊy tiÒn. ")
	end
end;

--------------- ÈëÃÅÈÎÎñ ----------------------
function enroll_prise()		-- ÈëÃÅÈÎÎñÍê³É
	Talk(1,"","Ng· PhËt tõ bi, ®· cã lßng thµnh, bÇn ni sÏ thu nhËn ng­¬i lµm m«n ®å, ®õng phô lßng kú väng cña ta.")
	DelItem(17)
	SetFaction("emei")    			
	SetCamp(1)
	SetCurCamp(1)
	SetRank(13)
	AddMagic(80)
	AddMagic(101)
	SetRevPos(13, 13)
	SetTask(1, 10*256)
	AddNote("Giao B¹ch Ngäc Nh­ ı cho Thanh HiÓu S­ Th¸i, hoµn thµnh nhiÖm vô nhËp m«n. Gia nhËp Nga Mi ph¸i, trë thµnh Bè Y Ni, häc ®­îc Phiªu TuyÕt Xuyªn V©n, TrŞ LiÖu thuËt ")
	Msg2Player("Giao B¹ch Ngäc Nh­ ı cho Ch­ëng m«n Thanh HiÓu S­ Th¸i, hoµn thµnh nhiÖm vô nhËp m«n. ")
	Msg2Player("Hoan nghªnh b¹n gia nhËp Nga Mi ph¸i, trë thµnh Bè Y Ni ")
	Msg2Player("Häc ®­îc vâ c«ng 'Phiªu TuyÕt Xuyªn V©n'. ")
	Msg2Player("Häc ®­îc tuyÖt kü Nga Mi ph¸i 'TrŞ LiÖu ThuËt' ")
end;

--------------------- 50¼¶ÈÎÎñ -----------------------
function L50_get_yes()
	Talk(1,"","<color=Red>Tõ H¶i ®¹i s­ <color> bÕ quan ®· l©u, b×nh th­êng kh«ng muèn gÆp ng­êi ngoµi, ng­¬i cã thÓ ®i t×m s­ ®Ö <color=Red>Tõ V©n Ph¸p s­<color>cña «ng. ")
	AddEventItem(23)
	Msg2Player("NhËn nhiÖm vô ®Õn Tİn T­íng tù: §­a Kim TuyÕn Tó T­îng Kim Cang kinh ®Õn Tİn T­íng tù ë Thµnh §«. ")
	Msg2Player("NhËn ®­îc Kim TuyÕn Tó T­îng Kim Cang Kinh. ")
	SetTask(1, 50*256+50)
	AddNote("GÆp Thanh HiÓu S­ Th¸i ë Ch¸nh ®iÖn, nhËn nhiÖm vô ®Õn Tİn T­íng tù, giao Kim TuyÕn Tó T­îng Kim Cang kinh. ")
end;

function L50_get_no()
	Talk(1,"","VËy h·y t×m «ng ®i!")
end;

function L50_prise()
	Talk(1,"","ChuyÖn nµy ng­¬i lµm rÊt tèt, ng­¬i t­ chÊt th«ng minh, chØ cÇn tiÕp tôc cè g¾ng, tiÒn ®å nhÊt ®Şnh réng më!")
	AddNote("Quay vÒ Ch¸nh ®iÖn phôc mÖnh Thanh HiÓu S­ Th¸i, hoµn thµnh nhiÖm vô Tİn T­íng tù. §­îc th¨ng chøc T¸n Hoa Thiªn N÷, häc ®­îc PhËt Quang Phæ ChiÕu, PhËt T©m Tõ H÷u, Tõ Hµng Phæ §é. ")
	SetRank(18)
	SetTask(1, 60*256)
--	AddMagic(92)
	add_em(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®· ®­îc th¨ng chøc T¸n Hoa Thiªn N÷! Häc ®­îc PhËt T©m Tõ H÷u. ")
	AddNote("NhiÖm vô hoµn thµnh, ®­îc phong T¸n Hoa Thiªn N÷ ")
end;

----------------------- ³öÊ¦ÈÎÎñ ------------------------
function L60_get_yes()
	Talk(1,"","Nghe nãi gÇn ®©y <color=Red>Thanh Hßa<color> xuÊt hiÖn ë <color=Red>Tr­êng Giang nguyªn ®Çu<color>, ng­¬i ph¶i hÕt søc cÈn thËn! ")
	SetTask(1, 60*256+50)
	AddNote("GÆp Thanh HiÓu S­ Th¸i ë Ch¸nh ®iÖn, nhËn nhiÖm vô xuÊt s­, giµnh l¹i Yªn Ngäc ChØ Hoµn. ")
	Msg2Player("NhËn nhiÖm vô xuÊt s­ Nga Mi ph¸i: §o¹t vÒ tİn vËt cña ch­ëng m«n Yªn Ngäc ChØ Hoµn. ")
end;

function L60_get_no()
	Talk(1,"","Xem ra ta chØ cã thÓ ®em träng tr¸ch nµy giao cho ng­êi kh¸c th«i!")
end;

function L60_prise()
	Talk(1, "","Chóc mõng b¹n thµnh nghÖ xuÊt s­! B¹n ®­îc phong lµ Th¸nh N÷. Tõ h«m nay cã thÓ tù do hµnh hiÖp giang hå! B¹n cã thÓ chän gia nhËp m«n ph¸i kh¸c tiÕp tôc häc nghÖ, còng cã thÓ x©y dùng bang héi më réng thÕ lùc trªn giang hå. HoÆc lµm mét ®éc hµnh n÷ hiÖp còng rÊt oai phong! Giang hå kiÕm hiÖp, biÓn réng trêi cao, hy väng b¹n ph¸t triÓn quyÒn c­íc, nhÊt triÓn hång ®å!")
	Msg2Player("Chóc mõng ng­¬i ®· häc thµnh tµi! Ng­¬i ®· ®­îc phong lµ Th¸nh n÷ Nga Mi ph¸i! Danh väng t¨ng thªm 120 ®iÓm! ")
--	AddGlobalCountNews("¶ëáÒ"..GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğÍ¬ÃÅÊ¦ÃÃÏÂÉ½´³µ´½­ºş", 1)
	Msg2SubWorld("§Ö tö Nga Mi ph¸i "..GetName().."Thµnh tµi xuÊt s­, tõ biÖt c¸c s­ muéi ®ång m«n ®Ó xuèng nói hµnh tÈu giang hå ")
	AddRepute(120)
	SetRank(74)
	SetTask(1, 70*256)
	SetFaction("") 		   					--Íæ¼ÒÍË³ö¶ëáÒÅÉ
	SetCamp(4)
	SetCurCamp(4)
	AddNote("VÒ ®Õn Ch¸nh ®iÖn giao Yªn Ngäc ChØ Hoµn cho Thanh HiÓu S­ Th¸i, hoµn thµnh nhiÖm vô xuÊt s­. §­îc th¨ng lµm Th¸nh n÷. ")
end;

function no()
end;

-------------------- ÊÀ½çÈÎÎñ ---------------------
function Uworld125_lose()
	DelItem(388)
	AddEventItem(389)
	SetTask(125,30)
	Msg2Player("§­a ra V« Tù Thiªn Th­, lÊy Nga My lÖnh tiÔn. ")
	AddNote("LÊy ®­îc lÖnh tiÔn, vÒ Thµnh §« t×m TiÕu Bµ Bµ l·nh th­ëng. ")
end

function Uworld125_finish()
	if (GetTask(1) >= 70*256) and (GetTask(1) ~= 75*256) then
		Talk(4,"","Xem ra, duyªn phËn gi÷a Nga Mi víi thiªn th­ ®· tËn, sø m¹ng nµy lµ cña c¸c h¹ míi ®óng!","T¹i h¹?","Ph¶i, cã lÏ chØ cã ng­¬i míi thÊu hiÓu ®­îc bİ mËt bªn trong. BÇn ni sÏ ®em nh÷ng chiªu thøc ghi trªn s¸ch truyÒn thô cho ng­¬i, mong ng­¬i cã thÓ ®¹t thµnh, ®õng uæng phİ mét lÇn luyÖn c«ng khã nhäc!","§Ö tö nhÊt ®Şnh kh«ng phô lßng. Tõ nay cã g× dÆn dß, ®Ö tö nhÊt nhÊt tu©n theo!")
		if (HaveMagic(328) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(328,1)
		end
		if (HaveMagic(380) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(380,1)
		end
		if (HaveMagic(332) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(332)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Ng­¬i ®· häc Tam Nga TÒ TuyÕt, Phong Lé Thóy ¶nh, Phæ §é Tïng Sinh ")
		SetTask(125,255)  --Ñ§µÃ¼¼ÄÜµÄÉèÖÃ±äÁ¿255
	else
		Talk(1,"","QuyÓn thiªn th­ nµy vèn kh«ng cã ng­êi nµo tu luyÖn ®­îc nªn ®µnh ph¶i ph¶i ®Ó trong Kinh L©u chê ®îi hËu nh©n. Ng­¬i b«n ba vÊt v¶ ®· l©u, mãn quµ nhá nµy xin göi tÆng ng­¬i!","VËy ®Ö tö còng kh«ng kh¸ch s¸o!")
	   SetTask(125,245)  --»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
	add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
	AddRepute(add_repute)
	Msg2Player("Thiªn th­ Nga My quay vÒ nh­ ®· ®Şnh, nhiÖm vô hoµn thµnh. Danh väng t¨ng thªm "..add_repute.."®iÓm.")
	AddNote("Thiªn th­ Nga My quay vÒ nh­ ®· ®Şnh, nhiÖm vô hoµn thµnh. ")
end
