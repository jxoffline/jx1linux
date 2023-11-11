-- ¸÷ÃÅÅÉ½ÓÒıµÜ×Ó½Å±¾¡¡À¥ÂØ
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "C«n L«n Hé Ph¸p"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 9 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyukunlun","Ng­¬i ®· lµ ®Ö tö cña bæn ph¸i, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu¶ ®óng lµ mü n÷! Ng­êi xø T©y B¾c khæ hµn khã mµ s¸nh ®­îc! ")
	elseif (player_Faction == "emei") then				
		Talk(1,"","N÷ l­u th× nªn häc c¸ch ch¨m sãc chång con! Vung g­¬m móa kiÕm ch¼ng ra thÓ thèng g×!  §óng lµ thêi thÕ ®¶o lo¹n! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","§­êng m«n ¸m khİ lµm sao cã thÓ so s¸nh víi chó thuËt ®¹o ph¸p thiªn t«n cña bän ta! ")
	elseif (player_Faction == "wudu") then
		Talk(1,"","A! Tµ ma ngo¹i ®¹o l¹i d¸m xuÊt hiÖn ë ®©y! H·y xem thanh kiÕm cña l·o gia ®©y! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Thiªn v­¬ng bang tuy hiÖn nay kh¸ m¹nh, nh­ng do mét n÷ l­u l·nh ®¹o!  Råi còng cã ngµy lµm tiªu tan c¬ nghiÖp")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Ai còng b¶o ThiÕu l©m lµ vâ häc chİnh t«ng nh­ng s¸nh sao ®­îc víi Thiªn s­ ®¹o thuËt cña C«n L«n ta?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Hai ph¸i chóng ta cïng thuéc ®¹o gia!  ViÖc g× cø ph¶i ph©n tranh cao thÊp! ")
	elseif (player_Faction == "kunlun") then
		Say("ThÕ giíi ngoµi kia t­¬i ®Ñp chø kh«ng nh­ xø T©y b¾c khæ hµn nµy! Cã muèn ®i vÒ kh«ng?",4,"VÒ th«i! §a t¹ ®¹o huynh! /return_yes","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Ch¬i vui nh­ thÕ nµy, vÒ sím lµm g×?/no")
	elseif (player_Faction == "tianren") then
		Talk(1,"","DiÖt s¹ch cÈu Kim chİnh lµ bæn phËn c¶ ®êi ta!  L¹i ®©y nÕm thö mét kiÕm cña l·o gia nµo! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","C¸i bang anh hïng!  Hõ!  Thùc chÊt chØ lµ mét bän « hîp ch¶ ra g×! ")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn!  T¹i h¹ v« cïng béi phôc! ")
	else						-- Ö»Òª²»ÊôÓÚ10¸öÃÅÅÉ£¬²»ÔÙµ¥¶À¼ì²â¡°ÎŞÃÅÅÉ¡±
		UTask_kl = nt_getTask(9)
--		if (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_kl < 5*256) and (nt_getTask(5) == 70*256) then		-- ×ªÃÅÅÉÈÎÎñÆô¶¯
--			Say("À¥ÂØ»¤·¨£º¸ú×ÅµÀÒ»ÀÏ¶ùÓĞÊ²Ã´ºÃ»ìµÄÂï£¬µÀÒ»ÄÇÀÏ¼Ò»ïËÄËê²Å»áËµ»°£¬ÆßËê»¹Äò¿ã×Ó£¬ÄãÏëÄã¸ú×ÅËûÓĞÊ²Ã´Ç°Í¾£¡²»ÈçÀ´ÎÒÃÇÀ¥ÂØÅÉËãÁË£¬Ïó¸ç¸çÎÒÕâÑùÏÉ·çµÀ¹Ç£¬ÄÑµÀÄã²»ÏÛÄ½Âğ£¿",2,"àÅ...¿ÉÒÔ¿¼ÂÇ/defection_get","ÔìÒ¥·Ì°ù£¬ÕĞÒ¡×²Æ­Ö®Í½£¬ÎÒÅŞ£¡/no")
		if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","Bæn ph¸i kh«ng nhËn nh÷ng kÎ l­êi biÕng!  Tr­íc tiªn h·y hoµn thµnh nhiÖm vô nhËp m«n, sau h·y tİnh! ")
		elseif (UTask_kl >= 70*256) and (player_Faction ~= "kunlun") then					--ÒÑ¾­³öÊ¦
			Say("Nghe nãi sau khi ng­¬i xuèng nói ®· lËp chót c«ng danh, cã nhí ®Õn s­ ®Ö s­ muéi chóng ta kh«ng?",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(1,"enroll_select","C«n L«n ph¸i ë T©y Vùc xa x«i, rÊt İt giao h¶o víi Trung Nguyªn. Tr¶i qua mÊy ®êi ch­ëng m«n ®· dÇn trë thµnh mét trong NhÊt ®¹i m«n ph¸i. ")
		end
	end
end;

function defection_get()
	Talk(1,"","Ng­¬i míi lµ anh hïng thøc thêi!  H·y mau ®i nãi víi l·o §¹o nhi, sau ®ã ®Õn diÖn kiÕn ch­ëng m«n TuyÒn C¬ Tö cña ta ®Ó xin nhËp m«n! ")
	nt_setTask(9,5*256+10)
	Msg2Player("Muèn gia nhËp C«n L«n ph¸i, h·y ®i xin phĞp §¹o NhÊt Ch©n Nh©n, sau ®ã ®Õn diÖn kiÕn ch­ëng m«n TuyÒn C¬ Tö lµ ®­îc!")
	AddNote("Muèn gia nhËp C«n L«n ph¸i, h·y ®i xin phĞp §¹o NhÊt Ch©n Nh©n, sau ®ã ®Õn diÖn kiÕn ch­ëng m«n TuyÒn C¬ Tö lµ ®­îc!")
end

function enroll_select()
	UTask_kl = nt_getTask(9)
	UTask_wd = nt_getTask(5)
	if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- ÒÑ½ÓÁËÎäµ±ÈëÃÅÈÎÎñ
		Talk(1,"","Th× ra ng­¬i vèn muèn gia nhËp Vâ §ang!  Còng tèt th«i!  Nh©n sÜ Trung nguyªn thİch sïng b¸i c¸c danh m«n chİnh ph¸i")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_wd < 5*256) and (UTask_kl < 5*256) then		--Ë®Ïµ¡¢Î´ÈëÎäµ±À¥ÂØ
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("Bæn m«n tinh th«ng ®¹o chó kiÕm thuËt. Bän Vâ §ang  lµ c¸i thø g× chø!  Cã muèn gia nhËp bæn ph¸i kh«ng?", 3, "Gia nhËp C«n L«n/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm qu¸!  H·y luyÖn ®Õn cÊp 10 ®i råi ®Õn t×m ta! ")
		end
	end		-- ²»ÊÇÍÁÏµµÄ¾Í²»ÔÙ¶àËµ»°ÁË¡£
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(131,57)		  				-- µÈ´ıÌá¹©ÖØÉúµã
	nt_setTask(9,10*256)						-- Ö±½ÓÈëÃÅ
	SetFaction("kunlun")      			-- Íæ¼Ò¼ÓÈëÀ¥ÂØ
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	nt_setTask(137,69)
	SetLastFactionNumber(9)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(9,80*256)
--	SetRank(75)
--	Msg2Player("»¶Ó­Äã¼ÓÈëÎäµ±ÅÉ£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_kl(GetLevel())			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªnh b¹n gia nhËp C«n L«n ph¸i. Trë thµnh PhÊt trÇn ®Ö tö! Häc ®­îc H« Phong Ph¸p, Cuång L«i ChÊn §Şa")
	AddNote("Gia nhËp C«n L«n ph¸i, trë thµnh PhÊt TrÇn ®Ö tö.")
	Msg2Faction("kunlun",GetName().."tõ h«m nay gia nhËp C«n L«n ph¸i! Xin b¸i kiÕn c¸c vŞ ®¹o huynh s­ tû! Mong c¸c vŞ quan t©m chØ gi¸o!",GetName())
---off--	NewWorld(131, 1582, 3175)			-- µÈ´ıÌá¹©×ø±ê

end;

function return_yes()
	NewWorld(131, 1582, 3175)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function kl_check_yes()			-- °´¼¼ÄÜÈ·¶¨ÈÎÎñ±äÁ¿µÄ¼ì²é¡£¡£¡£ÉĞÎ´ÏàÓ¦¸üĞÂ
	if (GetSeries() ~= 2) then
		Talk(1,"","Ngò hµnh cña ng­¬i kh¸c víi bän ta!  §Õn ®©y lµm g×? H·y lªn diÔn ®µn häc hái thªm!")
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
	Say("ThÕ giíi ngoµi kia t­¬i ®Ñp chø kh«ng nh­ xø T©y b¾c khæ hµn nµy! Cã muèn ®i vÒ kh«ng?",2,"VÒ th«i! §a t¹ ®¹o huynh! /return_yes","Ch¬i vui nh­ thÕ nµy, vÒ sím lµm g×?/no")
end

function Uworld1000_jiaoyukunlun()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn C«n L«n ph¸i b¶o b¹n kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn")
end

function no()
end;
