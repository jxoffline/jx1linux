-- ¸÷ÃÅÅÉ½ÓÒıµÜ×Ó½Å±¾¡¡´äÑÌÃÅ
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Thóy Yªn Hoa Sø "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 5 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyucuiyan","Ng­¬i ®· lµ ®Ö tö cña bæn ph¸i, kh«ng cÇn ph¶i ®i, cã thÓ gÆp trùc tiÕp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "cuiyan") then		-- ±¾ÃÅ
		Say("Muéi l¹i lĞn ®i ch¬i n÷a ­?",4,"Uhm! PhiÒn tû tû ®­a muéi vÒ!/return_yes","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Tû cø gi¶ vê nh­ kh«ng thÊy muéi lµ ®­îc råi!/no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Xinh ®Ñp nh­ hoa t­¬i mµ h»ng ngµy cø ®èi diÖn víi Thanh §¨ng Cæ PhËt!  Ta kh«ng thİch c¸c ng­¬i ë ®iÓm nµy! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Hai ph¸i chóng ta liªn minh l¹i, kh«ng cÇn ph¶i ph©n tranh n÷a! Ch¼ng ph¶i lµ hû sù ­?")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Ta ghĞt nhÊt lµ c¸i bän len lĞn h¹ ®éc h¹i ng­êi!  Êy!  Kh«ng ph¶i ta nãi ng­¬i! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","D­¬ng Hå cña Thiªn V­¬ng bang c¸c ng­¬i cßn kĞm xa tû tû cña ta, thiªn h¹ nam nh©n qu¶ nhiªn ch¼ng ra g× hÕt! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Hßa th­îng ®Çu träc sao l¹i ®Õn n¬i cña c¸c n÷ nhi thÕ nµy?! ")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Quı m«n lÊy hiÖp nghÜa lµm träng, nh­ng kh«ng biÕt §¬n T­ Nam cã biÕt hæ thÑn hay kh«ng mµ cø b¸m theo c¸c s­ tû xinh ®Ñp cña chóng ta")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C«n L«n ph¸i ph¸t triÓn thÇn tèc! TiÓu n÷ rÊt ng­ìng mé! ")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ai lµm hoµng ®Õ th× còng mÆc!  Nh­ng c¸c ng­¬i tµn s¸t sinh linh th× bæn c« n­¬ng kh«ng bá qua! ")
	elseif (player_Faction == "gaibang") then
		Talk(2,"","§¹i hiÖp!  §õng qua ®©y! ","¸! Bä chĞt!!! ")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn!  T¹i h¹ v« cïng béi phôc! ")
	else						-- Ö»Òª²»ÊôÓÚ10¸öÃÅÅÉ£¬²»ÔÙµ¥¶À¼ì²â¡°ÎŞÃÅÅÉ¡±
		UTask_cy = nt_getTask(6)
--		if (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_cy < 5*256) and (nt_getTask(1) == 70*256) then		-- ×ªÃÅÅÉÈÎÎñÆô¶¯
--			Say("´äÑÌ»¨Ê¹£ºÈç»¨°ãµÄÅ®×Ó£¬Æ«ÒªÈÕÈÕÃæ¶ÔÇàµÆ¹Å·ğ£¬ºÎ±ØÄØ¡£ÄÄÏóÎÒÃÇ´äÑÌÃÅÏÂ£¬ÌìÌì»¶ÉùĞ¦Óï£¬ÄÇ²ÅÊÇÎÒÃÇÕæÕıÓ¦¸ÃÓµÓĞµÄÈÕ×ÓÑ½¡£",2,"ÓĞµÀÀí£¬ÄÇÃ´ÎÒÏë¸ÄÍ¶´äÑÌ¸ÃÔõÃ´°ìÄØ£¿/defection_get","ÇàµÆ¹Å·ğ±¾ÎÒËùÔ¸£¬½ã½ã²»±Ø¶àÑÔ/no")
		if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","Muéi tiÕp nhËn nhiÖm vô nhËp m«n ®· l©u vÉn ch­a hoµn thµnh! ChØ cÇn th«ng qua kh¶o nghiÖm Hoa Kh«i trËn th× chóng ta sÏ lµ tû muéi tèt")
		elseif (UTask_cy >= 70*256) and (player_Faction ~= "cuiyan") then					--ÒÑ¾­³öÊ¦
			Say("Tû tû t¹i sao xuÊt s­ vËy!  Cø ë ®©y tù t¹i ch¼ng ph¶i vui vÎ l¾m sao!?",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(1,"enroll_select","Thóy Yªn m«n chóng ta tuy toµn lµ n÷, nh­ng vâ nghÖ lÊy 'Khinh, Kho¸i, Kú, Mü' mµ næi tiÕng giang hå. Tû muéi tÒ t©m!  Trong giang hå kh«ng ai d¸m coi khinh")
		end
	end
end;

function defection_get()
	Talk(1,"","ChØ cÇn muéi ®Õn thØnh cÇu Thanh HiÓu S­ Th¸i xin chuyÓn qua Thóy Yªn m«n, sau ®ã ®Õn tr×nh kiÕn víi Do·n Hµm Yªn ch­ëng m«n cña ta th× cã thÓ ®­îc!  Yªn t©m!  Thanh HiÓu S­ Th¸i th«ng t×nh ®¹t lı, sÏ kh«ng lµm khã muéi ®©u! ")
	nt_setTask(6,5*256+10)
	Msg2Player("Muèn gia nhËp Thóy Yªn m«n, chØ cÇn ®Õn xin phĞp Thanh HiÓu S­ Th¸i sau ®ã ®Õn tr×nh kiÕn víi Do·n Hµm Yªn lµ ®­îc!")
	AddNote("Muèn gia nhËp Thóy Yªn m«n, chØ cÇn ®Õn xin phĞp Thanh HiÓu S­ Th¸i sau ®ã ®Õn tr×nh kiÕn víi Do·n Hµm Yªn lµ ®­îc!")
end

function enroll_select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- ÒÑ½ÓÁË´äÑÌÈëÃÅÈÎÎñ
		Talk(1,"","L¹i cã thªm 1 ng­êi muèn ®Õn cÇu kinh niÖm phËt! ThËt lµ ®¸ng tiÕc! ")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_em < 5*256) and (UTask_cy < 5*256) then		--Ë®Ïµ¡¢Î´Èë¶ëáÒ´äÑÌ
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("Muéi cã muèn gia nhËp Thóy Yªn m«n cña chóng ta kh«ng?", 3, "Gia nhËp Thóy Yªn M«n/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Talk(1,"","Tr­íc tiªn muéi h·y luyÖn tËp l¹i c¨n b¶n, ®¹t ®Õn <color=Red>cÊp 10<color> chóng ta sÏ lµ tû muéi 1 nhµ! ")
		end
	end		-- ²»ÊÇË®ÏµµÄ¾Í²»ÔÙ¶àËµ»°ÁË¡£
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(154,61)		  				-- ÖØÉúµã
	nt_setTask(6,10*256)						-- Ö±½ÓÈëÃÅ
	SetFaction("cuiyan")      			--Íæ¼Ò¼ÓÈë¶ëáÒÅÉ
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	nt_setTask(137,66)
	SetLastFactionNumber(5)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(6,80*256)
--	SetRank(67)
--	Msg2Player("»¶Ó­Äã¼ÓÈë´äÑÌÃÅ£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_cy(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªnh b¹n gia nhËp Thóy Yªn m«n! Trë thµnh Hoa Tú. Häc®­îc Phong Hoa TuyÕt NguyÖt, Phong QuyÓn Tµn TuyÕt")
	AddNote("gia nhËp Thóy Yªn m«n, trë thµnh Hoa Tú ")
	Msg2Faction("cuiyan",GetName().."tõ h«m nay gia nhËp Thóy Yªn m«n. Xin b¸i kiÕn c¸c vŞ s­ tû. Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
---off--	NewWorld(154, 403, 1361)			-- ´«µ½ÃÅÅÉÖĞ

end;

function return_yes()
	NewWorld(154, 403, 1361)			-- ´«µ½ÃÅÅÉÖĞ
end;

function cy_check_yes()					-- ÓÉ¶ëáÒ¸ÄÀ´¡£¡£¡£ÉĞÎ´ÏàÓ¦¸üĞÂ
	if (GetSeries() ~= 2) then
		Talk(1,"","Ngò hµnh cña ng­¬i kh¸c víi bän ta!  §Õn ®©y lµm g×? H·y lªn diÔn ®µn häc hái thªm!")
	elseif (HaveMagic(91) >= 0) then		-- ×öÍêÁË50¼¶ÈÎÎñ,·ğ¹âÆÕÕÕ
		nt_setTask(1,60*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· cã thÓ ®i nhËn nhiÖm vô xuÊt s­.")
	elseif (HaveMagic(88) >= 0) then		-- ×öÍêÁË40¼¶ÈÎÎñ,²»Ãğ²»¾ø
		nt_setTask(1,50*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 40.")
	elseif (HaveMagic(85) >= 0) then		-- ×öÍêÁË30¼¶ÈÎÎñ,Ò»Ò¶ÖªÇï
		nt_setTask(1,40*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 30.")
	elseif (HaveMagic(82) >= 0) then		-- ×öÍêÁË20¼¶ÈÎÎñ,ËÄÏóÍ¬¹é
		nt_setTask(1,30*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 20.")
	elseif (HaveMagic(77) >= 0) then		-- ×öÍêÁË10¼¶ÈÎÎñ,¶ëÃ¼½£·¨
		nt_setTask(1,20*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 10.")
	else
		nt_setTask(1,10*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· cã thÓ nhËn nhiÖm vô cÊp 10.")
	end
end;

function cy_check_no()
	Say("Muéi l¹i lĞn ®i ch¬i n÷a ­?",2,"Uhm! PhiÒn tû tû ®­a muéi vÒ!/return_yes","Tû cø gi¶ vê nh­ kh«ng thÊy muéi lµ ®­îc råi!/no")
end

function Uworld1000_jiaoyucuiyan()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn Thóy Yªn m«n b¶o b¹n cã thÓ trùc tiÕp ®i gÆp Long Ngò nãi chuyÖn.")
end

function no()
end;
