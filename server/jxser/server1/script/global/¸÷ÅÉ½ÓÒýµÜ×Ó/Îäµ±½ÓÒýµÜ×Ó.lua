-- Îäµ±½ÓÒıµÜ×Ó Ä£°å Îäµ±µÀÈË
-- By: Dan_Deng(2003-10-28) ÓÉÈËÎï¶Ô»°ĞŞ¸Ä¶øÀ´
-- Update: Dan_Deng(2004-05-25) Ìå·ş¼¼ÄÜÈ«¿ªĞŞ¸Ä£¨µ÷ÓÃÍâ²¿ÎÄ¼ş·½Ê½£©
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Vâ §ang §¹o Nh©n"

function default_talk()
	check_WDtask()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 8 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudang","Ng­¬i ®· lµ ®Ö tö cña bæn ph¸i, kh«ng cÇn ®i n÷a, cã thÓ trùc tiÕp gÆp Long Ngò nãi chuyÖn.")
	elseif (player_Faction == "emei") then
		Talk(1,"","Nga My n÷ hiÖp! TiÓu ®¹o xin kİnh lÔ! S­ phô Thanh HiÓu S­ Th¸i cã kháe kh«ng?")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","TiÓu ®¹o rÊt béi phôc c«ng phu Thóy Yªn m«n! Kh«ng biÕt c« n­¬ng cã g× chØ gi¸o!?")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Tuy ch­ëng m«n quı ph¸i tİnh t×nh nãng n¶y, hµnh sù kh«ng theo qui t¾c, nh­ng rÊt th¼ng th¾n! Kh«ng hæ danh ch©n qu©n tö!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","B¶n lÜnh dïng ®éc cao siªu th× cuèi cïng còng lµ h¹ ®¼ng ®ª hÌn! Kh«ng cã tinh thÇn vâ häc!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Sím nghe nãi huynh ®Ö Thiªn v­¬ng bang ai còng lµ anh hïng h¶o h¸n! H«m nay gÆp mÆt qu¶ nhiªn danh bÊt h­ truyÒn!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Th× ra lµ tiÓu s­ phô ThiÕu l©m! Kh«ng biÕt cã g× chØ gi¸o!")
	elseif (player_Faction == "wudang") then
		Say("Ta lu«n nhí vÒ s­ phô! ¤ng Êy kh«ng biÕt cã kháe kh«ng!?",4,"Nhê s­ huynh ®­a ta vÒ nói!/return_yes","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","S­ phô lµ ng­êi ®¸ng kİnh!/no")
--		Say("Îäµ±µÀÈË£º²»ºÃÒâË¼£¬ÒòÎªÓĞĞ©ÈËµÄÈÎÎñ×´Ì¬²»ÕıÈ·£¬ÎÒÃÇÕıÔÚÖØĞÂÎªÃÅÏÂµÜ×Ó½øĞĞ¼ì²é¡£ÄãÒª¼ì²éÄãµÄÈÎÎñ×´Ì¬Âğ£¿Èç¹ûÄãÈÏÎªÄãµÄ×´Ì¬ÊÇÕıÈ·µÄ¾Í²»±Ø¼ì²éÁË¡£",2,"¼ì²é/wd_check_yes","²»ÓÃÁË/wd_check_no")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Th× ra lµ ®Ö tö C«n L«n ph¸i! Kh«ng biÕt cã g× chØ gi¸o!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","KÎ ¨n mµy nµy vèn tõ l©u ng­ìng mé Nga My kiÕm thuËt. H«m nay ®­îc gÆp n÷ hiÖp ®©y, thËt tháa lßng mong ­íc!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Bang chñ cña quı bang vµ ch­ëng m«n cña tÖ ph¸i vèn lµ b»ng h÷u tri giao! Quı bang cã viÖc g× tÖ ph¸i nhÊt ®Şnh lËp tøc gióp ®ì!")
	elseif (nt_getTask(75) == 255) then		-- Ñ§ÁËÒ°ÇòÈ­µÄ£¬²»ÔÊĞíÔÙÈëÃÅÅÉ
		Talk(1,"","Tù häc khæ luyÖn! T¹i h¹ v« cïng béi phôc!")
	else
		UTask_wd = nt_getTask(5)
		if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- ÈëÃÅÈÎÎñÖĞ
			Talk(1,"","Ng­¬i ®· tiÕp nhËn nhiÖm vô nhËp m«n nh­ng vÉn ch­a hoµn thµnh! H·y mau t×m vÒ cho Thanh Phong chiÕc thïng bŞ r¬i xuèng giÕng!")
		elseif (UTask_wd >= 70) and (player_Faction ~= "wudang") then					--ÒÑ¾­³öÊ¦
			Say("Tuy ng­¬i ®· xuÊt s­ nh­ng chóng ta vÉn th­êng nhí ®Õn! D¹o nµy cã kháe kh«ng?",3,"T×m hiÓu së tr­êng luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","KÕt thóc ®èi tho¹i/no")
		else
			Talk(3, "select", "Thiªn h¹ vâ häc, B¾c t«n ThiÕu l©m, nam sïng Vâ §ang. Ch¾c ng­¬i ®· tõng nghe qua?", "Vâ c«ng bæn ph¸i lÊy tÜnh chÕ ®éng, lÊy nhu kh¾c c­¬ng, lÊy ng¾n th¾ng dµi, lÊy chËm ®¸nh nhanh, lÊy ı vËn khİ, lÊy khİ vËn th©n, ®¸nh sau tíi tr­íc. Khiªm tèn ®iÒm ®¹m, lÊy v« h×nh th¾ng h÷u h×nh, ®ã lµ c¶nh giíi vâ häc tèi cao!", "Vâ nghÖ bæn m«n cã 'ngò bÊt truyÒn': yÕu ®uèi, hiÓm ®éc, h¸o th¾ng, cuång töu, gian d©m sÏ kh«ng truyÒn vâ c«ng")
		end
	end
end;

function select()
	UTask_wd = nt_getTask(5)
	UTask_kl = nt_getTask(9)
	if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- ÒÑ½ÓÁËÀ¥ÂØÈëÃÅÈÎÎñ
		Talk(1,"","Th× ra ng­¬i vèn muèn ®Õn C«n L«n häc phï ph¸p ®¹o thuËt!")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_kl < 5*256) and (UTask_wd < 5*256) then		--»ğÏµ¡¢Î´ÈëÀ¥ÂØÎäµ±
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("NÕu muèn gia nhËp bæn ph¸i ph¶i thay ®æi t©m tİnh, chuyÓn t©m tu hµnh, t­¬ng lai cã rÊt nhiÒu c¬ héi chê ®ãn ng­¬i!", 3, "Gia nhËp Vâ §ang/go", "§Ó ta suy nghÜ kü l¹i xem/no","T×m hiÓu tinh hoa vâ nghÖ c¸c m«n ph¸i/Uworld1000_knowmagic")
		else
			Say("C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn <color=Red>cÊp 10<color> l¹i ®Õn t×m ta", 0)
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(81,40)	 					--ÉèÖÃÖØÉúµã
	nt_setTask(5, 10*256)
	SetFaction("wudang")      				--Íæ¼Ò¼ÓÈëÎäµ±
	SetCamp(1)
	SetCurCamp(1)
	SetRank(7)
	nt_setTask(137,65)
	SetLastFactionNumber(8)
-- Ö±½Ó´¦ÀíÁ÷³Ì
--	nt_setTask(5,80*256)
--	SetRank(73)
--	Msg2Player("»¶Ó­Äã¼ÓÈëÎäµ±ÅÉ£¬²âÊÔÖĞÖ±½ÓÑ§»á±¾ÃÅËùÓĞ¼¼ÄÜ¡£")
	add_wd(GetLevel())		-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
-- ½áÊø
	Msg2Player("Hoan nghªn b¹n gia nhËp Vâ §ang ph¸i! H·y b¾t ®Çu tõ mét §¹o ®ång! Häc ®­îc vâ c«ng Né L«i ChØ, Th­¬ng h¶i Minh NguyÖt!")
	AddNote("gia nhËp Vâ §ang ph¸i, trë thµnh §¹o ®ång!")
	Msg2Faction("wudang",GetName().."tõ h«m nay gia nhËp Vâ §ang ph¸i, tr­íc tiªn ®Õn b¸i kiÕn c¸c vŞ s­ huynh, s­ tû!",GetName())
---off--	NewWorld(81, 1574, 3224)				--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú

end;

function return_yes()
	NewWorld(81, 1574, 3224)			--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
end;

function wd_check_yes()
	if (GetSeries() ~= 4) then
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· cã thÓ ®i nhËn nhiÖm vô xuÊt s­.")
	elseif (HaveMagic(164) >= 0) then		-- ×öÍêÁË50¼¶ÈÎÎñ,°ş¼°¶ø¸´
		nt_setTask(5,60*256)
		Talk(1,"","Ta ®· phôc håi l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i! B©y giê ng­¬i cã thÓ ®i nhËn nhiÖm vô xuÊt s­ ")
	elseif (HaveMagic(161) >= 0) then		-- ×öÍêÁË40¼¶ÈÎÎñ,Á½ÒÇĞÄ·¨
		nt_setTask(5,50*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 40.")
	elseif (HaveMagic(158) >= 0) then		-- ×öÍêÁË30¼¶ÈÎÎñ,½£·É¾ªÌì
		nt_setTask(5,40*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 30.")
	elseif (HaveMagic(156) >= 0) then		-- ×öÍêÁË20¼¶ÈÎÎñ,´¿ÑôĞÄ·¨
		nt_setTask(5,30*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 20.")
	elseif (HaveMagic(151) >= 0) then		-- ×öÍêÁË10¼¶ÈÎÎñ,Îäµ±½£·¨
		nt_setTask(5,20*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· hoµn thµnh nhiÖm vô cÊp 10.")
	else
		nt_setTask(5,10*256)
		Talk(1,"","Ta ®· chØnh lı l¹i tr¹ng th¸i nhiÖm vô cña ng­¬i. Ng­¬i ®· cã thÓ nhËn nhiÖm vô cÊp 10.")
	end
end

function wd_check_no()
	Say("Ta lu«n nhí vÒ s­ phô! ¤ng Êy kh«ng biÕt cã kháe kh«ng!?",2,"Nhê s­ huynh ®­a ta vÒ nói!/return_yes","S­ phô lµ ng­êi ®¸ng kİnh!/return_no")
end

function check_WDtask()
	if (nt_getTask(5) == 30*256+50) then		-- ÈÎÎñ±äÁ¿´íÎó
		if (GetFaction() == "wudang") then		-- Î´³öÊ¦ÖØ×öËùÓĞÈÎÎñ
			nt_setTask(5,10*256)
			Say("D÷ liÖu cña ng­¬i cã chót sai sãt! Ng­¬i h·y chŞu khã thùc hiÖn l¹i nhiÖm vô cÊp 10 nhĞ!",1,"Xin ®a t¹ /no")
		elseif (HaveMagic(164) >= 0) then			-- ÒÑ³öÊ¦(Ñ§»áÁË¡°°ş¼°¶ø¸´¡±²¢ÇÒ²»ÔÚÃÅÅÉÖĞ)µÄÉèÎªÕı³£³öÊ¦
			nt_setTask(5,70*256)
			Say("D÷ liÖu cña ng­¬i cã chót sai sãt! Ta ®· gióp ng­¬i chØnh söa! HiÖn giê ng­¬i ®· xuÊt s­!",1,"Xin ®a t¹ /no")
		else										-- ÆäËüÉèÎªÎ´ÈëÎäµ±ÅÉ
			nt_setTask(5,0)
			Say("D÷ liÖu cña ng­¬i cã chót sai sãt! B©y giê ng­¬i ®ang trong t×nh tr¹ng ch­a gia nhËp m«n ph¸i",1,"Xin ®a t¹ /no")
		end
	end
end

function Uworld1000_jiaoyuwudang()
	nt_setTask(1000,260)
	Msg2Player("§Ö tö tiÕp dÉn Vâ §ang b¶o b¹n ®· lµ ®Ö tö cña m«n pahİ, cã thÓ trùc tiÕp ®i gÆp Long Ngò nãi chuyÖn.")
end



function no()
end;
