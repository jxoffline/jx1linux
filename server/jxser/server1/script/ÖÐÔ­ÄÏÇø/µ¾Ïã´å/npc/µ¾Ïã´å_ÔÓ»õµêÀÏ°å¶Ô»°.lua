--ÖĞÔ­ÄÏÇø µ¾Ïã´å ÔÓ»õµêÀÏ°å¶Ô»°
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("Hµng hãa mäi miÒn tiÖm ta ®Òu cã!",getn(buttons), buttons);
end;


function yes()
Sale(90);   			--µ¯³ö½»Ò×¿ò
end;


function no()
end;