--promotion Noel - Created by DinhHQ - 20121206
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbPromotionAward = 
{
	nStartDate = 201212170000,
	nEndDate = 201301162400,
	strPromotionName = "VËn KhÝ §«ng Phong - ThÇn Long Ban Phóc",
	strLogTittle = "QuaySoNoel",
	tbPrizeList = {	
		[1] = 
		{
			strSubProm = "Quay sè tróng th­ëng",
			tbAward = 
			{
				[1] = nil,
				[2] = {szName="HuyÕt Long §»ng cÊp 5",tbProp={6,1,30289,5,0,0},nCount=5,},
				[3] = {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
				[4] = {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=10000},
				[5] = {szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}},
				[6] = {szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0}},
				[7] = 
				{
					szName = "Phi Phong CÊp 6 (chän 1 trong 3 lo¹i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[2] = {szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[3] = {szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
				},
				[8] = 
				{
					szName = "Phi Phong CÊp 7 (chän 1 trong 3 lo¹i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong PhÖ Quang (DÞch chuyÓn tøc thêi )",tbProp={0,3476},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[2] = {szName="Phi phong PhÖ Quang (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3477},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[3] = {szName="Phi phong PhÖ Quang (Träng kÝch)",tbProp={0,3478},nCount=1,nQuality = 1,nExpiredTime=259200,},
				},
			},
		},
		[2] =
		{
			strSubProm = "TÝch lòy ®æi quµ",
			tbAward = 
			{
				[1] = {szName="Gia H¹n Phï",tbProp={6,1,30225,1,0,0},nCount=1},
				[2] = {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
				[3] = {szName="Hçn nguyªn ch©n ®¬n",tbProp={6,1,30301,1,0,0},nCount=1},
				[4] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=129600},
				[5] = {szName="B¹ch Hæ KhÝ Giíi (Max Option) - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={29,0,0,0,0,0}},
				[6] = 
				{
					szName = "Phi Phong CÊp 7 (chän 1 trong 3 lo¹i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong PhÖ Quang (DÞch chuyÓn tøc thêi )",tbProp={0,3476},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[2] = {szName="Phi phong PhÖ Quang (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3477},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[3] = {szName="Phi phong PhÖ Quang (Träng kÝch)",tbProp={0,3478},nCount=1,nQuality = 1,nExpiredTime=129600,},
				},
			},
		},
		[3] =
		{
			strSubProm = "Mua quµ gi¸ rÎ",
			tbAward = 
			{
				[1] = {szName="Qu¶ Hoµng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1},
				[2] = {szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0}},
				[3] = 
				{
					szName = "Phi Phong CÊp 6 (chän 1 trong 3 lo¹i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[2] = {szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[3] = {szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
				},
				[4] ={szName="XÝch Long C©u",tbProp={0,10,9,1,0,0},nCount=1},
				[5] = 
				{
					szName = "Phi Phong CÊp 7 (chän 1 trong 3 lo¹i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong PhÖ Quang (DÞch chuyÓn tøc thêi )",tbProp={0,3476},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[2] = {szName="Phi phong PhÖ Quang (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3477},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[3] = {szName="Phi phong PhÖ Quang (Träng kÝch)",tbProp={0,3478},nCount=1,nQuality = 1,nExpiredTime=129600,},
				},
			},
		},		
	},
	tbFreeCellReq = {
		[1] =
		{
			[2] = 1,
			[3] = 1,
			[4] = 20,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
		},
		[2] ={
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
		},
		[3] ={
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 60,
			[5] = 1,
		},	
	},
	tbBitExpoint = {
		[1] =
		{
			[2] = {nExtPointID = 4, nBit = 2},
			[3] = {nExtPointID = 4, nBit = 3},
			[4] = {nExtPointID = 4, nBit = 4},
			[5] = {nExtPointID = 4, nBit = 5},
			[6] = {nExtPointID = 4, nBit = 6},
			[7] = {nExtPointID = 4, nBit = 7},
			[8] = {nExtPointID = 4, nBit = 8},
		},
		[2] ={
			[1] = {nExtPointID = 4, nBit = 9},
			[2] = {nExtPointID = 4, nBit = 12},
			[3] = {nExtPointID = 4, nBit = 14},
			[4] = {nExtPointID = 5, nBit = 4},
			[5] = {nExtPointID = 5, nBit = 5},
			[6] = {nExtPointID = 5, nBit = 6},
		},
		[3] ={
			[1] = {nExtPointID = 5, nBit = 7},
			[2] = {nExtPointID = 5, nBit = 11},
			[3] = {nExtPointID = 5, nBit = 12},
			[4] = {nExtPointID = 5, nBit = 14},
			[5] = {nExtPointID = 5, nBit = 15},
		},			
	},
	nExtPoint_Xmas_Box_Count = 6
}

function tbPromotionAward:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbPromotionAward:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("ChiÕn T©m T«n Gi¶", "VËn KhÝ §«ng Phong - ThÇn Long Ban Phóc", tbPromotionAward.main,{tbPromotionAward})
end

function tbPromotionAward:main()
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian diÔn ra ch­¬ng tr×nh.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)	
	tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng %s", self.tbPrizeList[1].strSubProm), tbPromotionAward.SelectAward, {tbPromotionAward, 1})
	tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng %s", self.tbPrizeList[2].strSubProm), tbPromotionAward.SelectAward, {tbPromotionAward, 2})
	tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng %s", self.tbPrizeList[3].strSubProm), tbPromotionAward.SelectAward, {tbPromotionAward, 3})
	tbMainDialog.szTitleMsg = format("Ta phô tr¸ch trao phÇn th­ëng ch­¬ng tr×nh <color=yellow>%s<color>, xin hái vÞ ®¹i hiÖp ®©y cÇn g×?", self.strPromotionName)
	tbMainDialog:Show()
end

function tbPromotionAward:SelectAward(nSubProm)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nFlag = 0
	local strTittle = "Danh s¸ch phÇn th­ëng cña c¸c h¹ nh­ sau:\n\n"	
	for i = 1, getn(self.tbBitExpoint[nSubProm]) do
		if self.tbBitExpoint[nSubProm][i] then
			local tbBitExtPoint = self.tbBitExpoint[nSubProm][i]
			if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) == 1 then
				nFlag = 1
				strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", self.tbPrizeList[nSubProm].tbAward[i].szName)
				tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng %s", self.tbPrizeList[nSubProm].tbAward[i].szName), tbPromotionAward.getAward, {tbPromotionAward, nSubProm, i})
			end
		end
	end	
	if nSubProm == 1 and self:CheckTimeGetXmasBox() == 1 and GetExtPoint(self.nExtPoint_Xmas_Box_Count) > 0 then
		nFlag = 1
		tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng %s", "Hép Quµ Gi¸ng Sinh"), tbPromotionAward.GetXmasBoxDialog, {tbPromotionAward})
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh«ng cã phÇn th­ëng nµo")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbPromotionAward:getAward(nSubProm, nAwardID)
	if nSubProm == 1 and nAwardID == 1 then		
		return
	end
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng.")
		return
	end
	local tbTmpAward = self.tbPrizeList[nSubProm].tbAward[nAwardID]
	if tbTmpAward.bSelectiveAward and tbTmpAward.bSelectiveAward == 1 then
		self:PickAward(nSubProm, nAwardID)
		return
	end
	
	local tbBitExtPoint = self.tbBitExpoint[nSubProm][nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tróng phÇn th­ëng nµy.")
		return
	end	
	local nFreeCell = self.tbFreeCellReq[nSubProm][nAwardID]
	if CalcFreeItemCellCount() < nFreeCell then
		Talk(1, "", format("§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa %d «  trèng trong hµnh trang råi míi nhËn th­ëng.", nFreeCell))
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "NhËn th­ëng kh«ng thµnh c«ng, xin h·y liªn hÖ ban ®iÒu hµnh cña trß ch¬i ®Ó ®­îc gi¶i quyÕt.")
			return
	end	
	tbAwardTemplet:Give(tbTmpAward, 1, {strLogTittle, "NhanPhanThuongGiai["..nSubProm.."]["..nAwardID.."]"})	
end

function tbPromotionAward:CheckTimeGetXmasBox()
	local nCurHour = tonumber(date("%H"))
	if nCurHour < 5 and nCurHour >= 3 then
		return nil
	end
	return 1
end

function tbPromotionAward:GetXmasBoxDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	tbMainDialog.szTitleMsg = format("HiÖn t¹i c¸c h¹ cã <color=yellow>%d<color> Hép Quµ Gi¸ng Sinh cã thÓ nhËn, cã muèn nhËn ngay kh«ng?", GetExtPoint(self.nExtPoint_Xmas_Box_Count))
	tbMainDialog:AddOptEntry("Ta muèn nhËn", tbPromotionAward.GetXmasBox, {tbPromotionAward})
	tbMainDialog:Show()
end

function tbPromotionAward:GetXmasBox()
	if self:CheckTimeGetXmasBox() ~= 1 then
		return
	end
	local nAwardCount = GetExtPoint(self.nExtPoint_Xmas_Box_Count)
	if nAwardCount <= 0 then
		return
	end
	if nAwardCount > 60 then
		nAwardCount = 60	
	end
	if CalcFreeItemCellCount() < nAwardCount then
		Talk(1, "", format("§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa %d «  trèng trong hµnh trang råi míi nhËn th­ëng.", nAwardCount))
		return
	end
	if PayExtPoint(self.nExtPoint_Xmas_Box_Count, nAwardCount) ~= 1 then
		return
	end
	local tbTmpAward = {szName="Hép Quµ Gi¸ng Sinh",tbProp={6,1,30332,1,0,0},nCount=nAwardCount,nExpiredTime=43200}
	tbAwardTemplet:Give(tbTmpAward, 1, {self.strLogTittle, "NhanPhanThuongHopQuaGiangSinh"})
end

function tbPromotionAward:PickAward(nSubProm, nAwardID)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	tbMainDialog.szTitleMsg = "Xin h·y chän phÇn th­ëng"
	local tbTmpAward = self.tbPrizeList[nSubProm].tbAward[nAwardID]
	for i = 1, getn(tbTmpAward) do
		tbMainDialog:AddOptEntry(tbTmpAward[i].szName, tbPromotionAward.DoPickAward, {tbPromotionAward, nSubProm, nAwardID, i})		
	end
	tbMainDialog:Show()
end

function tbPromotionAward:DoPickAward(nSubProm, nAwardID, nAwardID2)
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng.")
		return
	end
	local tbBitExtPoint = self.tbBitExpoint[nSubProm][nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tróng phÇn th­ëng nµy.")
		return
	end	
	local nFreeCell = self.tbFreeCellReq[nSubProm][nAwardID]
	if CalcFreeItemCellCount() < nFreeCell then
		Talk(1, "", format("§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa %d «  trèng trong hµnh trang råi míi nhËn th­ëng.", nFreeCell))
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "NhËn th­ëng kh«ng thµnh c«ng, xin h·y liªn hÖ ban ®iÒu hµnh cña trß ch¬i ®Ó ®­îc gi¶i quyÕt.")
			return
	end	
	local tbTmpAward = self.tbPrizeList[nSubProm].tbAward[nAwardID][nAwardID2]
	tbAwardTemplet:Give(tbTmpAward, 1, {strLogTittle, "NhanPhanThuongGiai["..nSubProm.."]["..nAwardID.."]"})	
end

if tbPromotionAward:IsActive() then
	tbPromotionAward:AddDialog()
end