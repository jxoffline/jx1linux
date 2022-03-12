-- ¸÷ÃÅÅÉ½ÓÒıµÜ×Ó½Å±¾¡¡ÉÙÁÖ
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "ThiÕu L©m La H¸n"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 0 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyushaolin","Ng­¬i ®· lµ ®Ö tö cña bæn ph¸i, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Quı m«n lÊy vò luyÖn vâ! UyÓn chuyÓn mµ tinh diÖu! TiÓu t¨ng v« cïng béi phôc!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh HiÓu S­ Th¸i cña quı ph¸i tinh th«ng phËt häc, vâ nghÖ cao c­êng, tiÓu t¨ng ng­ìng mé ®· l©u!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Nghe nãi tõ §­êng m«n ®æi ¸m khİ thµnh minh khİ, h¹ thñ xuÊt thÇn! T¹i h¹ rÊt kh©m phôc!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","§éc M«n cña quı ph¸i thiªn h¹ ®Òu o¸n ghĞt! BÇn t¨ng m¹o muéi khuyªn c¸c ng­¬i nªn tu söa PhËt tËp! Quay ®Çu lµ bê!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Nghe nãi Kim quèc ®ang muèn tiªu diÖt quı bang tËn gèc! Xin c¸c vŞ v« cïng thËn träng!")
	elseif (player_Faction == "shaolin") then
		Say("S­ ®Ö! S­ phô l¹i ph¸i ®Ö xuèng nói ­?",4,"V©ng! Nhê s­ huynh ®­a ®Ö vÒ nói!/return_yes","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin thay ta vÊn an s­ phô /no")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Xin chuyÓn lêi hái th¨m cu¶ bÇn t¨ng ®Õn §¹o NhÊt Ch©n Nh©n! Cã dŞp sÏ ®Õn ®Ó thØnh gi¸o ng­êi!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Ng­êi luyÖn vâ kş nhÊt lµ h¸m danh vµ ®è kŞ! A Di ®µ PhËt!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Quı gi¸o tuy ®­îc Kim quèc b¶o hé, nh­ng giang hå cã quy t¾c cña giang hå. Kh«ng ph¶i muèn lµm g× th× lµm.")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","D­íi sù l·nh ®¹o cña quı bang, d©n chóng ®· cã nh÷ng ngµy yªn b×nh h¹nh phóc! V¹n lÇn béi phôc! Béi phôc!")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn!  T¹i h¹ v« cïng béi phôc! ")
	else						-- Ö»Òª²»ÊôÓÚ10¸öÃÅÅÉ£¬²»ÔÙµ¥¶À¼ì²â¡°ÎŞÃÅÅÉ¡±
		UTask_sl = nt_getTask(7)
--		if (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_sl < 5*256) and (nt_getTask(3) == 70*256) then		-- ×ªÃÅÅÉÈÎÎñÆô¶¯
--			Say("ÉÙÁÖÂŞºº£ºÌìÏÂÎä¹¦³öÉÙÁÖ£¬±¾ÅÉÎä¹¦ÃûÃÅÕı×Ú£¬±¾ËÂÆßÇ§µÜ×Ó½ÔÒıÒÔÎª°Á¡£",2,"ÎÒÏë¸ÄÍ¶¹óÅÉÑ§ÒÕ/defection_get","Ã»ĞËÈ¤/defection_no")
		if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","ChØ cÇn hoµn thµnh nhiÖm vô nhËp m«n lµ cã thÓ trë thµnh huynh ®Ö tèt víi chóng ta!")
		elseif (UTask_sl >= 70*256) and (player_Faction ~= "shaolin") then					--ÒÑ¾­³öÊ¦
			Say("Th× ra lµ huynh ®Ö ®ång m«n! Kh«ng biÕt d¹o nµy thÕ nµo?",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(1,"enroll_select","ThiÕu l©m ph¸i lu«n ®­îc xem lµ Vâ l©m ®Ö nhÊt m«n ph¸i, mÖnh danh 'Th¸i s¬n b¾c ®Èu' cña Trung nguyªn vâ l©m")
		end
	end
end;

function defection_get()
	Talk(1,"","A di ®µ phËt! Huynh chØ cÇn thØnh cÇu quı bang D­¬ng bang chñ ®Ó rêi khái Thiªn v­¬ng bang, råi ®Õn bÈm b¸o víi HuyÒn Nh©n ph­¬ng tr­îng lµ cã thÓ nhËp ®Õn tÖ tù!")
	nt_setTask(7,5*256+10)
	Msg2Player("ChØ cÇn thØnh cÇu D­¬ng bang chñ ®Ó rêi khái Thiªn v­¬ng bang, råi ®Õn bÈm b¸o víi HuyÒn Nh©n ph­¬ng tr­îng lµ cã thÓ gia nhËp ThiÕu l©m!")
	AddNote("ChØ cÇn thØnh cÇu D­¬ng bang chñ ®Ó rêi khái Thiªn v­¬ng bang, råi ®Õn bÈm b¸o víi HuyÒn Nh©n ph­¬ng tr­îng lµ cã thÓ gia nhËp ThiÕu l©m!")
end

function defection_no()
	Talk(1,"","Vâ nghÖ bæn bang còng cã së tr­êng riªng kh«ng thua kĞm ThiÕu L©m! Ta nguyÖn trung thµnh víi D­¬ng bang chñ ")
end

function enroll_select()
	UTask_sl = nt_getTask(7)
	UTask_tw = nt_getTask(3)
	if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- ÒÑ½ÓÁËÈëÃÅÈÎÎñ
		Talk(1,"","Thiªn V­¬ng bang ®ang lµ c¸i gai trong m¾t Kim quèc! Ng­¬i chän nh­ thÕ ch­a h¼n lµ tèt!")
	elseif (GetSeries() == 0) and (GetCamp() == 0) and (UTask_tw < 5*256) and (UTask_sl < 5*256) then		--½ğÏµ¡¢Î´ÈëÌìÍõÉÙÁÖ
		if ((GetLevel() >= 10) and (HaveMagic(29) == -1)) then						--µÈ¼¶´ïµ½Ê®¼¶£¨²¢ÇÒÃ»Ñ§¹ı¡°Õ¶Áú¾ö¡±£©
			Say("ThiÕu L©m kh«ng hæ danh lµ danh m«n chİnh ph¸i! Huynh ®Ö cã muèn gia nhËp kh«ng?", 3, "Gia nhËp ThiÕu L©m ph¸i/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end		-- ²»ÊÇ½ğÏµµÄ¾Í²»ÔÙ¶àËµ»°ÁË¡£
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(103,51)		  			--ÉèÖÃÖØÉúµã
	nt_setTask(7,10*256)				-- Ö±½ÓÈëÃÅ
	SetFaction("shaolin")       			--Íæ¼Ò¼ÓÈëÃÅÅÉ
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	nt_setTask(137,67)
	SetLastFactionNumber(0)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(7,80*256)
--	SetRank(72)
--	Msg2Player("»¶Ó­Äã¼ÓÈëÉÙÁÖÅÉ£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_sl(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªnh b¹n gia nhËp ThiÕu L©m, trë thµnh T¶o §Şa t¨ng! Häc ®­îc Hµng Long BÊt Vò, Kim Cang Phôc Ma ")
	AddNote("Gia NhËp ThiÕu L©m ph¸i, trë thµnh T¶o §Şa t¨ng.")
	Msg2Faction("shaolin",GetName().."tõ h«m nay gia nhËp ThiÕu l©m, xin b¸i kiÕn c¸c vŞ huynh ®Ö! Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
---off--	NewWorld(103, 1845, 2983)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú

end;

function return_yes()
	NewWorld(103, 1845, 2983)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function sl_check_yes()			-- °´¼¼ÄÜÈ·¶¨ÈÎÎñ±äÁ¿µÄ¼ì²é¡£¡£¡£ÉĞÎ´ÏàÓ¦¸üĞÂ
	if (GetSeries() ~= 2) then
		Talk(1,"","Ngò hµnh cña ng­¬i kh¸c hÖ Kim víi bän ta!  §Õn ®©y lµm g×? H·y lªn diÔn ®µn häc hái ®i!")
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
	Say("S­ ®Ö! S­ phô l¹i ph¸i ®Ö xuèng nói ­?",2,"V©ng! Nhê s­ huynh ®­a ®Ö vÒ nói!/return_yes","Xin thay ta vÊn an s­ phô /no")
end

function Uworld1000_jiaoyushaolin()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn ThiÕu L©m b¶o b¹n ®· lµ ®Ö tö cña m«n ph¸i, cã thÓ trùc tiÕp ®i gÆp Long Ngò nãi chuyÖn.")
end

function no()
end;
