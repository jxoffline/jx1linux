-- ÎÄ¼þÃû¡¡£ºbossbaoxiang.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£ºµÀ¾ßboss±¦ÏäÊ¹ÓÃ½Å±¾
-- ´´½¨Ê±¼ä£º2011-08-29 11:44:06

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nRate = 1.1,},
	[2]={szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nRate = 1.1,},
	[3]={szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nRate = 1.1,},
	[4]={szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nRate = 1.1,},
	[5]={szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nRate = 0.5,},
	[6]={szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nRate = 0.5,},
	[7]={szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nRate = 0.7,},
	[8]={szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nRate = 0.3,},
	[9]={szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nRate = 0.3,},
	[10]={szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nRate = 0.1,},
	[11]={szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nRate = 0.05,},
	[12]={szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2744,1,0,0},nRate = 1,},
	[13]={nExp_tl=1,nRate = 39.29,nCount = 1500000,},
	[14]={nExp_tl=1,nRate = 32.14,nCount = 3000000,},
	[15]={nExp_tl=1,nRate = 16,nCount = 5000000,},
	[16]={nExp_tl=1,nRate = 2,nCount = 8000000,},
	[17]={nExp_tl=1,nRate = 1,nCount = 12000000,},
	[18]={nExp_tl=1,nRate = 0.2,nCount = 15000000,},
	[19]={nExp_tl=1,nRate = 0.1,nCount = 20000000,},
	[20]={szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nRate = 1,},
	[21]={szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3208,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
	[22]={szName="B¹ch C©u Hoµn ®Æc biÖt",tbProp={6,1,1157,1,0,0},nRate = 0.02,},
	[23]={szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3218,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
}

function main(nIndexItem)
	nWidth = 1
	nHeight = 1
	nFreeItemCellLimit = 1
	-- ÅÐ¶¨ÈçÒâÔ¿³×ÊÇ·ñ´æÔÚ
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("CÇn cã ch×a khãa Nh­ ý míi cã thÓ më B¶o R­¬ng Boss!", 1, "§ãng/no")
		return 1
	end
	
	local Genre, DetailType, Particular=GetItemProp(nIndexItem)
	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	
	ConsumeItem(3, 1, 6, 1, 2744, -1)	-- ÏûºÄÈçÒâÔ¿³×
	tbAwardTemplet:Give(%tbAward, 1, {"GoldBoss", "use_bossBox"})
	
	return 0
end