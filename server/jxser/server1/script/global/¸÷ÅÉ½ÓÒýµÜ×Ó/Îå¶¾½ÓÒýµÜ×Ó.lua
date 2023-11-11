-- ¸÷ÃÅÅÉ½ÓÒıµÜ×Ó½Å±¾¡¡Îå¶¾
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Ngò §éc T¶n Nh©n"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 3 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudu","Ng­¬i ®· lµ ®Ö tö cña bæn gi¸o, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","TiÓu mü n÷! §Õn th¨m ca ca nµy ­? Cho ta th¬m mét c¸i nµo! Hi hi!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Ni c« thói! ThËt lµ xui xÎo! Cø ®i ®i l¹i l¹i! Ph× ph× ph×!§¹i c¸t ®¹i lîi!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","§õng t­ëng Phi ®ao cña c¸c ng­¬i lµ ®Ö nhÊt thiªn h¹,®éc thuËt cña bæn bang v« h×nh v« ¶nh, giÕt ng­êi trong nh¸y m¾t")
	elseif (player_Faction == "wudu") then
		Say("Nghe nãi trªn nói võa xuÊt hiÖn mét ®«i nam thanh n÷ tó,ng­¬i véi vµng ®Õn xem h¶? Hª! Hª! Hª!",4,"Ha! Ha! C¶m phiÒn ®­a t¹i h¹ ®i mét chuyÕn!/return_yes","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Ch­a cÇn! Ta cßn viÖc ph¶i lµm!/no")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","§èi ®Çu víi §¹i Kim sÏ ch¼ng İch lîi g× ®©u! Sím muén g× Kim quèc còng b×nh ®Şnh Trung Nguyªn, lóc ®ã c¸c ng­¬i hèi hËn còng muén råi!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Bän ®Çu träc c¸c ng­¬i th©n ë Kim Quèc nh­ng hån l¹i h­íng vÒ Nam triÒu! NÕu ®Ó lät vµo tay ta th× c¸c ng­¬i mét manh gi¸p còng kh«ng cßn! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Vâ §ang ®¹i hiÖp l¹i muèn chØ gi¸o cho t¹i h¹ ­? ThËt lµ nùc c­êi!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Bän c¸c ng­¬i qu¶ lµ kh«ng biÕt nh×n thêi thÕ! Dùa vµo søc c¸c ng­¬i mµ còng ®ßi chèng ®èi víi §¹i kim ­?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Chóng ta l­ìng ph¸i liªn minh, Nam c«ng B¾c kİch, sang s¬n hoa lÖ nµy sím muén g× còng thuéc vÒ chóng ta th«i! Ha! Ha! Ha!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","¡n mµy thói! §i ®i! §õng cã lµm bÈn ¸o cña ®¹i gia!")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn! TiÒn ®å rÊt s¸ng l¹n! T¹i h¹ v« cïng kh©m phôc!")
	else						-- Ö»Òª²»ÊôÓÚ10¸öÃÅÅÉ£¬²»ÔÙµ¥¶À¼ì²â¡°ÎŞÃÅÅÉ¡±
		UTask_wu = nt_getTask(10)
--		if (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_wu < 5*256) and (nt_getTask(2) == 70*256) then		-- ×ªÃÅÅÉÈÎÎñÆô¶¯
--			Say("Îå¶¾É¢ÈË£ºÄãÌÆÃÅ°µÆ÷Ôõ¼°ÎÒ¶¾Ò©ÖÑÊõÖ®³³£¬ºÎ¿öÌÆ³ğ°ÁÂı²»Èº£¬ÎŞÀñµ±È÷ÍÑ£¬½«À´¶¨»á±»´ó½ğÌúÆï½ÌÑµ¡£Äã²»Èç³ÃÔç¸ÄÍ¶ÎÒ½Ì£¬½«À´´ó½ğÆ½¶¨ÖĞÔ­Ö®Ê±»¹¿É·ÖÒ»±­¸ş¡£",2,"É¢ÈËÖ®ÑÔÓĞÀí£¬ÎÒÏë¸ÄÍ¶Îå¶¾½Ì/defection_get","ÀÁµÃÀíÄã/no")
		if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","ChØ cÇn hoµn thµnh nhiÖm vô nhËp m«n,ng­¬i sÏ vinh quang trë thµnh ®Ö tö cña bæn ph¸i")
		elseif (UTask_wu >= 70*256) and (player_Faction ~= "wudu") then					--ÒÑ¾­³öÊ¦
			Say("L©u l¾m kh«ng gÆp! Xem ra d¹o nµy ng­¬i ®· kh¸ h¬n tr­íc nhiÒu",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(1,"enroll_select","Ngò §éc gi¸o hiÖn nay ®ang lóc h­ng thŞnh, l¹i liªn kÕt víi Thiªn NhÉn gi¸o hç trî §¹i Kim nam h¹! Ngµy sau vinh hoa phó quı sÏ cïng h­ëng!")
		end
	end
end;

function defection_get()
	Talk(1,"","Ha! Ha! Ha! Qu¶ nhiªn lµ tuÊn kiÖt thøc thêi!Ng­¬i chØ cÇn ®Õn gÆp l·o giµ §­êng Cõu xin ly gi¸o sau ®ã ®Õn gÆp gi¸o chñ H¾c DiÖn Lang Qu©n cña ta ®Ó b¸o danh lµ cã thÓ nhËp m«n")
	nt_setTask(10,5*256+10)
	Msg2Player("Muèn gia nhËp Ngò §éc gi¸o, chØ cÇn xin phĞp §­êng Cõu, sau ®ã ®Õn gÆp H¾c DiÖn Lang Qu©n b¸o danh!")
	AddNote("Muèn gia nhËp Ngò §éc gi¸o, chØ cÇn xin phĞp §­êng Cõu, sau ®ã ®Õn gÆp H¾c DiÖn Lang Qu©n b¸o danh!")
end

function enroll_select()
	UTask_wu = nt_getTask(10)
	UTask_tm = nt_getTask(2)
	if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- ÒÑ½ÓÁËÌÆÃÅÈëÃÅÈÎÎñ
		Talk(1,"","Ng­¬i kh«ng muèn gia nhËp th× biÕn khái ®©y ®i! Hõm! Hao c¶ nöa ngµy n­íc bät cña ta")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_tm < 5*256) and (UTask_wu < 5*256) then		--Ä¾Ïµ¡¢Î´ÈëÌÆÃÅÎå¶¾
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("Sao h¶? Cã muèn gia nhËp bæn gi¸o kh«ng?", 3, "Gia nhËp Ngò §éc Gi¸o/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end		-- ²»ÊÇÄ¾ÏµµÄ¾Í²»ÔÙ¶àËµ»°ÁË¡£
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(183,70)		  			--ÉèÖÃÖØÉúµã
	nt_setTask(10,10*256)				-- Ö±½ÓÈëÃÅ
	SetFaction("wudu")       			--Íæ¼Ò¼ÓÈë¶ëáÒÅÉ
	SetCamp(2)
	SetCurCamp(2)
	SetRank(49)
	nt_setTask(137,70)
	SetLastFactionNumber(3)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(10,80*256)
--	SetRank(80)
--	Msg2Player("»¶Ó­Äã¼ÓÈëÎå¶¾½Ì£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_wu(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªnh b¹n Gia nhËp Ngò §éc gi¸o, trë thµnh Ngò §éc §ång Tö! Häc ®­îc §éc Sa Ch­ëng, HuyÕt §ao §éc S¸t.")
	AddNote("Gia nhËp Ngò §éc gi¸o, trë thµnh Ngò §éc §ång Tö.")
	Msg2Faction("wudu",GetName().."tõ h«m nay gia nhËp Ngò §éc gi¸o, xin b¸i kiÕn c¸c vŞ huynh tû. Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
---off--	NewWorld(183, 1746, 2673)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú

end;

function return_yes()
	NewWorld(183, 1746, 2673)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function wu_check_yes()					-- °´¼¼ÄÜÈ·¶¨ÈÎÎñ±äÁ¿µÄ¼ì²é¡£¡£¡£ÉĞÎ´ÏàÓ¦¸üĞÂ
	if (GetSeries() ~= 2) then
		Talk(1,"","Ngò hµnh cña ng­¬i kh¸c hÖ Méc víi bän ta!  §Õn ®©y lµm g×? H·y lªn diÔn ®µn häc hái ®i!")
	elseif (HaveMagic(91) >= 0) then		-- ×öÍêÁË50¼¶ÈÎÎñ,·ğ¹âÆÕÕÕ
		nt_setTask(1,60*256)
		Talk(1,"","Ta ®· phôc håi l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i! B©y giê ng­¬i cã thÓ ®i nhËn nhiÖm vô xuÊt s­ ")
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
	Say("Nghe nãi trªn nói võa xuÊt hiÖn mét ®«i nam thanh n÷ tó,ng­¬i véi vµng ®Õn xem h¶? Hª! Hª! Hª!",2,"Ha! Ha! C¶m phiÒn ®­a t¹i h¹ ®i mét chuyÕn!/return_yes","Ch­a cÇn! Ta cßn viÖc ph¶i lµm!/no")
end

function Uworld1000_jiaoyuwudu()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn Ngò §éc b¶o b¹n ®· lµ ®Ö tö cña m«n pahİ, cã thÓ trùc tiÕp ®i gÆp Long Ngò nãi chuyÖn.")
end

function no()
end;
