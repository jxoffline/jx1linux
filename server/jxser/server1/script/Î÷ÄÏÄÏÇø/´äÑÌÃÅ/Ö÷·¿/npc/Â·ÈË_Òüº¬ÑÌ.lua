-- ´äÑÌÃÅ ÕÆÃÅÒüº¬ÑÌ 10¼¶ÈÎÎñ¡¢50¼¶ÈÎÎñ¡¢³öÊ¦ÈÎÎñ¡¢ÖØ·µÊ¦ÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-25)
-- Update: Dan_Deng(2003-09-24)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- Update£ºDan_Deng(2003-10-27)ÖØĞ´ÖØ·µÊ¦ÃÅÈÎÎñ£¬²¢ÖØĞÂÕûÀí½Å±¾

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ´øÒÕÍ¶Ê¦

Include("\\script\\item\\skillbook.lua")

function main()
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 5) then
		Describe("T×m ta cã viÖc g×?", 2,
			"Häc kü n¨ng cÊp 120./lvl120skill_learn",
			"Muèn thØnh gi¸o viÖc kh¸c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_cy = GetTask(6)
	local nFactID = GetLastFactionNumber();

	if (UTask_cy == 70*256) and (GetFaction() == "cuiyan") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_cy == 70*256) and (GetTask(1) >= 5*256) and (GetTask(1) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(1,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_cy == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(6,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (GetTask(1) == 70*256) and (GetTask(6) == 70*256) then			-- ×ªÃÅÅÉ´íÎóĞŞÕı
		SetTask(1,75*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_cy == 80*256 and nFactID == 5 and GetCamp() == 3 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("cuiyan");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_cy == 70*256 and nFactID == 5 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(5)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_cy = GetTask(6)
	local Uworld51 = GetTask(51)
	local Uworld126 = GetTask(126)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),6) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"","§éc C« minh chñ ®· cã lÖnh, ta ®©u d¸m kh«ng tu©n! Nh­ng bæn m«n chØ toµn lµ n÷ nhi yÕu ®uèi chØ sî viÖc kh«ng thµnh, xin håi b¸o l¹i víi §éc C« minh chñ lµ bæn m«n nhÊt ®Şnh sÏ ñng hé c¸c vŞ anh hïng, chóc c¸c vŞ kú khai ®¾c th¾ng!")
		Uworld40 = SetBit(GetTask(40),6,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 10) then			-- Ï´ÇåÔ©ÇüÈÎÎñ½øĞĞÖĞ
		Talk(5,"Uworld51_20","§­êng NhÊt TrÇn b¶o ta ®em khÈu tİn, cha «ng ta kh«ng biÕt v× sao ®ét nhiªn ph¶n ®èi h«n sù cña 2 ng­êi, h«n sù cã chót khã kh¨n, nh­ng c« ®õng qu¸ lo l¾ng.","NhÊt TrÇn… ","¤i...®õng khãc n÷a! Sù viÖc kh«ng nhÊt ®Şnh nh­ vËy ®©u, chØ cÇn chóng ta thËt t©m th× nhÊt ®Şnh sÏ xoay chuyÓn ®­îc t×nh thÕ.","Ta kh«ng khãc! Ta chØ lµ tøc giËn ta vµ NhÊt TrÇn ®· tr¶i qua nhiÒu gian khæ nh­ vËy cuèi cïng còng ®Õn ®­îc víi nhau, t¹i sao ng­êi nhµ huynh Êy l¹i ph¶n ®èi?","Kh«ng ph¶i nh­ vËy! §­êng NhÊt TrÇn rÊt yªu c«, nhÊt ®Şnh sÏ kh«ng ®øng nh×n, ta nhÊt ®Şnh sÏ hái huynh Êy cho râ ngän ngµnh.")
	elseif (Uworld51 == 100) then			-- Ï´ÇåÔ©ÇüÈÎÎñÍê³É
		Talk(3,"Uworld51_prise"," Th× ra vËy! Ng­¬i v× NhÊt TrÇn vµ ta mµ khæ së bÊy l©u, kh«ng biÕt lÊy g× b¸o ®¸p, xin h·y nhËn lÊy!","§©y lµ c¸i g×?","C¸i nµy lµ tiªn s­ ®Ó l¹i cho ta, cã thÓ th­ g©n ho¹t m¹ch, cã hiÖu qu¶ t¨ng c«ng lùc nhÊt thêi!")
	elseif (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- ÈÎÎñÏà¹ØÒÔ¼°ÃÅÅÉ¶Ô»°
		if (UTask_cy == 10*256+10) and (HaveItem(0) == 1) then		-- 10¼¶ÈÎÎñÍê³É
			Talk(2,"L10_prise","Ch­ëng m«n, ®Ö tö ®· gióp ng­êi t×m l¹i Thóy Vò Tr©m ®· mÊt! ","Tèt qu¸! Ng­¬i ®· t×m l¹i ®­îc råi.")
		elseif (UTask_cy == 10*256) and (GetLevel() >= 10) then		--10¼¶ÈÎÎñÆô¶¯
			Say("ThËt ®au lßng! H«m qua khi ®i d¹o ë khu rõng nhá phİa §«ng Nam ®· ®¸nh r¬i c©y Thóy Vò tr©m mµ ta yªu quİ nhÊt!",2,"Ta gióp ng­¬i t×m l¹i /L10_get_yes","Gi¶ vê nh­ kh«ng nghe/no")
		elseif (UTask_cy == 50*256+50) then		--Íê³É50¼¶ÈÎÎñ
			Talk(1,"L50_prise","§Ö tö ®· lµm trßn sø mÖnh ®· gióp Sïng Th¸nh Tù t×m vÒ ®­îc Vò §ång Quan ¢m. Ph­¬ng tr­îng ®¹i s­ nhê ®Ö tö chuyÓn lêi c¶m ¬n ®Õn S­ phô.")
		elseif (UTask_cy == 50*256) and (GetLevel() >= 50) then			--50¼¶ÈÎÎñÆô¶¯
			Say("Ph­¬ng tr­îng H­ Viªn ë Sïng Th¸nh Tù §¹i Lı lµ b¹n th©n cña ta. Ph­¬ng tr­îng míi ph¸i ng­êi ®Õn nãi cã mét bän trém ®Õn lÊy ®i Vò §ång Quan ¢m mét trong nh÷ng 'Sïng Th¸nh Ngò B¶o', bŞ ph¸t hiÖn ®· ch¹y vµo Thiªn TÇm Th¸p. Tªn trém vâ c«ng rÊt cao c­êng, c¸c t¨ng kh«ng ai ®Şch næi, nªn ph¸i ng­êi ®Õn cÇu cøu bæn m«n, ng­¬i cã ®ång ı ®Õn Sïng Th¸nh Tù gióp ®ì b¾t tªn trém kh«ng?",2,"Kh«ng vÊn ®Ò, ta sÏ ®i ®Õn Sïng Th¸nh tù /L50_get_yes","Vâ c«ng ®Ö tö thÊp hÌn e r»ng kh«ng lµm ®­îc /no")
		elseif (UTask_cy == 60*256+30) then							--³öÊ¦ÈÎÎñÍê³É
			L60_prise()
		elseif (UTask_cy == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			check_skill()
		elseif (UTask_cy >10*256) and (UTask_cy < 20*256) then		-- 10¼¶ÈÎÎñÖĞ
			Talk(1,"","Ch­a t×m ®­îc Thóy Vò Tr©m sao?")
		elseif (UTask_cy > 50*256) and (UTask_cy < 60*256) then		-- 50¼¶ÈÎÎñÖĞ
			Talk(1,"","B¾t ®­îc bän trém ch­a?")
		elseif (UTask_cy >= 60*256) then		-- Íê³É50¼¶ÈÎÎñºóµÄ³£¹æ¶Ô»°
			Talk(1,"","ChuyÖn cña Sïng Th¸nh Tù ng­¬i quyÕt ®Şnh rÊt ®óng, tr­íc ®©y kh«ng l©u Ph­¬ng tr­îng H­ Viªn cã ®Õn th¨m vµ cã hái th¨m ®Õn ng­¬i.")
		else		-- ÃÅÅÉÄÚÆäËü×´Ì¬ÏÂ³£¹æ¶Ô»°
			Talk(1,"","Vâ c«ng cña ng­¬i tiÕn bé rÊt nhanh, nh­ng còng ®õng v× thÕ mµ tù m·n, cÇn ph¶i tËp luyÖn nhiÒu míi cã thÓ thµnh c«ng.")
		end
	elseif (Uworld126 == 20) then			-- 90¼¶¼¼ÄÜÈÎÎñ
		Talk(5,"Uworld126_talk","Do·n c« n­¬ng!","C¸c h¹ cã chuyÖn g×?","T¹i h¹ nhËn lêi nhê ®­îc sù nhê v¶ cña c«ng tö §oµn T­ Thµmh, muèn t¸c hîp hai ng­êi l¹i, nh­ng LÖ c« n­¬ng qu¸ cè chÊp."," ¤i! Thu Thñy qu¸ cè chÊp. N¨m ®ã §oµn c«ng tö lµ mét nh©n tµi, ®èi víi c« ta thËt lßng thËt ı, ®¸ng tiÕc trong gia ®×nh c«ng tö l¹i lµ ®éc t«n, lµm sao cã thÓ gia nhËp vµo Thuı Yªn m«n ®­îc chø. §Õn nay muèn quay trë l¹i víi nhau th× thËt lµ khã, ta khuyªn kh«ng ®­îc c« n­¬ng Êy, hy väng ng­¬i sÏ t×m ra ®­îc c¸ch.","Th× ra lµ thÕ! T¹i h¹ sÏ cè g¾ng.")
	elseif (Uworld126 == 80) and (GetFaction() ~= "cuiyan") then
		Talk(5,"Uworld126_finish"," Do·n c« n­¬ng! Sù viÖc thµnh c«ng råi! ","å?","Sù viÖc lµ nh­ vÇy… nh­ vÇy… ","Tªn nµy thiÖt lµ! Nh­ng hä ®· gÆp nhau, duyªn phËn ch¾c còng sÏ quay vÒ, thËt kh«ng biÕt ph¶i c¸m ¬n ng­¬i nh­ thÕ nµo.","T¹i h¹ nghÜ ®­îc lµm b¹n víi c¸c c« n­¬ng ®· rÊt sung s­íng råi, hµ tÊt ph¶i c¶m t¹.")
	elseif (Uworld126 > 20) and (Uworld126 < 70) then
		Talk(1,"","TiÓu LÖ tİnh t×nh cè chÊp, c« Êy kh«ng chŞu ®­îc nh÷ng chuyÖn cña bæn m«n, c« Êy cho r»ng kh«ng cã viÖc g× tèt ®Ñp c¶, nªn ph¶i lµm phiÒn c¸c h¹ råi.")
--	elseif (UTask_cy == 5*256+20) then			-- ×ªÃÅÅÉÍê³É
--		Talk(1,"defection_complete","Òüº¬ÑÌ£ºÄãÌì¸³¹ıÈË£¬ÏàĞÅºÜ¿ì¾ÍÄÜ³ÉÎª±¾ÃÅ¶°ÁºÁË£¬²»±ØÔÚÒâÏÖÔÚÔİÊ±Ê§È¥Îä¹¦¡£ÄãÏÈÈ¥Óë±¾ÃÅ¸÷Î»½ãÃÃÊìÏ¤Ò»ÏÂ£¬ÈÃÎÒÃÇËùÓĞÈË¶¼¿ì¿ìÀÖÀÖµØÉú»î°É¡£")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_cy == 70*256) and ((GetTask(1) < 5*256) or (GetTask(1) == 75*256)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(2,"return_sele","Cã lêi ®ån r»ng gÇn ®©y ng­¬i giÕt kh«ng İt bän c­êng ®¹o, nªn rÊt cã tiÕng t¨m trong giang hå.","Nh­ng ta vÉn nhí c¸i kh«ng khİ Êm ¸p trong m«n ph¸i. Th­a s­ phô ta cã thÓ quay vÒ Thóy Yªn m«n ®­îc kh«ng?")
	elseif (GetCamp() == 4) and ((UTask_cy == 70*256+10) or (UTask_cy == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("§· chuÈn bŞ xong 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
--	elseif (GetTask(1) == 70*256+10) and (HaveMagic(111) >= 0) then		-- ¶ëáÒÅÉÖØ·µÃÅÅÉ£¬ÊÕ»Ø±Ìº£³±Éú
--		Say("Òüº¬ÑÌ£ºÉØ¹âÒ»È¥²»ÔÙÀ´£¬ÄãÕæµÄÖ´ÒâÒª¶İÈë¿ÕÃÅ£¿",2,"ºì³¾ÊµÎŞ¿É¾ìÁµ£¬ÇëÕÆÃÅÈÃÎÒÈ¥°É/defection_yes","ÎÒÔÙ¿¼ÂÇ¿¼ÂÇ/no")
	else
		Talk(1,"","NÕu bæn m«n vµ §­êng m«n liªn minh ®­¬ng nhiªn lµ tèt, chØ lµ. ")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
--	if (HaveMagic(114) == -1) then
--		AddMagic(114)					-- ±ù¹ÇÑ©ĞÄ
--		Msg2Player("ÄãÑ§»áÁË¡°±ù¹ÇÑ©ĞÄ¡±")
--		Say("Òüº¬ÑÌ£ºÎªÊ¦Õâ´Î±Õ¹Ø¿àË¼ÊıÈÕ£¬ĞÂ´´ÁËÒ»ÕĞ¡°±ù¹ÇÑ©ĞÄ¡±£¬ÏÖÔÚ´«ÊÚÓÚÄã¡£ÄãÑ§ÍêºóÏÈ»ØÈ¥ºÃºÃĞİÏ¢Ò»·¬£¬ÒÔÃâÉËµ½¾­Âö¡£",1,"¶àĞ»Ê¦¸¸/KickOutSelf")
--	else
		Say("L¹i nhí thÕ giíi bªn ngoµi sao?",2,"Ph¶i, xin ch­ëng m«n ©n chuÈn /goff_yes","Kh«ng, ta tù thÊy c«ng phutËp luyÖn vÉn ch­a ®ñ. /no")
--	end
end
--------------------- ×ªÃÅÅÉÏà¹Ø ------------------------
function defection_complete()
	Msg2Player("Hoan nghªnh ng­¬i gia nhËp Thóy Yªn m«n, trë thµnh Hoa T× ")
	SetRevPos(154,61)		  				-- ÖØÉúµã
	SetTask(6,10*256)						-- ÈëÃÅ
	SetFaction("cuiyan")      			--Íæ¼Ò¼ÓÈëÃÅÅÉ
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	AddMagic(99)
	Msg2Player("Häc ®­îc Phong Hoa TuyÕt NguyÖt ")
	AddNote("Gia nhËp Thóy Yªn m«n, trë thµnh Hoa T×, häc ®­îc Phong Hoa TuyÕt NguyÖt ")
	Msg2Faction("cuiyan",GetName().." tõ Nga Mi ®Õn gia nhËp Thóy Yªn m«n. Lùc l­îng bæn ph¸i ®· m¹nh l¹i cµng m¹nh!",GetName())
end

-------------------------- ÖØ·µÃÅÅÉÏà¹Ø ------------------------
function goff_yes()
	Talk(1,"","Cã mét sè viÖc, cuèi chØ cã b¶n th©n ta tr·i qua míi hiÓu râ. Ng­¬i ®i ®Ó cã kinh nghiÖm còng tèt.")
	SetCamp(4)
	SetCurCamp(4)
	SetTask(6,70*256)
	SetFaction("")
	AddNote("Rêi khái Thóy Yªn m«n, l¹i mét lÇn n÷a ra giang hå. ")
	Msg2Player("Rêi khái Thóy Yªn m«n, l¹i mét lÇn n÷a ra giang hå. ")
end

function return_sele()
	Say("§­¬ng nhiªn lµ ®­îc! Bæn m«n kh«ng cã ng©n khè cè ®Şnh, ng­¬i chØ cÇn 5 n¨m v¹n l­îng b¹c th× cã thÓ trë vÒ m«n ph¸i.",2,"ThÕ th× tèt qu¸! /return_yes","§Ó ta ®i lÊy tiÒn, råi sau ®ã sÏ nãi tiÕp. /return_no")
end;

function return_yes()
	Talk(1,"","§­îc! §Ö tö ®i lÊy 5 v¹n l­îng! ")
	SetTask(6,70*256+20)
	AddNote("Gãp 50000 l­îng b¹c cho Thóy Yªn m«n th× cã thÓ quay vÒ m«n ph¸i. ")
	Msg2Player("Gãp 50000 l­îng b¹c cho Thóy Yªn m«n th× cã thÓ quay vÒ m«n ph¸i. ")
end;

function return_no()
	Talk(1,"","5 v¹n l­îng kh«ng ph¶i lµ İt, ng­¬i h·y nghÜ kü ®i.")
end;

function return_complete()
	if (GetCash() >= 50000) then
		Talk(1,"","§­îc! 5 v¹n l­îng ®· nhËn ®ñ. Ta phong ng­¬i lµ Hoa ThÇn cña bæn ph¸i, ®ång thêi truyÒn cho ng­¬i häc vâ c«ng tuyÖt kü bæn m«n ' Bİch H¶i TriÒu Sinh', hi väng ng­¬i cã thÓ tiÕp tôc nç lùc.")
		Pay(50000)
		SetTask(6,80*256)
		SetFaction("cuiyan")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(67)
--		if (HaveMagic(114) == -1) then
--			AddMagic(108)
--			AddMagic(111)
--			AddMagic(114)
		add_cy(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("Ng­¬i häc ®­îc tuyÖt kü trÊn ph¸i cña Thóy Yªn M«n lµ B¨ng Cèt TuyÕt T©m, vâ c«ng Môc D· L­u Tinh, Bİch H¶i TriÒu Sinh ")
--		end
		Msg2Player(GetName().."<#>Quay l¹i Thóy Yªn m«n, ®­îc phong lµ Hoa ThÇn ")
		AddNote("§· quay vÒ Thóy Yªn m«n, ®øng trong hµng ngò. ")
	else
		Talk(1,"","Ng©n l­îng ng­¬i mang h×nh nh­ kh«ng ®ñ, kh¶o nghiÖm l¹i xem.")
	end
end;

---------------------- ÃÅÅÉÈÎÎñ ---------------------------
function L10_get_yes()
	Talk(2,"","HiÕm thÊy ng­¬i cã lßng nh­ thÕ nµy, vËy th× lµm phiÒn ng­¬i.","S­ phô qu¸ kh¸ch s¸o råi!")
	SetTask(6,10*256+10)
	AddNote("TiÕp nhËn nhiÖm vô cÊp 10: §Õn khu rõng nhá ë phİa ®«ng nam t×m Thóy Vò tr©m ")
	Msg2Player("TiÕp nhËn nhiÖm vô cÊp 10: §Õn khu rõng nhá ë phİa ®«ng nam t×m Thóy Vò tr©m ")
end;

function L10_prise()
	Talk(1,"","§­îc råi! Ng­¬i thËt cã tµi! Ta sÏ th¨ng cho ng­¬i lªn ®Ö tö 10 cÊp.")
	DelItem(0)
	SetTask(6,20*256)
	SetRank(32)
--	AddMagic(95)
--	AddMagic(97)
	add_cy(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("Giao Thóy Vò tr©m, quay vÒ Do·n Hµm Yªn phôc mÖnh, hoµn thµnh nhiÖm vô t×m tr©m. Trë thµnh Tam PhÈm Hoa Sø ")
	Msg2Player("Chóc mõng b¹n ®· ®­îc phong thµnh Tam PhÈm Hoa Sö cña Thóy Yªn m«n, häc ®­îc vâ c«ng Thóy Yªn ®ao ph¸p, Thóy Yªn song ®ao. ")
end;

function L50_get_yes()
	Talk(1,"","Mäi viÖc ph¶i cÈn thËn.")
	SetTask(6,50*256+10)
	AddNote("TiÕp nhËn nhiÖm vô cÊp 50: V× H­ Viªn ph­¬ng tr­îng cña Sïng Th¸nh Tù ®o¹t l¹i Vò §ång Quan ¢m ")
	Msg2Player("TiÕp nhËn nhiÖm vô cÊp 50: V× H­ Viªn ph­¬ng tr­îng cña Sïng Th¸nh Tù ®o¹t l¹i Vò §ång Quan ¢m ")
end;

function L50_prise()
	Talk(1,"","RÊt tèt! Ng­¬i qu¶ trİ dòng song toµn, ®· lµm kh«ng İt chuyÖn cho Bæn m«n, thËt kh«ng hæ danh lµ trô cét cña bæn m«n! ")
	SetTask(6,60*256)
	SetRank(36)
--	AddMagic(109)
	add_cy(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· ®­îc phong lµ Hoa Tinh! Häc ®­îc vâ c«ng TuyÕt ¶nh ")
	AddNote("§o¹t l¹i Vò §ång Quan ¢m, hoµn thµnh nhiÖm vô cÊp 50, ®­îc phong lµ Hoa Tinh ")
end;

function L60_prise()
	Msg2Player("B¹n giao th­ cho Do·n Hµm Yªn, vµ kÓ l¹i toµn bé sù viÖc cho nµng nghe. ")
	Talk(2,"","LÇn nµy ng­¬i ®· gióp gi¶i quyÕt chuyÖn Bæn m«n, lËp ®­îc ®¹i c«ng. Chóc mõng ng­¬i! Ng­¬i cã thÓ xuÊt s­! ","§a t¹ Ch­ëng m«n! ")
	SetTask(6,70*256)
	SetRank(35)
	SetFaction("") 		   					--ÍË³öÃÅÅÉ
	SetCamp(4)
	SetCurCamp(4)
	DelItem(235)
	AddNote("B¹n giao th­ cho Do·n Hµm Yªn, vµ kÓ l¹i toµn bé sù viÖc cho nµng nghe, hoµn thµnh nhiÖm vô xÊt s­, ®­îc phong lµ Hoa Tiªn ")
	Msg2Player("Chóc mõng b¹n ®­îc lµm Hoa Tiªn, ng­¬i ®· cã thÓ xuÊt s­ ")
end;

----------------------- ÊÀ½çÈÎÎñ --------------------------
function Uworld51_20()
	SetTask(51,20)
	Msg2Player("§iÒu tra §­êng NhÊt TrÇn rèt cuéc ®· x¶y ra chuyÖn g×, cã c¸ch g× quay trë vÒ kh«ng? ")
end

function Uworld51_prise()
	SetTask(51,255)
	AddMagicPoint(1)
	Task86_2 = GetByte(GetTask(86),2) + 1
	if (Task86_2 > 255) then Task86_2 = 255 end
	Task86 = SetByte(GetTask(86),2,Task86_2)
	SetTask(86,Task86)			-- ¼ÇÂ¼ÈÎÎñµÃ¼¼ÄÜµã×ÜÊı
	Msg2Player("Do·n Hµm Yªn v× muèn b¸o ®¸p mµ ®· lÊy Kim ®¬n cña s­ phô ®em tÆng cho ng­¬i. C«ng phu cña ng­¬i ®· t¨ng lªn thªm 1 ®iÓm ")
	Msg2Player("Hoµn thµnh nhiÖm vô röa s¹ch nçi oan ")
	AddNote("Hoµn thµnh nhiÖm vô röa s¹ch nçi oan ")
end

function no()
end;

function Uworld126_talk()
	SetTask(126,30)
	Msg2Player("Do·n Hµm Yªn còng kh«ng cã c¸ch nµo tèt h¬n. B¹n quyÕt ®Şnh quay vÒ gÆp l¹i LÖ Thu Thñy ")
	AddNote("Do·n Hµm Yªn còng kh«ng cã c¸ch nµo tèt h¬n. B¹n quyÕt ®Şnh quay vÒ gÆp l¹i LÖ Thu Thñy ")
end

function Uworld126_finish()
	if (GetTask(6) >= 70*256) and (GetTask(6) ~= 75*256) then
		Talk(3,"","Hµnh tÈu giang hå th­êng gÆp nhiÒu nguy hiÓm, ë ®©y Hµm Yªn cã quyÓn bİ kİp cña Thóy Yªn cã thÓ gióp İch cho ng­¬i. ","ThËt ng¹i qu¸!","Giang hå nhi n÷ kh«ng nªn c©u nÖ, h·y nhËn lÊy ®i!")
		if (HaveMagic(336) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(336,1)
		end
		if (HaveMagic(337) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(337,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Häc xong vâ c«ng B¨ng tung V« ¶nh, B¨ng T©m tiªn tö cña Thóy Yªn. ")
		SetTask(126,255)
	else
	   Talk(2,"","Cøu ng­êi kh«ng cÇn tr¶ ¬n, ®óng lµ nghÜa hiÖp! ","Do·n s­ phô ®· qu¸ khen!")
	   SetTask(126,245)								--»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
	add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
	AddRepute(add_repute)
	Msg2Player("<#>§· xãa bá ©n o¸n gi÷a LÖ Thu Thñy vµ §oµn T­ Thµnh, nhiÖm vô hoµn thµnh. Danh tiÕng cña ng­¬i ®· ®­îc t¨ng lªn "..add_repute.."<#>®iÓm.")
	AddNote("§· xo¸ bá ©n o¸n gi÷a LÖ Thu Thñy vµ §oµn T­ Thµnh. NhiÖm vô hoµn thµnh. ")
end
