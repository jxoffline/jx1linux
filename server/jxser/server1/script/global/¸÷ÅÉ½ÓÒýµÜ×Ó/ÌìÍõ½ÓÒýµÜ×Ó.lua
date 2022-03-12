-- ÌìÍõ½ÓÒıµÜ×Ó Ä£°å ÌìÍõ½«Áì
-- By: Dan_Deng(2003-10-28) ÓÉÈËÎï¶Ô»°ĞŞ¸Ä¶øÀ´
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )

npc_name = "Thiªn V­¬ng T­íng LÜnh"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 1 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianwang","Ng­¬i ®· lµ ®Ö tö cña bæn gi¸o, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh HiÓu S­ Th¸i cña quı ph¸i tinh th«ng phËt häc, vâ nghÖ cao c­êng, bæn m«n ng­ìng mé ®· l©u!")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","N÷ nh©n vèn ®· phiÒn, n÷ nh©n biÕt vâ c«ng l¹i cµng phiÒn h¬n! Ng­êi cña quı ph¸i chóng ta kh«ng d¸m trªu vµo!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng­êi häc vâ cÇn ph¶i quang minh lçi l¹c! Ta ghĞt nhÊt bän ng­êi dïng ¸m khİ h¹ ®éc thñ ng­êi kh¸c!")
	elseif (player_Faction == "wudu") then				
		Talk(1,"","Tuy bæn bang kh«ng mª muéi tİn nhiÖm bÊt cø danh m«n chİnh ph¸i nµo nh­ng còng coi khinh bän h¹ ®éc ®ª hÌn!")
	elseif (player_Faction == "shaolin") then				
		Talk(1,"","C«ng phu ThiÕu L©m th× cã g× hay ho? Hßa th­îng ®äc kinh giái míi lµ ®óng, häc ng­êi ta ®¸nh nhau ®Ó lµm gi?")
	elseif (player_Faction == "wudang") then				
		Talk(1,"","Xin chuyÓn lêi hái th¨m cña t¹i h¹ ®Õn §¹o NhÊt Ch©n Nh©n! Cã dŞp sÏ ®Õn ®Ó thØnh gi¸o ng­êi!")
	elseif (player_Faction == "kunlun") then				
		Talk(1,"","Quı ph¸i gÇn ®©y ph¸t triÓn thÇn tèc! Qu¶ kh«ng ph¶i h­ danh! Nh­ng còng ®õng qu¸ xem th­êng vâ l©m Trung nguyªn!")
	elseif (player_Faction == "tianren") then				
		Talk(1,"","Chóng ta quyÕt kh«ng giao h¶o víi bän ng­êi Kim!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Quı bang vµ bæn bang hîp thµnh Thiªn h¹ l­ìng ®¹i bang, cã c¬ héi chóng ta nªn th©n thiÕt h¬n n÷a")
	elseif (player_Faction == "tianwang") then
		Say("Huynh ®Ö! Cã muèn ta ®­a vÒ ®¶o kh«ng?",4,"§­îc! §a t¹ huynh ®µi!/return_yes", "T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Kh«ng cÇn ®©u! §a t¹!  /no")
--		Say("ÌìÍõ½«Áì£º²»ºÃÒâË¼£¬ÒòÎªÓĞĞ©ÈËµÄÈÎÎñ×´Ì¬²»ÕıÈ·£¬ÎÒÃÇÕıÔÚÖØĞÂÎªÃÅÏÂµÜ×Ó½øĞĞ¼ì²é¡£ÄãÒª¼ì²éÄãµÄÈÎÎñ×´Ì¬Âğ£¿Èç¹ûÄãÈÏÎªÄãµÄ×´Ì¬ÊÇÕıÈ·µÄ¾Í²»±Ø¼ì²éÁË¡£",2,"¼ì²é/tw_check_yes","²»ÓÃÁË/tw_check_no")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn! T¹i h¹ v« cïng béi phôc!")
	else						-- Ö»Òª²»ÊôÓÚ10¸öÃÅÅÉ£¬²»ÔÙµ¥¶À¼ì²â¡°ÎŞÃÅÅÉ¡±
		UTask_tw = nt_getTask(3)
--		if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
--			Talk(1,"","ÌìÍõ½«Áì£ºÄãÒÑ¾­ÔÚÌìÍõµºËïµÀÁì´¦½ÓÁË±¾°ïµÄÈëÃÅÈÎÎñ£¬µ«ÊÇÉĞÎ´Íê³É£¬ÄãĞèÒªÈ¥°ÍÁêÏØ¾Æ¹İÂòµ½ÃÀ¾Æ¡°ÅîÀ³´º¡±")
		if (UTask_tw >= 70*256) then					--ÌìÍõ°ï³öÊ¦
			Say("H¶o huynh ®Ö! Chóng ta l¹i gÆp nhau råi! Cã c¬ héi ta sÏ uèng r­îu cïng nhau!",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		elseif (UTask_tw == 5*256+80) and (GetByte(nt_getTask(38),1) == 127) then		-- ÌìÍõ¼ÇÃûÍê³É£¬µ«ÊÇÓĞBUGµÄÈËµÄĞŞ²¹
			Talk(1,"","ThËt xin lçi! Lóc ng­¬i tiÕn hµnh nhiÖm vô Kı danh ®Ö tö, chóng ta ghi ghĞp cã sai sãt! Nh­ng b©y giê ®· söa l¹i råi")
			if (HaveMagic(29) >= 0) then		-- Ñ§»áÁËÕ¶Áú¾÷µÄ£¨±¾ÃÅµÜ×Ó£©£¬ÉèÖÃÎªÒÑ³öÊ¦
				nt_setTask(3,70*256)
			else										-- ·ñÔò¾ÍÇåÁã£¬°üÀ¨ÒÔÇ°ÅÑµ½ÉÙÁÖµÄ¡£
				nt_setTask(3,0)
			end
		else
			Talk(3, "select", "Bang chñ D­¬ng Anh vâ nghÖ cao c­êng, gan d¹ h¬n ng­êi, kh«ng kĞm g× tu mi nam tö!", "Bæn m«n quy luËt uy nghiªm, ng­êi ®«ng thÕ m¹nh! Kh«ng ai trong thiªn h¹ d¸m coi khinh!", "Bæn bang võa chèng Kim võa kh¸ng Tèng! Huynh ®Ö ®Òu xuÊt th©n lµ d©n nghÌo, phiªu b¹t giang hå lµ v× kÕ sinh nhai! Ai lµm vua bän ta ch¶ cÇn quan t©m")
		end
	end
end;

function select()
	UTask_tw = nt_getTask(3)
	UTask_sl = nt_getTask(7)			-- ÔİÊ±²»ÔÊĞíÖØ·µÉÙÁÖÔÙÖØ·µÌìÍõ¡£
	if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- ÒÑ½ÓÁËÉÙÁÖÈëÃÅÈÎÎñ
		Talk(1,"","Tuy huynh ®Ö gia nhËp ph¸i ThiÕu l©m nh­ng r¶nh rçi vÉn cã thÓ ®Õn Thiªn v­¬ng bang lµm kh¸ch!")
	elseif (GetCamp() == 0) and (GetSeries() == 0) and (UTask_sl < 5*256) and (UTask_tw < 5*256) then		--½ğÏµ¡¢Î´ÈëÉÙÁÖÌìÍõ
		if (GetLevel() >= 10) then					--µÈ¼¶´ïµ½Ê®¼¶
			Say("Gia nhËp bæn bang, chóng ta sÏ lµ huynh ®Ö mét nhµ, häa phóc cïng h­ëng!", 3, "Gia nhËp Thiªn V­¬ng Bang/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn <color=Red>cÊp 10<color> l¹i ®Õn t×m ta!")
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(59,21)	  				--ÉèÖÃÖØÉúµã
	nt_setTask(3, 10*256)
	SetFaction("tianwang")       			--Íæ¼Ò¼ÓÈëÌìÍõ°ï
	SetCamp(3)
	SetCurCamp(3)
	SetRank(43)
	nt_setTask(137,63)
	SetLastFactionNumber(1)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(3,80*256)
--	SetRank(69)
--	Msg2Player("»¶Ó­Äã¼ÓÈëÌìÍõ°ï£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_tw(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªnh b¹n gia nhËp Thiªn V­¬ng bang! H·y khëi ®Çu tõ mét ng­êi ThŞ vÖ!")
	Msg2Player("Häc ®­îc vâ c«ng Kinh L«i Tr¶m, Håi Phong L¹c Nh¹n, Tr¶m Long QuyÕt")
	AddNote("Gia nhËp Thiªn V­¬ng Bang, trë thµnh ThŞ VÖ.")
	Msg2Faction("tianwang",GetName().." tõ h«m nay gia nhËp Thiªn V­¬ng bang, xin b¸i kiÕn c¸c vŞ huynh ®Ö! Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
---off--	NewWorld(59,1552,3188)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function return_yes()
	NewWorld(59, 1425, 3472)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function tw_check_yes()
	if (GetSeries() ~= 0) then
		Talk(1,"","Ngò hµnh cña ng­¬i kh¸c hÖ Kim víi bän ta! §Õn ®©y lµm g×? H·y lªn diÔn ®µn häc hái ®i!")
	elseif (HaveMagic(41) >= 0) then		-- ×öÍêÁË50¼¶ÈÎÎñ,ÑªÕ½°Ë·½
		nt_setTask(3,60*256)
		Talk(1,"","Ta ®· phôc håi l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i! B©y giê ng­¬i cã thÓ ®i nhËn nhiÖm vô xuÊt s­ ")
	elseif (HaveMagic(37) >= 0) then		-- ×öÍêÁË40¼¶ÈÎÎñ,ÆÃ·çÕ¶
		nt_setTask(3,50*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 40.")
	elseif (HaveMagic(36) >= 0) then		-- ×öÍêÁË30¼¶ÈÎÎñ,ÌìÍõÕ½Òâ
		nt_setTask(3,40*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 30.")
	elseif (HaveMagic(33) >= 0) then		-- ×öÍêÁË20¼¶ÈÎÎñ,¾²ĞÄ¾÷
		nt_setTask(3,30*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 20.")
	elseif (HaveMagic(23) >= 0) then		-- ×öÍêÁË10¼¶ÈÎÎñ,ÌìÍõÇ¹·¨
		nt_setTask(3,20*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 10.")
	else
		nt_setTask(3,10*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· cã thÓ nhËn nhiÖm vô cÊp 10.")
	end
end

function tw_check_no()
	Say("Huynh ®Ö! Cã muèn ta ®­a vÒ ®¶o kh«ng?",2,"§­îc! §a t¹ huynh ®µi!/return_yes","Kh«ng cÇn ®©u! §a t¹!  /return_no")
end


function Uworld1000_jiaoyutianwang()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn Thiªn V­¬ng b¶o b¹n ®· lµ ®Ö tö cña bang ph¸i, cã thÓ trùc tiÕp ®i gÆp Long Ngò nãi chuyÖn.")
end


function no()
end;


