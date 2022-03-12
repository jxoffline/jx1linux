-- ´óÀí Ö°ÄÜ Ò©µêÀÏ°å
-- By: Dan_Deng(2003-09-16)
Include( "\\script\\event\\teacherday\\teacherdayhead.lua" )
Include( "\\script\\event\\teacherday\\medicine.lua" )

OPTIONS = {}

function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main()
	Say("TiÖm ta sèng nhê §iÓm Th­¬ng s¬n, trªn ®ã cã hµng ngµn lo¹i th¶o d­îc.",
		getn(OPTIONS),
		OPTIONS)
end;

function yes()
	Sale(12)  			--µ¯³ö½»Ò×¿ò
end

if TEACHERSWITCH then
	tinsert(OPTIONS, "Gióp ta cÊt d­îc töu/brew")
end
tinsert(OPTIONS, "Giao dÞch/yes")
--tinsert(OPTIONS, "Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine")
tinsert(OPTIONS, "Kh«ng giao dÞch/Cancel")
