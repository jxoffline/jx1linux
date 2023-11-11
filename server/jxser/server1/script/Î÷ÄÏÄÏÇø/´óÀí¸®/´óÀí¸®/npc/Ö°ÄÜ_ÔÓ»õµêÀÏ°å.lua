-- ´óÀí¡¡Ö°ÄÜ ÔÓ»õµêÀÏ°å
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("§å ë chç ta võa rÎ l¹i dÔ b¸n, h«m qua võa mua hµng míi vÒ, vui qu¸! ", getn(Buttons), Buttons)
end;

function yes()
	Sale(17)
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
