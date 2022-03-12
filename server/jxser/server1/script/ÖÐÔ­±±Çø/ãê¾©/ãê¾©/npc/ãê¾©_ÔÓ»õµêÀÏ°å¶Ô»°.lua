--ÖĞÔ­±±Çø ãê¾©¸® ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("Kh¸ch quan cÇn g×? HiÖn giê thÕ ®¹o hçn lo¹n sèng ®­îc qua ngµy thËt kh«ng dÔ, tiÖm ta thø g× còng rÎ, muèn mua thø g×?", getn(Buttons), Buttons);
end;


function yes()
Sale(8);  			--µ¯³ö½»Ò×¿ò
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;


