Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\jinwu\\equiptable.lua")
tbItem2Jinwu = tbActivityCompose:new()

function tbItem2Jinwu:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	
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

function tbItem2Jinwu:Compose(nComposeCount, nProductId)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbAdditive = self.tbFormula.tbAdditive
	if not tbProduct then
		return 
	end
		
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- ¼ì²é±³°ü¿Õ¼ä
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- ¼ÆËã³É¹¦ÂÊ
	local nSuccessRate = self:GetSuccessRate()	
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end	
	
	--thay Tö M·ng Th¹ch = trang bÞ Tö M·ng
	local nMatId = tbProduct.tbProp[2] - 230
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{szName = strZimangName, tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>ChÕ t¹o <color=yellow>%s<color=red> cÇn cã <color=yellow>%s<color=red> ®Ó lµm nguyªn liÖu!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- ×éºÏºÏ³É±ØÐëÏûºÄµÄÎïÆ·
	local tbBMaterial = self.tbFormula.tbBMaterial
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  Ã¿´Î¶¼ÖØÐÂ»ñÈ¡£¬ÒÔ·ÀÖ¹ÓÐ±ä»¯
	local nMapCount = 0;
	tbMaterialEx = {}
	for i = 1, getn(tbAdditive) do
		local nn = self:CalcItemCount(tbRoomItems, tbAdditive[i])
		if nn * tbAdditive[i].nSuccessRate > tbAdditive[i].nMaxSuccessRate then
			nn = tbAdditive[i].nMaxSuccessRate / tbAdditive[i].nSuccessRate
		end 
		if i == 1 then
			nMapCount = nn
			if nn == 0 then
				local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
				Talk(1, "", szMsg)
				return 0;			
			end
			nn = floor((nn+1)/2)
			nMapCount = nMapCount - nn 
		end
		
		if nn > 0 then
			local tbM = {szName = tbAdditive[i].szName, tbProp = tbAdditive[i].tbProp, nCount = nn}
			tinsert(tbMaterialEx, tbM)	
		end		
	end	
	
	-- ¿Û³ýºÏ³É±ØÐëÏûºÄµÄÎïÆ·
	if self:ConsumeMaterial(tbBMaterial, nComposeCount, self.szLogTitle) ~= 1 or 
			self:ConsumeMaterial(tbMaterialEx, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end	
	
		-- ¿Û³ýºÏ³É³É¹¦ºó¿Û³ýµÄÎïÆ·
	local tbMEx = self.tbFormula.tbAdditiveEx
	if tbMEx[1] then 
		tbMEx[1].nCount = nMapCount
	end
	
	self:ConsumeMaterial(tbMEx, nComposeCount, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("ThËt ®¸ng tiÕc chÕ t¹o ®· thÊt b¹i")
		%tbVngTransLog:Write("201110_CheTaoKimO/", 15, "CheTaoKimO", "N/A", 0)
		return 0
	end

	if self:ConsumeMaterial(tbVnMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end

	if type(tbProduct) == "table" then
	--	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		local tbTranslog = {strFolder = "201110_CheTaoKimO/", nPromID = 15, nResult = 1}
		tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle, "CheTaoKimO", tbTranslog})
	--	AddStatData("zimang_jx1hechengzongshu", 1)	--Êý¾ÝÂñµãµÚÒ»ÆÚ
	end

	return 1;
end

function tbItem2Jinwu:GiveUIOk(nComposeCount, nProductId, nCount)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	--thay Tö M·ng Th¹ch = trang bÞ Tö M·ng
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local nMatId = tbProduct.tbProp[2] - 230	
	local strZimangName = %tbZimang_Name[nMatId]
	if not strZimangName then
		return 0
	end
	local tbVnMaterial = {{tbProp={0, nMatId}, nCount = 1},}
	
	if self:CheckMaterial(tbVnMaterial, nComposeCount) ~=1 then
		local szMsg = format("<color=red>ChÕ t¹o <color=yellow>%s<color=red> cÇn cã <color=yellow>%s<color=red> ®Ó lµm nguyªn liÖu!<color>", tbProduct.szName, strZimangName)
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	local tbMaterialEx = {{szName = tbAdditive[1].szName, tbProp = tbAdditive[1].tbProp, nCount = 1},}
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 or 
			self:CheckMaterial(tbMaterialEx, nComposeCount) ~= 1	then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end	
	
	local nSuccessRate = self:GetSuccessRate()
	local msg = "Hîp thµnh trang bÞ Kim ¤ cÇn ph¶i cã 1 Kim ¤ Kim Bµi, 5 viªn Thanh C©u Th¹ch, 4 viªn V©n Léc Th¹ch, 3 viªn Th­¬ng Lang Th¹ch, 2 viªn HuyÒn Viªn Th¹ch, 1 Kim ¤ LÖnh vµ 1 trang bÞ Tö M·ng t­¬ng øng víi m«n ph¸i vµ hÖ tÊn c«ng chñ ®¹o cña trang bÞ chÕ t¹o, yªu cÇu Ýt nhÊt cÇn ph¶i cã 1 Kim ¤ §å Phæ t­¬ng øng, 5000 v¹n ng©n l­îng, vµ nguyªn liÖu lµm t¨ng thªm tØ lÖ thµnh c«ng nÕu cÇn."
	local szMsg = format("%s, c¨n cø theo nguyªn liÖu mµ ng­¬i bá vµo th× nhËn ®­îc tØ lÖ thµnh c«ng lµ %d%%, ng­¬i cã muèn tiÕp tôc chÕ t¹o kh«ng?", msg, nSuccessRate)
	local tbOpt = 
	{
		{"TiÕp tôc chÕ t¹o", self.Compose, {self, nComposeCount, nProductId}},
		{"§Æt vµo lÇn n÷a", self.ComposeGiveUI, {self, nComposeCount, nProductId}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Jinwu:ComposeGiveUI(nComposeCount, nProductId)
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("§æi %s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self, nComposeCount, nProductId}}, nil, self.bAccessBindItem)
end

function tbItem2Jinwu:SelectEquip(nId, nCount)
	
	local tbProduct = self.tbFormula.tbProduct
	local msg = "Hîp thµnh trang bÞ Kim ¤ cÇn ph¶i cã 1 Kim ¤ Kim Bµi, 5 viªn Thanh C©u Th¹ch, 4 viªn V©n Léc Th¹ch, 3 viªn Th­¬ng Lang Th¹ch, 2 viªn HuyÒn Viªn Th¹ch, 1 Kim ¤ LÖnh, vµ 1 trang bÞ Tö M·ng t­¬ng øng víi m«n ph¸i vµ hÖ tÊn c«ng chñ ®¹o cña trang bÞ chÕ t¹o, yªu cÇu Ýt nhÊt cÇn ph¶i cã 1 Kim ¤ §å Phæ t­¬ng øng, 5000 v¹n ng©n l­îng, vµ nguyªn liÖu lµm t¨ng thªm tØ lÖ thµnh c«ng nÕu cÇn."
	local szMsg = format("%s,lùa chän mét %s", msg, tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.ComposeGiveUI, {self, 1, i}})
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
	{szName="Kim ¤ Kim Bµi", tbProp={6, 1, 3001}, nCount = 1},
	{szName="Thanh C©u Th¹ch", tbProp={6, 1, 2710}, nCount = 5},
	{szName="V©n Léc Th¹ch", tbProp={6, 1, 2711}, nCount = 4},
	{szName="Th­¬ng Lang Th¹ch", tbProp={6, 1, 2712}, nCount = 3},
	{szName="HuyÒn Viªn Th¹ch", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="Tö M·ng Th¹ch", tbProp={6, 1, 3000}, nCount = 1},
	{szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},	
	{szName=" l­îng", nJxb=1, nCount = 50000000},	
}

tbBaseMaterial = 
{
	{szName="Kim ¤ Kim Bµi", tbProp={6, 1, 3001}, nCount = 1},
	{szName="Thanh C©u Th¹ch", tbProp={6, 1, 2710}, nCount = 5},
	{szName="V©n Léc Th¹ch", tbProp={6, 1, 2711}, nCount = 4},
	{szName="Th­¬ng Lang Th¹ch", tbProp={6, 1, 2712}, nCount = 3},
	{szName="HuyÒn Viªn Th¹ch", tbProp={6, 1, 2713}, nCount = 2},
	--{szName="Tö M·ng Th¹ch", tbProp={6, 1, 3000}, nCount = 1},
	{szName=" l­îng", nJxb=1, nCount = 50000000},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "Kim ¤ H¹ng Liªn",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ H¹ng Liªn", tbProp = {6,1,2987}, nSuccessRate = 10, nMaxSuccessRate = 80},
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
			},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ H¹ng Liªn", tbProp = {6,1,2987}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "Kim ¤ Kh«i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Kh«i", tbProp = {6,1,2982}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Kh«i", tbProp = {6,1,2982}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "Kim ¤ Th­îng Giíi ChØ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Th­îng Giíi", tbProp = {6,1,2989}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Th­îng Giíi", tbProp = {6,1,2989}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "Kim ¤ Hé UyÓn",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Hé UyÓn", tbProp = {6,1,2986}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Hé UyÓn", tbProp = {6,1,2986}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "Kim ¤ Yªu §¸i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Yªu §¸i", tbProp = {6,1,2985}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Yªu §¸i", tbProp = {6,1,2985}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "Kim ¤ Y Phôc",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Y", tbProp = {6,1,2983}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Y", tbProp = {6,1,2983}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "Kim ¤ Vò KhÝ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ KhÝ Giíi", tbProp = {6,1,2991}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ KhÝ Giíi", tbProp = {6,1,2991}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "Kim ¤ Hµi",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Hµi", tbProp = {6,1,2984}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Hµi", tbProp = {6,1,2984}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "Kim ¤ Béi",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ Béi", tbProp = {6,1,2988}, nSuccessRate = 10, nMaxSuccessRate = 80},			
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ Béi", tbProp = {6,1,2988}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "Kim ¤ H¹ Giíi ChØ",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {{szName = "§å Phæ Kim ¤ H¹ Giíi", tbProp = {6,1,2990}, nSuccessRate = 10, nMaxSuccessRate = 80},		
					{szName = "Kim Hoa Chi B¶o", tbProp = {6,1,3002}, nSuccessRate = 1, nMaxSuccessRate = 9},
					{szName = "PhØ Thóy Chi B¶o", tbProp = {6,1,3003}, nSuccessRate = 2, nMaxSuccessRate = 18},
					{szName = "Phong V©n Chi B¶o", tbProp = {6,1,3004}, nSuccessRate = 5, nMaxSuccessRate = 45},
				},		
		tbBMaterial = tbBaseMaterial,
		tbAdditiveEx = {{szName = "§å Phæ Kim ¤ H¹ Giíi", tbProp = {6,1,2990}, nCount = 1},
				  {szName="Kim ¤ LÖnh", tbProp={6, 1, 2349}, nCount = 1},			
		},				

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

for i=1, getn(tbFormulaList) do
	tbEquip_jinwu[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_jinwu[i]
	
	local p = tbItem2Jinwu:new(tbFormulaList[i], "Item2Jinwu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("ChÕ t¹o %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbOpt, {"Hñy bá "})
function tbItem2Jinwu:Dialog()
	do
		Talk(1, "", "Chøc n¨ng t¹m ®ãng.")
		return
	end
	local msg = "Hîp thµnh trang bÞ Kim ¤ cÇn ph¶i cã 1 Kim ¤ Kim Bµi, 5 viªn Thanh C©u Th¹ch, 4 viªn V©n Léc Th¹ch, 3 viªn Th­¬ng Lang Th¹ch, 2 viªn HuyÒn Viªn Th¹ch, 1 Kim ¤ LÖnh vµ 1 trang bÞ Tö M·ng t­¬ng øng víi m«n ph¸i vµ hÖ tÊn c«ng chñ ®¹o cña trang bÞ chÕ t¹o, yªu cÇu Ýt nhÊt cÇn ph¶i cã 1 Kim ¤ §å Phæ t­¬ng øng, 5000 v¹n ng©n l­îng, vµ nguyªn liÖu lµm t¨ng thªm tØ lÖ thµnh c«ng nÕu cÇn."
	CreateNewSayEx(format("%s, lùa chän trang bÞ mµ ng­¬i muèn chÕ t¹o:", msg), %tbOpt)
end


Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["jinwu"] = {}
MAKE_EQUIP_LIST["jinwu"].nPak = curpack()
MAKE_EQUIP_LIST["jinwu"].pFun = tbItem2Jinwu.Dialog
MAKE_EQUIP_LIST["jinwu"].pSelf = tbItem2Jinwu
MAKE_EQUIP_LIST["jinwu"].szOpt = "ChÕ t¹o trang bÞ Kim ¤"