--promotion 123 pay - Created by DinhHQ - 20130423
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbPromotionAward = 
{
	nStartDate = 201304180000,
	nEndDate = 201305052400,
	tbPrizeList = {	
		[5] = {szName="HuyÕt Long §»ng CÊp 5",tbProp={6,1,30289,5,0,0},nCount=10,nBindState = -2},
		[4] = {szName="Long §¶m",tbProp={0,3499},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080,},
		[3] = {szName="Hçn nguyªn ch©n ®¬n",tbProp={6,1,30301,1,0,0},nCount=1, nBindState=-2},
		[2] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=43200,nBindState=-2},
		[1] = {szName="LÔ Bao Phi Phong (cÊp 7)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={7,1,86400,0,0,0},  nExpiredTime = 10080, nBindState=-2},
	},
	tbFreeCellReq = {
		[5] = 2,
		[4] = 1,
		[3] = 1,
		[2] = 1,
		[1] = 1,
	},
	tbBitExpoint = {
		[1] = {nExtPointID = 3, nBit = 14},
		[2] = {nExtPointID = 3, nBit = 13},
		[3] = {nExtPointID = 3, nBit = 12},
		[4] = {nExtPointID = 3, nBit = 11},
		[5] = {nExtPointID = 3, nBit = 10},
	},
	strEventName = "promotion 123 Pay",
	strLog = "promotion123pay",
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
	nId = pEventType:Reg("ChiÕn T©m T«n Gi¶", format("NhËn phÇn th­ëng %s", self.strEventName), tbPromotionAward.main,{tbPromotionAward})
end

function tbPromotionAward:main()
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
	local strTittle = format("Ta phô tr¸ch trao phÇn th­ëng ch­¬ng tr×nh <color=yellow>%s<color>. Danh s¸ch phÇn th­ëng cña c¸c h¹ nh­ sau:\n\n", self.strEventName)
	for i = 1, getn(self.tbBitExpoint) do
		local tbBitExtPoint = self.tbBitExpoint[i]
		if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", self.tbPrizeList[i].szName)
			tbMainDialog:AddOptEntry(format("NhËn phÇn th­ëng gi¶i %d", i), tbPromotionAward.getAward, {tbPromotionAward, i})
		end
	end	
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh«ng cã phÇn th­ëng nµo")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbPromotionAward:getAward(nAwardID)
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian nhËn th­ëng.")
		return
	end
	local tbBitExtPoint = self.tbBitExpoint[nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tróng phÇn th­ëng nµy.")
		return
	end	
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
	tbAwardTemplet:Give(tbTmpAward, 1, {self.strLog, "NhanPhanThuongGiai"..nAwardID})	
end

if tbPromotionAward:IsActive() then
	tbPromotionAward:AddDialog()
end