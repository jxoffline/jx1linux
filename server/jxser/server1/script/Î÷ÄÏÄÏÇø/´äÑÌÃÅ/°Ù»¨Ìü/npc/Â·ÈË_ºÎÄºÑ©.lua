-- ´äÑÌÃÅ ºÎÄºÑ© 30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-26)
-- update: Dan_Deng(2003-08-07)
-- update by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(5) == 1 then
		allbrother_0801_FindNpcTaskDialog(5)
		return 0;
	end
	UTask_cy = GetTask(6)
   Uworld121 = GetTask(121)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") then
		if (UTask_cy == 30*256+40) and (HaveItem(2) == 1) and (HaveItem(3) == 1) and (HaveItem(4) == 1) then
			L30_prise()
		elseif ((UTask_cy == 30*256) and (GetLevel() >= 30)) then		--30¼¶ÈÎÎñÆô¶¯
			Talk(1,"L30_get","Tr­íc ®©y kh«ng l©u ta cã duyªn may gÆp mét lo¹i hoa trµ gäi lµ ' Vò Y Nghª Th­êng', lo¹i hoa trµ nµy v« cïng quÝ hiÕm vµ khã trång. NÕu nh­ kh«ng n¾m v÷ng ®­îc bÝ quyÕt, th× rÊt khã thµnh c«ng, ta b©y giê ®ang lo l¾ng ®©y! ")
		elseif (UTask_cy > 30*256) and (UTask_cy < 40*256) then
			Talk(1,"","ThÕ nµo? ¤ng ta ®· nãi víi ng­¬i c¸ch trång 'Vò Y Nghª Th­êng' ch­a?")
		elseif (UTask_cy >= 40*256) then
			Talk(1,"","Vò Y Nghª Th­êng rÊt mau ra hoa, ®Õn lóc ®ã cïng nhau xem hoa trµ! ")
		else
			Talk(1,"","¤ng Êy còng thÝch xem hoa trµ sao?")
		end
	elseif(Uworld121 == 10) and (HaveItem(373) == 1) then		--ÅÐ¶ÏÈÎÎñÊÇ·ñÆô¶¯ÒÔ¼°±³°üÖÐÊ±ºòÓÐÖÜÐ¡Èª¼ôµ¶
		Talk(8,"Uworld121_lose","Hµ Tiªn Tö! ë ®©y cã 1 c©y kÐo Tr­¬ng TiÓu TuyÒn.","C¸m ¬n!","§õng kh¸ch s¸o! §­îc thÊy diÖn m¹o cña Tiªn Tö lµ vinh h¹nh cña t¹i h¹."," (B¹n vÉn ph¶i tiÕp tôc nãi, thÊy Mé TuyÕt vung kÐo lªn, gièng nh­ V©n Tó ph¸t kÐo nhiÒu lÇn) ","Hµ c« n­¬ng! C« ë ®©y lµm g×?"," Ta vµ ng­¬i vèn kh«ng quen biÕt nhau, ng­¬i l¹i b»ng lßng nhËn lêi ®i xa ngµn dÆm ®em kÐo tÆng ta, cßn «ng Êy th× sao?","¤ng ta lµ ai?",".....Cã thÓ gióp Mé TuyÕt thªm mét chuyÖn ®­îc kh«ng?")
	elseif(Uworld121 == 10 ) then										--Èç¹û½ÓÊÜÁËÈÎÎñµ«Ã»ÓÐÈÎÎñµÀ¾ß¼ôµ¶
		Talk(1,"","C©y kÐo nµy lµ ta nhê Tr­¬ng TiÓu TuyÒn s­ b¸ chÞu khã rÌn cho ta, ng­¬i xem cã ph¶i ®· ®Ó ë chç «ng ta hay kh«ng?.")
	elseif (Uworld121 == 20) and (HaveItem(10) == 0) then		-- Í··¢¶ªÁË
		AddEventItem(10)
		Msg2Player("L¹i t×m ®­îc mét chïm tãc ")
		Talk(1,"","Quªn mang theo tãc råi.")
	elseif (Uworld121 >= 20) and (Uworld121 < 30) then			--ÔÚÓëÑîºþ¶Ô»°Ç°
		Talk(1,"","Hy väng ng­¬i chuyÓn lêi giïm Mé TuyÕt. Xin ®a t¹!")
	elseif(Uworld121 == 30) then
		Talk(8,"Uworld121_Step4","Hµ c« n­¬ng!","Kh«ng cÇn nãi n÷a! Ta hiÓu råi.","Hµ c« n­¬ng ®· hiÓu lÇm råi, C«n L«n m­u ®å b¸ v­¬ng, D­¬ng H÷u sø ®îi mäi viÖc kÕt thóc råi sÏ lªn Thuý Yªn M«n gÆp nµng.","H¾n thËt sù cã ®¸p øng yªu cÇu cña ta kh«ng?",".....ViÖc nµy th× «ng ta kh«ng nãi.","Ha ha ha! Hµ Mé TuyÕt ¬i Hµ Mé TuyÕt, t¹i sao ng­¬i l¹i m¬ méng h·o huyÒn nh­ vËy?","Hµ c« n­¬ng.....","Ng­êi ta sinh ra th× ch­a cã ta, ®Õn lóc cã ta th× ng­êi ®· giµ! ¤i!.....")
	elseif(Uworld121 == 40) and (HaveItem(376) == 0) then
		Talk(1,"","Ch­a cã lÊy kh¨n thªu, Kh©u Anh ch¾c lµ kh«ng ®Ó ý ®Õn c« n­¬ng råi.")
		AddEventItem(376)
		Msg2Player("§o¹t l¹i kh¨n thªu. ")
	else
		Talk(1,"","T©m nguyÖn lín nhÊt cña ta lµ trång ®­îc hoa trµ ®Ñp nhÊt thiªn h¹.")
	end
end;

function L30_get()
	Say(" Nghe nãi ë thµnh §¹i Lý cã mét ng­êi trång hoa hä §oµn, biÕt trång hoa trµ. Nh­ng mµ tÝnh t×nh h¾n kú l¹, cã rÊt nhiÒu ng­êi ®Õn thØnh gi¸o, nh­ng ®Òu ph¶i uæng c«ng quay vÒ.",2,"§Ó ta nghÜ c¸ch gióp ng­¬i t×m c¸ch /L30_get_yes","Mäi ng­êi ®Òu ®ang gÆp trë ng¹i, e r»ng ta còng kh«ng cã c¸ch nµo kh¸c. /L30_get_no")
end;

function L30_get_yes()
	Talk(1,"","ThËt c¸m ¬n ng­¬i!")
	SetTask(6,30*256+10)
	AddNote("GÆp §oµn l·o n«ng ë thµnh §¹i Lý ®Ó thØnh gi¸o ph­¬ng ph¸p nu«i d­ìng Vò Y Nghª Th­êng. ")
	Msg2Player("GÆp §oµn l·o n«ng ë thµnh §¹i Lý ®Ó thØnh gi¸o ph­¬ng ph¸p nu«i d­ìng Vò Y Nghª Th­êng. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","Ho¸ ra vÉn cßn bÝ quyÕt nh­ vËy, ®a t¹ tiÓu muéi! Ta phong muéi lµ NhÊt PhÈm Hoa Sø.")
	SetTask(6,40*256)
	SetRank(34)
	DelItem(2)
	DelItem(3)
	DelItem(4)
--	AddMagic(105)
--	AddMagic(113)
	add_cy(40)			-- µ÷ÓÃskills_table.luaÖÐµÄº¯Êý£¬²ÎÊýÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· ®­îc phong thµnh NhÊt PhÈm Hoa Sø! Häc xong vâ c«ng Vò §¶ Lª Hoa, Phï V©n T¸n TuyÕt. ")
	AddNote("§o¹t ®­îc bÝ quyÕt trång hoa Vò Y Nghª Th­êng, hoµn thµnh nhiÖm vô, ®­îc phong lµ: NhÊt PhÈm Hoa Sø. ")
end;

function Uworld121_lose()
	Talk(5,"","C« n­¬ng cø nãi.","Xin ng­¬i h·y ®­a mí tãc nµy cho H÷u Sø D­¬ng Hå cña Thiªn V­¬ng Bang, nãi víi «ng Êy r»ng nÕu tr­íc th¸ng 7 «ng Êy kh«ng ®Õn Thuý Yªn m«n th× tõ ®©y vÒ sau ta vµ h¾n xem nh­ kh«ng cßn c¬ héi gÆp l¹i.","Qu¶ nhiªn lµ D­¬ng Hå! D­¬ng H÷u Sø v¨n tµi vâ ®øc chØ lµ sù lùa chän nhÊt thêi, lµ nh©n trung long phông. Hµ c« n­¬ng xin nghÜ l¹i.","Ng­¬i còng kh«ng muèn gióp ta? Hu hu...."," §­îc råi! Ta ®i.")
	DelItem(373)
	AddEventItem(10)
	Msg2Player("NhËn lêi Hµ Mé TuyÕt, gióp c« Êy chuyÓn lêi ®Õn D­¬ng Hå, nhËn ®­îc mét khóc lôa cña Hµ Mé TuyÕt. ")
	AddNote("NhËn lêi Hµ Mé TuyÕt, gióp c« Êy chuyÓn lêi ®Õn D­¬ng Hå. ")
	SetTask(121,20) --ÈÎÎñ±äÁ¿ÉèÖÃÎª20
end

function Uworld121_Step4()
	Talk(4,"Uworld121_sijin",".....….","Tuy h¾n bÊt nh©n nh­ng ta còng kh«ng thÓ bÊt nghÜa. ë ®©y cã mét c¸i kh¨n thªu, ng­¬i h·y d¾t h¾n ®i t×m Kh©u Anh C«n L«n ph¸i. Xem nh­ ta gióp h¾n lÇn cuèi cïng.","VËy ta ®i.....mong Tiªn c« nghÜ l¹i."," §õng nhiÒu lêi!")
end

function Uworld121_sijin()
	AddEventItem(376)
	Msg2Player("NhËn chiÕc kh¨n thªu. ")
	AddNote("NhËn ®­îc chiÕc kh¨n thªu cña Hµ Mé TuyÕt, ®em ®i t×m Kh©u Anh cña C«n L«n ph¸i. ")
	SetTask(121,40) --ÈÎÎñ±äÁ¿ÉèÖÃÎª40
end
