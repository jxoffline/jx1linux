--description: ÌìÍõ°ïÇŞ¹¬ Ñîçø¡¡ÌìÍõ³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- Update£ºDan_Deng(2003-10-27)ÎªÖØ·µÊ¦ÃÅÈÎÎñ¼ÓÈëÈ¡ÏûÈÎÎñ¹¦ÄÜ£¬ÒÔ¼°ÓëĞÂÃÅÅÉ¶ÔÓ¦

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	if (vt06_isactive() ~= 0) then
		Say("T×m ta cã viÖc g×?", 2, "Muèn thØnh gi¸o ®¹i s­!/oldentence", "Mõng lÔ ¢n S­, t¹i h¹ ®· t×m ®ñ “ThÎ ¢n S­” vµ “ThÎ Cao §å”./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×."
	G_TASK:OnMessage("Thiªn V­¬ng", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 1) then
		tbDailog:AddOptEntry("Häc kü n¨ng cÊp 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end

	UTask_tw = GetTask(3);
	local nFactID = GetLastFactionNumber();

	if (UTask_tw == 70*256) and (GetFaction() == "tianwang") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tw == 70*256) and (GetTask(7) >= 5*256) and (GetTask(7) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(7,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tw == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(3,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tw == 80*256 and nFactID == 1 and GetCamp() == 3 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianwang");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_tw == 70*256 and nFactID == 1 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end
	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(1)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","TriÒu ®×nh nhµ Tèng ngu xuÈn, kh«ng ®éi trêi chung víi D­¬ng gia ta. N¨m x­a Së V­¬ng cïng cha ta thÒ quyÕt diÖt Tèng. D­¬ng Anh tuy bÊt tµi, nh­ng còng quyÕt thùc hiÖn chİ lín!")
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--ÄÃµ½ÌìÍõÒÅÊé
			Talk(3, "L60_prise", "Thuéc h¹ kh«ng d¸m khinh sø mÖnh, ®· lÊy ®­îc 'Thiªn V­¬ng Di Th­', xin Bang chñ xem qua! ", "Tèt qu¸! LÊy ®­îc 'Thiªn V­¬ng Di Th­' kh«ng nh÷ng b¶o toµn ®­îc bæn bang mµ cßn cã thÓ ng¨n chÆn ®­îc tai ­¬ng trªn chèn vâ l©m! Ng­¬ilµm rÊt tèt! Tõ h«m nay trë ®i, ng­¬icã thÓ tù do hµnh tÈu giang hå!", "Chóc mõng b¹n thµnh nghÖ xuÊt s­! B¹n ®­îc phong lµ K×nh Thiªn Nguyªn So¸i, tõ nay vÒ sau cã thÓ tù do hµnh tÈu giang hå! Hy väng b¹n sÏ ph¸t huy n¨ng lùc, ph¸t triÓn tiÒn ®å!")
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", "Nhí n¨m x­a, Së V­¬ng khëi binh t¹i §éng §×nh Hå, Nam kh¸ng TriÖu Tèng, B¾c chèng Kim binh. Sau khi Së V­¬ng b¨ng hµ, nghÜa qu©n cßn l¹i tiÕn cö cha ta §¹i Th¸nh Thiªn V­¬ng lµm l·nh ®¹o. NghÜa qu©n ph¸t triÓn m¹nh mÏ, triÒu ®×nh ho¶ng sî cö qu©n ®Õn t×m diÖt. Trong trËn huyÕt chiÕn cha ta kh«ng may bŞ bän ph¶n béi b¸n ®øng, ®· hy sinh t¹i Thanh Loa §¶o", "Sau khi cha ta qua ®êi, ta lÊy ®­îc ¸o bµo, kiÕm b¸u vµ mét bé binh th­ giÊu t¹i <color=Red>Thanh Loa §¶o<color>. Tªn cuèn binh th­ ®ã lµ <color=Red>'Thiªn V­¬ng Di Th­'<color>, bªn trong kh«ng chØ ghi l¹i ph­¬ng ph¸p bè trËn cña cha ta, mµ cßn ghi chó chi tiÕt ®Şa thÕ chiÕn l­îc cña §éng §×nh Hå, v× thÕ ®©y ®­îc xem nh­ lµ bİ kİp cña bæn bang. ", "ThÕ nh­ng gÇn ®©y kh«ng biÕt bŞ ai ®ã cung cÊp th«ng tin ra ngoµi, cuèn s¸ch nµy bŞ qu©n Kim dß ra, chóng ®· cö bän s¸t thñ ®Õn lÊy c¾p cuèn s¸ch nµy. ")
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			Say("ThÕ nµo! Muèn hµnh tÈu giang hå mét phen µ?",2,"V©ng, xin Bang chñ ©n chuÈn. /goff_yes","Kh«ng, ta tù thÊy c«ng phutËp luyÖn vÉn ch­a ®ñ. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--ÒÑ¾­½Óµ½³öÊ¦ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","<color=Red>'Thiªn V­¬ng Di th­'<color> ®­îc giÊu trong mét <color=Red>B¶o r­¬ng <color>, B¶o r­¬ng ®­îc giÊu ë <color=Red>phİa b¾c Thanh Loa ®¶o<color>, tr­íc tiªn cÇn ph¶i t×m ®­îc <color=Red>Ch×a khãa ®Ó më B¶o r­¬ng<color>.")
		else
			Talk(1,"","Kim quèc cã ı muèn ng«ng cuång lËt ®æ vâ l©m Trung Nguyªn ta, nÕu nh­ huynh ®Ö chóng ta kh«ng ®ång t©m, lµm sao cã thÓ chèng ®­îc qu©n thï?")
		end
--	elseif (GetTask(7) == 5*256+10) then		-- ×ªÅÉÖÁÉÙÁÖÅÉ
--		Say("Ñîçø£ºÅÑ°ïÕßÒª·ÏÈ¥±¾°ïÈ«²¿Îä¹¦£¬ÄãÕæµÄÒª±³Æú±¾ÃÅÍ¶ÈëÉÙÁÖÅÉ£¿",2,"²»´í£¬ÎÒÒâÒÑ¾ö/defection_yes","²»£¬ÎÒ»¹ÊÇ²»¸ÄÍ¶ÉÙÁÖÁË/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_select","Tèt l¾m! Hµnh tÈu giang hå nhí gióp ®ì nh÷ng ng­êi khèn khã!")
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say("Ng­¬i ®· chuÈn bŞ ®ñ 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--ÒÑ¾­³öÊ¦
		Talk(1,"","Sau khi rêi khái Thiªn V­¬ng Bang, mäi ng­êi vÉn nh­ anh em ruét thŞt!")
	else
		Talk(1,"","Thiªn V­¬ng Bang ®øng gi÷a mèi thï Tèng Kim vÉn ®øng v÷ng, thËm chİ vÉn ph¸t triÓn m¹nh mÏ, ®Òu do huynh ®Ö trong Bang ®oµn kÕt mét lßng")
	end
end

---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
	x = 0
	skillID = 38					-- ÅÌ¹Å¾ÅÊ½
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ÈôÓĞ¼¼ÄÜ·¢Éú±ä»¯£¬ÔòÌßÏÂÏß£¬·ñÔò·µ»Ø¼ÌĞøÁ÷³Ì
		Say("Vi s­ lÇn nµy bÕ quan suy nghÜ mÊy ngµy, s¸ng chÕ ra ®­îc chiªu thøc míi, b©y giê truyÒn l¹i cho ng­¬i. Häc xong nhí ph¶i tŞnh d­ìng mét thêi gian ®Ó khái lµm tæn th­¬ng kinh m¹ch.",1,"§a t¹ s­ phô /KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- ÖØ·µÈÎÎñ ----------------------
function goff_yes()
	Talk(1,"","Tèt l¾m! Hµnh tÈu giang hå nhí gióp ®ì nh÷ng ng­êi khèn khã!")
	SetTask(3,70*256)
	AddNote("Rêi khái Thiªn V­¬ng bang, tiÕp tôc hµnh tÈu giang hå. ")
	Msg2Player("Ban ®· rêi khái Thiªn V­¬ng bang, tiÕp tôc hµnh tÈu giang hå. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Õ¶Áú¾÷
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõÇ¹·¨
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõµ¶·¨
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõ´¸·¨
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- »Ø·çÂäÑã
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ĞĞÔÆ¾÷
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÎŞĞÄÕ¶
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¾²ĞÄ¾÷
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¾ªÀ×Õ¶
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ñô¹ØÈıµş
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõÕ½Òâ
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÆÃ·çÕ¶
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÅÌ¹Å¾ÅÊ½£¨ÒÑÈ¡Ïû¼¼ÄÜ£©
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¶Ï»êØİ
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÑªÕ½°Ë·½
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ½ğÖÓÕÖ
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(79)						-- Í·ÏÎ½µÎªÕò°ïÔªË§
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200 ®iÓm! ")
		AddRepute(-200)
	end
	AddNote("D­¬ng Anh phÕ bá vâ c«ng Thiªn V­¬ng bang cña b¹n, ®o¹t l¹i chøc K×nh Thiªn Nguyªn So¸i dång thêi c«ng bè cho thiªn h¹ b¹n ®· ra khái Thiªn V­¬ng Bang. B©y giê ng­¬i cã thÓ gia nhËp ThiÕu L©m ph¸i. ")
	Msg2Player("D­¬ng Anh phÕ bá vâ c«ng Thiªn V­¬ng bang cña b¹n, ®o¹t l¹i chøc K×nh Thiªn Nguyªn So¸i dång thêi c«ng bè cho thiªn h¹ b¹n ®· ra khái Thiªn V­¬ng Bang. B©y giê ng­¬i cã thÓ gia nhËp ThiÕu L©m ph¸i. ")
	Talk(1,"KickOutSelf","ThËt ®¸ng tiÕc! Ta ph¶i thu håi l¹i vâ c«ng ®· d¹y ng­¬i! Hñy bá danh x­ng K×nh Thiªn Nguyªn So¸i cña ng­¬i")
end

function defection_no()
	SetTask(7,1*256)				-- ÎªÆóÍ¼ÅÑÊ¦×÷¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
	AddNote("B¹n tõ bá ı ®Şnh gia nhËp ThiÕu L©m ph¸i. ")
	Msg2Player("B¹n tõ bá ı ®Şnh gia nhËp ThiÕu L©m ph¸i. ")
end

function return_select()
	Say("§óng vËy! Søc mét con ng­êi chØ cã h¹n, ph¶i ®oµn kÕt cïng mäi ng­êi th× míi nªn chuyÖn. Bæn bang vÉn cßn tuyÖt kü trÊn ph¸i 'Kim Chung Tr¸o', chØ truyÒn cho nh÷ng ®Ö tö trung thµnh. ThÕ nµo,cã muèn quay l¹i bæn bang kh«ng?",2,"V©ng, ta muèn trë l¹i Thiªn V­¬ng bang /return_yes","Kh«ng, ta chØ buét miÖng nãi vËy th«i. /return_no")
end;

function return_yes()
	Talk(2,"","RÊt tèt! Tr­íc m¾t qu©n ta ®ang giao chiÕn víi qu©n Tèng, qu©n phİ kh«ng ®ñ, ng­¬i nép 50000 l­îng th× cã thÓ trë l¹i bæn bang häc Kim Chung Tr¸o","V©ng! Xin ®Ó ®Ö tö chuÈn bŞ mét chót. ")
	SetTask(3,70*256+20)
	AddNote("Hæ trî 50000 l­îng qu©n phİ cho Thiªn V­¬ng bang cã thÓ quay l¹i m«n ph¸i. ")
	Msg2Player("Hæ trî 50000 l­îng qu©n phİ cho Thiªn V­¬ng bang cã thÓ quay l¹i m«n ph¸i. ")
end;

function return_no()
	Talk(1,"","Ta chØ lµ nh©n tiÖn ghĞ th¨m ®ång m«n th«i!")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ÓĞ50000Á½
		Talk(1,"","RÊt tèt! Hoan nghªnh ng­¬i trë l¹i Thiªn V­¬ng Bang, ta phong ng­¬i lµ K×nh Thiªn Nguyªn So¸i. ")
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
--		if (HaveMagic(36) == -1) then
--			AddMagic(32)
--			AddMagic(41)
--			AddMagic(324)
--			AddMagic(36)
		add_tw(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n häc ®­îc tuyÖt kü trÊn ph¸i cña Thiªn V­¬ng bang: Thiªn V­¬ng ChiÕn ı, Vâ C«ng V« T©m Tr¶m, HuyÕt ChiÕn B¸t ph­¬ng, Thõa Long QuyÕt. ")
--		end
		AddNote("§· quay trë l¹i Thiªn V­¬ng bang. ")
		Msg2Faction(GetName().." ®· trë l¹i Thiªn V­¬ng bang, ®­îc phong lµ K×nh Thiªn Nguyªn So¸i")
	else
		Talk(2,"","H¶?H×nh nh­ vÉn ch­a ®ñ?","Xin lçi! §Ó ta kiÓm tra l¹i.")
	end
end;

---------------------- ³öÊ¦ÈÎÎñ ----------------------
function L60_get()
	Say("<color=Red>'Thiªn V­¬ng Di th­'<color> tuyÖt ®èi kh«ng thÓ ®Ó r¬i vµo tay ng­êi Kim. Ng­¬i h·y lËp tøc ®Õn <color=Red>Thanh Loa ®¶o<color>, lÊy <color=Red>'Thiªn V­¬ng Di th­'<color> vÒ ®©y! Cã lµm ®­îc kh«ng?", 2, "Thuéc h¹ tËn lùc thi hµnh /L60_get_yes", "E r»ng khã cã thÓ nhËn nhiÖm vô /no")
end;

function L60_get_yes()
	Talk(1,"","<color=Red>'Thiªn V­¬ng Di th­'<color> ®­îc giÊu trong mét <color=Red>B¶o r­¬ng <color>, B¶o r­¬ng ®­îc giÊu ë <color=Red>phİa b¾c Thanh Loa ®¶o<color>, tr­íc tiªn cÇn ph¶i t×m ®­îc <color=Red>Ch×a khãa ®Ó më B¶o r­¬ng<color>. Ng­¬i h·y lËp tøc ®i thuyÒn ®Õn <color=Red>Thanh Loa ®¶o<color>. Nhí pahØ hÕt søc cÈn thËn!")
	SetTask(3, 60*256+20)
	AddNote("T¹i TÈm cung Thiªn V­¬ng bang (223, 196) gÆp D­¬ng Anh, tiÕp nhËn nhiÖm vô ®i Thanh Loa ®¶o thu håi Thiªn V­¬ng Di Th­. ")
	Msg2Player("T¹i TÈm cung Thiªn V­¬ng bang (223, 196) gÆp D­¬ng Anh, tiÕp nhËn nhiÖm vô ®i Thanh Loa ®¶o thu håi Thiªn V­¬ng Di Th­. ")
end;

function L60_prise()
DelItem(96)
Msg2Player("Chóc mõng b¹n ®· xuÊt s­ thµnh c«ng, b¹n ®­îc phong lµ TrÊn Bang Nguyªn So¸i! Danh väng t¨ng thªm 120 ®iÓm! ")
--AddGlobalCountNews(GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğÍ¬ÃÅÊ¦µÜ¿ªÊ¼´³µ´½­ºş¡£", 1)
Msg2SubWorld("Thiªn V­¬ng"..GetName().."XuÊt s­ thµnh c«ng, c¸o biÖt D­¬ng bang chñ vµ c¸c ®ång m«n huynh ®Ö, tiÕp tôc hµnh tÈu giang hå. ")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--Íæ¼ÒÍË³öÌìÍõ°ï
SetCurCamp(4)
AddNote("Quay l¹i TÈm cung Thiªn V­¬ng Bang, ®­a Thiªn V­¬ng Di Th­ cho Bang chñ D­¬ng Anh, hoµn thµnh nhiÖm vô xuÊt s­. Th¨ng chøc K×nh Thiªn Nguyªn So¸i.. ")
end;

function no()
end
