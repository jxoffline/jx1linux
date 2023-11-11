--description: ÌìÍõ°ïÇ°µî Íõ×ô¡¡ÌìÍõ10¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3);
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 10*256) and (GetLevel() >= 10) then
			Say("Ng­¬i míi gia nhËp bæn bang? Muèn trë thµnh ThŞ VÖ tr­ëng, cÇn ph¶i ®Õn <color=Red>Thiªn V­¬ng ®¶o S¬n ®éng<color> lÊy vÒ <color=Red>3 viªn Kª HuyÕt Th¹ch<color>. Ng­¬i cã gan lµm kh«ng?", 2, "§­¬ng nhiªn d¸m. /L10_get_yes", "T¹i h¹ muèn tËp luyÖn thªm mét thêi gian n÷a /L10_get_no")
		elseif (UTask_tw == 10*256+20) and (GetItemCount(91) >= 3 ) then				--¼¦ÑªÊ¯ÊıÄ¿ÖÁÉÙÎª3
			L10_prise()
		elseif (UTask_tw > 10*256) and (UTask_tw < 10*256+50) then					--ÒÑ¾­½Óµ½10¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","§Õn <color=Red>Thiªn V­¬ng ®¶o S¬n ®éng<color> lÊy vÒ <color=Red>3 viªn Kª HuyÕt Th¹ch<color> råi h½ng tİnh!")
		else					--ÒÑ¾­Íê³É10¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦£¨È±Ê¡¶Ô»°£©
			Talk(1,"","Huynh ®Ö bæn m«n ®Òu lµ nh÷ng huynh ®Ö cã hoµi b·o lín, l·o phu ghĞt nhÊt lµ nh÷ng lo¹i trém gµ sê chã ")
		end
	elseif (UTask_tw >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Nam tö h¸n ®¹i tr­îng phu, ®· ra hµnh tÈu giang hå cÇn ph¶i ®Ønh thiªn lËp ®Şa, nÕu nh­ ng­¬i lµm chuyÖn g× tr¸i víi ®¹o nghÜa giang hå l·o phu nhÊt ®Şnh sÏ kh«ng tha cho ng­¬i ®©u")
	else
		Talk(1,"","L·o phu xem bang chñ gièng nh­ con g¸i ruét cña m×nh, bÊt luËn x¶y ra chuyÖn g× l·o phu còng ®Òu dèc hÕt lùc ®Ó b¶o vÖ c« ta")
	end
end;

function L10_get_yes()
	Talk(1,"","RÊt tèt! VËy míi lµ nam tö h¸n! §Õn <color=Red>Thiªn V­¬ng ®¶o S¬n ®éng<color> lÊy vÒ <color=Red>3 viªn Kª HuyÕt Th¹ch<color> råi h½ng tİnh!")
	SetTask(3, 10*256+20)
	AddNote("T¹i tiÒn ®iÖn Thiªn V­¬ng bang (201, 198) gÆp V­¬ng Hùu, tiÕp nhËn <color=red>nhiÖm vô Kª HuyÕt Th¹ch<color>, ®i ®Õn §¶o s¬n §éng t×m 3 viªn Kª HuyÕt Th¹ch ")
	Msg2Player("T¹i tiÒn ®iÖn Thiªn V­¬ng bang gÆp V­¬ng Hùu, tiÕp nhËn nhiÖm vô Kª HuyÕt Th¹ch ®i ®Õn §¶o s¬n ®éng t×m 3 viªn Kª HuyÕt Th¹ch. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","Lµm rÊt tèt! L·o phu sÏ phong cho ng­¬i lµm ThŞ VÖ tr­ëng! Sau nµy cã rÊt nhiÒu thö th¸ch ®ang chê, ng­¬i cÇn ph¶i tiÕp tôc cè g¾ng")
	for i = 1, (GetItemCount(91)) do DelItem(91) end
	SetTask(3, 20*256)
	SetRank(44)
	add_tw(20)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
--	AddMagic(26)
--	AddMagic(23)
--	AddMagic(24)
	Msg2Player("Chóc mõng B¹n! §· ®­îc phong lµm tr­ëng thŞ. Häc ®­îc: Thiªn V­¬ng Chïy Ph¸p, Thiªn V­¬ng Th­¬ng Ph¸p, Thiªn V­¬ng §ao Ph¸p. ")
	AddNote("Quay l¹i tiÒn ®iÖn, mang 3 viªn Kª HuyÕt Th¹ch giao cho V­¬ng Hùu, hoµn thµnh nhiÖm vô Kª HuyÕt Th¹ch, ®­îc phong lµm Tr­ëng thŞ vÖ. ")
end;
