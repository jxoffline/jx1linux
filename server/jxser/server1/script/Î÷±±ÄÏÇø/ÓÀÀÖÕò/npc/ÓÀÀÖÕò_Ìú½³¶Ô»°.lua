--Î÷±±ÄÏÇø ÓÀÀÖÕò Ìú½³¶Ô»°
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Muèn lo¹i vò khİ nµo? CÇn lo¹i nµo sÏ cã lo¹i ®ã!"

function main(sel)
	tiejiang_village()
end;


function yes()
Sale(83);  			--µ¯³ö½»Ò×¿ò
end;
