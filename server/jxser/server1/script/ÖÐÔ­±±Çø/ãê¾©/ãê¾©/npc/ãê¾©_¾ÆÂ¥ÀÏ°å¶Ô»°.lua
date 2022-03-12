--ÖÐÔ­±±Çø ãê¾©¸® ¾ÆÂ¥ÀÏ°å¶Ô»°£¨ÉÙÁÖ50¼¶ÈÎÎñ£©
-- Update: Dan_Deng(2003-10-25)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+20) and (HaveItem(123) == 0) then		-- 50¼¶ÈÎÎñ½øÐÐÖÐ
		Say("§Ö nhÊt Thiªu Kª töu ®©y! Kinh thµnh ®Ö nhÊt töu ®©y! ChØ cã 500 l­îng th«i!",2,"Mua/buy","Kh«ng mµng /no")
	else
		Talk(1,"","Kh¸ch quan muèn uèng r­îu ­? Uèng r­îu th× ®­îc, nh­ng ta nãi tr­íc, ®Õn ®©y chØ ®­îc uèng r­îu, kh«ng nãi chuyÖn quèc sù. NÕu nh­ muèn nãi chuyÖn quèc sù th× xin mêi ®Õn n¬i kh¸c! ")
	end
end;

function buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(123)
		Msg2Player("Mua ®­îc mét con gµ n­íng ë töu lÇu ")
		AddNote("Mua ®­îc mét con gµ n­íng ë töu lÇu ")
	else
		Talk(1,"","Kh¸ch quan! Göi con gµ nµy ë ®©y! Xin h·y vÒ mang tiÒn ®Õn ®·! ")
	end
end

function no()
end
