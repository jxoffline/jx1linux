--Î÷±±ÄÏÇø ·ïÏè¸® Ìú½³ÆÌÀÏ°å¶Ô»°

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Muèn mua lo¹i vò khÝ nµo? Xin mêi xem vµ chän tù nhiªn."
function main(sel)
	tiejiang_city(TIEJIANG_DIALOG);
end;


function yes()
	Sale(19);  			--µ¯³ö½»Ò×¿ò
end;

