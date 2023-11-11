--Î÷±±ÄÏÇø ·ïÏè¸® Â·ÈË18æÎ¿Í¶Ô»°
--Î÷±±ÄÏÇø ·ïÏè¸® »ªÉ½¾ø¶¥´«ËÍNPC 199,201
function main(sel)
	if(GetLevel() >= 60)then
		Say("Nh×n qua lµ biÕt ng­¬i lµ tuyÖt thÕ ®¹i hiÖp. Cã ph¶i ®Þnh ®Õn ®Ønh Hoa S¬n tû vâ ph¶i kh«ng? ChØ cÇn bá ra 500 l­îng, ta sÏ ®­a ng­¬i ®Õn tËn n¬i!",2,"Thó vÞ ®Êy, ®i xem thö! /yes","Kh«ng quan t©m, kh«ng muèn ®i. /no")
	else
		Say("§Ønh Hoa S¬n phÝa ®«ng cã mÊy tªn cø suèt ngµy chÐm giÕt,tranh giµnh thiªn h¹ ®Ö nhÊt g× ®ã. Bän ta ®­a c¸c ng­¬i ®Õn ®ã, thËt còng ch¼ng ph¶i lµ chuyÖn hay!",0)
	end
end;

function yes()
	if(GetCash() >= 500)then
		Pay(500);
		NewWorld(2, 2600, 3600);		
	else
		Say("500 l­îng mµ còng kh«ng cã lµm sao ®i?",0)
	end
end;

function no()
	Say("Lóc xuèng nói nhí t×m D­ Vâ nµy nhÐ!",0)
end;