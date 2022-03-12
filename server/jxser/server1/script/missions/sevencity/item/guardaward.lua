-- ÎÀÖùÀñ°üÊ¹ÓÃ½Å±¾
Include("\\script\\lib\\awardtemplet.lua")

--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName = "§å Phæ Tö M·ng Hµi", 		tbProp = {6, 1, 2716, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "§å Phæ Tö M·ng Yªu §¸i", 		tbProp = {6, 1, 2717, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "§å Phæ Tö M·ng Hé UyÓn", 		tbProp = {6, 1, 2718, 1, 0, 0}, 	nRate = 0.12},
--	{szName = "Tö Tinh Kho¸ng Th¹ch", 			tbProp = {6, 1, 30040, 1, 0, 0}, 	nRate = 44},
--	{szName = "Tinh LuyÖn Th¹ch", 			tbProp = {6, 1, 2280, 1, 0, 0}, 	nRate = 27.34},
--	{szName = "ThÇn Quy Bæ HuyÕt §¬n (tiÓu)", 	tbProp = {6, 1, 2583, 1, 0, 0}, 	nRate = 18.3,	nCount = 10},
--	{szName = "ThÇn Quy Bæ HuyÕt §¬n (trung)",	tbProp = {6, 1, 2582, 1, 0, 0},		nRate = 10,		nCount = 10},

--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428	
--	{szName="§iÓm kinh nghiÖm", nExp=5000000, nRate=30},
--	{szName="§iÓm kinh nghiÖm", nExp=10000000, nRate=20},
--	{szName="§iÓm kinh nghiÖm", nExp=15000000, nRate=15},
--	{szName="§iÓm kinh nghiÖm", nExp=20000000, nRate=10},
	{szName="§iÓm kinh nghiÖm 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "VÖ Trô LÔ Bao")
				end,
				nRate = 30,
	},
	{szName="§iÓm kinh nghiÖm 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "VÖ Trô LÔ Bao")
				end,
				nRate = 20,
	},
	{szName="§iÓm kinh nghiÖm 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "VÖ Trô LÔ Bao")
				end,
				nRate = 15,
	},
	{szName="§iÓm kinh nghiÖm 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "VÖ Trô LÔ Bao")
				end,
				nRate = 10,
	},
	
	{szName="CÈm nang thay ®æi trêi ®Êt", tbProp={6,1,1781,1,0,0}, tbParam={60}, nRate=8},
	{szName="Tiªn Th¶o Lé ®Æc biÖt", tbProp={6,1,1181,1,0,0}, nRate=7},
	{szName="B¸ch Niªn Tr©n Lé", tbProp={6,1,2266,1,0,0}, nRate=5},
	{szName="V¹n Niªn Tr©n Lé", tbProp={6,1,2268,1,0,0}, nRate=2},
	{szName="Thiªn Niªn Tr©n Lé", tbProp={6,1,2267,1,0,0}, nRate=1},
	{szName="ThÇn Hµnh Phï", tbProp={6,1,1266,1,0,0}, nRate=2, nExpiredTime=20160},

}

function main()
	if (CalcFreeItemCellCount() < 1) then
		Say("Hµnh trang Ýt nhÊt ph¶i cã <color=red>1<color> « trèng míi nhËn ®­îc phÇn th­ëng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseGuardAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("invalid rate: %d", rate))
	end
end

