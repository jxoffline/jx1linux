--Ã÷ÔÂÀÏÈË¶Ô»°
--ÔÂ±ý»»¶ÔÓ¦ÀñÆ·
--mingyuelaoren.lua
--2005-09-07


tbCAKE2GIFT = {
		[891] = { "<#> B¸nh trung thu nh©n ®Ëu ", "<#> 1 Tiªn Th¶o lé ",			{ 6, 1, 71, 1, 0, 0, 0 } },
		[893] = { "<#> B¸nh Trung Thu §Ëu Trøng", "<#> 1 Phóc Duyªn lé (®¹i) ",		{ 6, 1, 124, 1, 0, 0, 0 } },
		[895] = { "<#> B¸nh Trung thu H¹nh nh©n", "<#> ThÇn BÝ §¹i Hång Bao",			{ 6, 1, 402, 1, 0, 0, 0 } },
		[896] = { "<#> B¸nh trung thu thËp cÈm ", "shijin_ex_goldequip()" }
}

tbSHIJIN2GOLDEQUIP = {
		{ "<#> §å phæ Hoµng Kim - §Þnh Quèc Thanh Sa Tr­êng Sam", { 0, 159 }, 0.12 },
		{ "<#> §å phæ Hoµng Kim - §Þnh Quèc ¤ Sa Ph¸t Qu¸n", { 0, 160 }, 0.12 },
		{ "<#> §å phæ Hoµng Kim - §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa", { 0, 161 }, 0.12 },
		{ "<#> §å phæ Hoµng Kim - §Þnh Quèc Tö §»ng Hé uyÓn", { 0, 162 }, 0.12 },
		{ "<#> §å phæ Hoµng Kim - §Þnh Quèc Ng©n Tµm Yªu ®¸i", { 0, 163 }, 0.12 },
		{ "<#> §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn", { 0, 164 }, 0.1 },
		{ "<#> §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn", { 0, 165 }, 0.1 },
		{ "<#> §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi", { 0, 166 }, 0.1 },
		{ "<#> §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ", { 0, 167 }, 0.1 },
}

function main()
	local tbOpp = {
				"<#> §©y lµ B¸nh trung thu nh©n ®Ëu, xin mêi dïng thö!/#cake_ex_gift(891)",
				"<#> §©y lµ b¸nh trung thu ®Ëu trøng, xin mêi dïng thö!/#cake_ex_gift(893)",
				"<#> §©y lµ B¸nh Trung thu H¹nh nh©n, xin mêi dïng thö!/#cake_ex_gift(895)",
				"<#> §©y lµ b¸nh trung thu thËp cÈm, xin mêi dïng thö!/#cake_ex_gift(896)",
				"<#> Kh«ng cã g×! Ta chØ ®Õn th¨m l·o th«i!/OnCancel",
	}
	Say("<#> Tay nghÒ lµm b¸nh cña c¸c vÞ s­ phô ë ®©y ®Òu vµo h¹ng th­îng thõa. Mçi n¨m ta ®Òu tr«ng ®îi dÞp trung thu nµy. B¹n trÎ cã chuyÖn g× kh«ng?", getn(tbOpp), tbOpp )
end

function OnCancel()
end

function cake_ex_gift(dtype)
	local count = CalcEquiproomItemCount( 6, 1, dtype, -1 )
	if ( count <= 0 ) then
		Say("<#> B¹n trÎ! B¸nh trung thu cña ng­¬i ®©u? §Þnh trªu chäc giµ nµy ­?", 1, "<#> Xin lçi! Ta sai råi!/OnCancel" )
		return
	end
	Say("<#> A! X­a giê ta ch­a bao giê ®­îc ¨n b¸nh ngon nh­ vÇy! §©y lµ chót thµnh ý! Cã b¸nh ngon nhí quay l¹i tÆng cho ta nhÐ!", 1, "NhËn lÔ phÈm!/#take_ex_gift("..dtype..")")

end

function take_ex_gift(dtype)
	local dpass = ConsumeEquiproomItem(1, 6, 1, dtype, -1)
	if ( dpass ~= 1 ) then
		print("delete item cake error dtype = "..dtype)
		return
	end
	Msg2Player("<#> B¹n mÊt 1 "..tbCAKE2GIFT[dtype][1])
	
	if ( dtype == 896 ) then
		shijin_ex_goldequip()
	else
		AddItem(tbCAKE2GIFT[dtype][3][1], tbCAKE2GIFT[dtype][3][2], tbCAKE2GIFT[dtype][3][3], tbCAKE2GIFT[dtype][3][4], tbCAKE2GIFT[dtype][3][5], tbCAKE2GIFT[dtype][3][6], tbCAKE2GIFT[dtype][3][7] )
		Msg2Player("<#> B¹n nhËn ®­îc "..tbCAKE2GIFT[dtype][2])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[dtype][1].." in exchange for "..tbCAKE2GIFT[dtype][2])
	end
end

function shijin_ex_goldequip()
	local base = 0
	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		base = base + tbSHIJIN2GOLDEQUIP[ i ][ 3 ]
	end
	base = 100 * base
	
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		sum = sum + tbSHIJIN2GOLDEQUIP[i][3] * 100
		if( sum >= num ) then
			AddGoldItem( tbSHIJIN2GOLDEQUIP[i][2][1], tbSHIJIN2GOLDEQUIP[i][2][2] )
			Msg2Player("<#> B¹n nhËn ®­îc 1 bé "..tbSHIJIN2GOLDEQUIP[i][1])
			WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[896][1].." in exchange for "..tbSHIJIN2GOLDEQUIP[i][1])
			break
		end
	end
end