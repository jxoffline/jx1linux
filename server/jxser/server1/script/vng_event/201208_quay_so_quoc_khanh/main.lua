--promotion quay sè th¸ng 8 - Created by DinhHQ - 20120821
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbQuocKhanh2012 = 
{
	nStartDate = 201208230000,
	nEndDate = 201209262400,
	tbPrizeList = {	
		[2] = {szName="Bé trang bÞ B¹ch Hæ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0},},	
		[3] = {
			[1] = {szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200,},
			[2] = {szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
			[3] = {szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
			szName = "Phi Phong Ngù Phong",
		},
		[4] = {szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}},
		[5] = {szName="§å Phæ B¹ch Hæ Vò KhÝ",tbProp={6,1,3182,1,0,0},nCount=8,nExpiredTime=259200},
		[6] = {szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
		[7] = {szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1},		
	},
	tbFreeCellReq = {
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5] = 8,
		[6] = 1,
		[7] = 1,
	},
	tbBitExpoint = {
		[2] = {nExtPointID = 5, nBit = 1},
		[3] = {nExtPointID = 5, nBit = 2},
		[4] = {nExtPointID = 5, nBit = 3},
		[5] = {nExtPointID = 5, nBit = 4},
		[6] = {nExtPointID = 5, nBit = 5},
		[7] = {nExtPointID = 5, nBit = 6},
	},
	nPrize8ExtID = 6,	
}

function tbQuocKhanh2012:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbQuocKhanh2012:CheckTime2Get8thPrize()
	local nCurHour = tonumber(date("%H"))
	if nCurHour < 5 and nCurHour >= 3 then
		return nil
	end
	return 1
end

function tbQuocKhanh2012:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("LÔ Quan", "NhËn phÇn th­ëng Quay sè [B¸t M¹ch Ch©n Kinh - Rinh ngay quµ khñng]", tbQuocKhanh2012.main,{tbQuocKhanh2012})
end

function tbQuocKhanh2012:main()
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nFlag = 0
	local strTittle = "Ta phô tr¸ch trao phÇn th­ëng ch­¬ng tr×nh quay sè <color=yellow>[B¸t M¹ch Ch©n Kinh - Rinh ngay quµ khñng]<color>. Danh s¸ch phÇn th­ëng cña c¸c h¹ nh­ sau:\n\n"
	for i = 2, 7 do
		local tbBitExtPoint = self.tbBitExpoint[i]
		if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", self.tbPrizeList[i].szName)
			tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng gi¶i %d", i), tbQuocKhanh2012.getAward, {tbQuocKhanh2012, i})
		end
	end
	if self:CheckTime2Get8thPrize() and GetExtPoint(self.nPrize8ExtID) > 0 then
		nFlag = 1
		tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng gi¶i %d", 8), tbQuocKhanh2012.get8thPrize, {tbQuocKhanh2012})
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh«ng cã phÇn th­ëng nµo")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbQuocKhanh2012:getAward(nAwardID)
	local tbBitExtPoint = self.tbBitExpoint[nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tróng phÇn th­ëng nµy.")
		return
	end
	if nAwardID == 3 then
		self:get3rdPrize()	
	else	
		local nFreeCell = self.tbFreeCellReq[nAwardID]
		if CalcFreeItemCellCount() < nFreeCell then
			Talk(1, "", format("§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa %d «  trèng trong hµnh trang råi míi nhËn th­ëng.", nFreeCell))
			return
		end
		if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
			Talk(1, "", "NhËn th­ëng kh«ng thµnh c«ng, xin h·y liªn hÖ ban ®iÒu hµnh cña trß ch¬i ®Ó ®­îc gi¶i quyÕt.")
				return
		end
		local tbTmpAward = self.tbPrizeList[nAwardID]
		tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "NhanPhanThuongGiai"..nAwardID})
	end
end

function tbQuocKhanh2012:get3rdPrize()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local tb3rdAward = self.tbPrizeList[3]
	for i = 1, getn(tb3rdAward) do
		tbMainDialog:AddOptEntry(format("Ta chän %s", tb3rdAward[i].szName), tbQuocKhanh2012.get3rdPrizeStep2, {tbQuocKhanh2012, i})
	end
	tbMainDialog.szTitleMsg = "Xin h·y chän phÇn th­ëng:"	
	tbMainDialog:Show()
end

function tbQuocKhanh2012:get3rdPrizeStep2(nIndex)
	if nIndex < 1 or nIndex > 3 then
		return
	end
	local tbBitExtPoint = self.tbBitExpoint[3]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tróng phÇn th­ëng nµy.")
		return
	end
	local nFreeCell = self.tbFreeCellReq[3]
	if CalcFreeItemCellCount() < nFreeCell then
		Talk(1, "", format("§Ó tr¸nh mÊt m¸t tµi s¶n, xin h·y chõa %d «  trèng trong hµnh trang råi míi nhËn th­ëng.", nFreeCell))
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "NhËn th­ëng kh«ng thµnh c«ng, xin h·y liªn hÖ ban ®iÒu hµnh cña trß ch¬i ®Ó ®­îc gi¶i quyÕt.")
			return
	end
		local tbTmpAward = self.tbPrizeList[3][nIndex]
		tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "NhanPhanThuongGiai3"})
end

function tbQuocKhanh2012:get8thPrize()	
	if self:CheckTime2Get8thPrize() ~= 1 then
		return
	end
	local nAwardCount = GetExtPoint(self.nPrize8ExtID)
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
	if PayExtPoint(self.nPrize8ExtID, nAwardCount) ~= 1 then
		return
	end
	local tbTmpAward = {szName="Tói Mõng Quèc Kh¸nh",tbProp={6,1,30241,1,0,0},nCount=nAwardCount,nExpiredTime=43200}
	tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "NhanPhanThuongGiai8"})
end

if tbQuocKhanh2012:IsActive() then
	tbQuocKhanh2012:AddDialog()
end