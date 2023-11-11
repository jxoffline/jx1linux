-- ÁÙ°²¡¡Ö°ÄÜ¡¡Ò©µêÀÏ°å
-- by£ºDan_Deng(2003-09-16)

-- Á¶ÖÆ»ìÔªÁéÂ¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	Say(10855,
		3,
		"Giao dŞch/yes",
		--"Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine",
		"Kh«ng giao dŞch/Cancel")
end;

function yes()
	Sale(12)  				--µ¯³ö½»Ò×¿ò
end
