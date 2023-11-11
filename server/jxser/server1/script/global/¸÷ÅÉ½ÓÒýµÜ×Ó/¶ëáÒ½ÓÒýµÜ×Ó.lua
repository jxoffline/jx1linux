-- ¶ëáÒ½ÓÒıµÜ×Ó Ä£°å ¶ëáÒ½õÒÂÄá
-- By: Dan_Deng(2003-10-28) ÓÉÈËÎï¶Ô»°ĞŞ¸Ä¶øÀ´
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Nga My CÈm Y Ni"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 4 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuemei","Ng­¬i ®· lµ ®Ö tö cña bæn ph¸i, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "emei") then
		Say("TiÓu s­ muéi l¹i xuèng nói ch¬i µ? Cã cÇn ta ®­a vÒ nói kh«ng?",4,"L¹i lµm phiÒn tû tû n÷a råi!/return_yes", "T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng cÇn ®©u! §a t¹ S­ tû /no")
--		Say("¶ëáÒ½õÒÂÄá£º²»ºÃÒâË¼£¬ÒòÎªÓĞĞ©ÈËµÄÈÎÎñ×´Ì¬²»ÕıÈ·£¬ÎÒÃÇÕıÔÚÖØĞÂÎªÃÅÏÂµÜ×Ó½øĞĞ¼ì²é¡£ÄãÒª¼ì²éÄãµÄÈÎÎñ×´Ì¬Âğ£¿Èç¹ûÄãÈÏÎªÄãµÄ×´Ì¬ÊÇÕıÈ·µÄ¾Í²»±Ø¼ì²éÁË¡£",2,"¼ì²é/em_check_yes","²»ÓÃÁË/em_check_no")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","Quı ph¸i danh chÊn V©n Nam. Tr­íc giê ch­a cïng bæn ph¸i qua l¹i. Kh«ng biÕt cã g× chØ gi¸o! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng­¬i lµ ng­êi cña Thôc Nam §­êng M«n? Bæn m«n lµ danh m«n ch¸nh ph¸i, tr­íc giê kh«ng qua l¹i víi nh÷ng ng­êi cã t­ t­ëng kh«ng chİnh thèng")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Bän tµ ma ngo¹i ®¹o c¸c ng­¬i!  Ai ai còng muèn tiªu diÖt! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Quı bang bang chñ D­¬ng Anh lµ mét bËc n÷ trung hµo kiÖt!  BÇn ni tõ l©u ng­ìng mé!  Mong sÏ cã ngµy diÖn kiÕn! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","A di ®µ phËt!  Th× ra lµ hßa th­îng  ThiÕu l©m, kh«ng biÕt HuyÒn Nh©n ®¹i s­ gÇn ®©y cã kháe kh«ng?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Vâ ®ang hiÖp nghÜa, danh chÊn thiªn h¹. §¹o NhÊt Ch©n Nh©n cña quı ph¸i vµ ch­ëng m«n cña bæn ph¸i giao t×nh th©m s©u. Hai ph¸i chóng ta cã thÓ nãi lµ  anh em mét nhµ ")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","TÖ ph¸i vµ quı ph¸i ch­a hÒ qua l¹i, kh«ng biÕt cã g× chØ gi¸o!?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","C¸c ng­¬i phô thuéc Kim quèc, lu«n dßm ngã giang s¬n  §¹i tèng ta. Vâ l©m chİnh ph¸i chóng ta vµ c¸c ng­¬i thÒ kh«ng ®éi trêi chung! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Quı bang ng­êi ®«ng thÕ m¹nh, hµo khİ xung thiªn, bæn gi¸o rÊt vui ®­îc kÕt giao víi nh÷ng b»ng h÷u nh­ vËy! ")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn!  BÇn ni v« cïng béi phôc! ")
	else						-- Ö»Òª²»ÊôÓÚ10¸öÃÅÅÉ£¬²»ÔÙµ¥¶À¼ì²â¡°ÎŞÃÅÅÉ¡±
		UTask_em = nt_getTask(1)
		if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","Muéi ®· tiÕp nhËn nhiÖm vô nhËp m«n víi  DiÖp B¨ng H©n nh­ng vÉn ch­a hoµn thµnh. Tr­íc tiªn h·y th«ng qua cuéc kh¶o nghiÖm Trµ CÇm Th­, sau ®ã  lªn dèc Toµn Thiªn Ph¸ lÊy B¹ch Ngäc Nh­ ı! ")
		elseif (UTask_em >= 70*256) and (player_Faction ~= "emei") then					--ÒÑ¾­³öÊ¦
			Say("Th× ra lµ S­ tû, d¹o nµy cã kháe kh«ng?",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(1,"select","Trong thiªn h¹ c¸c m«n ph¸i do n÷ nhi s¸ng lËp th× bæn m«n ®øng ®Çu!  §Ö tö bæn m«n kh«ng nh÷ng vâ nghÖ cao c­êng, cÇm kú thi häa ®Òu tinh th«ng!  Ai nãi giang hå lµ thÕ giíi cña nam nh©n th× cø nh×n bæn ph¸i mµ lµm g­¬ng")
		end
	end
end;

function select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- ÒÑ½ÓÁË´äÑÌÈëÃÅÈÎÎñ
		Talk(1,"","C« ng­¬i nµy vèn lµ muèn gia nhËp Thóy Yªn m«n! Mçi ng­êi cã chİ h­íng riªng cña m×nh! Ta còng kh«ng miÔn c­ìng! ")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_cy < 5*256) and (UTask_em < 5*256) then		--Ë®Ïµ¡¢Î´Èë´äÑÌ¶ëáÒ
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("Gia nhËp Nga My ph¸i, chóng ta sÏ lµ tû muéi 1 nhµ!  Häa phóc cïng h­ëng! ", 3, "Gia nhËp Nga Mi ph¸i/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Say("Tr­íc tiªn muéi h·y luyÖn tËp l¹i c¨n b¶n, ®¹t ®Õn <color=Red>cÊp 10<color> chóng ta sÏ lµ tû muéi 1 nhµ! ", 0)		
		end
	end		-- ²»ÊÇË®ÏµµÄ¾Í²»ÔÙ¶àËµ»°ÁË¡£
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(13,13)		  			--ÉèÖÃÖØÉúµã
	nt_setTask(1, 10*256)				-- Ö±½ÓÈëÃÅ
	SetFaction("emei")       			--Íæ¼Ò¼ÓÈë¶ëáÒÅÉ
	SetCamp(1)
	SetCurCamp(1)
	SetRank(13)
	nt_setTask(137,61)
	SetLastFactionNumber(4)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(1,80*256)
--	SetRank(63)
--	Msg2Player("»¶Ó­Äã¼ÓÈë¶ëáÒÅÉ£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_em(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªnh b¹n gia nhËp Nga Mi ph¸i, trë thµnh Bè Y Ni. Häc ®­îc NhÊt DiÖp Tri Thu, Phiªu TuyÕt Xuyªn V©n")
	AddNote("gia nhËp Nga Mi Ph¸i, trë thµnh Bè Y Ni")
	Msg2Faction("emei",GetName().."tõ h«m nay gia nhËp Nga Mi ph¸i. Xin b¸i kiÕn c¸c vŞ s­ tû. Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
---off--	NewWorld(13, 1898, 4978)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú

end;

function return_yes()
	NewWorld(13, 1898, 4978)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function em_check_yes()
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

function em_check_no()
	Say("TiÓu s­ muéi l¹i xuèng nói ch¬i µ? Cã cÇn ta ®­a vÒ nói kh«ng?",2,"L¹i lµm phiÒn tû tû n÷a råi!/return_yes","Kh«ng cÇn ®©u! §a t¹ S­ tû /return_no")
end

function Uworld1000_jiaoyuemei()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn Nga Mi b¶o b¹n ®· lµ ®Ö tö cña m«n ph¸i, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
end

function no()
end;
