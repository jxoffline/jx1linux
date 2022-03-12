Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")
Include("\\script\\lib\\objbuffer_head.lua")

function GetDesc(nItem)
	return ""
end
-- Thªm phÇn sö dông ch×a khãa vµng  -Modifiled by ThanhLD - 20130417	
tbXS_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbXS_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
    		{szName = "§å Phæ Tö M·ng Kh«i", tbProp = {6, 1,2714,1,0,0}, nRate = 0.03},
		{szName = "§å Phæ Tö M·ng Y", tbProp = {6, 1,2715,1,0,0}, nRate = 0.03},
		{szName = "§å Phæ Tö M·ng Yªu §¸i", tbProp = {6, 1,2717,1,0,0}, nRate = 0.03},
		{szName = "§å Phæ Tö M·ng Hé UyÓn", tbProp = {6, 1,2718,1,0,0}, nRate = 0.07},
		{szName = "§å Phæ Tö M·ng H¹ng Liªn", tbProp = {6, 1,2719,1,0,0}, nRate = 0.02},
		{szName = "§å Phæ Tö M·ng Béi", tbProp = {6, 1,2720,1,0,0}, nRate = 0.07},
		{szName = "§å Phæ Tö M·ng Hµi", tbProp = {6, 1,2716,1,0,0}, nRate = 0.07},
		{szName = "§å Phæ Tö M·ng Th­îng Giíi ChØ", tbProp = {6, 1,2721,1,0,0}, nRate = 0.01},
		{szName = "§å Phæ Tö M·ng H¹ Giíi ChØ", tbProp = {6, 1,2722,1,0,0}, nRate = 0.01},
		{szName = "§å Phæ Tö M·ng KhÝ Giíi", tbProp = {6, 1,2723,1,0,0}, nRate = 0.01},
		{szName = "Tö M·ng LÖnh", tbProp = {6, 1,2350,1,0,0}, nRate = 0.01},
		{szName = "HuyÒn Viªn LÖnh", tbProp = {6, 1,2351,1,0,0}, nRate = 0.2},
		{szName="3.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(3000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 63.34,
		},
		{szName="5.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(5000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 30,
		},
		{szName="8.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(8000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 5,
		},
		{szName="12.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(12000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 1,
		},
		{szName = "Thiªn B¶o Khè LÖnh", tbProp = {6, 1,2813,1,0,0}, nRate = 0.1},
    	},	
	["chiakhoavang"] = 
	{
		-- {szName="XÝch L©n LÖnh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.05},
		-- {szName="M¶nh XÝch L©n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=0.2},
		-- {szName="XÝch L©n Kim Bµi",tbProp={6,1,3392,1,0,0},nCount=1,nRate=0.1},
		-- {szName="XÝch L©n Tr¶o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=0.7},
		-- {szName="XÝch L©n Gi¸c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=0.3},
		-- {szName="XÝch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=0.1},
		-- {szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={2,0,0,0,0,0}},
		-- {szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.006,tbParam={6,0,0,0,0,0}},
		-- {szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.018,tbParam={5,0,0,0,0,0}},
		-- {szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={1,0,0,0,0,0}},
		-- {szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={9,0,0,0,0,0}},
		-- {szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={8,0,0,0,0,0}},
		-- {szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={4,0,0,0,0,0}},
		-- {szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={3,0,0,0,0,0}},
		-- {szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.016,tbParam={10,0,0,0,0,0}},
		-- {szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.006,tbParam={7,0,0,0,0,0}},
		-- {szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=10,nBindState=-2},
		-- {szName="l­îng",nJxb=1000000,nCount=1,nRate=4},
		-- {szName="l­îng",nJxb=500000,nCount=1,nRate=10},
		-- {szName="Tèc HiÖu B¹ch C©u Hoµn cÊp 150",tbProp={6,1,2975,1,0,0},nCount=1,nRate=3,nExpiredTime=10080,},
		-- {szName="XÝch L©n Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={2,0,0,0,0,0}},
		-- {szName="XÝch L©n Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.001,tbParam={6,0,0,0,0,0}},
		-- {szName="XÝch L©n Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={5,0,0,0,0,0}},
		-- {szName="XÝch L©n H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={1,0,0,0,0,0}},
		-- {szName="XÝch L©n Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={9,0,0,0,0,0}},
		-- {szName="XÝch L©n Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={8,0,0,0,0,0}},
		-- {szName="XÝch L©n Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={4,0,0,0,0,0}},
		-- {szName="XÝch L©n Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={3,0,0,0,0,0}},
		-- {szName="XÝch L©n H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.002,tbParam={10,0,0,0,0,0}},
		-- {szName="XÝch L©n KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.008,tbParam={7,0,0,0,0,0}},
		-- {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
		-- {szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
		-- {szName="Phong V©n Chiªu Binh LÔ Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},
		-- {szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1.5,nExpiredTime=43200},
		-- {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nRate=0.1,nExpiredTime=10080,nUsageTime = 60},
		-- {szName="Viªm §Õ LÖnh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="LÖnh Bµi Thñy TÆc",tbProp={6,1,2745,1,0,0},nCount=1,nRate=0.6,nExpiredTime=20160},
		-- {szName="Håi thiªn t¸i t¹o lÔ bao",tbProp={6,1,2527,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Trî Lùc Hoµn LÔ Bao",tbProp={6,1,30161,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Ho¹t HuyÕt §¬n LÔ Bao",tbProp={6,1,30160,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=0.5,nExpiredTime=20160},
		-- {szName="Phó Quý CÈm H¹p",tbProp={6,1,2402,1,0,0},nCount=1,nRate=1,nExpiredTime=1440},
		{szName="4.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(4000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 28.313,
		},
		{szName="5.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(5000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 18,
		},
		{szName="6.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(6000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 7,
		},
		{szName="8.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(12000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 4,
		},
		{szName="10.000.000 Exp", 
			pFun = function (tbItem, nItemCount, szLogTitle)
				%tbvng_ChestExpAward:ExpAward(10000000, "TÝn Sø B¶o R­¬ng")
			end,
			nRate = 2,
		},	
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbXS_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbXS_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("CÇn ph¶i cã Ch×a Khãa Vµng hoÆc Ch×a Khãa Nh­ ý míi cã thÓ më ®­îc B¶o R­¬ng TÝn Sø", 1, "§ãng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa nh­ ý/#VnXSBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa vµng/#VnXSBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "§ãng/Oncancel")
		Say("Sö dông ch×a khãa ®Ó më r­¬ng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnXSBoxNewAward(nItemIdx, strKeyType)
	local tbKey = tbXS_Key_Require[strKeyType]
	local tbAward = tbXS_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("CÇn ph¶i cã Ch×a Khãa Vµng hoÆc Ch×a Khãa Nh­ ý míi cã thÓ më ®­îc B¶o R­¬ng TÝn Sø", 1, "§ãng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 2812, -1) ~= 1 then
		Say("Kh«ng t×m thÊy B¶o R­¬ng TÝn Sø", 1, "§ãng/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"TinSu", "SuDungBaoRuongTinSu"})	
end 
