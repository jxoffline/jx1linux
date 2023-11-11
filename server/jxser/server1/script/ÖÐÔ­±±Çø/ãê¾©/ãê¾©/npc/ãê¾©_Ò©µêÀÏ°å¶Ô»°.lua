--ÖĞÔ­±±Çø ãê¾©¸® Ò©µêÀÏ°å¶Ô»°
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

-- Á¶ÖÆ»ìÔªÁéÂ¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

OPTIONS = {}

function main(sel)
	Say("TiÖm ta thuèc nµo còng cã, d­ìng th©n kiÖn thÓ, kĞo dµi tuæi thä, bæ m¸u İch khİ, ng­¬i muèn mua g×?",
		getn(OPTIONS),
		OPTIONS)
end

function yes()
	Sale(9) 			--µ¯³ö½»Ò×¿ò
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "Gióp ta cÊt d­îc töu/brew")
end
tinsert(OPTIONS, "Giao dŞch/yes")
--tinsert(OPTIONS, "Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine")
tinsert(OPTIONS, "Kh«ng giao dŞch/Cancel")
