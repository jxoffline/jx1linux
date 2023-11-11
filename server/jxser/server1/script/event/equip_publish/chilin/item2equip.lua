Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\chilin\\formula_def.lua")
IncludeLib("ITEM")
tbItem2Chilin = tbActivityCompose:new()

function tbItem2Chilin:GetComposeRate()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local tbAdditivelMaterial = self.tbFormula.tbMaterial.tbAdditivelMaterial
	return self:CalcRate(tbAdditivelMaterial ,tbRoomItems) + self.nSuccessRate
end

function tbItem2Chilin:CalcRate(tbAdditive, tbRoomItems)	
	-- »ñÈ¡³É¹¦ÂÊ
	local nSuccessRate = 0
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2Chilin:ConsumeAdditive(tbAdditive, szLogTitle)
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		end
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return 1;
end

function tbItem2Chilin:CheckEquip(nItemIndex, tbEquip, nProductId)

	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	
	if not self.bAccessBindItem and GetItemBindState(nItemIndex) ~= 0 then
		return
	end
	local nItemGenre = GetItemProp(nItemIndex)
	if nItemGenre == 7 then
		return
	end
	local nExpiredTime = ITEM_GetExpiredTime(nItemIndex)
	local nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	if nExpiredTime ~= 0 or nLeftUsageTime ~= 4294967295 then
		return 
	end
	local nQuality = GetItemQuality(nItemIndex)
	local nEqIndex = -1
	if nQuality == 1 then
		nEqIndex = GetGlodEqIndex(nItemIndex)
	elseif nQuality == 4 then
		nEqIndex = GetPlatinaEquipIndex(nItemIndex)
		if GetPlatinaLevel(nItemIndex) > 0 then
			return
		end
	end	
	
	if tbEquip.tbEqIndex[nEqIndex] == nProductId then
		return 1
	end
	return 
end

function tbItem2Chilin:ConsumeEquip(nItemIndex, tbItem, nProductId)
	if self:CheckEquip(nItemIndex, tbItem, nProductId) then
		if RemoveItemByIndex(nItemIndex) == 1 then
			return 1
		end
	end
end

function tbItem2Chilin:TraversalRoom(pCallBack, tbItem, nProductId)
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex and nItemIndex > 0 then
			if pCallBack(self, nItemIndex, tbItem, nProductId) then
				return 1
			end
		end
	end
	return
end

function tbItem2Chilin:Compose(nProductId)
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbCommonMaterial = tbMaterial.tbCommonMaterial
	local tbAdditivelMaterial = tbMaterial.tbAdditivelMaterial
	local tbFragment = tbMaterial.tbFragment
	local tbEquip = tbMaterial.tbEquip
	if not tbProduct then
		return 
	end
	
	if not self:CheckLimit(nProductId) then
		return 
	end
	
	-- ¼ÆËã³É¹¦ÂÊ
	
	local nSuccessRate = self:GetComposeRate()
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	if self:ConsumeMaterial(tbCommonMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	if self:ConsumeAdditive(tbAdditivelMaterial, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	
	if self:ConsumeMaterial(tbFragment, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	
	if random(1, 100) > nSuccessRate then
		Msg2Player("ThËt ®¸ng tiÕc chÕ t¹o ®· thÊt b¹i")
		if self.tbFormula.szAction then
			tbLog:PlayerActionLog(self.szLogTitle, self.tbFormula.szAction, nSuccessRate, "fail")
		end
		return 0
	end	
	
	if self:TraversalRoom(self.ConsumeEquip, tbEquip, nProductId) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:Give(tbProduct, nComposeCount, {self.szLogTitle})
	end
	return 1;
end

function tbItem2Chilin:CheckLimit(nProductId)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbCommonMaterial = tbMaterial.tbCommonMaterial
	local tbAdditivelMaterial = tbMaterial.tbAdditivelMaterial
	local tbFragment = tbMaterial.tbFragment
	local tbEquip = tbMaterial.tbEquip
	
	-- ¼ì²é±³°ü¿Õ¼ä
	if self.tbFormula.nWidth  and self.tbFormula.nHeight and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, 1) < 1 then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", 1, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return
	end
	if self:CheckMaterial(tbCommonMaterial, nComposeCount) ~=1 then
		local szMsg = "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return
	end
	if self:CheckMaterial(tbFragment, nComposeCount) ~=1 then
		local szMsg = "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return
	end
	if self:TraversalRoom(self.CheckEquip, tbEquip, nProductId) ~= 1 then
		local szMsg = format("<color=red>CÇn %d %s<color>", tbEquip.nCount, tbEquip.szName)
		Talk(1, "", szMsg)
		return
	end
	return 1
end

function tbItem2Chilin:GiveUIOk(nId, nCount)
	if not self:CheckLimit(nId) then
		return 
	end
	local nSuccessRate = self:GetComposeRate()
	local szMsg = format("§Æt nguyªn liÖu vµo nhËn ®­îc tØ lÖ thµnh c«ng lµ%d%%, ®¹i hiÖp cã muèn tiÕp tôc chÕ t¹o kh«ng?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "TØ lÖ thµnh c«ng v­ît qu¸ 100% sÏ l·ng phÝ nguyªn liÖu cña ®¹i hiÖp, ng­¬i cã muèn tiÕp tôc chÕ kh«ng?"
	end
	
	local tbOpt = 
	{
		{"TiÕp tôc chÕ t¹o", self.Compose, {self, nId}},
		{"§Æt vµo lÇn n÷a", self.ComposeGiveUI, {self, nId}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end
function tbItem2Chilin:GettbAdditivelDesc(tbMaterial)
	local szList = ""
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.szName and tbItem.nSuccessRate then
			szList = format("%s<enter>Mçi khi bá vµo  1 %s sÏ t¨ng %d%% tû lÖ thµnh c«ng", szList,tbItem.szName, tbItem.nSuccessRate)
		end
	end
	return szList
end

function tbItem2Chilin:GetMaterialDesc(tbMaterial)
	local szList = ""
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.nJxb then
			szList = format("%s<enter>%-20s  %d",szList,"Ng©n l­îng", tbItem.nJxb * tbItem.nCount)
		elseif tbItem.szName and tbItem.nCount then
			szList = format("%s<enter>%-20s  %d",szList,tbItem.szName, tbItem.nCount or 1)
		end
	end
	return szList
end
function tbItem2Chilin:GetComposeDesc()
	local szList = format("%-20s  %s","vËt phÈm ","Sè l­îng")
	local tbMaterial = self.tbFormula.tbMaterial
	local tbCommonMaterial = tbMaterial.tbCommonMaterial
	local tbAdditivelMaterial = tbMaterial.tbAdditivelMaterial
	local tbFragment = tbMaterial.tbFragment
	local tbEquip = tbMaterial.tbEquip
	szList = szList..self:GetMaterialDesc(tbCommonMaterial)
	szList = szList..self:GetMaterialDesc(tbFragment)
	szList = szList..self:GetMaterialDesc({tbEquip})
	szList = szList..("<enter>Bá thªm c¸c ®¹o cô sau ®©y sÏ gia t¨ng tû lÖ thµnh c«ng")
	szList = szList..self:GettbAdditivelDesc(tbAdditivelMaterial)
	return szList
end
function tbItem2Chilin:ComposeGiveUI(nId)
	g_GiveItemUI(format("ChÕ t¹o %s", self.tbFormula.tbProduct[nId].szName), self:GetComposeDesc(), {self.GiveUIOk, {self, nId}}, nil, self.bAccessBindItem)
end

function tbItem2Chilin:SelectEquip(nId, nCountPerPage)
	local szMsg = format("Chon mét c¸i %s", self.tbFormula.tbProduct.szName)
	local nProductCount = getn(self.tbFormula.tbProduct)
	local nEndId = nCountPerPage + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {self.tbFormula.tbProduct[i].szDesc, self.ComposeGiveUI, {self, i}})
	end
	if nId >= nCountPerPage + 1  then
		tinsert(tbOpt, {"Trang tr­íc", self.SelectEquip, {self, nId-nCountPerPage, nCountPerPage}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang kÕ ", self.SelectEquip, {self, nId+nCountPerPage, nCountPerPage}})
	end
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szMsg, tbOpt)
end

local tbComposeOpt = {}
for i=1, getn(tbFormulaList) do
	local p = tbItem2Chilin:new(tbFormulaList[i], "tbItem2Chilin", INVENTORY_ROOM.room_giveitem)
	p.nSuccessRate = 80
	local szOpt = format("ChÕ t¹o %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbComposeOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbComposeOpt, {"§Ó ta suy nghÜ kü l¹i xem", cancel})

function tbItem2Chilin:Dialog()
	CreateNewSayEx("§¹i hiÖp muèn chÕ t¹o bé phËn nµo cña trang bÞ XÝch L©n", %tbComposeOpt)
end

Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["chilin"] = {}
MAKE_EQUIP_LIST["chilin"].nPak = curpack()
MAKE_EQUIP_LIST["chilin"].pFun = tbItem2Chilin.Dialog
MAKE_EQUIP_LIST["chilin"].pSelf = tbItem2Chilin
MAKE_EQUIP_LIST["chilin"].szOpt = "ChÕ t¹o trang bÞ XÝch L©n"