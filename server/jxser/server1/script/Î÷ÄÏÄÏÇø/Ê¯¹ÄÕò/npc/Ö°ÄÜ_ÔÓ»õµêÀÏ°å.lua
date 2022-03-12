-- Ê¯¹ÄÕò Ö°ÄÜ ÔÓ»õµêÀÏ°å
-- By: Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local buttons = store_sel_village_extend();
		Say("Kh¸ch quan muèn mua g×? Muèn g× còng cã! ",getn(buttons), buttons);
end;

function yes()
	Sale(26)			-- ÁÙÊ±Ê¹ÓÃ£¬ÓëÁúÃÅÕòÖØÓÃ
end;

function no()
end;
