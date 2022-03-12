Include("\\script\\activitysys\\config\\17\\head.lua")
-- Include("\\script\\activitysys\\config\\17\\config.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

pActivity.tbAward = {}
pActivity.tbAward["shuizeibaoxiang"] = 
{	
	{szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.3},
	{szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.03},
	{szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nCount=1,nRate=1.8},
	{szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nCount=1,nRate=1.8},
	{szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.03},
	{szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.03},
	{szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.03},
	{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.3},
	{szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
	{szName="MÆt n¹ Nguyªn so¸i",tbProp={0,11,447,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="B¸ch Niªn Tr©n Lé",tbProp={6,1,2266,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="V¹n Niªn Tr©n Lé",tbProp={6,1,2268,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
	{szName="Thiªn Niªn Tr©n Lé",tbProp={6,1,2267,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	
	{szName="§iÓm kinh nghiÖm 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(3000000, "B¶o R­¬ng Thñy TÆc")
				end,
				nRate = 25,
	},
	{szName="§iÓm kinh nghiÖm 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "B¶o R­¬ng Thñy TÆc")
				end,
				nRate = 17.78,
	},
	{szName="§iÓm kinh nghiÖm 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(8000000, "B¶o R­¬ng Thñy TÆc")
				end,
				nRate = 7,
	},
	{szName="§iÓm kinh nghiÖm 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(12000000, "B¶o R­¬ng Thñy TÆc")
				end,
				nRate = 4,
	},
	{szName="§iÓm kinh nghiÖm 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(15000000, "B¶o R­¬ng Thñy TÆc")
				end,
				nRate = 2,
	},
	{szName="§iÓm kinh nghiÖm 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "B¶o R­¬ng Thñy TÆc")
				end,
				nRate = 1,
	},
	
	{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=4},
	{ szName = "Hoµng Kim Ên (C­êng hãa)", tbProp = {0,3205}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (C­êng hãa)", tbProp = {0,3206}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (C­êng hãa)", tbProp = {0,3207}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (C­êng hãa)", tbProp = {0,3208}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (C­êng hãa)", tbProp = {0,3209}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (Nh­îc hãa)", tbProp = {0,3215}, nRate = 4, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (Nh­îc hãa)", tbProp = {0,3216}, nRate = 3, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (Nh­îc hãa)", tbProp = {0,3217}, nRate = 2, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (Nh­îc hãa)", tbProp = {0,3218}, nRate = 1.5, nExpiredTime = 10080, nQuality = 1, nCount = 1},
	{ szName = "Hoµng Kim Ên (Nh­îc hãa)", tbProp = {0,3219}, nRate = 1, nExpiredTime = 10080, nQuality = 1, nCount = 1},
}
