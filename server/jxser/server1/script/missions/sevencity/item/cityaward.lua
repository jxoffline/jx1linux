-- ¹¥³ÇÀñ°üÊ¹ÓÃ½Å±¾
Include("\\script\\lib\\awardtemplet.lua")

--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName="§iÓm kinh nghiÖm 1", 
--				pFun = function (tbItem, nItemCount, szLogTitle)
--					%tbvng_ChestExpAward:ExpAward(1500000, "C«ng Thµnh LÔ Bao (míi)")
--				end,
--				nRate = 60,
--	},
	{szName="§iÓm kinh nghiÖm 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "C«ng Thµnh LÔ Bao (míi)")
				end,
				nRate = 97.20,
	},
	{szName="§iÓm kinh nghiÖm 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "C«ng Thµnh LÔ Bao (míi)")
				end,
				nRate = 2,
	},
	{szName="§iÓm kinh nghiÖm 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "C«ng Thµnh LÔ Bao (míi)")
				end,
				nRate = 0.05,
	},
	{szName="§iÓm kinh nghiÖm 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "C«ng Thµnh LÔ Bao (míi)")
				end,
				nRate = 0.02,
	},
	{szName="§iÓm kinh nghiÖm 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "C«ng Thµnh LÔ Bao (míi)")
				end,
				nRate = 0.01,
	},
	{szName = "§å Phæ Tö M·ng Kh«i", 	tbProp = {6, 1, 2714, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng Y", 	tbProp = {6, 1, 2715, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng Yªu §¸i", 	tbProp = {6, 1, 2717, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng Hé UyÓn",	tbProp = {6, 1, 2718, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng H¹ng Liªn",	tbProp = {6, 1, 2719, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng Béi",		tbProp = {6, 1, 2720, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng Hµi",		tbProp = {6, 1, 2716, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng Th­îng Giíi ChØ",	tbProp = {6, 1, 2721, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng H¹ Giíi ChØ",	tbProp = {6, 1, 2722, 1, 0, 0}, nRate = 0.01},
	{szName = "§å Phæ Tö M·ng KhÝ Giíi",	tbProp = {6, 1, 2723, 1, 0, 0}, nRate = 0.01},
	{szName = "Tö M·ng LÖnh",			tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},
	{szName = "HuyÒn Viªn LÖnh",			tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.10},
	{szName = "MÆt n¹ Nguyªn so¸i",	tbProp = {0, 11, 447, 1, 0, 0}, nRate = 0.10},
	{szName = "B¸ch Niªn Tr©n Lé",		tbProp = {6, 1, 2266, 1, 0, 0}, nRate = 0.05},
	{szName = "V¹n Niªn Tr©n Lé",		tbProp = {6, 1, 2268, 1, 0, 0}, nRate = 0.02},
	{szName = "Thiªn Niªn Tr©n Lé",		tbProp = {6, 1, 2267, 1, 0, 0}, nRate = 0.01},	
	{szName = "ThÇn Hµnh Phï",			tbProp = {6, 1, 1266, 1, 0, 0}, nRate = 0.01, nExpiredTime = 14 * 24 * 60},
	
--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
--	{nExp = 1500000,  nRate = 48.02},
--	{nExp = 2000000,  nRate = 30},
--	{nExp = 5000000,  nRate = 5},
--	{nExp = 10000000, nRate	= 3},
--	{nExp = 20000000, nRate	= 2},
--	{nExp = 50000000, nRate	= 1},	

	{szName = "Ch×a Khãa Nh­ ý",		tbProp = {6, 1, 2744, 1, 0, 0}, nRate = 0.1},
	{szName = "Hçn Nguyªn Linh Lé",		tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 0.01},
	{szName = "Ngäc Qu¸n",			tbProp = {6, 1, 2311, 1, 0, 0}, nRate = 0.01},
	{szName = "CÈm nang thay ®æi trêi ®Êt",	tbProp = {6, 1, 1781, 1, 0, 0}, nRate = 0.1, tbParam = {60}},
	{szName = "Tiªn Th¶o Lé ®Æc biÖt",		tbProp = {6, 1, 1181, 1, 0, 0}, nRate = 0.1},
}

function main(nItemIndex)
	if (CalcFreeItemCellCount() < 1) then
		Say("Hµnh trang Ýt nhÊt ph¶i cã <color=red>1<color> « trèng míi nhËn ®­îc phÇn th­ëng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseCityAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("total rate is wrong", rate))
	end
end

test()
