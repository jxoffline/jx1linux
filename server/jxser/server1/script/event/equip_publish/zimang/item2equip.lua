Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\zimang\\equiptable.lua")
tbItem2Equip = tbActivityCompose:new()

function tbItem2Equip:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nCount = self:CalcItemCount(tbRoomItems, tbAdditive)
	
	local nSuccessRate = nCount * tbAdditive.nSuccessRate
	if nSuccessRate > tbAdditive.nMaxSuccessRate then
		nSuccessRate = tbAdditive.nMaxSuccessRate
	end
	return nSuccessRate, nCount
end

function tbItem2Equip:ConsumeAdditive(nCount)
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  Ã¿´Î¶¼ÖØÐÂ»ñÈ¡£¬ÒÔ·ÀÖ¹ÓÐ±ä»¯
	
	if self:ConsumeItem(tbRoomItems, nCount, tbAdditive) ~= 1 then
		return
	end
	self:ConsumeLog(nCount.." "..tbAdditive.szName, self.szLogTitle)
	return 1
end


function tbItem2Equip:Compose(nComposeCount, nProductId)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	if not tbProduct then
		return 
	end
	
	nComposeCount = nComposeCount or 1
	
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	
	
	
	if self:ConsumeAdditive(nAdditiveCount) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	
	if random(1, 100) > nSuccessRate then
		Msg2Player("ThËt ®¸ng tiÕc chÕ t¹o ®· thÊt b¹i")
		return 0
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		AddStatData("zimang_jx1hechengzongshu", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
	end

	return 1;
end

function tbItem2Equip:GiveUIOk(nCount)
	if nCount < getn(self.tbFormula.tbMaterial) then
		return Talk(1, "", self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>")
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	local szMsg = format("Ng­¬i ®Æt vµo %d c¸i %s, tØ lÖ thµnh c«ng lµ %d%%, cã muèn tiÕp tôc chÕ t¹o kh«ng?", nAdditiveCount, self.tbFormula.tbAdditive.szName, nSuccessRate)
	local tbOpt = 
	{
		{"TiÕp tôc chÕ t¹o", self.SelectEquip, {self, 1, 5}},
		{"§Æt vµo lÇn n÷a", self.ComposeGiveUI, {self}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Equip:SelectEquip(nId, nCount)
	
	if self:CheckMaterial(self.tbFormula.tbMaterial, 1) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	local tbProduct = self.tbFormula.tbProduct
	local szMsg = format("Chon mét c¸i %s", tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.Compose, {self, 1, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"Trang tr­íc", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang kÕ ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szMsg, tbOpt)
end


tbCommonMaterial = 
{
	{szName="Tö M·ng Kim Bµi", tbProp={6, 1, 2765}, nCount = 1},
	{szName="Thanh C©u Th¹ch", tbProp={6, 1, 2710}, nCount = 4},
	{szName="V©n Léc Th¹ch", tbProp={6, 1, 2711}, nCount = 3},
	{szName="Th­¬ng Lang Th¹ch", tbProp={6, 1, 2712}, nCount = 2},
	{szName="HuyÒn Viªn Th¹ch", tbProp={6, 1, 2713}, nCount = 1},
	{szName="Tö M·ng LÖnh", tbProp={6, 1, 2350}, nCount = 1},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "Tö M·ng Kh«i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Kh«i", tbProp = {6,1,2714}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{
		szName = "Tö M·ng Y",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Y", tbProp = {6,1,2715}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[3] = 
	{
		szName = "Tö M·ng Hµi",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Hµi", tbProp = {6,1,2716}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "Tö M·ng Yªu §¸i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Yªu §¸i", tbProp = {6,1,2717}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "Tö M·ng Hé UyÓn",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Hé UyÓn", tbProp = {6,1,2718}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "Tö M·ng H¹ng Liªn",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng H¹ng Liªn", tbProp = {6,1,2719}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "Tö M·ng Béi",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Béi", tbProp = {6,1,2720}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[8] = 
	{
		szName = "Tö M·ng Th­îng Giíi ChØ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng Th­îng Giíi ChØ", tbProp = {6,1,2721}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "Tö M·ng H¹ Giíi chØ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng H¹ Giíi ChØ", tbProp = {6,1,2722}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "Tö M·ng KhÝ Giíi",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "§å Phæ Tö M·ng KhÝ Giíi", tbProp = {6,1,2723}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

for i=1, getn(tbFormulaList) do
	tbEquip_zimang[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_zimang[i]
	
	local p = tbItem2Equip:new(tbFormulaList[i], "Item2Equip", INVENTORY_ROOM.room_giveitem)
	p.bAccessBindItem = 1
	local szOpt = format("ChÕ t¹o %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbOpt, {"Hñy bá "})

local dialog = function()
	CreateNewSayEx("Lùa chän trang bÞ b¹n muèn chÕ t¹o", %tbOpt)
end

Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["zimang"] = {}
MAKE_EQUIP_LIST["zimang"].nPak = curpack()
MAKE_EQUIP_LIST["zimang"].pFun = dialog
MAKE_EQUIP_LIST["zimang"].pSelf = nil
MAKE_EQUIP_LIST["zimang"].szOpt = "ChÕ t¹o  trang bÞ Tö M·ng"

