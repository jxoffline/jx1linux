--ÖĞÔ­±±Çø ÖìÏÉÕò ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("ChØ cÇn kh¸ch gia muèn, ë ®©y kh«ng thø g× lµ kh«ng cã.",getn(buttons), buttons);
end;


function yes()
Sale(87);   			--µ¯³ö½»Ò×¿ò
end;


function no()
end;