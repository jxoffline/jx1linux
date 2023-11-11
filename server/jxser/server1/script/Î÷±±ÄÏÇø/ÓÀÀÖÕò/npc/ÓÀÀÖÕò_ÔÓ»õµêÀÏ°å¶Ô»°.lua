--Î÷±±ÄÏÇø ÓÀÀÖÕò ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("kh¸ch quan muèn cÇn mua g×? Thø g× còng cã!",getn(buttons), buttons);
end;


function yes()
Sale(84);   			--µ¯³ö½»Ò×¿ò
end;


function no()
end;