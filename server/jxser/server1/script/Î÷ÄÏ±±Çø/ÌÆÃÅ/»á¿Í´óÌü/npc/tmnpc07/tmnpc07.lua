--description: ÌÆÃÅÌÆ³ğ 20¼¶ÈÎÎñ¡¢³öÊ¦ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-13)
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
				"TÆng b¸nh ngµy xu©n/#tbMasterGift:getGift('tangmen')",
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
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 2) then
		Describe("T×m ta cã viÖc g×?", 2,
			"Häc kü n¨ng cÊp 120./lvl120skill_learn",
			"Muèn thØnh gi¸o viÖc kh¸c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end
	local UTask_tm = GetTask(2);
	local nFactID = GetLastFactionNumber();
	
	if (UTask_tm == 70*256) and (GetFaction() == "tangmen") then			-- »ØÊ¦´íÎóĞŞÕı
		SetFaction("")
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tm == 70*256) and (GetTask(10) >= 5*256) and (GetTask(10) < 10*256) then		-- ÒÔÇ°½Ó¹ıÈëÃÅÈÎÎñµÄ
		SetTask(10,0)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tm == 80*256) and (GetCamp() == 4) then			-- »ØÊ¦´íÎóĞŞÕı
		SetTask(2,70*256)
		Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
		return
	elseif (UTask_tm == 80*256 and nFactID == 2 and GetCamp() == 3 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tangmen");
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	elseif (UTask_tm == 70*256 and nFactID == 2 and GetCamp() ~= 4 and GetFaction() == "Míi nhËp giang hå ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("HÖ thèng ph¸t hiÖn sai sãt, ®· kŞp thêi håi phuc!",0)
			return
		end
	end

	local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(2)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
	
	Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tm = GetTask(2);
	local Uworld51 = GetTask(51)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),2) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		if (GetSex() == 0) then
			Talk(1,"","§­êng M«n tæ s­ gi¸o huÊn ®Ö tö kh«ng ®­îc can dù chuyÖn ngoµi. §­êng Cõu ta kh«ng d¸m tr¸i lêi. Nhê c«ng tö ®©y chuyÓn lêi xin lçi ®Õn §éc c« Minh chñ.")
		else
			Talk(1,"","§­êng M«n tæ s­ gi¸o huÊn ®Ö tö kh«ng ®­îc can dù chuyÖn ngoµi. §­êng Cõu ta kh«ng d¸m tr¸i lêi. Nhê c«ng tö ®©y chuyÓn lêi xin lçi ®Õn §éc c« Minh chñ.")
		end
		Uworld40 = SetBit(GetTask(40),2,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 30) then				-- Ï´ÇåÔ©ÇüÈÎÎñ½øĞĞÖĞ
		Talk(4,"Uworld51_40","M«n chñ, t¹i h¹ nghe nãi ng­êi cã thµnh kiÕn víi c«ng tö NhÊt TrÇn. HiÖn giê h¾n ®ang bŞ ng­êi hiÓu lÇm.","§©y lµ chuyÖn cña §­êng gia, kh«ng liªn quan ®Õn ng­¬i!","M«n chñ, c«ng tö NhÊt TrÇn chİnh lµ con ruét cña «ng…..!","Hõ! TiÔn kh¸ch! ")
	elseif (Uworld51 == 80) and (HaveItem(377) == 1) then				-- Ï´ÇåÔ©ÇüÈÎÎñ£ºÒÑ¾­¶á»ØÃØóÅ
		Talk(8,"Uworld51_90","M«n chñ,chuyÖn ThiÕu L©m cao t¨ng gÆp n¹n ta ®· tra râ! Sau khi Thiªn NhÉn gi¸o ®o¹t ®­îc Bİ kiÕp cña bæn gi¸o,®· lĞn ¸m to¸n nh÷ng ThiÕu L©m cao thñ. Bİ kiÕp nµy do BÊt NhiÔm c«ng tö tiÕt lé ra ngoµi!","C¸i g×? Sao l¹i nh­ vËy ®­îc?","BÊt NhiÔm lo ng¹i NhÊt TrÇn lµ con tr­ëng, e r»ng t­¬ng lai cã thÓ sÏ giµnh lÊy ng«i vŞ Ch­ëng m«n. V× thÕ mµ h¾n th­êng liªn l¹c víi B¹ch c«ng tö mËt sø Kim Quèc, trém s¸ch cho Thiªn NhÉn gi¸o!","Sau khi Thiªn NhÉn gi¸o cã ®­îc s¸ch nµy, ®· ph¸i 2 tªn cao thñ ®i ¸m s¸t ThiÕu L©m cao thñ. LÇn nµy khi hä ®ang chuÈn bŞ ¸m s¸t C¸i Bang cao thñ. T¹i h¹ sÏ ®i h¹ thñ hä vµ ®o¹t vÒ Bİ kiÕp cña bæn m«n, xin m«n chñ ®õng bËn t©m.","BÊt nhiÔm…l¹i cã chuyÖn nh­ vËy µ?……M¾t ta mï råi nªn nu«i nhÇm nghŞch tö!","M«n chñ bít giËn, suy cho cïng BÊt NhiÔm c«ng tö chØ nhÊt thêi hå ®å. T¹i h¹ d¸m xin m«n chñ tha cho h¾n 1 lÇn!","Tªn ®¹i nghŞch bÊt ®¹o d¸m lµm c¸i chuyÖn quay l­ng chèng l¹i bæn m«n, téi chÕt kh«ng tha vµ ®õng hßng kÕ thõa ng«i vŞ Ch­ëng m«n.","Nhê ng­¬i thay ta an ñi NhÊt TrÇn, hãa ra ta ®· tr¸ch lÇm h¾n!")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 20*256+60) and (UTask_tm <= 20*256+70) and (HaveItem(41) == 1)) then		-- 20¼¶ÈÎÎñÍê³É
			Talk(5, "L20_prise", "§©y ch¼ng ph¶i lµ Kim H¹ng Khuyªn cña U muéi muéi sao? Sao nã l¹i ë ®©y?", "§©y lµ vËt mµ s­ c« nhê t¹i h¹ trao cho Ch­ëng M«n, bµ ®· tha thø cho Ch­ëng m«n råi!", "U muéi muéi thËt ®· tha thø cho ta? Cã thËt nµng muèn håi gia? Chİnh ng­¬i thuyÕt phôc nµng µ?", "ChuyÖn nµy lµ do §¹i s­ huynh an bµi, ®Ö tö ch¼ng biÕt lµm g× c¶?", "Dï ng­¬i cã nãi sao, nh­ng ng­¬i ®· gióp ta më ra niÒm vui cho cuéc ®êi nµy. C«ng lao rÊt lín, ta sÏ kh«ng b¹c ®·i ng­¬i.")
		elseif (UTask_tm == 60*256+60) and (HaveItem(49) == 1) then		-- ³öÊ¦ÈÎÎñÍê³É
			Talk(3, "L60_prise", "Ch­ëng m«n, trong Tróc T¬ ®éng ta t×m ®­îc thanh kiÕm cïn nµy. Nã cã ph¶i lµ ThÊt Tinh TuyÖt MÖnh KiÕm trong truyÒn thuyÕt nh¾c tíi?", "Kh«ng sai. §©y chİnh lµ ThÊt Tinh TuyÖt MÖnh KiÕm! Tuy bÒ ngoµi tÇm th­êng nh­ng gi¸ trŞ cña nã chİnh lµ ë chç ng­¬i ®· chän nã.Ng­¬i ®· thuËn lîi xuÊt s­!", "B¹n ®· ®­îc phong lµm Thiªn thñ thÇn vÖ cña §­êng M«n. Tõ h«m nay cã thÓ tù do hµnh hiÖp giang hå!Cã thÓ chän gia nhËp vµo m«n ph¸i kh¸c tiÕp tôc häc nghÖ, còng cã thÓ tù lËp bang héi më réng thÕ lùc giang hå, hoÆc lµm ®éc kh¸ch hµnh oai phong lÉm liÖt! Giang hå kiÕm hiÖp, trêi cao ®Êt réng, hy väng b¹n sÏ tiÕp tôc ph¸t triÓn tiÒn ®å cña m×nh")
		elseif (UTask_tm == 60*256+70) then				--³öÊ¦ÈÎÎñ
			Talk(3, "L60_fail", "Lµ ThÊt Tinh TuyÖt MÖnh KiÕm ta cÇn µ?", "............", "Ng­¬i ®· bŞ tiÒn tµi b¸u vËt mª hoÆc, lµm sao ta yªn t©m ®Ó ng­¬i xuÊt s­ ®©y? Kh«ng chõng cã mét ngµy ng­¬i v× c¸i lîi lín h¬n mµ quay l­ng ph¶n l¹i bæn m«n!")
		elseif (UTask_tm == 60*256+80) then
			if (GetCash() >= 20000) then
				Talk(1,"","ThÊy ng­¬i thËt t©m hèi lçi, ta sÏ cho ng­¬i thªm mét c¬ héi. H·y ®Õn Tróc T¬ §éng lÊy vÒ ThÊt Tinh TuyÖt MÖnh KiÕm.")
				Pay(20000)
				SetTask(2, 60*256+20)
				AddNote("Tr¶ 20000 l­îng, cÇu xin ch­ëng m«n tha thø, ®Õn Tróc T¬ ®éng lÊy ThÊt Tinh TuyÖt MÖnh kiÕm. ")
				Msg2Player("Tr¶ 20000 l­îng, cÇu xin ch­ëng m«n tha thø, ®Õn Tróc T¬ ®éng lÊy ThÊt Tinh TuyÖt MÖnh kiÕm. ")
			else
				Talk(1,"","Hèi lçi kh«ng thÓ nãi su«n, mau lÊy tiÒn nép ra råi míi nãi chuyÖn víi ta!")
			end
		elseif (UTask_tm == 60*256+90) then
			if (GetCash() >= 40000) then
				Talk(1,"","Hõ! Ta sÏ cho ng­¬i thªm mét c¬ héi. H·y ®i Tróc T¬ §éng lÊy vÒ ThÊt Tinh TuyÖt MÖnh KiÕm..")
				Pay(40000)
				SetTask(2, 60*256+20)
				AddNote("Tr¶ 40000 l­îng, cÇu xin ch­ëng m«n tha thø, ®Õn Tróc T¬ ®éng lÊy ThÊt Tinh TuyÖt MÖnh kiÕm. ")
				Msg2Player("Tr¶ 40000 l­îng, cÇu xin ch­ëng m«n tha thø, ®Õn Tróc T¬ ®éng lÊy ThÊt Tinh TuyÖt MÖnh kiÕm. ")
			else
				Talk(1,"","Nµy! Mau nép ra 4 v¹n l­îng, råi ®i Tróc T¬ §éng lÊy vÒ ThÊt Tinh TuyÖt MÖnh KiÕm.. ")
			end
		elseif ((UTask_tm == 60*256) and (GetLevel() >= 50) and (GetFaction() == "tangmen")) then				--³öÊ¦ÈÎÎñÆô¶¯
			Say("Khi ng­¬i ë bæn m«n häc thªm, thÇy ph¶i thö th¸ch ng­¬i. N¬i rõng tróc s©u th¼m ë h­íng §«ng cã 1 <color=Red>Tróc T¬ ®éng<color>. NÕu ng­¬i cã thÓ ®Õn <color=Red>Tróc T¬ ®éng<color> lÊy vÒ 1 thanh <color=Red> ThÊt Tinh TuyÖt MÖnh KiÕm <color> lµ cã thÓ thuËn lîi xuÊt s­!", 2, "TiÕp nhËn kiÓm tra /L60_get_yes", "T¹m kh«ng tiÕp nhËn /no")
		elseif (UTask_tm == 80*256) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			Say("L¹i hoµi niÖm vÒ sãng giã giang hå sao?",2,"V©ng, xin m«n chñ cho ®Ö tö ®­îc hµnh tÈu giang hå. /goff_yes","§Ö tö tËp luyÖn cßn ch­a ®ñ, ph¶i nç lùc luyÖn c«ng. /no")
		elseif (UTask_tm > 20*256) and (UTask_tm < 20*256+60) then					--ÒÑ¾­½Óµ½20¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Kh«ng biÕt U muéi muéi cuéc sèng ra sao? M·i ®Õn h«m nay nµng vÉn kh«ng chŞu tha thø cho ca ca nµy!")
		elseif (UTask_tm >= 30*256) and (UTask_tm <= 60*256) then					--ÒÑ¾­Íê³É20¼¶ÈÎÎñ£¬ÉĞÎ´½Óµ½³öÊ¦ÈÎÎñ
			Talk(1,""," Ng­¬i ®· gióp ta t×m l¹i ®­îc nguån vui, ta sÏ kh«ng b¹c ®·i ng­¬i!")
		elseif (UTask_tm > 60*256) and (UTask_tm < 70*256) then					--ÒÑ¾­½Óµ½³öÊ¦ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","ChØ cÇn ®Õn <color=Red>Tróc T¬ ®éng<color> lÊy vÒ 1 thanh <color=Red> ThÊt Tinh TuyÖt MÖnh KiÕm <color> th× xem nh­ ng­¬i tr·i qua thö th¸ch xuÊt s­!")
		else					--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´½Ó20¼¶ÈÎÎñ£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Kü n¨ng cña bæn m«n tõ tr­íc dÕn nay kh«ng truyÒn ra ngoµi. NÕu ®Ö tö m«n h¹ cã ng­êi tiÕt lé tuyÖt kü, sÏ chiÕu theo m«n quy mµ hµnh xö, quyÕt kh«ng n­¬ng tay!")
		end
--	elseif (GetTask(10) == 5*256+10) then		-- ×ªÃÅÅÉµ½Îå¶¾½Ì
--		Say("ÌÆ³ğ£ºÏëÍ¶ÈëÎå¶¾£¿ĞëÖª±¾ÃÅ²»Ğí´øÒÕÁíÍ¶£¬³ı·ÇÄãÏÈ×ÔĞĞ·ÏÈ¥±¾ÃÅ¾øÒÕ¡£Äã²»ÔÙÖØĞÂ¿¼ÂÇÒ»ÏÂÂğ£¿",2,"²»´í£¬ÎÒÒâÒÑ¾ö/defection_yes","ÎÒ»¹ÊÇ²»È¥Îå¶¾ËãÁË/defection_no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tm == 70*256) and (GetTask(10) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Say("LÇn nµy trë vÒ, ng­¬i muèn quay l¹i §­êng M«n sao?",2,"Tu©n lÖnh!/return_yes","Kh«ng. /return_no")
	elseif (GetCamp() == 4) and ((UTask_tm == 70*256+10) or (UTask_tm == 70*256+20)) then		-- ÖØ·µÊ¦ÃÅÈÎÎñÖĞ
		Say("§· chuÈn bŞ ®ñ 5 v¹n l­îng ch­a?",2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/return_uncompleted")
	elseif (Uworld51 >= 90) then			-- ÒÑ¾­Íê³É¡°Ï´ÇåÔ©Çü¡±ÈÎÎñ
		Talk(1,"","Tªn sóc sinh BÊt NhiÔm cuèi cïng ®· phô ta!")
	elseif (UTask_tm == 70*256) and (GetFaction() ~= "tangmen") then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Sau khi ng­¬i xuÊt s­, ®õng ®Ó ng­êi ta xem th­êng c«ng phu cña bæn m«n!")
	else
		Talk(1,"","Ng­êi ®êi ®Òu xem §­êng M«n lµ Long §µm Hæ HuyÖt. Xem §­êng Cõu ta lµ tªn ma ®Çu hû né v« th­êng. Hõ! Cã can hÖ g× chø?")
	end
end;
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
	x = 0
	skillID = 51					-- ÇàÄ¾¹¦
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (GetFaction() == "tangmen") and (GetTask(2) == 80*256) and (HaveMagic(253) == -1) then		-- ÖØ·µÊ¦ÃÅÇÒÎŞĞÂ¼¼ÄÜ
		AddMagic(253)
		Msg2Player("B¹n häc ®­îc Ngù §éc Thùc Cèt. ")
		Say("Ta ®· nhiÒu ngµy bÕ quan khæ luyÖn, chÕ t¹o ra 1 chiªu Ngò §éc Thùc Cèt, nay ta truyÒn l¹i cho ng­¬i! Sau khi ng­¬i häc xong, ph¶i chó ı nghØ ng¬i, ®Ó tr¸nh tæn th­¬ng kinh m¹ch!",1,"§a t¹ s­ phô /KickOutSelf")
		return 0
	elseif (x > 0) then		-- ÈôÓĞ¼¼ÄÜ·¢Éú±ä»¯£¬ÔòÌßÏÂÏß£¬·ñÔò·µ»Ø¼ÌĞøÁ÷³Ì
		Say("Ta ®· nhiÒu ngµy bÕ quan khæ luyÖn, chÕ t¹o ra 1 chiªu Ngò §éc Thùc Cèt, nay ta truyÒn l¹i cho ng­¬i! Sau khi ng­¬i häc xong, ph¶i chó ı nghØ ng¬i, ®Ó tr¸nh tæn th­¬ng kinh m¹ch!",1,"§a t¹ s­ phô /KickOutSelf")
		return 0
	else
		return 1
	end
end

------------------------ ÖØ·µÃÅÅÉÏà¹Ø -------------------------
function goff_yes()
	Talk(1,"","§­îc, h·y ®i ®i! Nªn nhí kh«ng thÓ kÕt giao víi gian tµ.")
	SetTask(2,70*256)
	AddNote("Ra khái §­êng m«n, l¹i ®i hµnh tÈu giang hå. ")
	Msg2Player("B¹n rêi khái §­êng m«n, l¹i ®i hµnh tÈu giang hå. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ×ªÅÉ£¬ÊÕ»ØÔ­ÃÅÅÉÎä¹¦¼¼ÄÜ
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=45; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Åùö¨µ¯
	i=43; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌÆÃÅ°µÆ÷
	i=44; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌÆÃÅµ¶·¨
	i=47; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¶á»êïÚ
	i=48; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ĞÄÑÛ
	i=50; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ×·ĞÄ¼ı
	i=51; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÇàÄ¾¹¦£¨ÒÑÈ¡Ïû£©
	i=54; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÂşÌì»¨Óê
	i=55; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ´ã¶¾Êõ
	i=57; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ±ùÆÇº®¹â
	i=58; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÂŞµØÍø
	i=249;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ğ¡Àî·Éµ¶
	i=253;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ô¦¶¾Ê´¹Ç
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(10,5*256+20)
	SetTask(2,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(66)
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200 ®iÓm! ")
		AddRepute(-200)
	end
	AddNote("§­êng Cõu thu håi vâ c«ng §­êng M«n cña b¹n, hñy bá chøc danh Lôc C¸c Tr­ëng L·o. B©y giê b¹n cã thÓ gia nhËp Ngò §éc Gi¸o råI. ")
	Msg2Player("§­êng Cõu thu håi vâ c«ng §­êng M«n cña b¹n, hñy bá chøc danh Lôc C¸c Tr­ëng L·o. B©y giê b¹n cã thÓ gia nhËp Ngò §éc Gi¸o råI. ")
	Talk(1,"KickOutSelf","§Ò phßng tiÕt lé tuyÖt häc cña bæn m«n, ng­¬i ®· quyÕt lßng muèn gia nhËp Ngò §éc, ta ®µnh ph¶i thu håi tuyÖt kü §­êng m«n cña ng­¬i!")
end

function defection_no()
	AddNote("B¹n tõ bá ı ®Şnh gia nhËp Ngò §éc Gi¸o. ")
	Msg2Player("B¹n tõ bá ı ®Şnh gia nhËp Ngò §éc Gi¸o. ")
	SetTask(10,1*256)			-- ÎªÆóÍ¼ÅÑÊ¦×ö¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
end

function return_yes()
	Talk(3,"","§óng! §Ö tö trªn giang hå ch­a lËp nªn c«ng danh g×, muèn xin c¸c vŞ thóc b¸ chØ gi¸o thªm!","ChiÕu theo m«n quy, ng­¬i ph¶i nép 5 v¹n l­îng ®Ó trïng ph¶n bæn m«n!","D¹! §Ó ®Ö tö chuÈn bŞ mét chót!")
	SetTask(2,70*256+20)
	AddNote("Giao n¹p 50000 l­îng b¹c th× lËp tøc cã thÓ quay l¹i §­êng m«n ")
	Msg2Player("Giao n¹p 50000 l­îng b¹c th× lËp tøc cã thÓ quay l¹i §­êng m«n ")
end;

function return_no()
	Talk(2,"","Ta muèn tù m×nh phiªu b¹t giang hå thªm 1 thêi gian n÷a.","§· nh­ thÕ, ng­¬i h·y tù m×nh b¶o träng!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Hay l¾m! Ng­¬i ®· thµnh t©m nh­ vËy! Ta sao nì tõ chèi!")
		Pay(50000)
		SetTask(2,80*256)
		SetRank(76)
--		if (HaveMagic(48) == -1) then
--			AddMagic(249)
--			AddMagic(58)
--			AddMagic(341)
--			AddMagic(48)
		add_tm(70)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("B¹n ®· häc ®­îc tuyÖt häc trÊn ph¸i: T©m Nh·n, vâ c«ng TiÓu Lı Phi §ao, Thiªn La §Şa Vâng, T¸n Hoa Tiªu. ")
--		end
		SetFaction("tangmen")
		SetCamp(3)
		SetCurCamp(3)
		AddNote("§· quay l¹i §­êng M«n, ®øng trong hµng ngò ")
		Msg2Player(GetName().."Quay l¹i §­êng M«n, ®­îc th¨ng lµ Lôc C¸c tr­ëng l·o. ")
	else
		Talk(2,"","Ng­¬i râ lµ cßn ch­a chuÈn bŞ xong!","Xin lçi! §Ó ta kiÓm tra l¹i.")
	end
end;

function return_uncompleted()
	Talk(1,"","Kh«ng sao, tiÕp tôc chuÈn bŞ ®i!")
end;

----------------------- 20¼¶ÈÎÎñ -----------------------
function L20_prise()
	DelItem(41)
	SetRank(27)	
	SetTask(2, 30*256)
--	AddMagic(303)
	add_tm(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®· ®­îc th¨ng lµm §­êng M«n Hé ViÖn, ®­îc häc vâ c«ng §éc Thİch Cèt ")
	AddNote("Giao Kim H¹ng quyÓn cho §­êng Cõu ch­ëng m«n, hoµn thµnh nhiÖm vô §­êng U. §­îc th¨ng lµm Hé ViÖn. ")
end;

----------------------- ³öÊ¦ÈÎÎñ --------------------------
function L60_get_yes()
	SetTask(2, 60*256+20)
	AddNote("T¹i ®¹i s¶nh ( 508, 322) , gÆp §­êng Cõu, nhËn <color=red>nhiÖm vô xuÊt s­<color>, tíi Tróc T¬ §éng thu håi ThÊt Tinh TuyÖt MÖnh KiÕm. ")
	Msg2Player("T¹i ®¹i s¶nh gÆp §­êng Cõu, nhËn nhiÖm vô xuÊt s­, tíi Tróc T¬ §éng thu håi ThÊt Tinh TuyÖt MÖnh KiÕm. ")
end;

function L60_prise()
	DelItem(49)
	Msg2Player("Chóc mõng b¹n häc thµnh tµi cã thÓ xuÊt s­! B¹n ®­îc phong lµ Thiªn Thñ ThÇn VÖ.. Danh väng t¨ng thªm 120 diÓm. ")
--	AddGlobalCountNews(GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğ¸÷Î»Í¬ÃÅĞĞ×ß½­ºş¡£", 1)
	Msg2SubWorld("§­êng M«n"..GetName().."Thµnh tµi xuÊt s­, tõ biÖt c¸c huynh muéi ®ång m«n ®Ó hµnh tÈu giang hå. ")
	AddRepute(120)
	SetRank(66)
	SetTask(2, 70*256)
	SetFaction("")				    			--Íæ¼ÒÍË³öÌÆÃÅ
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Trë vÒ §­êng M«n, giao ThÊt Tinh TuyÖt MÖnh KiÕm cho §­êng Cõu ch­ëng m«n, hoµn thµnh nhiÖm vô xuÊt s­. §­îc th¨ng lµm Thiªn Thñ ThÇn VÖ. ")
end;

function L60_fail()
	Say("Ch­ëng m«n tøc giËn råi, b¹n ph¶i lµm sao ®©y?", 2, "TiÒn ®Õn tay råi mµ cßn xui xÎo /L60_faila", "Xin ch­ëng m«n l­îng thø. /L60_failb")
end;

function L60_faila()
	SetTask(2,60*256+90)
	Talk(1,"","Nµy! Mau ®­a 4 v¹n l­îng råi cót vÒ Tróc T¬ ®éng lÊy ThÊt Tinh TuyÖt MÖnh KiÕm vÒ cho ta!")
end;

function L60_failb()
	SetTask(2,60*256+80)
	Talk(1,"","ThÊy ng­¬i thËt t©m hèi lçi, ta sÏ cho ng­¬i thªm mét c¬ héi. LËp tøc nép 2 v¹n l­îng ra, råi ®i Tróc T¬ §éng lÊy vÒ ThÊt Tinh TuyÖt MÖnh KiÕm.")
end;

----------------------- ÊÀ½çÈÎÎñ --------------------------
function Uworld51_40()
	SetTask(51,40)
	Msg2Player("Xem ra kh«ng cã c¸ch nµo khuyªn §­êng Cõu, b¹n ®Şnh ®i t×m s­ phô §­êng H¹c cña §­êng NhÊt TrÇn gi¶i quyÕt chuyÖn nµy ")
end

function Uworld51_90()
	DelItem(377)
	SetTask(51,90)
	Msg2Player("Ch©n t­íng râ rµng, §­êng Cõu cuèi cïng biÕt r»ng ®· hiÓu lÇm §­êng NhÊt TrÇn. Mau ®em tin tøc b¸o cho NhÊt TrÇn c«ng tö. ")
	AddNote("Ch©n t­íng râ rµng, §­êng Cõu cuèi cïng biÕt r»ng ®· hiÓu lÇm §­êng NhÊt TrÇn. ")
end

function no()
end
