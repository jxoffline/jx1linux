-- ´äÑÌÃÅ æÌÏşÙ» 20¼¶ÈÎÎñ¡¢40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-26)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- ÈÎÎñÏà¹ØÒÔ¼°ÃÅÅÉ¶Ô»°
		if (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--20¼¶ÈÎÎñ½øĞĞÖĞ
			if (GetTimerId() == 8) then
				StopTimer()								--½â¶¾ÁË
				Msg2Player("§éc mµ b¹n tróng vÉn ch­a gi¶i ")
				Talk(1,"L20_check","S­ muéi mau qua ®©y, ta gióp muéi gi¶i ®éc.")
			else
				L20_check()
			end
		elseif (UTask_cy == 20*256) and (GetLevel() >= 20) then		--20¼¶ÈÎÎñ
			Say("Bæn m«n nu«i rÊt nhiÒu ong vµng, mét sè ong vµng nµy ph¶i ¨n mét lo¹i mËt hoa, mËt hoa cña hoa §¹i M¹n §µ La. GÇn ®©y mËt hoa ®· hÕt, ng­¬i cã thÓ gióp ta ®i lÊy 10 b«ng hoa vÒ ®­îc kh«ng? ",2,"§­îc!/L20_get_yes","§Ö tö c«ng phu cßn kĞm, e r»ng khã lµm nªn chuyÖn /L20_get_no")
		elseif (UTask_cy == 40*256+30) then							--40¼¶ÈÎÎñÍê³É
			L40_prise()
		elseif ((UTask_cy == 40*256) and (GetLevel() >= 40)) then		--40¼¶ÈÎÎñÆô¶¯
			Say("Nghe nãi ë thµnh §¹i Lı cã mét tªn ¸c b¸, chuyªn ®i c­ìng hiÕp d©n n÷, kh«ng biÕt ®· h¹i biÕt bao nhiªu thiÕu n÷, ng­¬i cã b»ng lßng gióp ta ®i tiªu diÖt tªn ®èn m¹t nµy kh«ng?",2,"LÇn nµy ta sÏ v× d©n trõ h¹i /L40_get_yes","§Ö tö vâ c«ng yÕu kĞm, sî kh«ng lµm næi chuyÖn nµy /L40_get_no")
		elseif (UTask_cy > 40*256) and (UTask_cy < 50*256) then		--40¼¶ÈÎÎñ½øĞĞÖĞ
			Talk(1,"","D­íi tay h¾n cã nhiÒu thuéc h¹, s­ muéi h·y cÈn thËn!")
		else
			Talk(1,"","§µn «ng kh«ng cã thø g× tèt, muéi ph¶i cÈn thËn, nh÷ng viÖc h¾n lµm ®Òu thèi tha.")
		end
	else
		Talk(1,"","§µn «ng kh«ng cã g× tèt! ")
	end
end;

function L20_get_yes()
	Talk(3,"","§¹i M¹n §µ La hoa mäc ë trªn s­ên nói cña T©y B¾c. Lóc mµ ng­¬i h¸i hoa ph¶i cÈn thËn, §¹i M¹n §µ La cã ®éc do ®ã ph¶i h¸i hoa trong thêi gian nhÊt ®Şnh, nÕu kh«ng sÏ bŞ tróng ®éc mµ chÕt. ","Trong 1 thêi gian ng¾n mµ h¸i 10 ®ãa hoa th× thËt lµ phiÒn phøc.","Cho nªn S­ muéi h¸i ®ñ 10 ®ãa mau chãng ®em vÒ.")
	SetTask(6,20*256+10)
	AddNote("§i h¸i 10 ®ãa hoa §¹i Man §µ La. CÈn thËn hoa cã ®éc, trong mét thêi gian ng¾n ph¶i lÊy ®­îc 10 ®ãa hoa ®em vÒ. ")
	Msg2Player("§i h¸i 10 ®ãa hoa §¹i Man §µ La. CÈn thËn hoa cã ®éc, trong mét thêi gian ng¾n ph¶i lÊy ®­îc 10 ®ãa hoa ®em vÒ. ")
end;

function L20_get_no()
end;

function L20_check()
	i = GetItemCount(1)
	for j = 1, i do DelItem(1) end			-- ¼ì²éÓĞÃ»ÓĞ10¶ä»¨
	if (i >= 10) then		--Èç¹ûÓĞ10¸öÔòÍê³ÉÈÎÎñ
		Talk(1,"","<#> Yªn HiÓu Tr¸i:"..i.."<#> §¹i Man §µ La Hoa ®· ®ñ råi. S­ muéi qu¶ lµ cã b¶n lÜnh, cã thÓ trë thµnh NhŞ PhÈm Hoa Sø.")
		SetTask(6,30*256)
		SetRank(33)
--		AddMagic(269)
		add_cy(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
		Msg2Player("Chóc mõng b¹n! §· ®­îc th¨ng Thóy Yªn m«n NhŞ PhÈm Hoa Sø! Häc ®­îc vâ c«ng B¨ng T©m Tr¸i ¶nh. ")
		AddNote("H¸i ®­îc 10 ®ãa §¹i Man §µ La Hoa, hoµn thµnh nhiÖm vô §¹i Man §µ La Hoa. §­îc th¨ng lµ NhŞ PhÈm Hoa Sø. ")
	else
		Talk(2,"","Nh­ng ng­¬i vÉn ch­a h¸i ®ñ 10 ®o¸ §¹i M¹n §µ La hoa, mét lÇn ch­a h¸i ®ñ 10 ®o¸ lµ ch­a dïng ®­îc.","Xin s­ muéi h·y ®i thªm mét chuyÕn n÷a.")
		SetTask(6,20*256+10)
	end
end;

function L40_get_yes()
	Talk(1,"","§­îc! ViÖc nµy giao cho ng­¬i.")
	SetTask(6,40*256+10)
	AddNote("TiÕp nhËn nhiÖm vô: Gi¸o huÊn tªn ¸c b¸ trong thµnh §¹i Lı ")
	Msg2Player("TiÕp nhËn nhiÖm vô: Gi¸o huÊn tªn ¸c b¸ trong thµnh §¹i Lı ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(2,"","Yªn s­ tû! Ta ®· cøu ®­îc tÊt c¶ nh÷ng ng­êi con g¸i bŞ tªn ¸c b¸ b¾t ®i, vµ ®· cho h¾n mét bµi häc, h¾n sÏ kh«ng d¸m lµm chuyÖn xÊu Êy n÷a ®©u!","ChØ cÇn ®Ö tö Thuı Yªn M«n chóng ta ra tay th× kh«ng cã viÖc g× lµ kh«ng thµnh, b¶n lÜnh cña ng­¬i ngµy cµng cao, tiÕp tôc nç lùc thªm nhĞ!")
	SetTask(6,50*256)
	SetRank(77)
--	AddMagic(100)
	add_cy(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· ®­îc th¨ng lµ Thóy Yªn m«n Hoa ThÇn Sø Gi¶! Häc ®­îc vâ c«ng Hé ThÓ Hµn B¨ng. ")
	AddNote("Cøu tho¸t c¸c d©n n÷ bŞ tªn ¸c b¸ b¾t cãc, d¹y h¾n mét bµi häc. Hoµn thµnh nhiÖm vô cÊp 40. §­îc th¨ng lµ Thóy Yªn m«n Hoa ThÇn Sø Gi¶! ")
end;
