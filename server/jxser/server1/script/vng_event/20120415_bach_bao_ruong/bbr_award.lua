--PhÇn th­ëng tõ tÝnh n¨ng B¸ch B¶o R­¬ng - Created By DinhHQ - 20120415
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")
tbBBRAward = {}
tbBBRAward.tbFlag = {
	["LongLenhKy"] = {szName = "Long LÖnh Kú", tbProp = {6, 1, 3056, 1, 0, 0}},
	["LanLenhKy"] = {szName = "L©n LÖnh Kú", tbProp = {6, 1, 3057, 1, 0, 0}},
	["QuyLenhKy"] = {szName = "Quy LÖnh Kú", tbProp = {6, 1, 3059, 1, 0, 0}},
	["PhungLenhKy"] = {szName = "Phông LÖnh Kú", tbProp = {6, 1, 3058, 1, 0, 0}},
}
tbBBRAward.tbProduct = {
	["LongLenhKy"] = {
		{tbProduct = {szName = "Kim ¤ Ph¸t Qu¸n - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim ¤ Hµi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim ¤ Kim Kh¶i - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}}, nFlagRequire = 900},
		{tbProduct = {szName = "Kim ¤ Yªu §¸i - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim ¤ H¹ng Liªn - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}}, nFlagRequire = 700},
		{tbProduct = {szName = "Kim ¤ Hé UyÓn - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}}, nFlagRequire = 800},
		{tbProduct = {szName = "Kim ¤ Ngäc Béi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}}, nFlagRequire = 750},
		{tbProduct = {szName = "Kim ¤ Th­îng Giíi ChØ - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "Kim ¤ H¹ Giíi ChØ - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}}, nFlagRequire = 1000},
		{tbProduct = {szName = "Kim ¤ KhÝ Giíi - Tù chän hÖ ph¸i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}}, nFlagRequire = 3000},
		{tbProduct = {szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1}, nFlagRequire = 600},
		{tbProduct = {szName="Vò §· Hµ",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B×nh L¹c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Håi Xu©n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh« Méc",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L­u V©n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Nª Tr¹ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L«i Háa KiÕp",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Mª Tóy Thiªn H­¬ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="§iÖp Vò Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["LanLenhKy"] = {
		{tbProduct = {szName="MÆt n¹ V­¬ng Gi¶",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 400},
		{tbProduct = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080, nUsageTime=60}, nFlagRequire = 30},
		{tbProduct = {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 240},
		{tbProduct = {szName="Phong V©n B¹ch M·",tbProp={0,10,19,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 100, },
		{tbProduct = {szName="Phiªn Vò (HSD 1 th¸ng)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=43200}, nFlagRequire = 20},
		{tbProduct = {szName="Phiªn Vò (HSD 3 th¸ng)",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=129600}, nFlagRequire = 60},
		{tbProduct = {szName="Vò §· Hµ",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B×nh L¹c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Håi Xu©n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh« Méc",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L­u V©n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Nª Tr¹ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L«i Háa KiÕp",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Mª Tóy Thiªn H­¬ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="§iÖp Vò Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},		
	},
	["QuyLenhKy"] = {
		{tbProduct = {szName="1000 v¹n ng©n l­îng", nJxb = 10000000, nCount = 1}, nFlagRequire = 8},
		{tbProduct = {szName="5000 v¹n ng©n l­îng", nJxb = 50000000, nCount = 1}, nFlagRequire = 40},
		{tbProduct = {szName="10000 v¹n ng©n l­îng", nJxb = 100000000, nCount = 1}, nFlagRequire = 80},
		{tbProduct = {szName="50000 v¹n ng©n l­îng", nJxb = 500000000, nCount = 1}, nFlagRequire = 400},
		{tbProduct = {szName="Vò §· Hµ",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B×nh L¹c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Håi Xu©n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh« Méc",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L­u V©n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Nª Tr¹ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L«i Háa KiÕp",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Mª Tóy Thiªn H­¬ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="§iÖp Vò Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},
	},
	["PhungLenhKy"] = {
		{tbProduct = {szName="Hoµng Kim Ên (C­êng hãa) cÊp 7",tbProp={0,3211},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="Hoµng Kim Ên (C­êng hãa) cÊp 8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="Hoµng Kim Ên (Nh­îc hãa) cÊp 7",tbProp={0,3221},nCount=1,nQuality = 1,}, nFlagRequire = 2000},
		{tbProduct = {szName="Hoµng Kim Ên (Nh­îc hãa) cÊp 8",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=129600,}, nFlagRequire = 3000},
		{tbProduct = {szName="Vò §· Hµ",tbProp={0,3880},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Thanh B×nh L¹c",tbProp={0,3881},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Håi Xu©n",tbProp={0,3882},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Kh« Méc",tbProp={0,3883},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L­u V©n ",tbProp={0,3884},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Nª Tr¹ch",tbProp={0,3885},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="L«i Háa KiÕp",tbProp={0,3886},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Mª Tóy Thiªn H­¬ng",tbProp={0,3887},nCount=1,nQuality = 1,nExpiredTime=10080}, nFlagRequire = 10},
		{tbProduct = {szName="§iÖp Vò Hoa Phi",tbProp={0,3888},nCount=1,nQuality = 1,nExpiredTime=10080,}, nFlagRequire = 10},
		{tbProduct = {szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,}, nFlagRequire = 2},
	},
}
function tbBBRAward:main()
	local tb = {
		format("Ta muèn sö dông Long LÖnh Kú ®æi phÇn th­ëng/#tbBBRAward:SelectAward('%s', %d)", "LongLenhKy", 1),
		format("Ta muèn sö dông L©n LÖnh Kú ®æi phÇn th­ëng/#tbBBRAward:SelectAward('%s', %d)", "LanLenhKy", 1),
		format("Ta muèn sö dông Quy LÖnh Kú ®æi phÇn th­ëng/#tbBBRAward:SelectAward('%s', %d)", "QuyLenhKy", 1),
		format("Ta muèn sö dông Phông LÖnh Kú ®æi phÇn th­ëng/#tbBBRAward:SelectAward('%s', %d)", "PhungLenhKy", 1),
		"Hñy bá/Oncancel",
	}
	Describe("Khi thu thËp ®ñ sè l­îng lÖnh kú, ng­¬i cã thÓ ®em ®Õn ta ®Ó ®æi phÇn th­ëng. Danh s¸ch vËt phÈm th­ëng vµ gi¸ trÞ quy ®æi sÏ ®­îc cËp nhËt liªn tôc.", getn(tb), tb)
end

function tbBBRAward:SelectAward(strFlag, nStartIndex)	
	local tb1 = self.tbProduct[strFlag]
	if nStartIndex < 1 or nStartIndex > getn(tb1) then
		return
	end
	local tb2
	local nEndIndex
	local tbDialog = {}
	if nStartIndex +11 > getn(tb1) then
		nEndIndex = getn(tb1)
	else
		nEndIndex = nStartIndex + 11
	end
	for i = nStartIndex, nEndIndex do
		tb2 = tb1[i]
		tinsert(tbDialog , format("%s/#tbBBRAward:MakeCompose('%s', %d)", tb2.tbProduct.szName, strFlag, i))
	end
	if nEndIndex < getn(tb1) then	
		tinsert(tbDialog, format("Trang kÕ/#tbBBRAward:SelectAward('%s', %d)", strFlag, nEndIndex + 1))
	end
	if nStartIndex > 1 then
		tinsert(tbDialog, format("Trë l¹i/#tbBBRAward:SelectAward('%s', %d)", strFlag, nStartIndex - 12))
	end
	tinsert(tbDialog, "Hñy bá/Oncancel")
	Describe("Xin h·y chän phÇn th­ëng:", getn(tbDialog), tbDialog)
end

function tbBBRAward:MakeCompose(strFlag, nProductID)
	local tbTemp = self.tbProduct[strFlag][nProductID]
	local tbMat = {}
	tbMat[1] = {}
	tbMat[1].nCount = tbTemp.nFlagRequire
	tbMat[1].szName = self.tbFlag[strFlag].szName
	tbMat[1].tbProp = self.tbFlag[strFlag].tbProp	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbTemp.tbProduct,	
		nWidth = 3,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	}
	pCompos = tbActivityCompose:new(tbFormula, strFlag.."DoiPhanThuong");
	pCompos:ComposeDailog(1);
end

pEventType:Reg("LÔ Quan", "PhÇn th­ëng Phong V©n B¶o §iÖn", tbBBRAward.main, {tbBBRAward})