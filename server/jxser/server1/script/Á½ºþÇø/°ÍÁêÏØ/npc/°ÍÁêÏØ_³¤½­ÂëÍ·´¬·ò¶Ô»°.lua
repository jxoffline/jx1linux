--Á½ºþÇø °ÍÁêÏØ ³¤½­ÂëÍ·´¬·ò¶Ô»°
--suyu
--200306015
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

CurWharf = 5;
Include("\\script\\global\\station.lua")

function main(sel)
	--if (GetLevel() >= 5) then		--µÈ¼¶´ïµ½Îå¼¶
	--	Say("Ta cã biÖt hiÖu lµ 'L·ng Lý B¹ch §iÒu', ba ®êi ®Òu sèng dùa vµo s«ng n­íc! Kh¾p Ba L¨ng huyÖn nµy kh«ng cã ai lµ ®èi thñ! Kh¸ch quan muèn ®i ®©u!", 2, "Ngåi thuyÒn/WharfFun", "Kh«ng ngåi/OnCancel")
	--else		
	--	Talk(1,"","Bªn ngoµi lo¹n l¹c, xem ng­¬i trãi gµ kh«ng chÆt! Ra ngoµi th«n ta e kh«ng gi÷ ®­îc m¹ng ®©u!")
	--end
end;

function  OnCancel()
   Talk(1,"","Kh«ng tiÒn kh«ng thÓ ngåi thuyÒn! ")
end;
