--ÖÐÔ­ÄÏÇø ÑïÖÝ¸® ¾ÆÂ¥ÀÏ°å¶Ô»°£¨Ø¤°ï10¼¶ÈÎÎñ¡¢Ø¤°ï90¼¼ÄÜÈÎÎñ¡¢È­ÇãÌìÏÂÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+10) then		--10¼¶ÈÎÎñÖÐ
		SetTask(8,10*256+20)
		Talk(4,"L10_buy","¤ng chñ! Ta muèn mua r­îu!","Thø kh¸c th× ta kh«ng cã, chØ cã r­îu lµ nhiÒu kh¸ch quan muèn mua r­îu g×?","HuÖ TuyÒn Töu, Kim L¨ng Xu©n, B¸ch Hoa Nh­ìng, Kinh Hoa Lé vµ Song C©u §¹i Khóc.","¸i da, kh«ng may HuÖ TuyÒn Töu ®· b¸n hÕt råi, cßn mét b×nh cuèi cïng tªn ma men Tóy B¸n Tiªn næi tiÕng trong thµnh mua ®i mÊt. Ch¾c giê nµy h¾n ®ang vui vÎ say men r­îu. Cßn l¹i 4 lo¹i r­îu ®Òu cã, nh­ng bëi ®Òu lµ r­îu danh tiÕng, v× vËy kh«ng thÓ b¸n rÎ ®­îc!")
	elseif (UTask_gb >= 10*256+20) and (UTask_gb < 20*256) then		--¡¡µÀ¾ß¶ªÊ§´¦Àí
		if (HaveItem(77) == 0) then
			Say("Kim L¨ng Xu©n võa th¬m võa ng©y ngÊt, chØ cÇn 400 l­îng, mêi nhanh ch©n vµo mua!",2,"Mua/L10_buy_yes1","Kh«ng mua/L10_buy_no")
		elseif (HaveItem(78) == 0) then
			Say("B¸ch Hoa Nh­ìng vÞ ngät th¬m nång, chØ cÇn 400 l­îng, mêi nhanh ch©n vµo mua!",2,"Mua/L10_buy_yes2","Kh«ng mua/L10_buy_no")
		elseif (HaveItem(79) == 0) then
			Say("Kinh Hoa Lé ngät th¬m nøt mòi, chØ cÇn 400 l­îng, mêi nhanh ch©n vµo mua!",2,"Mua/L10_buy_yes3","Kh«ng mua/L10_buy_no")
		elseif (HaveItem(80) == 0) then
			Say("Song C©u §¹i Khóc ®Ëm nång, chØ cÇn 400 l­îng, mêi nhanh ch©n vµo mua!",2,"Mua/L10_buy_yes4","Kh«ng mua/L10_buy_no")
		else
			Talk(1,"","C¸c lo¹i mü töu th¬m ng©y ngÊt! H­¬ng bay tr¨m dÆm, ngÊt ng©y lßng ng­êi!")
		end
	elseif (GetTask(128) == 10) and (HaveItem(76) == 0) then			-- Ø¤°ï90¼¼ÄÜÈÎÎñ
		Say("HuÖ TuyÒn Töu th¬m ng©y ngÊt! chØ cÇn 1000 l­îng, mêi nhanh ch©n vµo mua!",2,"Mua/U128_10","Kh«ng mua/L10_buy_no")
	elseif (GetTask(75) == 10) and (GetTask(55) == 10) and (HaveItem(77) == 0) then			-- È­ÇãÌìÏÂÈÎÎñ
		Say("Kim L¨ng Xu©n võa th¬m võa ng©y ngÊt, chØ cÇn 800 l­îng, mêi nhanh ch©n vµo mua!",2,"Mua/U75_10","Kh«ng mua/L10_buy_no")
	else
		Talk(1,"","§Õn ®Êt D­¬ng Ch©u c¶nh ®Ñp, l¹i l¾m mü n÷, sao cã thÓ thiÕu r­îu ngon? Kh¸ch quan! Uèng chót r­îu ngon chø!")
	end
end;

function U75_10()
	if (GetCash() >= 800) then
		Pay(800)
		AddEventItem(77)
		Msg2Player("Cã Kim L¨ng Xu©n ")
	else
		L10_buy_noMoney()
	end
end

function U128_10()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(76)
		Msg2Player("Cã r­îu HuÖ tuyÒn ")
	else
		L10_buy_noMoney()
	end
end

function L10_buy()
	Say("Ngoµi 4 lo¹i r­îu, tÝnh kh¸ch quan 1200 l­îng! Muèn mua kh«ng?",2,"Mua/L10_buy_yes","Kh«ng mua/L10_buy_no")
end;

function L10_buy_yes()
	if (GetCash() >= 1200) then
		Pay(1200)
		AddEventItem(77)
		AddEventItem(78)
		AddEventItem(79)
		AddEventItem(80)
		AddNote("Cã 4 lo¹i mÜ töu Kim L¨ng Xu©n, B¸ch Hoa Xu©n, Kinh Hoa Lé, Song C©u §¹i Khóc ")
		Msg2Player("Cã 4 lo¹i mÜ töu Kim L¨ng Xu©n, B¸ch Hoa Xu©n, Kinh Hoa Lé, Song C©u §¹i Khóc ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_no()
	Talk(1,"","§ïa µ! C­íp ng­êi ta hay sao? Kh«ng mua, quyÕt kh«ng mua!")
end;

function L10_buy_yes1()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(77)
		Msg2Player("Cã Kim L¨ng Xu©n ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes2()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(78)
		Msg2Player("Cã B¸ch Hoa Xu©n ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes3()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(79)
		Msg2Player("Cã Kinh Hoa Lé ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_yes4()
	if (GetCash() >= 400) then
		Pay(400)
		AddEventItem(80)
		Msg2Player("Cã Song C©u §¹i Khóc ")
	else
		L10_buy_noMoney()
	end
end;

function L10_buy_noMoney()
	Talk(1,"","Kh«ng cã tiÒn? VËy kh«ng ®­îc råi!")
end;
