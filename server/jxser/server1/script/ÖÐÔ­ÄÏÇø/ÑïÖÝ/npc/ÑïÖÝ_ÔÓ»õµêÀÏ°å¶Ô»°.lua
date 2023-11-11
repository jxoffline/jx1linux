--ÖÐÔ­ÄÏÇø ÑïÖÝ¸® ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("§­êng thñy D­¬ng Ch©u cña chóng ta th«ng ra bèn ng·, lµ n¬i cã ®ñ hµng hãa tõ Nam tíi B¾c, v× thÕ vËt phÈm chóng t«i cã ®ñ §«ng T©y Nam B¾c, thø g× còng cã, mua mét Ýt g× ®i?", getn(Buttons), Buttons);

end;


function yes()
Sale(5);  			--µ¯³ö½»Ò×¿ò
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;





