--Î÷ÄÏ±±Çø ³É¶¼¸® ÔÓ»õµêÀÏ°å¶Ô»° 
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	UTask_em = GetTask(1);
	UTask_tm = GetTask(2);
	if (UTask_em == 30*256+50) then 		--¶ëáÒÅÉÄÂÔÆ´È30¼¶ÈÎÎñ
		Say("§ïi gµ n­íng cßn nãng hái võa míi lÊy trong bÕp. 50 l­îng b¹c mét c¸i, cã muèn lÊy kh«ng?", 3, "Ta muèn mua mét c¸i ®ïi gµ. /chicken", "Ta muèn mua hµng hãa kh¸c /yes", "Kh«ng giao dÞch/no")
	elseif ((UTask_em == 40*256+50) and (GetByte(GetTask(29),1) == 1)) then		--¶ëáÒÅÉ40¼¶ÈÎÎñ
		Say("Cã lo¹i tr©m b¹c kiÓu míi nhÊt, ®¾t hµng l¾m, chØ cã 200 l­îng b¹c, rÎ lµm sao, mua mét c©y nhÐ!", 3, "Mua Ng©n Tr©m /hairpin", "Mua hµng ho¸ kh¸c /yes", "Kh«ng giao dÞch/no")
	elseif (UTask_tm == 10*256+40) then		--ÌÆÃÅÌÆº×10¼¶ÈÎÎñ
		Say("ChiÕc nhÉn m· n·o nµy rÊt ®Ñp, 500 l­¬ng b¹c mét chiÕc. Kh«ng mua sÏ hèi hËn!", 3, "Mua nhÉn M· n·o. /ring", "Giao dÞch/yes", "Kh«ng giao dÞch/no")
	else
		local Buttons = store_sel_extend();
		Say("ë ®©y ta b¸n ®ñ chñng lo¹i hµng hãa,xin h·y chän lùa, xem cã g× dïng ®­îc kh«ng?", getn(Buttons), Buttons);
	end
end;

function chicken()
	if (GetCash() >= 50) then
		Pay(50)
		AddEventItem(119)
		Msg2Player("Mua ®­îc ®ïi gµ. ")
		AddNote("Mua ®­îc ®ïi gµ ë tiÖm t¹p ho¸ Thµnh §« ")
	else
		Say("Cã ®ñ tiÒn råi h·y ®Õn mua ®i, h·y xem nh÷ng mãn hµng kh¸c tr­íc ®i.", 2, "Giao dÞch/yes", "Kh«ng giao dÞch/no")		
	end
end;

function hairpin()
	if (GetCash() >= 200) then
		Pay(200)
		AddEventItem(63)
		Msg2Player("Mua ®­îc Ng©n Tr©m ")
--		SetTask(29, 4)
		AddNote("Mua ®­îc Ng©n Tr©m ë tiÖm t¹p hãa Thµnh §« ")
	else
		Say("Cã ®ñ tiÒn råi h·y ®Õn mua ®i, h·y xem nh÷ng mãn hµng kh¸c tr­íc ®i.", 2, "Giao dÞch/yes", "Kh«ng giao dÞch/no")		
	end
end;


function ring()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(165)
		Msg2Player("Mua ®­îc chiÕc nhÉn M· n·o ")
		AddNote("Mua ®­îc chiÕc nhÉn M· n·o ë tiÖm t¹p ho¸ Thµnh §« ")
	else
		Say("Cã ®ñ tiÒn råi h·y ®Õn mua ®i, h·y xem nh÷ng mãn hµng kh¸c tr­íc ®i.", 2, "Giao dÞch/yes", "Kh«ng giao dÞch/no")		
	end
end;

function yes()
Sale(14);  		--µ¯³ö½»Ò×¿ò
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
