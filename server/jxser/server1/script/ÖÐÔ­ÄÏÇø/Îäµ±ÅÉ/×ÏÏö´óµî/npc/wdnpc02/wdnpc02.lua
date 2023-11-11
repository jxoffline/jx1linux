--description: Îäµ±ÅÉµÀÒ»ÕæÈË¡¡Îäµ±10¼¶ÈÎÎñ¡¢40¼¶ÈÎÎñ¡¢³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- ĞŞ¸ÄDan_DengµÄ´íÎó£ºQBJ
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
				"TÆng b¸nh ngµy xu©n/#tbMasterGift:getGift('wudang')",
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
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 8) then
		Describe("T×m ta cã viÖc g×?", 2,
			"Häc kü n¨ng cÊp 120./lvl120skill_learn",
			"Muèn thØnh gi¸o viÖc kh¸c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wd = GetTask(5)
	local nFactID = GetLastFactionNumber();

	if (UTask_wd == 70*256) and (GetFaction() == "wudang") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_wd == 70*256) and (GetTask(9) >= 5*256) and (GetTask(9) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(9,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_wd == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(5,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_wd == 80*256 and nFactID == 8 and GetCamp() == 1 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudang");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_wd == 70*256 and nFactID == 8 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(8)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wd = GetTask(5)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),5) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","B©y giê Minh chñ lÊy danh nghÜa ' Thiªn h¹ ®¹i nghÜa' ®Ó mêi, Vâ §ang ph¸i kh«ng thÓ kh«ng ®Õn. H·y chuyÓn lêi tíi §éc C« minh chñ: Vâ §ang ph¸i tu©n theo sù s¾p xÕp cña Minh chñ.")
		Uworld40 = SetBit(GetTask(40),5,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 60*256+20) and (HaveItem(69) == 1 and HaveItem(70) == 1 and HaveItem(71) == 1) then
			Talk(2, "L60_prise", "Cã thÓ lµm ng­êi lo cho c¸i lo cña thiªn h¹, lµ ®· ®¹t ®­îc mét ch÷ 'hiÖp'. B©y giê thêi thÕ läan l¹c, bÖnh dŞch, chiÕn tranh, b¹o quyÒn, nh©n d©n ®au khæ lÇm than, ng­¬i cã thÓ lµm thuËn theo lßng d©n, ®em vâ nghÖ ®· häc t¹o phóc cho b¸ t¸nh", "Chóc mõng b¹n thµnh nghÖ xuÊt s­! B¹n ®­îc phong lµ HuyÒn Vâ ThÇn ThŞ, Tõ h«m nay cã thÓ tù do hµnh hiÖp giang hå!Cã thÓ chän gia nhËp vµo m«n ph¸i kh¸c tiÕp tôc häc nghÖ, còng cã thÓ tù lËp bang héi më réng thÕ lùc giang hå, hoÆc lµm ®éc kh¸ch hµnh oai phong lÉm liÖt! Giang hå kiÕm hiÖp, trêi cao ®Êt réng, hy väng b¹n sÏ tiÕp tôc ph¸t triÓn tiÒn ®å cña m×nh")
		elseif (UTask_wd == 60*256) and (GetLevel() >= 50) then					--³öÊ¦ÈÎÎñ
			Say("Trªn <color=Red>Th¸i Tö Nham<color> cã <color=Red>3 c¸i B¶o r­¬ng <color>, mçi c¸i B¶o r­¬ng cã niªm l¸ bïa, nÕu ng­¬i cã thÓ hoµn thµnh nhiÖm vô ghi trªn l¸ bïa, th× cã thÓ më B¶o r­¬ng lÊy <color=Red>3 mãn b¶o vËt<color> mang vÒ ®©y!", 2, "TiÕp nhËn nhiÖm vô /L60_get_yes", "T¹m thêi kh«ng xuÊt s­ /L60_get_no")
		elseif ((UTask_wd == 40*256+60) or (UTask_wd == 40*256+80)) and (HaveItem(164) == 1) then		--40¼¶ÈÎÎñÍê³É
			Talk(3, "L40_prise", " S­ phô! §Ö tö thay Chu s­ huynh ®i nói Phôc Ng­u mét chuyÕn,®em th­ giao cho NhuËn N­¬ng, ®©y lµ th­ tr¶ lêi cña bµ Êy!", "Th× ra lµ vËy.....viÖc nµy ng­¬i kh«ng nªn nãi lung tung, nhí ch­a?", " §Ö tö hiÓu râ! ")
--		Îª¼ÆÊ±Æ÷´íÎó´ò²¹¶¡£¬±äÁ¿ÖµÎª35¡¢Î´Ñ§Îäµ±½£·¨(151)µÄ£¬Ò²¿ÉÒÔ½Ó10¼¶ÈÎÎñ£¨ÒÑÈ¡Ïû£©
--		elseif ((UTask_wd == 10*256) or (((UTask_wd == 35) or (UTask_wd >= 20*256)) and (HaveMagic(151) == -1))) and (GetLevel() >= 10) and (GetFaction() == "wudang") then
		elseif (UTask_wd == 10*256) and (GetLevel() >= 10) then
			Talk(1,"","§Ö tö Vâ §ang ph¸i ta ®Òu ph¶i häc thuéc <color=Red>'§¹o §øc Kinh'<color>. Ng­¬i h·y ®Õn thØnh gi¸o <color=Red>DiÖp TiÕp Mü<color> s­ thóc, häc thuéc'§¹o §øc Kinh'. Sau ®ã quay l¹i l¹i t×m ta")
			SetTask(5, 10*256+20)
			AddNote("T¹i Tö Tiªu ®¹i ®iÖn gÆp §¹o NhÊt Ch©n Nh©n, nhËn nhiÖm vô §¹o §øc kinh, t×m DiÖp TiÕp MÜ häc §¹o §øc kinh. ")
			Msg2Player("T¹i Tö Tiªu ®¹i ®iÖn gÆp §¹o NhÊt Ch©n Nh©n, nhËn nhiÖm vô §¹o §øc kinh, t×m DiÖp TiÕp MÜ häc §¹o §øc kinh. ")
		elseif (UTask_wd == 10*256+50) then					--10¼¶ÈÎÎñ
			Talk(1,"L10_Q1","§· thuéc ch­a? Vi s­ muèn kiÓm tra ng­¬i, nghe râ ch­a?")
		elseif (UTask_wd == 10*256+60)  then
			L10_Q2()
		elseif (UTask_wd == 10*256+70)  then
			L10_Q3()
		elseif (UTask_wd == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë£¨ĞÂ¼Ó¼¼ÄÜ£©
			check_skill()
		elseif (UTask_wd == 10*256+20) then
			Talk(1,"","§Ö tö Vâ §ang ph¸i ta ®Òu ph¶i häc thuéc <color=Red>'§¹o §øc Kinh'<color>. Ng­¬i h·y ®Õn thØnh gi¸o <color=Red>DiÖp TiÕp Mü<color> s­ thóc, häc thuéc'§¹o §øc Kinh'. Sau ®ã quay l¹i l¹i t×m ta")
		elseif (UTask_wd > 60*256) and (UTask_wd < 70*256) then					--ÉĞÎ´Íê³É³öÊ¦ÈÎÎñ
			Talk(1,"","Ng­¬i ph¶i më 3 b¶o r­¬ng trªn<color=Red>Th¸i Tö Nham<color>phİa sau<color=Red>hËu s¬n<color>, lÊy ®­îc<color=Red>3 bé b¶o vËt<color>bªn trong, míi cã thÓ xuÊt s­ ®­îc!")
		elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´½Óµ½³öÊ¦ÈÎÎñ
			Talk(1,"","ChuyÖn cña NhuËn N­¬ng kh«ng ®­îc nãi lung tung, nhí ch­a?")
		else					--ÒÑ¾­Íê³É10¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É40¼¶ÈÎÎñ£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Lµm ng­êi cã thÓ kÕt thµnh huynh ®Ö b»ng h÷u, ®Òu lµ do duyªn sè c¶!")
		end
--	elseif (GetTask(9) == 5*256+10) then		-- ×ªÃÅÅÉµ½À¥ÂØ
--		Say("µÀÒ»ÕæÈË£ºÀ¥ÂØÅÉÃÅ·ç²»Õı£¬¿öÇÒÎªÃâÒÉÂÇ£¬×ªÃÅÅÉµÄ»°ÎÒ±ØĞëÊÕ»ØÄãËùÓĞ±¾ÅÉÎäÒÕ¡£ÄãÕæµÄÖ´ÒâÒªÈëÀ¥ÂØ£¿",2,"²»´í£¬ÎÒÒâÒÑ¾ö/defection_yes","ÄÇÎÒ»¹ÊÇ²»È¥ÁË/defection_no")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wd == 70*256) and (GetTask(9) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(2,"return_select","H¹ s¬n trong nh÷ng ngµy nµy, ng­¬i c¶m thÊy thÕ nµo?","Phiªu b¹t giang hå nhiÒu ngµy míi biÕt vâ c«ng cña m×nh thËt tÖ.")
	elseif (GetCamp() == 4) and ((UTask_wd == 70*256+10) or (UTask_wd == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("ChuÈn bŞ ®ñ 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
	elseif (UTask_wd >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Tuy ng­¬i ®· xuÊt s­, ta còng cã vµi lêi muèn göi g¾m cïng ng­¬i: Víi ng­êi tËp vâ, §¹o vâ vèn rÊt quan träng, §øc vâ còng cµng ph¶i chuyªn t©m tu d­ìng. Ng­êi häc vâ mµ kh«ng tu luyÖn §øc sÏ kh«ng thÓ ®¹t ®­îc c¶nh giíi vâ häc, mong ng­¬i cè g¾ng tu d­ìng!")
	else
		Talk(1,"","Vâ häc cã ®¹o, theo ®­êng chİnh ®¹o míi cã thÓ ®¹t thµnh. NÕu ®i nhÇm ®­êng, sÏ uæng c«ng c¶ ®êi tu luyÖn")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(267) == -1) then
--		AddMagic(267)					-- Èı»·Ì×ÔÂ
--		Msg2Player("ÄãÑ§»áÁË¡°Èı»·Ì×ÔÂ¡±")
--		Say("µÀÒ»ÕæÈË£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°Èı»·Ì×ÔÂ¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("Vâ nghÖ cña ng­¬i ®· cã nhiÒu tiÕn bé! Ch¾c cã thÓ h¹ s¬n thİ luyÖn mét phen!",2,"D¹! §Ö tö ®i liÒn /goff_yes","§Ö tö tËp luyÖn vÉn ch­a ®ñ /no")
--	end
end

-------------------------- ÖØ·µÃÅÅÉÏà¹Ø ---------------------
function goff_yes()
	Talk(1,"","§­îc! H·y ghi nhí t«n chØ cña bæn ph¸i: 'Lu«n lµm viÖc thiÖn, gióp ®ì kÎ yÕu ®uèi nghÌo khã'")
	SetTask(5,70*256)
	AddNote("Rêi khái Vâ §ang ph¸i, l¹i chu du giang hå. ")
	Msg2Player("Rêi khái Vâ §ang ph¸i, l¹i chu du giang hå. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ×ªÅÉ£¬ÊÕ»ØÔ­ÃÅÅÉÎä¹¦¼¼ÄÜ
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=153; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Å­À×Ö¸
	i=151; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Îäµ±½£·¨
	i=152; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Îäµ±È­·¨
	i=155; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ²×º£Ã÷ÔÂ
	i=156; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ´¿ÑôĞÄ·¨
	i=157; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ×øÍüÎŞÎÒ
	i=158; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ½£·É¾ªÌì
	i=159; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÆßĞÇÕó
	i=160; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌİÔÆ×İ
	i=161; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Á½ÒÇĞÄ·¨
	i=162; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ĞşÒ»ÎŞÏó
	i=164; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- °ş¼°¶ø¸´
	i=165; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÎŞÎÒÎŞ½£
	i=166; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ì«¼«Éñ¹¦
	i=267; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Èı»·Ì×ÔÂ
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(9,5*256+20)
	SetTask(5,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(63)
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200 ®iÓm! ")
		AddRepute(-200)
	end
	AddNote("Thu håi vâ c«ng Vâ §ang, hñy bá chøc vŞ HuyÒn vâ ch©n nh©n. B¹n cã thÓ gia nhËp C«n L«n ph¸i. ")
	Msg2Player("Thu håi vâ c«ng Vâ §ang, hñy bá chøc vŞ HuyÒn vâ ch©n nh©n. B¹n cã thÓ gia nhËp C«n L«n ph¸i. ")
	Talk(1,"KickOutSelf","NÕu ®· nh­ thÕ, ta ®µnh ph¶i thu l¹i vâ nghÖ bæn ph¸i mµ ng­¬i ®· häc!")
end

function defection_no()
	AddNote("B¹n tõ bá suy nghÜ quay l¹i C«n L«n ph¸i. ")
	Msg2Player("B¹n tõ bá suy nghÜ quay l¹i C«n L«n ph¸i. ")
	SetTask(9,1*256)			-- ÎªÆóÍ¼ÅÑÊ¦×ö¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
end

function return_select()
	Say("Cã rÊt nhiÒu ng­êi nghiªn cøu vµ ph¸t huy vâ c«ng cña bæn ph¸i. ThÕ nµo? Ng­¬i cã høng thó quay l¹i cïng ta nghiªn cøu vâ häc ®Õn c¶nh giíi tèi cao kh«ng?",2,"§Ö tö hy väng cã thÓ cïng nghiªn cøu vâ häc /return_yes","Kh«ng cÇn ®©u/return_no")
end;

function return_yes()
	Talk(1,"","Vâ §ang s¬n cß nhiÒu du kh¸ch th­ëng l·m, s¬n lé còng v× thÕ mµ h­ háng nhiÒu! §Ó thö th¸ch ng­¬i, ng­¬i cã thÓ quyªn gãp 5 v¹n l­îng tiÒn tu söa s¬n lé kh«ng? ")
	SetTask(5,70*256+20)
	AddNote("Giao 50000 l­îng b¹c cã thÓ quay l¹i Vâ §ang ph¸i. ")
	Msg2Player("Giao 50000 l­îng b¹c cã thÓ quay l¹i Vâ §ang ph¸i. ")
end;

function return_no()
	Talk(1,"","Xin ®a t¹ h¶o ı cña Ch­ëng m«n. Nh­ng hiÖn ®¹o suy ma thŞnh, sinh linh chŞu c¶nh th­¬ng t©m. §Ö tö sao cã thÓ m¾t lÊp tai ng¬!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Hay l¾m! Ta sÏ th«ng b¸o tin ng­¬i ®· quay l¹i m«n ph¸i!")
		Pay(50000)
		SetTask(5, 80*256)
		SetFaction("wudang")
--		if (HaveMagic(166) == -1) then
--			AddMagic(165)
--			AddMagic(267)
--			AddMagic(166)
		add_wd(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n häc ®­îc trÊn ph¸i tuyÖt häc Th¸i Cùc ThÇn C«ng, V« Ng· V« KiÕm, Tam Hoµn Thao NguyÖt. ")
--		end
		SetCamp(1)
		SetCurCamp(1)
		SetRank(73)
		AddNote("§· trë vÒ Vâ §ang ph¸i,®øng trong hµng ngò. ")
		Msg2Player(GetName().."§­îc phong lµm HuyÒn Vâ Ch©n Qu©n cña Vâ §ang ph¸i, tiÕp tôc ë l¹i Vâ §ang tËp luyÖn. ")
	else
		Talk(2,"","H¶? H×nh nh­ kh«ng ®ñ l¾m!","µ! Xin lçi! §Ó ®Ö tö kiÓm tra l¹i c¸i ®·!")
	end
end;

function return_uncompleted()
	Talk(1,"","Nµo, cè lªn!")
end;

------------------- 10¼¶ÈÎÎñ --------------------
function L10_Q1()
	Say("C©u thø nhÊt khëi biªn trong ch­¬ng 1 '§¹o §øc Kinh' lµ g×?", 3, "§¹o sinh nhÊt, nhÊt sinh nhŞ, nhŞ sinh tam, tam sinh v¹n vËt /no", "Nh©n ph¸p ®Şa, ®Şa ph¸p thiªn, thiªn ph¸p ®¹o, ®¹o ph¸p tù nhiªn /no", "§¹o kh¶ ®¹o, phi th­êng ®¹o; danh kh¶ danh, phi th­êng danh /L10_Q2")
end;

function L10_Q2()
	SetTask(5,10*256+60)
	Say("C©u hái kÕ tiÕp: '§¹i T­îng' trong '§¹i T­îng v« h×nh' lµ chØ c¸i g×?", 3, "Mét lo¹i ®éng vËt /no", "H×nh tr¹ng lín nhÊt /L10_Q3", "Th¸i t­îng /no")
end;

function L10_Q3()
	SetTask(5,10*256+70)
	Say("Giái! C©u hái cuèi cïng: Phİa sau cña c©u 'Tri Nh©n Gi¶ Trİ, Tù Tri Gi¶ Minh' lµ c©u g×?", 3, "§¹i trùc nh­îc khóc, ®¹i x¶o nh­îc chuyÕt /no", "Th¾ng nh©n gi¶ h÷u lùc, tù th¾ng gi¶ c­êng /L10_prise", "Häa hÒ, phóc chi së k×; häa hÒ, häa chi së phôc /no")
end;

function no()
	Talk(1,"","Xem ra ng­¬i ch¼ng cã chót khæ c«ng g×! Häc thuéc '§¹o §øc Kinh' råi h·y ®Õn!")
end;

function L10_prise()
	Talk(1,"","Xem ra ng­¬i ®· bá chót c«ng phu luyÖn tËp! Giái l¾m!")
	SetRank(8)
	SetTask(5, 20*256)
--	AddMagic(152)
--	AddMagic(151)
	add_wd(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("VÒ Tö Tiªu ®¹i ®iÖn, tr¶ lêi chİnh x¸c 3 c©u hái cña ch­ëng m«n, hoµn thµnh nhiÖm vô §¹o §øc kinh. Trë thµnh Nhµn T¶n ®¹o nh©n. ")
	Msg2Player("Chóc mõng B¹n! §· trë thµnh Nhµn T¶n §¹o Nh©n! Häc ®­îc Vâ §ang QuyÒn Ph¸p, Vâ §ang KiÕm Ph¸p. ")
end

----------------------- 40¼¶ÈÎÎñ -----------------------
function L40_prise()
	DelItem(164)
	SetRank(11)
	SetTask(5, 50*256)
--	AddMagic(160)
	add_wd(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! Trë thµnh NhËp Quan §¹o Nh©n! Häc ®­îc vâ c«ng Thª V©n Tung cña Vâ §ang ph¸i. ")
	AddNote("§Õn Tö Tiªu ®¹i ®iÖn, giao th­ cña NhuËn N­¬ng cho §¹o NhÊt Ch©n Nh©n, hoµn thµnh nhiÖm vô. Trë thµnh NhËp Quan ®¹o nh©n. ")
end;

------------------------- ³öÊ¦ÈÎÎñ -------------------------
function L60_get_yes()
Say("Ng­¬i ph¶i më 3 b¶o r­¬ng trªn<color=Red>Th¸i Tö Nham<color>phİa sau<color=Red>hËu s¬n<color>, lÊy ®­îc<color=Red>3 bé b¶o vËt<color>bªn trong, míi cã thÓ xuÊt s­ ®­îc!", 0);
SetTask(5, 60*256+20)	
AddNote("GÆp §¹o NhÊt Ch©n Nh©n t¹i Tö Tiªu ®¹i ®iÖn, nhËn nhiÖm vô xuÊt s­, ra v¸ch Th¸i Tö Nham sau nói lÊu 3 vËt quı trong 3 B¶o r­¬ng. ")
Msg2Player("GÆp §¹o NhÊt Ch©n Nh©n t¹i Tö Tiªu ®¹i ®iÖn, nhËn nhiÖm vô xuÊt s­, ra v¸ch Th¸i Tö Nham sau nói lÊu 3 vËt quı trong 3 B¶o r­¬ng. ")
end;

function L60_get_no()
	Talk(1,"","Còng tèt! VËy ng­¬i h·y ë l¹i Vâ §ang häc nghÖ thªm mét thêi gian!")
end;

function L60_prise()
	DelItem(69)
	DelItem(70)
	DelItem(71)
--	AddGlobalCountNews(GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğ¸÷Î»Ê¦µÜÊ¦ÃÃ³öÉ½´³µ´½­ºş£¡", 1)
	Msg2SubWorld("§Ö tö Vâ §ang ph¸i "..GetName().."XuÊt s­ thµnh c«ng, c¸o biÖt c¸c s­ ®Ö s­ muéi xuÊt s¬n hµnh hiÖp tr­îng nghÜa! ")
	SetRank(63)
	SetTask(5, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("VÒ Tö Tiªu ®¹i ®iÖn, lÊy 3 b¶n ch©n kinh giao cho ch­ëng m«n §¹o NhÊt Ch©n Nh©n, hoµn thµnh nhiÖm vô xÊt s­. Trë thµnh ng­êi gióp viÖc, thuËn lîi xuÊt s­. ")
	Msg2Player("Chóc mõng b¹n xuÊt s­! §­îc phong lµm HuyÒn Vò ThÇn ThŞ! Danh väng cña b¹n t¨ng thªm 120 ®iÓm! ")
	AddRepute(120)
end;

function no()
end
