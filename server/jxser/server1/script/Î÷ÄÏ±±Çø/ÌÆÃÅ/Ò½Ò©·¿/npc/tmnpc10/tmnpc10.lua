--Î÷ÄÏ±±Çø\ÌÆÃÅ\Ò½Ò©·¿\npc\tmnpc10.lua
--description: ÌÆÃÅÌÆÒ° 40¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-13)
-- Update: xiaoyang(2004\4\13)  ¼ÓÈë90¼¶Îå¶¾ÈÎÎñ

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	Uworld124 = GetTask(124)
	if(GetFaction() == "tangmen") and (GetSeries() == 1) then
		if((UTask_tm == 40*256) and (GetLevel() >= 40) and (GetFaction() == "tangmen")) then		--40¼¶ÈÎÎñÆô¶¯
			Talk(4,"L40_get","Ta cã mét chuyÖn duy nhÊt mµ ®Õn nay vÉn ch­a hoµn thµnh! ThËt buån qu¸!", "L·o phu tõng cã ng­êi b¹n tªn C¶nh Tö Kú, 10 n¨m tr­íc, vî C¶nh Tö Kú m¾c bÖnh l¹ ®Õn xin cøu gióp. Nh­ng Bæn m«n cã quy ®Şnh kh«ng ph¶i lµ ng­êi trong §­êng M«n kh«ng ®­îc cøu ch÷a. BÊt luËn C¶nh Tö Kú cÇu xin l·o phu vÉn c­¬ng quyÕt kh«ng ra tay gióp ®ì, kÕt qu¶ kh«ng l©u sau vî h¾n qua ®êi, hai ta tõ ®ã trë mÆt thµnh thï.", "MÊy ngµy tr­íc, ta cã nhËn ®­îc 1 bøc th­ cña C¶nh Tö Kú, hÑn ta ra gÆp mÆt. Ta biÕt h¾n ®Õn t×m ta ®Ó b¸o thï, ta nî h¾n 1 m¹ng tr¶ l¹i h¾n còng kh«ng sao. ChØ lµ ta kh«ng mÆt mòi nµo gÆp l¹i cè nh©n! ", "S­ thóc! ChuyÖn nµy kh«ng thÓ tr¸ch ng­êi ®­îc, ng­êi nªn gi¶i thİch râ nguyªn nh©n víi «ng ta, ®Ó «ng ta hiÓu râ nçi khæ n¨m x­a cña ng­êi.")
		elseif(UTask_tm == 40*256+40) then 
			Talk(3, "L40_step44", "§­êng D· s­ thóc! Con g¸i cña C¶nh tiÒn bèi vµ mÑ c« ta cïng m¾c gièng mét chøng bÖnh, tİnh m¹ng ®ang nguy kŞch, nÕu S­ thóc cã thÓ cøu con cña «ng ta, «ng ta nhÊt ®Şnh sÏ kh«ng tr¸ch ng­êi n÷a!", "Nh­ng mµ m«n quy.....", "S­ thóc yªn t©m, ®Ö tö ®· nghÜ ra mét biÖn ph¸p hay. S­ thóc kh«ng cÇn ph¸ m«n quy mµ vÉn cã thÓ cøu ng­êi. ChØ cÇn cho §Ö tö biÕt ph­¬ng thuèc lµ ®­îc!")
		elseif(UTask_tm == 40*256+80) then
			Talk(4, "L40_prise", "Ph­¬ng thuèc mµ S­ thóc ®­a qu¶ nhiªn cã hiÖu qu¶, con g¸i cña C¶nh tiÒn bèi ®­îc cøu råi! ¤ng ta ®· kh«ng cßn tr¸ch ng­êi n÷a!", "ThËt kh«ng? ThÕ th× hay qu¸! Nh­ng con g¸i cña «ng ta kh«ng ph¶i lµ do ta cøu mµ lµ ng­¬i cøu, hiÓu ı ta chø?", "D¹ hiÓu! ViÖc nµy kh«ng liªn can ®Õn S­ thóc, lµ do §Ö tö lµm! ", "Ng­¬i qua nhiªn th«ng minh, l·o phu kh«ng nh×n lÇm ng­¬i, ha ha ha! ")
		elseif(UTask_tm > 40*256) and (UTask_tm < 40*256+60) then					--40¼¶ÈÎÎñÖĞÆÕÍ¨¶Ô»°
			Talk(1,"","<color=Red>C¶nh Tö Kú<color> Èn c­ ë <color=Red>phİa t©y Thanh Thµnh s¬n<color>.")
		elseif(UTask_tm >= 40*256+60) and (UTask_tm < 50*256) then					--ÉĞÎ´Íê³É40¼¶ÈÎÎñ
			Talk(1,"","D­îc liÖu cã 5 lo¹i:<color=Red>da cãc<color>, <color=Red>gan r¾n ®éc<color>,<color=Red>h¹t anh tóc<color>,<color=Red>®u«i rÕt ®éc<color>,<color=Red>®Çu thiªn tµm<color>. Nh÷ng d­îc liÖu nµy cã nhiÒu ë <color=Red>Thanh D­¬ng LÜnh<color> <color=Red>§«ng b¾c Thanh Thµnh s¬n<color>.")
		elseif(UTask_tm >= 50*256) and (GetFaction() == "tangmen") then					--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Ng­¬i ®· gióp l·o phu hãa gi¶i ©n o¸n 10 n¨m nay, thËt kh«ng biÕt sao ®Ó c¶m t¹!")
		else
			Talk(1,"","B¹n bÌ trë mÆt, thËt khiÕn ng­êi ta ®au lßng!")
		end
	elseif (Uworld124 == 20) and (HaveItem(385) == 1) then
		Talk (2,"Uworld_wdutask","§­êng tiªn sinh! ë ®©y cã bøc th­ xin ngµi xem qua!","Vøt nã ®i! Ta kh«ng thÌm xem!")
	elseif (Uworld124 == 20) then
		Msg2Player("Bøc th­ ph¶i ch¨ng ®· bŞ mÊt trªn ®­êng ®i, h·y ®i t×m thö. ")
	elseif (Uworld124 == 25) then
		Talk (15,"Uworld_wdutask2","ChuyÖn g× vËy?","TiÓu tö! Ng­¬i suıt mÊt m¹ng cã biÕt kh«ng?","Oh! T¹i h¹ ngu muéi!","NÕu nh­ ta kh«ng cã néi gi¸n trong Ngò §éc Gi¸o xem ra h«m nay bŞ tróng kÕ cña V©n l·o nhi råi. Cã ph¶i ®©y lµ bøc th­ V©n BÊt Tµ nhê ng­êi chuyÓn gióp kh«ng?","§óng vËy.","Haha! Ng­¬i tróng kÕ råi! Th­ nµy cã ®éc v« h×nh ®ã, bÒ ngoµi kh«ng thÊy g× hÕt nh­ng khi më ra sÏ lµm cho kinh m¹ch ®¶olén, V©n l·o nhi vèn dÜ muèn h¹i ta, kh«ng xem m¹ng sèng cña ng­¬i ra g× hÕt.","Huhu! Tİnh sao ®©y tiªn sinh?","§õng lo! V©n l·o nhi h¹i ta lµ v× ta th­êng cøu nh÷ng ng­êi mµ l·o h¹ ®éc. BÖnh cña ng­¬i giao cho l·o phu.","§­êng D· sö dông néi c«ng trŞ ®éc cho b¹n, b¹n cã c¶m gi¸c nh­ cã ngµn viªn bi b¾n ra xuèng ®Êt vËy.","§­êng D·: May lµ ph¸t hiÖn sím, kh«ng th× ng­¬i tiªu råi.","C¸m ¬n §­êng L·o gia.","Kh«ng ph¶i lµm c«ng kh«ng ®©u! Ng­¬i gióp ta ®em bøc th­ nµy vÒ bªn ®ã ta cã bá s½n thuèc ®éc kh¸c råi chØ cÇn ng­¬i nãi lµ ®· ph¸t hiÖn ra ©m m­u cña h¾n, h¾n sÏ giùt ngay bøc th­ xem ®Õn lóc Êy sÏ cã ng­êi ®Õn lÊy m¹ng cña h¾n.","V©n BÊt Tµ nu«i ®éc h¹i ng­êi nhÊt ®Şnh ta kh«ng tha cho h¾n ®©u.","Ng­¬i uèng thuèc gi¶i xong lªn ®­êng ngay ®i.","D¹!")
	elseif(Uworld124 == 30 ) and (HaveItem(386) == 0) then
		Talk (1,"","TiÓu tö nhµ ng­¬i, l¸ th­ ë ®ã, ®i ®­êng cÈn thËn, V©n l·o tÆc tuyÖt kh«ng dÔ ®èi phã ®©u. ") 
		AddEventItem(386)
		Msg2Player("NhËn l¹i th­ cña §­êng D· ")
	elseif(UTask_tm == 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Cã r¶nh ®Õn uèng r­îu víi l·o phu!")
	else										--Î´Íê³É40¼¶ÈÎÎñ£¨È±Ê¡¶Ô»°£©
		Talk(1,"","§­êng mç nµy ®· nãi mét lêi quyÕt kh«ng thay ®æi!")
	end
end;

function L40_step44()
	SetTask(2, 40*256+60)
	AddNote("Trë vÒ phßng Y D­îc gÆp §­êng D· s­, biÕt ®­îc ph­¬ng thuèc gåm cã: Da Cãc, Gan R¾n ®éc, §u«i RÕt ®éc vµ §Çu Thiªn tµm.")
	Msg2Player("§i Thanh Thµnh S¬n,  ®Õn Thanh D­¬ng Phong t×m d­îc liÖu")
	Talk(2,"", "ViÖc ®Õn n­íc nµy chØ ®µnh vËy, muèn trŞ bÖnh nµy cÇn cã 5 lo¹i ®éc vËt:<color=Red>da cãc<color>,<color=Red>gan r¾n ®éc<color>,<color=Red>vá anh tóc<color>,<color=Red> ®u«i bß c¹p ®éc<color>,<color=Red>®Çu con t»m<color>. LÊy ®éc trŞ ®éc.","5 lo¹i ®éc vËt nµy cã ë nhiÒu ë <color=Red>Thanh D­¬ng LÜnh<color> trªn <color=Red>§«ng B¾c Thanh Thµnh s¬n<color>. Nh­ng mµ ë ®ã th­êng cã <color=Red> H¾c ¦ng<color>,<color=Red>Hung thøu<color>,<color=Red>Linh §iªu<color> xuÊt hiÖn, ng­¬i ph¶i cÈn thËn!")
end;

function L40_get()
	Say("H¾n hËn ta thÊy chÕt kh«ng cøu, lµm g× nghe ta gi¶i thİch.", 2, "Hãa gi¶i ©n o¸n gi÷a hai ng­êi/L40_get_yes", "Ta kh«ng thÓ gióp g× ®­îc/L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","<color=Red>C¶nh Tö Kú<color> cø Èn c­ ë <color=Red> phİa t©y Thanh Thµnh s¬n<color>.")
	SetTask(2, 40*256+20)
	AddNote("T¹i phßng Y D­îc gÆp §­êng D·, nhËn <color=red> nhiÖm vô C¶nh Tö Kú<color>, hãa gi¶i ©n o¸n gi÷a §­êng D· vµ C¶nh Tö Kú.")
	Msg2Player("NhËn nhiÖm vô C¶nh Tö Kú tõ §­êng D·: Hãa gi¶i ©n o¸n gi÷a §­êng D· vµ C¶nh Tö Kú.")
end;

function L40_get_no()
end;

function L40_prise()
	SetRank(29)
	SetTask(2, 50*256)
--	AddMagic(345)
	add_tm(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®· ®­îc th¨ng lµm ®Ö tö NhËp C¸c! Cã thÓ häc vâ c«ng Hµn B¨ng Thİch cña §­êng M«n. ")
	AddNote("§Õn phßng thuèc §­êng m«n, phôc mÖnh §­êng D·, hoµn thµnh nhiÖm vô C¶nh Tö Kú, th¨ng lµm ®Ö tö NhËp C¸c. ")
end;

function Uworld_wdutask()
	DelItem(385)
	Msg2Player("B¹n nĞm bá th­ cña V©n BÊt Tµ ")
	SetTask(124,25)
end

function Uworld_wdutask2()
	AddEventItem(386)
	Msg2Player("ChÊt ®éc ®· gi¶i hÕt, nhËn ®­îc th­ cña §­êng D·, giao cho V©n BÊt Tµ ")
	AddNote("§em th­ tr¶ lêi cña §­êng D· giao cho V©n BÊt Tµ. ")
	SetTask(124,30)
end
