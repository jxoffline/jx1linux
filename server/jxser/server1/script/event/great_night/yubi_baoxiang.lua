-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æ - Óñèµ±¦Ïä
-- ÎÄ¼þÃû¡¡£ºyubi_baoxiang.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2011-03-23 17:08:58

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua")

--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 300triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

local tbAward = 
{
	[1]={szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nRate = 0.15,},
	[2]={szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nRate = 0.15,},
	[3]={szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nRate = 0.15,},
	[4]={szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nRate = 0.15,},
	[5]={szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nRate = 0.01,},
	[6]={szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nRate = 0.15,},
	[7]={szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nRate = 0.15,},
	[8]={szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nRate = 0.15,},
	[9]={szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nRate = 0.01,},
	[10]={szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nRate = 0.01,},
	[11]={szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nRate = 0.1,},
	[12]={szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nRate = 0.2,},
	[13]={szName="MÆt n¹ Nguyªn so¸i",tbProp={0,11,447,1,0,0},nRate = 0.2,},
	[14]={szName="B¸ch Niªn Tr©n Lé",tbProp={6,1,2266,1,0,0},nRate = 0.5,},
	[15]={szName="V¹n Niªn Tr©n Lé",tbProp={6,1,2268,1,0,0},nRate = 0.2,},
	[16]={szName="Thiªn Niªn Tr©n Lé",tbProp={6,1,2267,1,0,0},nRate = 0.3,},
	[17]={szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nExpiredTime=20160,nRate = 0.1,},
--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 300triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
--	[18]={nExp=1,nRate = 48.72,nCount = 1500000,},
--	[19]={nExp=1,nRate = 30.0,nCount = 2000000,},
--	[20]={nExp=1,nRate = 5.0,nCount = 5000000,},
--	[21]={nExp=1,nRate = 3.0,nCount = 10000000,},
--	[22]={nExp=1,nRate = 2.0,nCount = 20000000,},
--	[23]={nExp=1,nRate = 1.0,nCount = 50000000,},
	[18]={szName="§iÓm kinh nghiÖm 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(1500000, "Ngäc BÝch B¶o R­¬ng")
				end,
				nRate = 48.72,
			},
	[19]={szName="§iÓm kinh nghiÖm 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "Ngäc BÝch B¶o R­¬ng")
				end,
				nRate = 30.0,
			},
	[20]={szName="§iÓm kinh nghiÖm 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "Ngäc BÝch B¶o R­¬ng")
				end,
				nRate = 5.0,
			},
	[21]={szName="§iÓm kinh nghiÖm 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "Ngäc BÝch B¶o R­¬ng")
				end,
				nRate = 3.0,
			},
	[22]={szName="§iÓm kinh nghiÖm 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "Ngäc BÝch B¶o R­¬ng")
				end,
				nRate = 2.0,
			},
	[23]={szName="§iÓm kinh nghiÖm 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "Ngäc BÝch B¶o R­¬ng")
				end,
				nRate = 1.0,
			},

	[24]={szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2744,1,0,0},nRate = 1.0,},
	[25]={szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nRate = 0.2,},
	[26]={szName="Ngäc Qu¸n",tbProp={6,1,2311,1,0,0},nRate = 0.4,},
	[27]={szName="CÈm nang thay ®æi trêi ®Êt",tbProp={6,1,1781,1,0,0},tbParam = {60}, nRate = 5.0,},
	[28]={szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nRate = 1.0,},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	
	-- ÅÐ¶¨ÈçÒâÔ¿³×ÊÇ·ñ´æÔÚ
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("Ph¶i cã Ch×a Khãa Nh­ ý míi më ®­îc Ngäc BÝch B¶o R­¬ng", 1, "§ãng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	if ConsumeItem(3, 1, 6, 1, 2744, -1) == 1 then	-- ÏûºÄÈçÒâÔ¿³×
		tbAwardTemplet:GiveAwardByList(%tbAward, "use yubi_baoxiang", 1);
	end
	return 0
end
