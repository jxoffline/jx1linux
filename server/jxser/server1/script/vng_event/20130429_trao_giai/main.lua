--promotion 123 pay - Created by DinhHQ - 20121203
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbPromotionAward = 
{
	nStartDate = 201304010000,
	nEndDate = 201304052400,
	tbPrizeList = {	
		[1] = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},
		[2] = {szName="Phong V©n B¹ch M·",tbProp={0,10,19,1,0,0},nCount=1,nExpiredTime=129600},
		[3] = {szName="Gia H¹n Phï",tbProp={6,1,30225,1,0,0},nCount=2},
		[4] = {szName="Phi phong cÊp 6 lÔ hép",tbProp={6,1,30302,1,0,0},nCount=1,nExpiredTime=10080},
		[5] = {szName="Long §¶m",tbProp={0,3499},nCount=1,nQuality = 1,nExpiredTime=129600,nBindState=-2},
	},
	tbFreeCellReq = {
		[1] = {1,1,1},
		[2] = {2,3,1},
		[3] = {1,1,1},
		[4] = {1,1,1},		
		[5] = {1,1,1},		
	},
	tbBitExpoint = {
		[1] = {nExtPointID = 3, nBit = 3},
		[2] = {nExtPointID = 3, nBit = 4},
		[3] = {nExtPointID = 3, nBit = 5},
		[4] = {nExtPointID = 3, nBit = 6},		
		[5] = {nExtPointID = 3, nBit = 7},		
	},	
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
	nId = pEventType:Reg("ChiÕn T©m T«n Gi¶", "NhËn phÇn th­ëng promotion 123Pay", tbPromotionAward.main,{tbPromotionAward})
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
	local strTittle = "Ta phô tr¸ch trao phÇn th­ëng ch­¬ng tr×nh <color=yellow>promotion 123Pay<color>. Danh s¸ch phÇn th­ëng cña c¸c h¹ nh­ sau:\n\n"
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
function tbPromotionAward:FreeItemCellCount(tbFreeCellReq)
	if CountFreeRoomByWH(tbFreeCellReq[1],tbFreeCellReq[2], tbFreeCellReq[3]) < tbFreeCellReq[3] then
		return 1,format("Xin h·y chõa <color=red>%d x %d <color>« trèng hµnh trang råi h·y nhËn th­ëng",tbFreeCellReq[1],tbFreeCellReq[2])
	end
	return 0
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
	local nRet,szMsg = self:FreeItemCellCount(self.tbFreeCellReq[nAwardID])
	if nRet ~= 0 then
		Talk(1, "", szMsg)
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "NhËn th­ëng kh«ng thµnh c«ng, xin h·y liªn hÖ ban ®iÒu hµnh cña trß ch¬i ®Ó ®­îc gi¶i quyÕt.")
			return
	end
	local tbTmpAward = self.tbPrizeList[nAwardID]
	tbAwardTemplet:Give(tbTmpAward, 1, {"Promotion123Pay", "NhanPhanThuongGiai"..nAwardID})	
end

if tbPromotionAward:IsActive() then
	tbPromotionAward:AddDialog()
end