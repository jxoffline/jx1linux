-- ÌìÈÌ½ÓÒıµÜ×Ó Ä£°å ÌìÈÌËÀÊ¿
-- By: Dan_Deng(2003-10-28) ÓÉÈËÎï¶Ô»°ĞŞ¸Ä¶øÀ´
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Thiªn NhÉn Tö SÜ "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 7 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianren","Ng­¬i ®· lµ ®Ö tö cña bæn ph¸i, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "emei") then
		Talk(1,"","NÕu Nga My ph¸i chŞu gia nhËp bæn gi¸o, vËy th× bän ta suèt ngµy ®Òu ®­îc ng¾m nh×n ng­êi ®Ñp! ¤i! Sung s­íng chÕt ®i th«i!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Sím ®· nghe con g¸i ph­¬ng Nam s¾c ®Ñp nghiªng thµnh, h«m nay ®­îc gÆp ®©y, qu¶ lµ tiÕng ®ån kh«ng ngoa")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Gi¸o chñ cña bæn gi¸o lu«n cã lßng mong mái quı gi¸o cïng gia nhËp, vinh hoa phó quı, cao quan bæng léc, h­ëng c¶ ®êi kh«ng hÕt!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Thiªn NhÉn vµ Ngò §«c gi¸o mµ hîp thµnh Nam c«ng B¾c kİch, Trung Nguyªn sím muén còng r¬i vµo tay chóng ta")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Kh«ng ai cã thÓ ng¨n c¶n ®­îc sù nghiÖp hïng b¸ Trung nguyªn cña Thiªn NhÉn gi¸o")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Cao thñ ThiÕu L©m ph¸i cña c¸c ng­¬i ®· s¾p quy tiªn hÕt råi!Nh©n tµi trÎ tuæi l¹i ch¼ng cã mÊy ng­êi! Xem ra ThiÕu L©m còng ®· s¾p ®Õn ngµy tËn nghiÖp! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Ta ®· nghe Néi c«ng, kiÕm thuËt cña Vâ §ang lõng danh Trung nguyªn! Cã c¬ héi nhÊt ®Şnh ph¶i thØnh gi¸o!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C«n L«n ph¸i c¸c ng­¬i hïng cø T©y Vùc,cã d· t©m dßm ngã Trung nguyªn ®· l©u. SÏ cã  mét ngµy bæn gi¸o vµ c¸c ng­¬i ph©n chia cao thÊp t¹i Trung Nguyªn")
	elseif (player_Faction == "tianren") then
		Say("NhiÖm vô ®· hoµn thµnh ch­a?",4,"NhiÖm vô ®· hoµn thµnh! H·y ®­a ta vÒ Tæng ®µn!/return_yes","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng hái n÷a!/no")
--		Say("ÌìÈÌËÀÊ¿£º²»ºÃÒâË¼£¬ÒòÎªÓĞĞ©ÈËµÄÈÎÎñ×´Ì¬²»ÕıÈ·£¬ÎÒÃÇÕıÔÚÖØĞÂÎªÃÅÏÂµÜ×Ó½øĞĞ¼ì²é¡£ÄãÒª¼ì²éÄãµÄÈÎÎñ×´Ì¬Âğ£¿Èç¹ûÄãÈÏÎªÄãµÄ×´Ì¬ÊÇÕıÈ·µÄ¾Í²»±Ø¼ì²éÁË¡£",2,"¼ì²é/tr_check_yes","²»ÓÃÁË/tr_check_no")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Tªn ¨n mµy nµy muèn trµ trén vµo ®©y lµm gian tÕ ­?")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn! TiÒn ®å rÊt s¸ng l¹n! T¹i h¹ v« cïng béi phôc!")
	else
		UTask_tr = nt_getTask(4)
		if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","Ng­¬i ®· tiÕp nhËn nhiÖm vô nhËp m«n nh­ng ®Õn giê vÉn ch­a hoµn thµnh. H·y mau lªn Hoa S¬n mang Vò V­¬ng kiÕm vÒ ®©y!")
		elseif (UTask_tr >= 70*256) and (player_Faction ~= "tianren") then					--ÒÑ¾­³öÊ¦
			Say("Nghe nãi ng­¬i sau khi xuÊt s­ ®· lËp nªn nhiÒu c«ng danh! Qu¶ kh«ng hæ danh lµ ®Ö tö cña bæn ph¸i",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(1,"select","Gi¸o chñ cña bæn gi¸o lµ Hoµn Nhan Hïng LiÖt. Danh chÊn thiªn h¹! Hoµng ®Õ Kim quèc còng ph¶i nh­êng 3 phÇn. Cao thñ cña bæn gi¸o nhiÒu v« sè! Nh©n tµi ngäa hæ tµng long")
		end
	end
end;

function select()
	UTask_tr = nt_getTask(4)
	UTask_gb = nt_getTask(8)
	if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- ÒÑ½ÓÁËØ¤°ïÈëÃÅÈÎÎñ
		Talk(1,"","Nam triÒu u mª! Téi g× c¸c ng­¬i cø ph¶i b¸n m×nh cho c¸i g· hä TriÖu ngu ngèc ®ã vËy?")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_gb < 5*256) and (UTask_tr < 5*256) then		--»ğÏµ¡¢Î´ÈëØ¤°ïÌìÈÌ
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("Cã muèn gia nhËp bæn gi¸o kh«ng?", 3, "Gia nhËp Thiªn NhÉn gi¸o/yes", "Kh«ng gia nhËp/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn <color=Red>cÊp 10<color> l¹i ®Õn t×m ta!")
		end
	end
end;

function yes()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	Talk(1,"","Gia nhËp bæn gi¸o cÇn ph¶i chÊp hµnh hiÖu lÖnh! M¹nh ®­îc yÕu thua chİnh lµ t«n chØ cña bæn gi¸o! Ng­¬i h·y tù dïng thùc lùc ®Ó chøng minh m×nh!")
	SetRevPos(49,28)	 						--ÉèÖÃÖØÉúµã
	nt_setTask(4, 10*256)
	SetFaction("tianren")      					--Íæ¼Ò¼ÓÈëÌìÈÌ½Ì
	SetCamp(2)
	SetCurCamp(2)
	SetRank(55)							--ÉèÖÃ³ÆºÅ
	nt_setTask(137,64)
	SetLastFactionNumber(7)
	Msg2Player("Gia nhËp Thiªn NhÉn gi¸o, trë thµnh S¸t thñ. Häc ®­îc vâ c«ng: Tµn D­¬ng Nh­ HuyÕt; §¬n ChØ LiÖt DiÖm")
	AddNote("Gia nhËp Thiªn NhÉn gi¸o, trë thµnh S¸t thñ ")
	Msg2Faction("tianren",GetName().."tõ h«m nay gia nhËp Thiªn NhÉn gi¸o! Xin b¸i kiÕn c¸c vŞ ®¹o huynh s­ tû! Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(4,80*256)
--	SetRank(81)
--	Msg2Player("»¶Ó­Äã¼ÓÈëÌìÈÌ½Ì£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_tr(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
---off--	NewWorld(49, 1644, 3215)					--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú

end;

function return_yes()
	NewWorld(49, 1644, 3215)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function tr_check_yes()
	if (GetSeries() ~= 3) then
		Talk(1,"","Ng­¬i kh«ng thuéc nhãm Ngò hµnh hÖ Háa cña ta, ®Õn ®©y lµm g×? H·y lªn diÔn ®µn häc hái ®i!")
	elseif (HaveMagic(148) >= 0) then		-- ×öÍêÁË50¼¶ÈÎÎñ,ÆßÉ±ÉñÈ­
		nt_setTask(4,60*256)
		Talk(1,"","Ta ®· phôc håi l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i! B©y giê ng­¬i cã thÓ ®i nhËn nhiÖm vô xuÊt s­ ")
	elseif (HaveMagic(146) >= 0) then		-- ×öÍêÁË40¼¶ÈÎÎñ,ÎåĞĞÕó
		nt_setTask(4,50*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 40.")
	elseif (HaveMagic(141) >= 0) then		-- ×öÍêÁË30¼¶ÈÎÎñ,ÁÒ»ğÇéÌì
		nt_setTask(4,40*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 30.")
	elseif (HaveMagic(138) >= 0) then		-- ×öÍêÁË20¼¶ÈÎÎñ,ÍÆÉ½Ìîº£
		nt_setTask(4,30*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 20.")
	elseif (HaveMagic(131) >= 0) then		-- ×öÍêÁË10¼¶ÈÎÎñ,ÌìÈÌÃ¬·¨
		nt_setTask(4,20*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 10.")
	else
		nt_setTask(4,10*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· cã thÓ nhËn nhiÖm vô cÊp 10.")
	end
end

function tr_check_no()
	Say("NhiÖm vô ®· hoµn thµnh ch­a?",2,"NhiÖm vô ®· hoµn thµnh! H·y ®­a ta vÒ Tæng ®µn!/return_yes","Kh«ng hái n÷a!/return_no")
end

function Uworld1000_jiaoyutianren()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn Thiªn NhÉn b¶o b¹n ®· lµ ®Ö tö cña m«n ph¸i, cã thÓ trùc tiÕp ®i gÆp Long Ngò nãi chuyÖn.")
end

function no()
end;
