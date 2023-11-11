-- Ø¤°ï ÕÆ°ô³¤ÀÏÂŞ¿ïÉú 30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)
-- by: xiaoyang(2004\4\22)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_gb = GetTask(8)
	Uworld128 = GetTask(128)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 30*256) and (GetLevel() >= 30) then		--30¼¶ÈÎÎñ
			Say("Ta phô tr¸ch c«ng vô th­êng ngµy cña c¸c ph©n ®­êng, mçi th¸ng c¸c ®µ chñ ®Òu tr×nh c«ng v¨n lªn mét lÇn, nh­ng th¸ng nµy TriÖu §µ chñ ph©n §µ thø ba ch­a giao tíi n÷a, ng­¬i gióp ta ®i hèi thóc ®­îc kh«ng?",2,"§ång ı!/L30_get_yes","TiÕc qu¸! Ta cã viÖc kh¸c råi /L30_get_no")
		elseif (UTask_gb == 30*256+40) and (HaveItem(81) == 1) then		--30¼¶ÈÎÎñÍê³É
			L30_prise()
		elseif (UTask_gb >= 30*256+10) and (UTask_gb < 400*256) then		--30¼¶ÈÎÎñ½øĞĞÖĞ
			Talk(1,"","§i qua D­¬ng Ch©u ch­a vËy? Sao TriÖu §µ chñ ch­a ®­a c«ng v¨n tíi n÷a?")
		else
			Talk(1,"","Kim Binh cµng ngµy cµng t¸o b¹o, chóng ta ph¶i hµnh ®éng g× th«i!")
		end
	elseif (Uworld128 == 20) and (HaveItem(390) == 1) then
		Talk(9,"Uworld128_danger","La tr­ëng l·o! ë ®©y cã bøc th­ cña Giíi V« Tµ.",".....Xin hái C¸c h¹ lÊy th­ nµy ë ®©u?","T¹i h¹ víi Giíi V« Tµ biÕt nhau, ë Tr­êng Giang nguyªn ®Çu h¾n ®­a th­ cho ta.","VËy ch¾c kh«ng sai! Trong th­ V« Tµ nãi râ ng­¬i rÊt ®¸ng tin vµ nãi cã ng­êi muèn h¹i h¾n.","Sao?","ChuyÖn nµy v« cïng träng ®¹i, tuyÖt ®èi kh«ng ®­îc truyÒn ra ngoµi","T¹i h¹ hiÓu râ!","Ta kh«ng tiÖn xuÊt ®Çu lé diÖn! Ng­¬i cã d¸m ®¶m tr¸ch sø m¹ng nµy kh«ng/","VËy ta ®i ngay!")
	elseif (Uworld128 == 50) then
		Talk(5,"Uworld128_finish","La tr­ëng l·o! Giíi ®¹i ca ®· tho¸t hiÓm.","§a t¹ b»ng h÷u! Nh­ng ta vÉn cßn lo l¾ng mét chuyÖn","Xin cø nãi ra!","Giíi V« Tµ lµ hy väng C¸i Bang, ®èi ph­¬ng sÏ kh«ng bu«ng tha. Mong ng­¬i h·y cè g¾ng b¶o vÖ y.","La tr­ëng l·o xin yªn t©m! ")
	elseif (Uworld128 == 20) then
		Talk(1,"","La tr­ëng l·o! Giíi V« Tµ quı bang nhê t«i giao bøc th­ cho «ng, nh­ng ta ®· quªn mang theo.")
	elseif (Uworld128 > 20) and (Uworld128 < 50)then
		Talk(1,"","TiÓu Giíi lµ ®Ö tö kú väng cña c¸i bang. Cã thÓ ®em ®Õn phóc phÇn cho ng­¬i! ")
	else
		Talk(1,"","Kim binh cµng lóc cµng manh ®éng, chóng ta còng ph¶i sím hµnh ®éng míi ®­îc.")
	end
end;

function L30_get_yes()
	Talk(1,"","Ph©n ®µ thø 3 n»m ë D­¬ng Ch©u, ng­¬i ®Õn ®ã sÏ gÆp ®­îc TriÖu §µ chñ.")
	SetTask(8,30*256+10)
	Msg2Player("TiÕp nhËn nhiÖm vô: §Õn D­¬ng Ch©u ®Ó hái nguyªn nh©n giao d¸ch s¸ch trÔ cña TriÖu ®µ chñ ")
	AddNote("TiÕp nhËn nhiÖm vô: §Õn D­¬ng Ch©u ®Ó hái nguyªn nh©n giao d¸ch s¸ch trÔ cña TriÖu ®µ chñ ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(2,"","Tr­ëng l·o! Ta ®· ®em v¨n th­ vÒ råi!","Xem ra Kim binh ®· thËt sù hµnh ®éng! Chóng ta ph¶i cÈn hËn h¬n míi ®­îc. LÇn nµy ng­¬i lËp ®­îcc«ng lín, ta phong ng­¬i lµ ®Ö tö cÊp 30")
	DelItem(81)
	SetTask(8,40*256)
	SetRank(40)
--	AddMagic(274)
--	AddMagic(124)
	add_gb(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· ®­îc th¨ng lµ C¸i Bang ChÊp Bæng ®Ö tö, sÏ ®­îc häcGi¸ng Long Ch­ëng; §¶ CÈu TrËn. ")
	AddNote("Gi¶i quyÕt ®­îc sù viÖc ë Thôc C­¬ng s¬n, cøu ®­îc ®Ö tö C¸i bang, ®­îc th¨ng lµ ChÊp bæng ®Ö tö ")
end;

function Uworld128_danger()
	DelItem(390)
	SetTask(128,30)
	Msg2Player("La tr­ëng l·o nhê b¹n ®i cøu Giíi V« Tµ ")
	AddNote("La tr­ëng l·o nhê b¹n ®i cøu Giíi V« Tµ ")
end

function Uworld128_finish()
	if (GetTask(8) >= 70*256) and (GetTask(8) ~= 75*256) then
		Talk(1,"","C¸i Bang ta cã mét bé mËt quyÕt, ng­¬i xøng ®¸ng ®­îc truyÒn d¹y!")
		if (HaveMagic(357) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(357,1)
		end
		if (HaveMagic(359) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(359,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("B¹n häc ®­îc tuyÖt kü cña C¸i bangPhi Long T¹i Thiªn, Thiªn H¹ V« CÈu ")
		SetTask(128,255)
	else
	   SetTask(128,245)  --»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
   add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
   AddRepute(add_repute)
   Msg2Player("Cøu ®­îc Giíi V« Tµ, hoµn thµnh nhiÖm vô. Danh väng cña b¹n t¨ng thªm "..add_repute.."®iÓm.")
   AddNote("Cøu ®­îc Giíi V« Tµ, hoµn thµnh nhiÖm vô. ")
end
