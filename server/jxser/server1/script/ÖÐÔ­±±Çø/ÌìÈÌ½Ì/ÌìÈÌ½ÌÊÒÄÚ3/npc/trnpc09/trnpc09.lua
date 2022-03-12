--description: ÌìÈÌ½Ì½ÌÖ÷ÍêÑÕºêÁÒ¡¡ÌìÈÌ½Ì³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- Update£ºDan_Deng(2003-10-27)ÎªÖØ·µÊ¦ÃÅÈÎÎñ¼ÓÈëÈ¡ÏûÈÎÎñ¹¦ÄÜ£¬ÒÔ¼°ÓëĞÂÃÅÅÉ¶ÔÓ¦

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"TÆng b¸nh ngµy xu©n/#tbMasterGift:getGift('tianren')",
				"Muèn thØnh gi¸o viÖc kh¸c/oldMain"
			}
		Say("N¨m míi an khang thŞnh v­îng", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("T×m ta cã viÖc g×?", 2, "Muèn thØnh gi¸o ®¹i s­!/oldentence", "Mõng lÔ ¢n S­, t¹i h¹ ®· t×m ®ñ “ThÎ ¢n S­” vµ “ThÎ Cao §å”./vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 7) then
		Describe("T×m ta cã viÖc g×?", 2,
			"Häc kü n¨ng cÊp 120./lvl120skill_learn",
			"Muèn thØnh gi¸o viÖc kh¸c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_tr = GetTask(4);
	local nFactID = GetLastFactionNumber();

	if (UTask_tr == 70*256) and (GetFaction() == "tianren") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tr == 70*256) and (GetTask(8) >= 5*256) and (GetTask(8) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(8,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tr == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(4,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tr == 80*256 and nFactID == 7 and GetCamp() == 2 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianren");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_tr == 70*256 and nFactID == 7 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(7)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tr = GetTask(4);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),4) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","§éc C« KiÕm bŞ mÊt trİ µ? Bæn gi¸o vèn lµ §¹i Kim quèc gi¸o, §éc C« KiÕm ph¸i ng­¬i ®Õn hái l·o phu chuyÖn nµy. §­îc! Ng­¬i nãi l¹i víi §éc C« KiÕm r»ng: C¸c ng­êi chØ lµ lò qu©n « hîp, d¸m chèng víi ®¹i qu©n hïng m¹nh cña §¹i Kim, h·y lo chuyÖn hËu sù tr­íc råi h·y nãi! Ha ha ha!")
		Uworld40 = SetBit(GetTask(40),4,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 60*256) and (GetLevel() >= 50) then		-- ³öÊ¦ÈÎÎñÆô¶¯
			Say("Th¸nh th­ cña bæn gi¸o lµ cuèn s¸ch ghi râ vÒ quèc gi¸o cña §¹i Kim-- <color=Red>cuèn s¸ch da dª<color> cña T¸t M·n Gi¸o Kinh V¨n, cuèn s¸ch nµy ®­îc Gi¸o chñ cÊt giÊu t¹i <color=Red>Th¸nh §éng<color>, nghe nãi ai vµo Th¸nh §éng sÏ kh«ng cã ®­êng vÒ. Ng­¬i vèn lµ Hé Gi¸o Ph¸p V­¬ng cña bæn gi¸o, cã d¸m vµo Th¸nh §éng lÊy cuèn s¸ch ®ã kh«ng?", 2, "Thuéc h¹ tËn lùc thi hµnh /L60_get_yes", "Thuéc h¹ e r»ng kh«ng ®¶m nhiÖm næi/L60_get_no")
		elseif (UTask_tr == 60*256+20) and (HaveItem(127) == 1 and HaveItem(128) == 1 and HaveItem(129) == 1 and HaveItem(130) == 1 and HaveItem(131) == 1) then 
			DelItem(127)
			DelItem(128)
			DelItem(129)
			DelItem(130)
			DelItem(131)
			SetTask(28,0)		-- ½«×Ó±äÁ¿¸´Î»£¬Ê¥¶´ÖĞÔÙ¼ÌĞøÊ¹ÓÃ
			SetTask(4,60*256+50)		-- ÄÃÆëÎå°Ñ¶Ï½£ºóÏÈÕÒÍêÑÕºéÁÒ²ÅÄÜ½øÊ¥¶´£¬¼ò»¯³ÌĞò´¦Àí¡£
			AddNote("Sau khi t×m ®ñ n¨m Thanh ®o¶n kiÕm, quay l¹i Thiªn NhÉn Gi¸o, ®­îc phĞp vµo Th¸nh §éng. ")
			Msg2Player("B¹n ®· ®­îc phĞp vµo Th¸nh §éng ")
			Talk(1,"","RÊt tèt! b©y giê ng­¬i cã thÓ vµo Th¸nh §éng lÊy cuèn s¸ch da dª mang vÒ ®©y.")
		elseif (UTask_tr == 60*256+70) and (HaveItem(132) == 1) then		-- ³öÊ¦ÈÎÎñÍê³É
			Talk(2, "L60_prise", "§©y qu¶ nhiªn lµ Th¸nh th­ cña bæn gi¸o! Tèt! Tèt! L·o phu ®· kh«ng nh×n lÇm ng­êi, víi tr×nh ®é vâ c«ng còng nh­ lßng cam ®¶m cña ng­¬i hiÖn giê, cã ngµy sÏ lµm nªn nh÷ng chuyÖn kinh thiªn ®éng ®Şa! Hy väng sau khi ng­¬i xuÊt s­, sÏ kh«ng trë thµnh kÎ thï cña l·o phu! Ha ha ha!", "Chóc mõng b¹n cã thÓ xuÊt s­! B¹n ®­îc phong lµ T¸t M·n Ph¸p S­ cña Thiªn NhÉn gi¸o, tõ nay vÒ sau cã thÓ tù do hµnh tÈu giang hå! Hy väng b¹n sÏ ph¸t huy n¨ng lùc, ph¸t triÓn tiÒn ®å!")
		elseif (UTask_tr == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			check_skill()
		elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then					--ÒÑ¾­½Óµ½³öÊ¦ÈÎÎñ£¬ÉĞÎ´ÄÃµ½Îå°Ñ¶Ï½£
			Talk(1,"","Tr­íc khi vµo <color=Red>Th¸nh §éng<color> lÊy <color=Red>cuèn s¸ch da dª<color>, ng­¬i ph¶i ®Õn <color=Red>BiÖn Kinh<color> t×m <color=Red>n¨m thanh ®o¶n kiÕm<color> ®ang l­u l¹c.")
		elseif (UTask_tr >= 60*256+50) and (UTask_tr <= 60*256+70) then					--ÒÑ¾­½Óµ½³öÊ¦ÈÎÎñ£¬ÉĞÎ´ÄÃµ½ÑòÆ¤Êé
			Talk(1,"","<color=Red>cuèn s¸ch da dª<color> ë phİa sau trong <color=Red>Th¸nh §éng<color>.")
		else
			Talk(1,"","X­a nay, quyÒn cao chøc träng lu«n hÊp dÉn mäi ng­êi, n¨m x­a Th¸nh Th­îng tuy rÊt ©n sñng ta, nh­ng vÉn cã lßng ®è kş, nÕu kh«ng sao l¹i ph¸i ThÊt c«ng chóa ®Õn bæn gi¸o lµm mét §­êng chñ nhá nhoi nµy? ¤i! L·o phu kh«ng hÒ hæ thÑn l­¬ng t©m, nh­ng còng kh«ng qu¶n næi nh÷ng lêi phØ b¸ng dÌm pha!")
		end
--	elseif (GetTask(8) == 5*256+10) then		-- ×ªÃÅÅÉµ½Ø¤°ï
--		Say("ÍêÑÕºéÁÒ£ºØ¤°ïÓë±¾°ïÊÄ²»Á½Á¢£¬Äã¾¹Ïë±³Æú±¾½Ì¸ÄÍ¶Ø¤°ï£¿Ğ¡ĞÄÎÒ·ÏÁËÄãµÄ¹¦·ò£¡",2,"¶Ô²»Æğ£¬µ«ÎáÒâÒÑ¾ö/defection_yes","ÎÒ»¹ÊÇ²»È¥ÁË/defection_no")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tr == 70*256) and (GetTask(8) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_sele","Th­a Gi¸o chñ, nh÷ng ng­êi xuÊt s­ råi cã thÓ quay trë l¹i m«n ph¸i tiÕp tôc phông sù kh«ng?")
	elseif (GetCamp() == 4) and ((UTask_tr == 70*256+10) or (UTask_tr == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("§· chuÈn bŞ ®ñ 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
	elseif (UTask_tr >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","ThËt lµ hËu sinh kh¶ óy! Víi tr×nh ®é vâ c«ng còng nh­ lßng cam ®¶m cña ng­¬i, sÏ cã ngµy lµm nªn nh÷ng chuyÖn kinh thiªn ®éng ®Şa! Hy väng sau khi ng­¬i xuÊt s­, sÏ kh«ng trë thµnh kÎ thï cña l·o phu!")
	else
		Talk(1,"","ChØ cÇn nh÷ng ai cã tµi, thËt lßng muèn gia nhËp bæn gi¸o, bæn gi¸o s½n sµng hoan nghªnh.")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(150) == -1) then
--		AddMagic(142)
--		AddMagic(148)
--		AddMagic(150)
--		AddNote("ÄãÑ§»áÁËÕòÅÉ¾øÑ§ÌìÄ§½âÌå¡¢Îä¹¦ÍµÌì»»ÈÕ¡¢Ä§ÑæÆßÉ±¡£")
--		Msg2Player("ÄãÑ§»áÁËÕòÅÉ¾øÑ§ÌìÄ§½âÌå¡¢Îä¹¦ÍµÌì»»ÈÕ¡¢Ä§ÑæÆßÉ±¡£")
--		Say("ÍêÑÕºêÁÒ£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬¸Ä½øÁË±¾ÃÅÎä¹¦£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("Ng­¬i cã muèn ®i Nam triÒu th¨m dß t×nh h×nh?",2,"§­îc, thuéc h¹ còng ®ang muèn th©m nhËp giang hå mét phen. /goff_yes","Thuéc h¹ tù thÊy luyÖn tËp ch­a ®ñ /no")
--	end
end

----------------------- ÖØ·µÃÅÅÉÏà¹Ø --------------------
function goff_yes()
	Talk(1,"","Tèt! Nhí ®õng sa vµo nh÷ng c¸m dç cña Nam triÒu. ")
	SetTask(4,70*256)
	AddNote("Rêi khái Thiªn NhÉn Gi¸o, tiÕp tôc hµnh tÈu giang hå. ")
	Msg2Player("Ban rêi khái Thiªn NhÉn Gi¸o, tiÕp tôc hµnh tÈu giang hå. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ×ªÅÉ£¬ÊÕ»ØÔ­ÃÅÅÉÎä¹¦¼¼ÄÜ
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=135; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ²ĞÑôÈçÑª
	i=131; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÈÌµ¶·¨
	i=132; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÈÌÃ¬·¨
	i=134; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÈÌ´¸·¨
	i=136; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- »ğÁ«·Ù»ª
	i=137; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- »ÃÓ°·Éºü
	i=138; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÍÆÉ½Ìîº£
	i=139; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- »ëË®ÃşÓã
	i=140; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ·ÉºèÎŞ¼£
	i=141; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÁÒË®¾¦Ìì
	i=142; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÍµÌì»»ÈÕ
	i=143; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- À÷Ä§¶á»ê
	i=145; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- µ¯Ö¸ÁÒÑæ
	i=146; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÎåĞĞÕó
	i=147; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ĞşÚ¤ÎüĞÇ
	i=148; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÆßÉ±ÉñÈ­
	i=149; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ê´¹ÇÑªÈĞ
	i=150; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÄ§½âÌå
	i=254; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÈıÎ¶Õæ»ğ
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(8,5*256+20)
	SetTask(4,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(71)
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200 ®iÓm! ")
		AddRepute(-200)
	end
	AddNote("Sau khi bá ®i c¸c kü n¨ng vµ danh hiÖu tr­ëng l·o cña Thiªn NhÉn Gi¸o, B©y giê b¹n cã thÓ gia nhËp C¸i Bang. ")
	Msg2Player("Sau khi bá ®i c¸c kü n¨ng vµ danh hiÖu tr­ëng l·o cña Thiªn NhÉn Gi¸o, B©y giê b¹n cã thÓ gia nhËp C¸i Bang. ")
	Talk(1,"KickOutSelf","§· thÕ, h·y phÕ bá vâ c«ng, ng­¬i thİch thÕ nµo sÏ nh­ thÕ ®ã. ")
end

function defection_no()
	AddNote("B¹n tõ bá ı ®Şnh gia nhËp C¸i Bang. ")
	Msg2Player("B¹n tõ bá ı ®Şnh gia nhËp C¸i Bang. ")
	SetTask(8,1*256)			-- ÎªÆóÍ¼ÅÑÊ¦×ö¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
end

function return_sele()
	Say("Ng­¬i nãi muèn quay l¹i bæn gi¸o ­?",2,"Tu©n lÖnh!/return_yes","Kh«ng. /return_no")
end;

function return_yes()
	Talk(2,"","§Ó nhí ®Õn qu¸ tr×nh ph¸t triÓn tõ gian khæ cña bæn gi¸o, bæn gi¸o quy ®Şnh nh÷ng ®Ö tö ngao du giang hå nh­ ng­¬i muèn quay trë l¹i ph¶i giao nép 50000 l­îng. ","V©ng, ®Ö tö ®· ®em 5 v¹n l­îng ®Õn.")
	SetTask(4,70*256+20)
	AddNote("Giao nép 5 v¹n l­îng ®Ó quay l¹i Thiªn NhÉn Gi¸o. ")
	Msg2Player("Giao nép 5 v¹n l­îng ®Ó quay l¹i Thiªn NhÉn Gi¸o. ")
end;

function return_no()
	Talk(1,"","Sau nµy sÏ quay vÒ phôc vô bæn gi¸o, cßn b©y giê vÉn cßn chuyÖn t¹i h¹ ch­a lµm xong. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","RÊt tèt! Ng­¬i ®· trë thµnh Kı danh ®Ö tö cña bæn gi¸o. Ta sÏ ®Ò cö ng­¬i víi Th¸nh Gi¸o Tr­ëng L·o cña bæn gi¸o, ®õng lµm ta thÊt väng.")
		Pay(50000)
		SetFaction("tianren")	
		SetCamp(2)
		SetCurCamp(2)
		SetRank(81)
		SetTask(4, 80*256)
--		if (HaveMagic(150) == -1) then
--			AddMagic(142)
--			AddMagic(148)
--			AddMagic(150)
		add_tr(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n ®· häc ®­îc trÊn ph¸i tuyÖt häc: Thiªn Ma Gi¶i ThÓ, Du Thiªn Ho¸n NhËt, Ma DiÖm ThÊt S¸t. ")
--		end
		AddNote("Quay trë l¹i Thiªn NhÉn Gi¸o, l¹i ®øng vµo hµng ngò. ")
		Msg2Player(GetName().."Quay trë l¹i Thiªn NhÉn Gi¸o, ®­îc phong lµm Th¸nh Gi¸o tr­ëng l·o. ")
	else
		Talk(2,"","Sao? Ng­¬i chØ ®em bao nhiªu ng©n l­îng th«i sao?","Xin lçi! §Ó ta kiÓm tra l¹i.")
	end
end;

function return_uncompleted()
	Talk(1,"","õ, nhanh lªn!")
end;

----------------------- ³öÊ¦ÈÎÎñ ------------------------
function L60_get_yes()
	Talk(1,"","L·o phu qu¶ kh«ng nh×n lÇm ng­êi, ng­¬i qu¶ cã lßng can ®¶m! Nh­ng tr­íc khi vµo Th¸nh ®éng, ph¶i t×m ®­îc <color=Red>5 thanh ®o¶n kiÕm<color> l­u l¹c ë <color=Red>BiÖn Kinh<color> cho ta.")
	SetTask(4, 60*256+20)
	AddNote("GÆp Gi¸o chñ Hoµn Nhan Hïng LiÖt, tiÕp nhËn nhiÖm vô xuÊt s­. Tr­íc tiªn ph¶i ®i BiÖn Kinh t×m 5 thanh ®o¶n kiÕm. ")
	Msg2Player("GÆp Gi¸o chñ Hoµn Nhan Hïng LiÖt, tiÕp nhËn nhiÖm vô xuÊt s­. Tr­íc tiªn ph¶i ®i BiÖn Kinh t×m 5 thanh ®o¶n kiÕm. ")
end;

function L60_get_no()
	Talk(1,""," LÏ nµo ng­¬i kh«ng chó träng h­ danh sao?")
end;

function L60_prise()
	DelItem(132)
--	AddGlobalCountNews(GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğ¸÷Î»½ÌÓÑÄÏÏÂ½­ºş¡£", 1)
	Msg2SubWorld("Tİn ®å Thiªn NhÉn Gi¸o "..GetName().."XuÊt s­ thµnh c«ng, c¸o biÖt ch­ vŞ gi¸o h÷u trë vÒ ph­¬ng Nam. ")
	SetRank(71)
	SetTask(28,0)		-- ½«×Ó±äÁ¿¸´Î»
	SetTask(4, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Quay l¹i Thiªn NhÉn §¹i ®×nh, ®­a quyÓn s¸ch da dª cho Hoµn Nhan Hïng LiÖt, hoµn thµnh nhiÖm vô xuÊt s­. Th¨ng cÊp T¸t M·n Ph¸p S­. ")
	Msg2Player("Chóc mõng B¹n! XuÊt s­ thµnh c«ng! §­îc phong lµ T¸t M·n Ph¸p S­! Danh väng t¨ng thªm 120 ®iÓm! ")
	AddRepute(120)
end;

function no()
end
