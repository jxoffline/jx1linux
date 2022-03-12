--description: ÌìÍõ°ïÓÒÊ¹Ñîºş¡¡ÌìÍõ20¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-16)
-- by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()
	UTask_tw = GetTask(3)
	Uworld121 = GetTask(121)
--	if (UTask_tw == 70*256) and (Uworld121 == 245) then		-- °×Ãû×öÍê90¼¶ÈÎÎñºóÓÖÈëÁËÌìÍõµÄ£¬Ö±½Ó¸ø¼¼ÄÜ
--		Talk(1,"","Ñîºş£ºĞ¡ĞÖµÜ¹ûÈ»Ó¢ĞÛ³öÖÚ£¬ÕâÀïÓĞÌìÍõÃØóÅÒ»²¿£¬ÔÚÄãÊÖÖĞ¶¨ÄÜ·¢Ñï¹â´ó¡£")
--  	AddMagic("ÆÆÌìÕ¶")
--		AddMagic("×··ç¾÷")
--		AddMagic("×·ĞÇÖğÔÂ")
--   	Msg2Player("»ñµÃÌìÍõ¼¼ÄÜÆÆÌìÕ¶¡¢×··ç¾÷¡¢×·ĞÇÖğÔÂ")
--   	SetTask(121,255)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 20*256+50) and (HaveItem(92) == 1 ) then	-- Ö»¼ì²âµÀ¾ß£¬ÈôµÀ¾ß¶ªÊ§Ö»ÒªÖØ´ò×îºóÒ»¸öÍÁ·Ë¾Í¿ÉÖØĞÂ´ò³ö¡£
			L20_prise()
		elseif (UTask_tw == 20*256) and (GetLevel() >= 20) then
			Say("Th¸m tö håi b¸o: gÇn ®©y trªn <color=Red>Vò L¨ng s¬n<color> xuÊt hiÖn mét nhãm <color=Red>Thæ PhØ<color>,chuyªn gi¶ m¹o c¸c danh nghÜa cña Thiªn V­¬ng bang ®Ó c­íp cña giÕt ng­êi, ng­êi d©n n¬i ®©y v« cïng o¸n giËn. Sù viÖc nµy cã liªn quan ®Õn danh dù cña bæn m«n. Ng­¬icã ®ång ı ®i ®Õn ®ã x©m nhËp vµo sµo huyÖt bän thæ phØ kh«ng?", 2, "Thuéc h¹ tËn lùc thi hµnh /L20_get_yes", "Thuéc h¹ vâ c«ng thÊp kĞm, sî r»ng g¸nh kh«ng ®­îc träng tr¸ch nµy /L20_get_no")
		elseif (UTask_tw < 20*256) then								--ÉĞÎ´½Ó20¼¶ÈÎÎñ
			Talk(1,"","Thiªn V­¬ng bang chóng ta danh tiÕng lÉy lõng, nªn th­êng cã bän xÊu gi¶ m¹o®Ö tö bæn bang ®Ó lµm viÖc xÊu")
		elseif (UTask_tw > 20*256) and (UTask_tw < 20*256+80) then					--ÒÑ¾­½Óµ½20¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Bän thæ phØ ®ã th­êng xuÊt hiÖn ë <color=Red>B¹ch Thñy §éng<color> t¹i <color=Red>phİa ®«ng Vò L¨ng s¬n<color>.")
		else					--ÒÑ¾­Íê³É20¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Thiªn V­¬ng Bang chóng ta vµ l·o b¸ t¸nh g¾n bã víi nhau nh­ m«i víi r¨ng, nªn ng­¬icÇn ph¶i nhí r»ng tuyÖt ®èi kh«ng ®­îc tù tiÖn dïng vâ c«ng ®Ó ¸p bøc l·o b¸ t¸nh, nhí ch­a?")
		end
	elseif (Uworld121 == 20) and (HaveItem(10) == 1) then
		Talk(7,"Uworld121_yanghu","D­¬ng H÷u Sø.","C¸c h¹ d­êng nh­ cã g× khã nãi, ch¼ng hay ®· x¶y ra viÖc g×?","µ!... ë ®©y cã mét bói tãc cña T­êng Vi tiªn tö, ng­êi h·y nhËn ®i!"," H¶! Mé TuyÕt? C« ta lµm sao?","Yªn t©m! Hµ c« n­¬ng chØ h¬i tiÒu tôy mét chót!","Ta hiÓu råi!","Tiªn Tö nhê ta chuyÓn lêi cho ng­êi r»ng: tr­íc th¸ng 7 nÕu ng­êi kh«ng ®Õn Thuı Yªn gÆp mÆt c« ta, hai ng­êi tõ ®©y vÒ sau sÏ ch¼ng gÆp mÆt nhau n÷a ®©u")
	elseif(Uworld121 == 50 ) then
		Talk(8,"Uworld121_yanghu2","Lµm sao? ","¤i. T­êng Vi Tiªn Tö nhÊt ®Şnh sÏ kh«ng håi t©m chuyÓn ı ","D­¬ng Hå:... ","Nh­ng mµ c« Êy ®· b¶o ta ®i t×m Kh©u Anh, anh ta ®· nãi t­êng tËn cho ta biÕt vÒ kÕ ho¹ch cña C«n L«n ph¸i ","Mé TuyÕt, nµng qu¶ nhiªn ®· v× ta mµ ®i cÇu xin tªn gian x¶o Kh©u Anh, ta ®· phô nµng råi. ","thËt kh«ng g× cã thÓ bï ®¾p chç trèng ®ã sao? ","§õng nãi h«m qua ®· cïng nhau h¸t ca vui vÎ, h«m nay ta l¹i cø uèng thªm r­îu nång, uèng cho say s­a. ChuyÖn tãc xanh hay b¹c lµ chuyÖn cña n¨m m­¬i n¨m. Rót kiÕm chĞm lªn trêi, mäi chuyÖn dÔ nh­ trë bµn tay. ","Ng­êi ch¬i:. ")
	else
		Talk(1,"","Nh©n t©m t¹i giang hå, chØ cã hoµi b·o lín, bÊt kÓ ë n¬i nµo còng gi÷ th©n m×nh lµ thanh thiªn b¹ch nhËt, nÕu nh­ trong lßng mµ cßn nghÜ g× xÊu xa bÈn thØu th× bÊt kÓ ®i ®Õn ®©u còng bŞ ng­êi ®êi phØ b¸ng!")
	end
end;

function L20_get_yes()
	Talk(1,"","Bän thæ phØ ®ã th­êng xuÊt hiÖn ë <color=Red>B¹ch Thñy §éng<color> t¹i <color=Red>phİa ®«ng Vò L¨ng s¬n<color>.")
	SetTask(3, 20*256+50)
	AddNote("T¹i cöa vµo ®iÖn §«ng Thiªn cña Thiªn V­¬ng bang gÆp D­¬ng Hå (218, 198) , nhËn <color=red>nhiÖm vô B¹ch Thñy §éng<color>, ®Õn ®éng B¹ch Thuû nói Vâ L¨ng diÖt thæ phØ. ")
	Msg2Player("T¹i cöa vµo ®iÖn §«ng Thiªn cña Thiªn V­¬ng bang gÆp D­¬ng Hå nhËn nhiÖm vô ®i ®Õn ®éng B¹ch Thuû nói Vâ L¨ng diÖt thæ phØ ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","Ng­¬i®¬n th©n ®éc m· x«ng vµo sµo huyÖt cña bän thæ phØ v× d©n trõ h¹i, lµm thËt tèt! Bæn to¹ xem víi t­ chÊt cña ng­¬i chØ cÇn tËp luyÖn mét thêi gian ch¾c ch¾n sÏ trë thµnh mét nh©n vËt næi tiÕng vang danh thiªn h¹!")
	DelItem(92)
	SetRank(45)
	SetTask(3, 30*256)
--	AddMagic(33)
	add_tw(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· hoµn thµnh nhiÖm vô ®éng B¹ch Thuû ®­îc phong lµm Thñ Tr¹i H¶n T­íng, sÏ ®­îc häc vâ c«ng TÜnh T©m QuyÕt cña Thiªn V­¬ng bang ")
	AddNote("Trë l¹i ®¶o Thiªn V­¬ng mang CÈm K× giao cho D­¬ng Hå hoµn thµnh nhiÖm vô ®éng B¹ch Thuû, ®­îc phong lµm Thñ Tr¹i H·n T­íng ")
end;

function Uworld121_yanghu()
	Talk(6,"","Mé TuyÕt! Nµng hµ tÊt ph¶i nh­ vËy chø!","Hµ Tiªn Tö lµ tiªn n÷ khã mµ t×m ®­îc ë nh©n gian! D­¬ng H÷u Sø! Ng­êi cè mµ gi÷ lÊy nhĞ, h·y quªn hÕt nh÷ng sai lÇm ®· qua","NÕu sinh ra trong thêi th¸i b×nh, th× ta ®©u cÇn c¸i h­ danh Thiªn V­¬ng H÷u sø nµy lµm g× chø? ChØ cÇn cïng c« Êy sèng an b×nh ë §éng §×nh hå. Nh­ng ®¸ng tiÕc ngµy nay thiªn h¹ lÇm thanh, c¶nh m¸u ch¶y liªn miªn, ta lµm sao cã thÓ bá mÆc ®Ö tö trong bang mµ kh«ng lo ®­îc chø?",".....….","GÇn ®©y nghe tin truyÒn r»ng ph¸i C«n L«n cã ı ®å tiÕn qu©n vÒ phİa Nam. T¹i §éng §×nh hå ®· ph¸t hiÖn ra tung tİch cña ®Ö tö ph¸i C«n L«n, e r»ng trø¬c tiªn bän hä sÏ m­u ®å h·m h¹i Thiªn v­¬ng bang chóng ta, sù tån vong cña bæn bang ®ang gÆp nguy hiÓm, t¹i h¹ kh«ng thÓ n¶o ®øng ngoµi cuéc ®­îc, sù viÖc ®· ®Õn n­íc nµy ta sÏ tù m×nh Yªn Thuı yªn ®Ó nãi râ cho c« Êy biÕt","Còng chØ cßn c¸ch nµy th«i!")
	SetTask(121,30) --ÉèÖÃÈÎÎñ±äÁ¿30
	DelItem(10)
	Msg2Player("Tham väng lín cña C«n L«n ph¸i lµ muèn tiÕn c«ng Thiªn Bang ph¸i, D­¬ng Hå kh«ng thÓ rêi khái ")
	AddNote("D­¬ng Hå kh«ng cã c¸ch nµo gÆp mÆt Hµ Mé TuyÕt, nhê ng­¬i khuyªn c« Êy dïm ")
end

function Uworld121_yanghu2()
   if(GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) then			-- ÊÇÌìÍõµÜ×Ó»ò³öÊ¦µÜ×Ó
		Talk(2,"","ThËt vÊt v¶ cho ng­¬i®· nãi cho t¹i h¹ biÕt kÕ ho¹ch x©m chiÕm cña ph¸i C«n L«n! §©y cã mét quyÓn mËt tŞch cña Thiªn V­¬ng bang! Xin h·y nhËn lÊy!","Ta nhÊt ®Şnh sÏ chuyªn cÇn rÌn luyÖn vâ nghÖ! Cïng víi D­¬ng H÷u Sø b¶o vÖ giang s¬n Tèng triÒu!")
		if (HaveMagic(322) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(322,1)
		end
		if (HaveMagic(323) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(323,1)
		end
		if (HaveMagic(325) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(325,1)
   	end
   	Msg2Player("Häc ®­îc kü thuËt Ph¸ Thiªn Tr¶m, Truy Tinh Trôc NguyÖt, Truy Phong QuyÕt cña Thiªn V­¬ng bang ")
   	SetTask(121,255)
	else
		SetTask(121,245)
	end
	add_repute = ReturnRepute(30,95,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
	AddRepute(add_repute)
	Msg2Player("NhiÖm vô hoµn thµnh, danh väng cña b¹n ®­îc t¨ng lªn "..add_repute.."<<Î´·­Òë>>")
	AddNote("NhiÖm vô Bi LuyÕn Mé TuyÕt: Nãi cho D­¬ng Hå biÕt kÕ ho¹ch x©m chiÕm cña C«n L«n ph¸i nh­ng vÉn kh«ng cã c¸ch nµo hµn g¾n l¹i quan hÖ gi÷a Hµ Mé TuyÕt vµ D­¬ng Hå, nhiÖm vô hoµn thµnh. ")
end
