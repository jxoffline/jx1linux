-- Ø¤°ï °ïÖ÷ºÎÈËÎÒ¡¡10¼¶ÈÎÎñ¡¢50¼¶ÈÎÎñ¡¢ÖØ·µÊ¦ÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-28)
-- Update£ºDan_Deng(2003-10-27)ÖØĞ´ÖØ·µÊ¦ÃÅÈÎÎñ£¬²¢ÖØĞÂÕûÀí½Å±¾

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
	G_TASK:OnMessage("C¸i Bang", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 6) then
		tbDailog:AddOptEntry("Häc kü n¨ng cÊp 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Muèn thØnh gi¸o viÖc kh¸c", oldentence)
	tbDailog:Show() 
end
	

function oldentence()
--	check_skill()
	local UTask_gb = GetTask(8)
	local nFactID = GetLastFactionNumber();

	if (UTask_gb == 70*256) and (GetFaction() == "gaibang") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_gb == 70*256) and (GetTask(4) >= 5*256) and (GetTask(4) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(4,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_gb == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(8,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (GetTask(4) == 70*256) and (GetTask(8) == 70*256) then			-- ×ªÃÅÅÉ´íÎóĞŞÕı
		SetTask(4,75*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_gb == 80*256 and nFactID == 6 and GetCamp() == 1 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("gaibang");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_gb == 70*256 and nFactID == 6 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(6)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_gb = GetTask(8)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),8) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","C¸i bang vµ Kim Quèc kh«ng ®éi trêi chung, h¬n n÷a Minh chñ cã lÖnh, t¹i h¹ kh«ng d¸m kh«ng nghe! Mêi ng­¬i vÒ chuyÓn lêi: C¸i Bang trªn d­íi sÏ nghe theo lÖnh cña ngµi.")
		Uworld40 = SetBit(GetTask(40),8,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 50*256+60) then		-- 50¼¶ÈÎÎñÍê³É
			Talk(1,"L50_prise","ChuyÖn nµy lµ nh­ vËy ®ã, ®Ö tö ®· ®em tÊm Trung Nguyªn ®Şa ®å giao cho Tr­¬ng §¹i Nh©n, nhê «ng ta tr×nh lªn Hoµng Th­îng.")
		elseif ((UTask_gb == 50*256+10) or (UTask_gb == 50*256+20)) and (HaveItem(199) == 0) then		--ÈÎÎñÖĞ£¬µÀ¾ß¶ªÁË
			Talk(2,"","Sao ng­¬i cÈu th¶ thÕ nµy! Ta dÆn ®i dÆn l¹i mÊy lÇn råi ph¶i cÈn thËn gi÷ bøc ®Şa ®å chø, sao cã thÓ ®¸nh r¬i ®­îc!","ë ®©y cßn mét b¶n, lÇn nµy ph¶i cÈn thËn h¬n ®ã, ®õng ®Ó x¶y ra chuyÖn n÷a!")
			AddEventItem(199)
		elseif ((UTask_gb == 50*256) and (GetLevel() >= 50)) then		--50¼¶ÈÎÎñÆô¶¯
			Say("Trong cÈm hép nµy lµ mét bøc tranh miªu t¶ Trung Nguyªn ®Şa ®å, cÇn ng­êi ®em ®Õn L©m An d©ng cho triÒu ®×nh. Ng­¬i cã ®ång ı ®i kh«ng?",2,"§ång ı!/L50_get_yes","§Ö tö cßn yÕu kĞm qu¸! E kh«ng ®­¬ng nçi viÖc nµy!/no")
		elseif (UTask_gb == 10*256+40) and (HaveItem(76) == 1) and (HaveItem(77) == 1) and (HaveItem(78) == 1) and (HaveItem(79) == 1) and (HaveItem(80) == 1) then
			L10_prise()
		elseif (UTask_gb == 10*256) and (GetLevel() >= 10) then		--10¼¶ÈÎÎñÆô¶¯
			Talk(3,"L10_get","Ng­êi sèng trªn ®êi, ®õng nªn thï o¸n lÉn nhau, ¨n uèng no say qua ngµy th× tèt biÕt mÊy!","Bang chñ! Cã ph¶i ngµi ®· uèng say råi ph¶i kh«ng?","Hahaha, cµng say ta cµng tØnh ®Êy! Ta lµ ai! Ai lµ ta! Hahaha!")
		elseif (UTask_gb == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			Say("KhiÕu hãa tö ta ®©y chİ t¹i bèn ph­¬ng ng­¬i ®õng suèt ngµy ngåi kh«ng ra ®Êy!",2,"D¹! §Ö tö muèn ra giang hå rÌn luyÖn thªm!/goff_yes","§Ö tö tù thÊy m×nh vâ nghÖ cßn kĞm, ch­a thÓ xuÊt s­!/no")
		elseif (UTask_gb > 10*256) and (UTask_gb < 20*256) then		--10¼¶ÈÎÎñ½øĞĞÊ±µÄÆÕÍ¨¶Ô»°
			Talk(1,"","Sao r­îu cßn ch­a mang ®Õn? LÑ ®i nµo, lÑ ®i!")
		else
			Talk(1,"","Tr­íc giê Th¸nh nh©n ®Òu phiÒn muén chØ cã nh­ ta ®©y míi vui vÎ th«i.")
		end
--	elseif (UTask_gb == 5*256+20) then			-- ×ªÃÅÅÉÍê³É
--		Talk(1,"defection_complete","ºÎÈËÎÒ£ººÜºÃ£¬Æú°µÍ¶Ã÷¸üÊÇ´óÖÇ´óÓÂ¡£µ½¿¹½ğÇ°ÏßÉÏÈ¥Ö¤Ã÷ÄãµÄ³àµ¨ÖÒĞÄ°É£¡")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_gb == 70*256) and ((GetTask(4) < 5*256) or (GetTask(4) == 75*256)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(3,"return_sele","KhiÕu hãa tö bªn ngoµi chŞu nhiÒu lêi ®µm tiÕu qu¸!","§­¬ng nhiªn, cho c¬m ng­¬i ¨n ph¶i cã chót g× ®ã chø, chuyÖn ®­¬ng nhiªn th«i, haha!","Th­êng kh«ng cho c¬m ¨n cßn b¾t chóng t«i ra ®Ó trót giËn n÷a ®Êy!")
	elseif (GetCamp() == 4) and ((UTask_gb == 70*256+10) or (UTask_gb == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("5 v¹n l­îng ®· chuÈn bŞ xong ch­a vËy?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
--	elseif (GetTask(4) == 70*256+10) and (HaveMagic(128) >= 0) then		-- ÌìÈÌÖØ·µÃÅÅÉ£¬ÊÕ»Ø¿ºÁúÓĞ»Ú
--		Say("ºÎÈËÎÒ£º±¾°ïÓë½ğ¹úÊÄ²»Á½Á¢£¬Äã¾¹Ïë±³Æú±¾½ÌÍ¶¿¿½ğ¹ú£¿",2,"ÊôÏÂĞÄÒâÒÑ¾ö/defection_yes","¶Ô²»Æğ£¬ÊôÏÂÖª´íÁË/no")
	else
		Talk(1,"","B¶ Töu §­¬ng Ca, Nh©n Sinh Kû Hµ.")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()		-- Ä¿Ç°Ã»ÓĞÍæ¼Ò±ä¶¯ĞŞ¸ÄĞèÇó£¬Ã»ÓĞ60¼¶¼¼ÄÜ
	x = 0
	skillID = 121					-- 
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ÈôÓĞ¼¼ÄÜ·¢Éú±ä»¯£¬ÔòÌßÏÂÏß£¬·ñÔò·µ»Ø¼ÌĞøÁ÷³Ì
		Say("Vi s­ nay ph¶i bÕ quan ®Ó suy nghÜ, nay ®em vâ nghÖ tuyÖt häc bæn gi¸o truyÒn cho ng­¬i, häc xong nªn nghÜ ng¬i mét l¸t, tr¸nh viÖc tæn th­¬ng kinh m¹ch.",1,"§a t¹ s­ phô /KickOutSelf")
	else
		return
	end
end

--------------------- ×ªÃÅÅÉÏà¹Ø ------------------------
function defection_complete()
	SetRevPos(115,53)		  			--µÈ´ıÌá¹©ÖØÉúµã
	SetTask(8, 10*256)				-- Ö±½ÓÈëÃÅ
	SetFaction("gaibang")       			--Íæ¼Ò¼ÓÈëÃÅÅÉ
	SetCamp(1)
	SetCurCamp(1)
	SetRank(37)
	AddMagic(117)
	Msg2Player("Hoan nghªnh b¹n gia nhËp C¸i bang,trë thµnh ®Ö tö kh«ng tói!")
	Msg2Player("Häc ®­îc KiÕn Nh©n ThÇn Thñ, Diªn M«n Th¸c B¸t")
	AddNote("Gia  nhËp C¸i bang, trë thµnh §Ö tö kh«ng tói! Häc ®­îc KiÕn Nh©n ThÇn Thñ, Diªn M«n Th¸c B¸t")
	Msg2Faction("gaibang",GetName().."Cã thªm ng­êi cña Thiªn NhÉn gia nhËp, lùc l­îng C¸i bang ®· m¹nh thªm",GetName())
end

--------------- ÖØ·µÊ¦ÃÅÏà¹Ø ------------------------
function goff_yes()
	Talk(1,"","Tèt! nhí ®Êy gÆp chuyÖn bÊt b×nh, ph¶i ra tay nghÜa hiÖp ®ã!")
	SetTask(8,70*256)
	AddNote("Rêi khái C¸i bang, tiÕp tôc hµnh tÈu giang hå ")
	Msg2Player("B¹n rêi khái C¸i bang, tiÕp tôc hµnh tÈu giang hå ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("Haha, mau trë vÒ bæn bang ®i, mäi ng­êi cã thÓ cïng nhau ¨n c¬m, kh«ng ai trót giËn ai ®©u mµ lo.",2,"§a t¹ Bang chñ!/return_yes","Th«i kh«ng cÇn ®©u!/return_no")
end;

function return_yes()
	Talk(2,"","ChØ t¹i bæn bang chi c¸c kho¶n lín, th­êng kh«ng ®ñ xoay së, nÕu ng­¬i muèn trïng ph¶i bæn ph¸i th× ph¶i quyªn gãp 50000 l­îng.","§­îc! §Ö tö chuÈn bŞ tiÒn ngay ®©y.")
	SetTask(8,70*256+20)
	AddNote("Giao nép 50000 l­îng, trïng ph¶n C¸i bang.")
	Msg2Player("Giao nép 50000 l­îng, trïng ph¶n C¸i bang.")
end;

function return_no()
	Talk(1,"","S­ phô, con c¶m thÊy sèng trªn ®êi ph¶i gÇy dùng sù nghiÖp, kh«ng thÓ ¨n b¸m ng­êi kh¸c qua ngµy ®­îc. V× vËy cßn tİnh kh«ng quay l¹i ®©u.")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Haha, kh«ng ngê ng­¬i chuÈn bŞ ®ñ sè ng©n l­îng mµ ta nãi, tèt l¾m! Ta lÊy th©n phËn bang chñ cho ng­¬i trïng ph¶n bæn ph¸i ®ång thêi ®¶m nhiÖm chøc Cöu §¹i Tr­ëng L·o cña bæn gi¸o.")
		Pay(50000)
		SetTask(8,80*256)
		SetFaction("gaibang")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(78)
--		if (HaveMagic(130) == -1) then
--			AddMagic(360)
--			AddMagic(130)
		add_gb(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n häc ®­îc tuyÖt häc trÊn ph¸i Tóy §iÖp Cuång Vò, vâ c«ng Tiªu Diªu C«ng")
--		end
		AddNote("§· ®­îc phĞp trë l¹i C¸i bang")
		Msg2Player(GetName().."Trïng ph¶n C¸i bang, ®­îc phong lµ Cöu §¹i Tr­ëng L·o")
	else
		Talk(2,"","§õng nghÜ ta ®· say, ng©n l­îng th× ta nh×n râ l¾m, ®©y kh«ng ®ñ 5 v¹n l­îng mµ!","Xin lçi! Lµ t«i ®Õm nhÇm, ®Ó t«i kiÓm tra l¹i.")
	end
end;

function return_uncompleted()
	Talk(1,"","5 v¹n l­îng kh«ng ph¶i sè nhá, ng­¬i tõ tõ ®i kh«ng sao ®©u!")
end;

---------------- ÃÅÅÉÈÎÎñÏà¹Ø -----------------------
function L10_get()
	Say("§i nhanh mua gióp ta 5 lo¹i danh töu Giang Nam ®Õn ®©y gåm: HuÖ TuyÒn Töu, Kim L¨ng Xu©n, B¸ch Hoa Nh­ìng, Kinh Hoa Lé, Song C©u §¹i Khóc.",2,"§i mua r­îu/L10_get_yes","Gi¶ vê nh­ kh«ng nghe/no")
end;

function L10_get_yes()
	SetTask(8,10*256+10)
	AddNote("TiÕp nhËn nhŞªm vô cÊp 10, ®i mua 5 lo¹i r­îu HuÖ TuyÒn Töu, Kim L¨ng Xu©n, B¸ch Hoa Nh­ìng, Kinh Hoa Lé, Song C©u §¹i Khóc vÒ cho Bang chñ.")
	Msg2Player("TiÕp nhËn nhŞªm vô cÊp 10, ®i mua 5 lo¹i r­îu HuÖ TuyÒn Töu, Kim L¨ng Xu©n, B¸ch Hoa Nh­ìng, Kinh Hoa Lé, Song C©u §¹i Khóc vÒ cho Bang chñ.")
end;

function L10_prise()
	Talk(2,"","Bang chñ, r­îu t«i ®· mua vÒ råi!","Tèt! Huynh ®Ö l¹i uèng chung ®i nµo?")
	DelItem(76)
	DelItem(77)
	DelItem(78)
	DelItem(79)
	DelItem(80)
	SetTask(8,20*256)
	SetRank(38)
--	AddMagic(116)
--	AddMagic(115)
	add_gb(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("Mua ®ñ 5 l¹i r­îu, hoµn thµnh nhiÖm vô cÊp 10, trë thµnh ChÊp §¹i ®Ö tö ")
	Msg2Player("Chóc mõng b¹n! §­îc phong lµ ChÊp §¹i ®Ö tö! Häc ®­îc C¸i bang Ch­ëng ph¸p, C¸i bang Bæng ph¸p.")
end;

function L50_get_yes()
	Talk(1,"","TÊm Trung Nguyªn ®Şa ®å nµy quan hÖ träng ®¹i, cÈn thËn ®õng ®Ó lät vµo tay ng­êi Kim ®Êy!")
	SetTask(8,50*256+10)
	AddEventItem(199)
	AddNote("TiÕp nhËn nhiÖm vô cÊp 50, hiÕn tÆng bøc §Şa ®å Trung nguyªn cho triÒu ®×nh.")
	Msg2Player("TiÕp nhËn nhiÖm vô cÊp 50, hiÕn tÆng bøc §Şa ®å Trung nguyªn cho triÒu ®×nh.")
end;

function L50_prise()
	Talk(1,"","Bang chñ: Ng­¬i lµm tèt l¾m, mong r»ng viÖc lµm lÇn nµy gióp cho sù nghiÖp kh¸ng Kim, ®Ó khái bá c«ng kh«ng v« İch!")
	SetTask(8,60*256)
	SetRank(42)
--	AddMagic(128)
--	AddMagic(125)
	add_gb(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §­îc phong lµ §¹i Long ®Çu! Häc ®­îc vâ c«ng Kh¸ng Long H÷u Hèi, Bæng §¶ ¸c CÈu.")
	AddNote("Giao thµnh c«ng bøc §Şa ®å Trung nguyªn cho Tr­¬ng TuÊn, hoµn thµnh nhiÖm vô cÊp 50. Trë thµnh §¹i Long ®Çu.")
end;

function no()
end;
