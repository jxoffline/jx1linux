--Î÷ÄÏ±±Çø ½­½ò´å ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("Hµng chÊt ®Çy trong tiÓu ®iÕm, Kh¸ch quan muèn mua g× nµo? H·y vµo xem thö ®i!",getn(buttons), buttons);
end;


function yes()
Sale(23);   			--µ¯³ö½»Ò×¿ò
end;


function no()
end;






