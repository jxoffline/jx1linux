IncludeLib("ITEM")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\vng_script\\features\\upgrade_equip\\head.lua")

tbVngUpgradeABDQ.AdditiveMaterial =
{
	{szName="Thiªn Tinh Kho¸ng", tbProp={6, 1, 30561}, nCount = 1,nSuccessRate = 10, nMaxSuccessRate = 10},	
}

tbVngUpgradeABDQ.tbFormulaList = 
{
	[167] = 
	{
		szName = "[Hoµn Mü] An Bang Kª HuyÕt Th¹ch Giíi ChØ",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",tbProp={0,167},nCount =1, },
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nCount =1,nSuccessRate = 1, nMaxSuccessRate = 70},
		},
		tbSpecialMaterial = {
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},				
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[165] = 
	{				
		szName = "[Hoµn Mü] An Bang Cóc Hoa Th¹ch ChØ Hoµn",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",tbProp={0,165},},
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},			
		},
		tbSpecialMaterial = {
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},	
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,		
	},
	[164] = 
	{
		szName = "[Hoµn Mü] An Bang B¨ng Tinh Th¹ch H¹ng Liªn",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp={0,164},},
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},		
			{szName = "TrÊn Hån Th¹ch", tbProp = {6,1,30560}, nCount = 5, },		
		},
		tbSpecialMaterial = {
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},			
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[166] = 
	{
		szName = "[Hoµn Mü] An Bang §iÒn Hoµng Th¹ch Ngäc Béi",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",tbProp={0,166},},
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},	
			{szName = "TrÊn Hån Th¹ch", tbProp = {6,1,30560}, nCount = 4, },		
		},		
		tbSpecialMaterial = {
			{szName = "An Bang Hån Th¹ch", tbProp = {6,1,30562}, nSuccessRate = 1, nMaxSuccessRate = 70},
		},	
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	--Dinh Quoc
	[160] = 
	{
		szName = "[Cùc phÈm] §Þnh Quèc Thanh Sa Ph¸t Qu¸n",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - §Þnh Quèc ¤ Sa Ph¸t Qu¸n",tbProp={0,160},},	
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
			{szName = "TrÊn Hån Th¹ch", tbProp = {6,1,30560}, nCount = 3, },			
		},
		tbSpecialMaterial = {
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[159] = 
	{
		szName = "[Cùc phÈm] §Þnh Quèc Thanh Sa Tr­êng Sam",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - §Þnh Quèc Thanh Sa Tr­êng Sam",tbProp={0,159},},
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},		
			{szName = "TrÊn Hån Th¹ch", tbProp = {6,1,30560}, nCount = 1, },		
		},
		tbSpecialMaterial = {
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},			
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[162] = 
	{
		szName = "[Cùc phÈm] §Þnh Quèc Tö §»ng Hé UyÓn",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - §Þnh Quèc Tö §»ng Hé uyÓn",tbProp={0,162},},			
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},		
		},		
		tbSpecialMaterial = {
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[163] = 
	{
		szName = "[Cùc phÈm] §Þnh Quèc Ng©n Tµm Yªu §¸i",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - §Þnh Quèc Ng©n Tµm Yªu ®¸i",tbProp={0,163},},	
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},				
		},			
		tbSpecialMaterial = {
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[161] = 
	{
		szName = "[Cùc phÈm] §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",
		tbNeedMaterial = 
		{
			{szName=" §å phæ Hoµng Kim - §Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",tbProp={0,161},},			
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},		
		},				
		tbSpecialMaterial = {
			{szName = "§Þnh Quèc Hån Th¹ch", tbProp = {6,1,30563}, nSuccessRate = 1, nMaxSuccessRate = 70},	
		},	
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
}

function tbVngUpgradeABDQ:UpgradeEquip()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nCheck , nGoldIndex, nItemIndex =  self:CheckGoldEqInRoomUI(tbRoomItems)
	if nCheck == 0 then
		return 0
	end
	
	local tbFormula= self.tbFormulaList[nGoldIndex]
	local tbFormulaListCheck = tbFormula.tbNeedMaterial
	if self:CheckMaterial(tbFormulaListCheck,1) ~= 1 then
		return Talk(1,"","Nguyªn liÖu chÕ t¹o kh«ng ®ñ, h·y kiÓm tra l¹i.")	
	end
	
	--check cho trong hanh trang 
	local nWidth = tbFormula.nWidth
	local nHeight = tbFormula.nHeight 
	if PlayerFunLib:CheckFreeBagCellWH(nWidth,nHeight,1,"default") ~= 1 then
		return
	end
	local nSuccessRate = self:GetComposeRate(tbFormula)
	local szMsg = format("<npc>§Æt nguyªn liÖu vµo nhËn ®­îc tØ lÖ thµnh c«ng lµ:<color=yellow>%d%%<color>, ®¹i hiÖp cã muèn tiÕp tôc chÕ t¹o kh«ng?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "TØ lÖ thµnh c«ng v­ît qu¸ 100% sÏ l·ng phÝ nguyªn liÖu cña ®¹i hiÖp, ng­¬i cã muèn tiÕp tôc chÕ kh«ng?"
	end	
	local tbOpt = 
	{
		{"§ång ý n©ng cÊp", self.UpgradeEquip_ProcessBar, {self,nGoldIndex,tbFormula,nSuccessRate}},
		{"§Ó ta ®Æt l¹i nguyªn liÖu", self.UpgradeEquip_UI, {self}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)		
end

local _OnBreak = function()
	Msg2Player("N©ng cÊp bÞ gi¸n ®o¹n, h·y lµm l¹i.")
end

--Dong y che tao
local _UpgradeEquipOK = function(nGoldIndex,tbFormula,nSuccessRate)		
	local szKeyLog = tbVngUpgradeABDQ.EVENT_LOG_TITLE
	--tru nguyen lieu truoc, roi moi tinh thanh cong hay that bai =))
	local nCheck1 =tbVngUpgradeABDQ:ConsumeAdditive(tbFormula.tbSpecialMaterial,2, szKeyLog.."- [Tru]: TrangbiHonthach")
	local nCheck2 =tbVngUpgradeABDQ:ConsumeMaterial(tbFormula.tbNeedMaterial, 1, szKeyLog.."- [Tru]: NguyenlieuChetao") 
	local nCheck3 =tbVngUpgradeABDQ:ConsumeAdditive(tbVngUpgradeABDQ.AdditiveMaterial,1, szKeyLog.."- [Tru]: ThienTinhKhoang")		
	if nCheck1 ~= 1 or nCheck2 ~= 1 or nCheck3 ~= 1 then
		tbLog:PlayerActionLog(szKeyLog, format("Cã g× ®ã kh«ng æn, nghi vÊn cheat - State: nCheck1=%d, nCheck2= %d, nCheck3 =%d",nCheck1,nCheck2,nCheck3))
		return 
	end	
	if random(1, 100) > nSuccessRate then
		Msg2Player(format("<color=yellow>¤i thÇn linh ¬i!!! thÊt b¹i råi sao...<color>"))
		Talk(1,"",format("<color=yellow>¤i thÇn linh ¬i!!! thÊt b¹i råi sao...<color>\n<color=red>ThËt kh«ng thÓ tin næi!<color>"))		
		return
	end	
	tbAwardTemplet:Give(tbVngUpgradeABDQ.tbEquip_Upgrade[nGoldIndex], 1, {szKeyLog.."- [CheTao]: ThanhCong"})	
end

function tbVngUpgradeABDQ:UpgradeEquip_ProcessBar(nGoldIndex,tbFormula,nSuccessRate)
	tbProgressBar:OpenByConfig(18, %_UpgradeEquipOK, {nGoldIndex,tbFormula,nSuccessRate}, %_OnBreak)
end

function tbVngUpgradeABDQ:CheckGoldEqInRoomUI(tbRoomItems)
	local nCountGoldEq = 0
	local nItemIndex = 0
	local nGoldIndex = 0 
	for i=1, getn(tbRoomItems) do
		if GetGlodEqIndex(tbRoomItems[i]) > 0 then
			nCountGoldEq = nCountGoldEq + 1
			nItemIndex = tbRoomItems[i] 
			nGoldIndex = GetGlodEqIndex(tbRoomItems[i] )
		end
	end
	if nCountGoldEq > 1 then
		Talk(1,"","ChØ ®­îc ®Æt mét trang bÞ cÇn n©ng cÊp")	
		return 0
	end
	if not self.tbFormulaList[nGoldIndex] or nGoldIndex == 0 then
		Talk(1,"","Trang bÞ nµy kh«ng thÓ n©ng cÊp.")	
		return 0
	end
	if self:CheckAll_DK_ReleaseEquip(nItemIndex) ~= 1 then
		return 0
	end	
	return nCountGoldEq, nGoldIndex, nItemIndex
end

function tbVngUpgradeABDQ:CheckMaterial(tbMaterial,nComposeCount)
	local i
	local flag = 1
	local tbCount  = {}
	local tbMaxSetCount = {}
	nComposeCount = nComposeCount or 1
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then
			tbItem.nCount = tbItem.nCount or 1
			local nItemNeedCount = tbItem.nCount * nComposeCount
			if nItemNeedCount > 0 then
				local tbProp = tbItem.tbProp
				tbProp[4] = tbProp[4] or -1		
				local nCurCount = self:CalcItemCount(tbRoomItems, tbItem)
				tbCount[i] = nCurCount
				--print("CheckMaterial - nCurCount"..nCurCount)
				tbMaxSetCount[i] = floor(nCurCount / nItemNeedCount)
				--print("CheckMaterial - tbMaxSetCount[i]"..tbMaxSetCount[i])
				if nCurCount < nItemNeedCount then
					flag =  0					
				end	
			end		
		end
	end	
	return flag, tbCount, tbMaxSetCount
end

function tbVngUpgradeABDQ:GetComposeRate(tbFormula)
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nRate = self:CalcRate(self.AdditiveMaterial ,tbRoomItems)
	local tbSpecialMaterial = tbFormula.tbSpecialMaterial
	nRate = nRate + self:CalcRate(tbSpecialMaterial ,tbRoomItems)
	return nRate
end

function tbVngUpgradeABDQ:CalcRate(tbAdditive, tbRoomItems)		
	local nSuccessRate = 0
	for i=1, getn(tbAdditive) do
		local nCount = self:CalcItemCount(tbRoomItems, tbAdditive[i])	
		if tbAdditive[i].nSuccessRate then
			local nSR = nCount * tbAdditive[i].nSuccessRate
			if nSR > tbAdditive[i].nMaxSuccessRate then
				nSR = tbAdditive[i].nMaxSuccessRate
			end
			nSuccessRate = nSuccessRate + nSR			
		end				
	end
	return nSuccessRate
end
-- nType = 1 trõ nguyªn liªu/Thien tinh khoang; 2: trõ Hån th¹ch
function tbVngUpgradeABDQ:ConsumeAdditive(tbAdditive, nType, szLogTitle)
	local nFlag = 1
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		local nMaxCount = floor(tbItem.nMaxSuccessRate / tbItem.nSuccessRate)
		if nCount > nMaxCount then
			nCount = nMaxCount
		end
		if nType == 2 and nCount > 0 then
			--tru di 1 hon thach vi da tru o trong tbmaterial roi
			nCount = nCount -1			
		end
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		elseif nType ~= 1 then
			nFlag = 0
		end		
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return nFlag
end