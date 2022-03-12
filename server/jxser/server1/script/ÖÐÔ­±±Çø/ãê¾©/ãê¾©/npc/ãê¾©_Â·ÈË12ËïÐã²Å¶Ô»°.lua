--description: ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË12ËïĞã²Å¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),2)
		if (UTask_trsub60 == 0) then 
			DelItem(128)			--´¦ÀíÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ßµÄÇé¿ö
			AddNote("T¹i cöa B¾c thµnh BiÖn Kinh, ngåi t¸n gÉu, ®o¸n ch÷ víi T«n Tó Tµi ")
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 2) then
			L60_sub2_Q1()
		elseif (UTask_trsub60 == 3) then
			L60_sub2_Q2()
		elseif (UTask_trsub60 == 4) then 
			L60_sub2_Q3()
		elseif (UTask_trsub60 == 5) then 
			L60_sub2_Q4()
		elseif (UTask_trsub60 == 6) then 
			L60_sub2_Q5()
		elseif (UTask_trsub60 == 10) and (HaveItem(128) == 0) then		-- µÀ¾ß¶ªÊ§
			AddEventItem(128)
			Talk(1,"","T¹i h¹ rÊt b¸i phôc sù th«ng minh cña c¸c h¹, xin h·y nhËn thanh kiÕm nµy, ®õng tõ chèi! ")
		else
			Talk(1,"","B¸i phôc, b¸i phôc!")
		end
	else
		i = random(0,3)
		if (i == 0) then
			Talk(1,"","Quèc ph¸ s¬n hµ t¹i, thµnh xu©n th¶o méc th©m. C¶m thêi hoa tiÔn lÖ, t×nh biÖt ®iÓu kinh t©m. ¤i thËt ®¸ng th­¬ng!         ")
		elseif (i == 1) then
			Talk(1,"","YÕn long hµn thñy nguyÖt long sa; D¹ b¹c tÊu chuÈn cËn töu gia; Th­¬ng n÷ bÊt tri vong quèc hËn; C¸ch giang ­u x­íng hËu ®×nh hoa. Êy! ThËt ®¸ng th­¬ng! §¸ng th­¬ng! ")
		elseif (i == 2) then
			Talk(1,"","TÇn Thêi Minh NguyÖt H¸n Thêi Quan, V¹n Lı Tr­êng Chinh Nh©n VŞ Hoµn. §¶m Sø Long Thµnh Phi T­íng T¹i, BÊt Gi¸o Hå M· §é ¢m S¬n!Chao «i! ThËt ®¸ng th­¬ng! ")
		else
			Talk(1,"","YÕn liÔu häa kiÒu, phong liªn thóy mé, tham sai thËp v¹n nh©n gia, träng hå ®iÖp ®iÖp thanh giai, h÷u tam thu quÕ tö, tËp lı hµ hoaChao «i! §¸ng hËn! §¸ng hËn!....NÕu nh­ kh«ng ph¶i lµ v× bµi th¬ nµy th× cã lÏ Kim quèc còng ®· kh«ng khëi bin")
		end
	end
end

function L60_sub2_Q1()
	Say("TiÓu sinh cã mÊy ch÷ nµy. Trong mét lóc bèi rèi ch­a thÓ ®o¸n ra, kh«ng biÕt ng­êi cã thÓ ®o¸n ®­îc kh«ng. 'Sµng tiÒn minh nguyÖt quang'lµ ch÷ g×? ", 3, "Ho¶ng /no1", "Kho¸ng /L60_sub2_Q2", "§¶m /no1")
end;

function no1()
	SetTask(28, SetByte(GetTask(28),2,2))
	Talk(1,"","Ch÷ thø nhÊt ng­¬i ®ãan ch­a ra µ?")
end;

function L60_sub2_Q2()
	Say("õm! Cßn ch÷ thø hai: 'H÷u c­íc kho¸i nh­ phong, ®iÓm háa h÷u thanh ©m, gia thñy trµ thiÕt thµnh, tr­êng th¶o hoa t­¬ng phãng'lµ ch÷ g× vËy? ", 3, "Th­¬ng /no2", "Lu©n /no2", "Bao /L60_sub2_Q3")
end;

function no2()
	SetTask(28, SetByte(GetTask(28),2,3))
	Talk(1,"","Phi d· phi d·! ")
end;

function L60_sub2_Q3()
	Say("§­îc råi! Cßn ch÷ thø 3: 'BÊt chİnh chØ vi v·n tiÕt khuÊt' lµ ch÷ g× vËy?", 3, "c¸i /L60_sub2_Q4", "Oai /no3", "ThÊt /no3")
end;

function no3()
	SetTask(28, SetByte(GetTask(28),2,4))
	Talk(1,"","Ta thÊy kh«ng ph¶i vËy!")
end;

function L60_sub2_Q4()
	Say("ThÕ ch÷ thø 4: '§iÓm ®iÓm huúnh háa chiÕu giang biªn' lµ ch÷ g× vËy?", 3, "Träc /no4", "®¹m /L60_sub2_Q5", "N·ng /no4")
end;

function no4()
	SetTask(28, SetByte(GetTask(28),2,5))
	Talk(1,"","H×nh nh­ kh«ng ®óng ph¶i kh«ng?")
end;

function L60_sub2_Q5()
	Say("Ch÷ cuèi míi lµ khã ®o¸n nhÊt! '§×nh tiÒn nguyÖt ®èi ¸nh, ¶nh h¹ nh¹n trËn nhÊt hµng'", 3, "LiÖu /L60_sub2_prise", "LiÖu /no5", "¦ng /no5")
end;

function no5()
	SetTask(28, SetByte(GetTask(28),2,6))
	Talk(1,"","Chao «i! Cuèi cïng còng ch¼ng xong! ")
end;

function L60_sub2_prise()
	Talk(1,"","Béi phôc! TiÓu sinh rÊt vui ®­îc kÕt b¹n víi ng­êi, Tæ phô cña tiÓu sinh vèn lµ nhµ vâ, ®Õn ®êi tiÓu sinh th× bá vâ theo v¨n. Nh­ng chØ lµ mét th­ sinh v« dông th«i. Tæ phô cña tiÓu sinh cã truyÒn l¹i c©y ®o¶n kiÕm nµy, nh­ng mµ ®èi víi tiÓu s")
	AddEventItem(128)
	SetTask(28, SetByte(GetTask(28),2,10))
	AddNote("§o¸n ®óng tÊt c¶ nh÷ng c©u ®è cña t«n tó tµi, ®­îc tÆng cho c©y ®ao §o¶n Thñy ")
	Msg2Player("NhËn ®­îc c©y ®ao §o¶n Thñy ")
end;
