Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
Include("\\script\\event\\equip_publish\\baihu\\equiptable.lua")

IncludeLib("ITEM")
tbItem2BaiHu = tbActivityCompose:new()
tbItem2BaiHu.bAccessBindItem = 0
MSG_COMPOSE_TITLE = "Hîp thµnh 1 trang bÞ B¹ch Hæ yªu cÇu cã 1 B¹ch Hæ Kim Bµi, 3 HuyÒn Viªn Th¹ch, 1 Tö M·ng Th¹ch, 1 B¹ch Hæ LÖnh, Ýt cÇn cã 1 §å Phæ B¹ch Hæ t­¬ng øng vµ trang bÞ Kim ¤, 20000 v¹n l­îng, 1 viªn HuyÒn Tinh cÊp 9, vµ c¸c nguyªn liÖu kh¸c lµm t¨ng tØ lÖ thµnh c«ng"

CommonMaterial = 
{
	{szName="B¹ch Hæ Kim Bµi", tbProp={6, 1, 3183}, nCount = 1},
	{szName="HuyÒn Viªn Th¹ch", tbProp={6, 1, 2713}, nCount = 3},
	{szName="Tö M·ng Th¹ch", tbProp={6, 1, 3000}, nCount = 2},
	{szName="B¹ch Hæ LÖnh", tbProp={6, 1, 2357}, nCount = 1},	
	{szName="HuyÒn tinh kho¸ng th¹ch cÊp 9", tbProp={6, 1, 147, 9}, nCount = 1},
	{szName=" l­îng", nJxb=1, nCount = 50000000},
	
}

AdditiveMaterial =
{
	{szName = "B¹ch Hæ B¶o Th¹ch", tbProp = {6,1,3184}, nSuccessRate = 1, nMaxSuccessRate = 9},
	{szName = "B¹ch Hæ Thiªn Th¹ch", tbProp = {6,1,3185}, nSuccessRate = 2, nMaxSuccessRate = 18},
	{szName = "B¹ch Hæ ThÇn Th¹ch", tbProp = {6,1,3186}, nSuccessRate = 5, nMaxSuccessRate = 45},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "B¹ch Hæ H¹ng Liªn",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ H¹ng Liªn", tbProp = {6,1,3178}, nSuccessRate = 10, nMaxSuccessRate = 80},
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "B¹ch Hæ Kh«i",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Kh«i", tbProp = {6,1,3173}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "B¹ch Hæ Th­îng Giíi",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Th­îng Giíi", tbProp = {6,1,3180}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "B¹ch Hæ Hé UyÓn",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Hé UyÓn", tbProp = {6,1,3177}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "B¹ch Hæ Yªu §¸i",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Yªu §¸i", tbProp = {6,1,3176}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "B¹ch Hæ Y",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Y", tbProp = {6,1,3174}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "B¹ch Hæ Vò KhÝ",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Vò KhÝ", tbProp = {6,1,3182}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "B¹ch Hæ Hµi",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Hµi", tbProp = {6,1,3175}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},			
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "B¹ch Hæ Béi",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ B¹ch Hæ Béi", tbProp = {6,1,3179}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "B¹ch Hæ H¹ Giíi",
		tbSpecialMaterial = 
		{
			{szName = "B¹ch Hæ §å Phæ H¹ Giíi", tbProp = {6,1,3181}, nSuccessRate = 10, nMaxSuccessRate = 80},		
		},		

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


function tbItem2BaiHu:GetComposeRate()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nRate = self:CalcRate(%AdditiveMaterial ,tbRoomItems)
	local tbSpecialMaterial = self.tbFormula.tbSpecialMaterial
	nRate = nRate + self:CalcRate(tbSpecialMaterial ,tbRoomItems)
	return nRate
end

function tbItem2BaiHu:CalcRate(tbAdditive, tbRoomItems)	
	-- »ñÈ¡³É¹¦ÂÊ
	local nSuccessRate = 0
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		if nSR > v.nMaxSuccessRate then
			nSR = v.nMaxSuccessRate
		end
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2BaiHu:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local tbRecItem = self:MakeItem(nItemIndex)
	if tbRecItem.nQuality == 1 then
		if GetItemBindState(nItemIndex) ~= 0 then
			return
		end
		if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
			return
		end
		local nG = GetItemProp(nItemIndex)
		if nG == 7 then
			return
		end
	end
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
					return 
				end
			end
		end
	end	
	return 1
end
function tbItem2BaiHu:ConsumeAdditive(tbAdditive, szLogTitle)
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		local nMaxCount = floor(tbItem.nMaxSuccessRate / tbItem.nSuccessRate)
		if nCount > nMaxCount then
			nCount = nMaxCount
		end
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		end
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return 1;
end

function tbItem2BaiHu:Compose(nProductId)
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbGoldEquip	= self.tbFormula.tbGoldEquip[nProductId]
	local tbGoldEquipEx	= self.tbFormula.tbGoldEquipEx[nProductId]
	
	if not tbProduct then
		return 
	end
	
	-- ¼ì²é±³°ü¿Õ¼ä
	local nFreeItemCellLimit = 1
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- ¼ÆËã³É¹¦ÂÊ
	
	local nSuccessRate = self:GetComposeRate()
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	local szFailMsg = "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
	if self:CheckMaterial(%CommonMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial(self.tbFormula.tbSpecialMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial({tbGoldEquip}, 1) ~=1 and self:CheckMaterial({tbGoldEquipEx}, 1) ~= 1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	
	
	self:ConsumeMaterial(%CommonMaterial, 1, self.szLogTitle)
	self:ConsumeAdditive(self.tbFormula.tbSpecialMaterial, self.szLogTitle)
	self:ConsumeAdditive(%AdditiveMaterial, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("ThËt ®¸ng tiÕc chÕ t¹o ®· thÊt b¹i")
		return 0
	end
	
	if self:ConsumeMaterial({tbGoldEquip}, 1, self.szLogTitle) ~= 1 then
		self:ConsumeMaterial({tbGoldEquipEx}, 1, self.szLogTitle)
	end
	
	tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle})

	return 1;
end

function tbItem2BaiHu:GiveUIOk(nCount)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	
	local szFailMsg = "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
	if self:CheckMaterial(%CommonMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial(self.tbFormula.tbSpecialMaterial, 1) ~=1 then
		Talk(2, "", szFailMsg, self.tbFormula.tbSpecialMaterial[1].szName)
		return 0;
	end
	
	local nSuccessRate = self:GetComposeRate()
	local szMsg = format("§Æt nguyªn liÖu vµo nhËn ®­îc tØ lÖ thµnh c«ng lµ%d%%, ®¹i hiÖp cã muèn tiÕp tôc chÕ t¹o kh«ng?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "TØ lÖ thµnh c«ng v­ît qu¸ 100% sÏ l·ng phÝ nguyªn liÖu cña ®¹i hiÖp, ng­¬i cã muèn tiÕp tôc chÕ kh«ng?"
	end
	
	local tbOpt = 
	{
		{"TiÕp tôc chÕ t¹o", self.SelectEquip, {self, 1, 5}},
		{"§Æt vµo lÇn n÷a", self.ComposeGiveUI, {self}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2BaiHu:SelectEquip(nId, nCount)
	
	local msg = %MSG_COMPOSE_TITLE
	local szMsg = format("%s,lùa chän mét %s", msg, self.tbFormula.szName)
	local nProductCount = getn(self.tbFormula.tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.Compose, {self, i}})
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

local tbDialogOpt = {}
function tbItem2BaiHu:ComposeGiveUI()
		
	local szTitle = format("§æi %s", self.tbFormula.szName)
	local szContent = self:GetMaterialList(%CommonMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	szContent = format("%s<enter>%-20s  %s", szContent, "Trang bÞ Kim ¤", "1")
	szContent = format("%s<enter>%-20s  %s", szContent, "B¹ch Hæ §å Phæ", "1")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbItem2BaiHu:SelectParts()
	CreateNewSayEx(format("%s, lùa chän trang bÞ mµ ng­¬i muèn chÕ t¹o:", %MSG_COMPOSE_TITLE), %tbDialogOpt)
end

for i=1, getn(tbFormulaList) do
	tbFormulaList[i].tbProduct = tbEquip_BaiHu[i]
	tbFormulaList[i].tbGoldEquip = tbEquip_jinwu[i]
	tbFormulaList[i].tbGoldEquipEx = tbEquip_JinWuEx[i]
	
	local p = tbItem2BaiHu:new(tbFormulaList[i], "Item2BaiHu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("ChÕ t¹o %s", tbFormulaList[i].szName)
	tinsert(tbDialogOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbDialogOpt, {"Hñy bá "})


Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["baihu"] = {}
MAKE_EQUIP_LIST["baihu"].nPak = curpack()
MAKE_EQUIP_LIST["baihu"].pFun = tbItem2BaiHu.SelectParts
MAKE_EQUIP_LIST["baihu"].pSelf = tbItem2BaiHu
MAKE_EQUIP_LIST["baihu"].szOpt = "ChÕ T¹o Trang BÞ B¹ch Hæ"
