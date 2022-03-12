--ÎÞUI½çÃæµÄºÏ³ÉÀà
--Í¨¹ýµ÷ÓÃtbActivityCompose:GetMaterialList(tbMaterial)×Ô¶¯²úÉúºÏ³É²ÄÁÏÐÅÏ¢ 
--¸ñÊ½£º ÎïÆ·Ãû £¨ÎïÆ·¸öÊý/ÐèÇó¸öÊý£©
--
--µ÷ÓÃ tbComposeClass:Compose(tbFormula, szLogTitle, pFun, ...)
--¼´¿ÉºÏ³É£¬Ê§°Ü·µ»Ø0£¬³É¹¦·µ»Ø1
--
--tbFormula¸ñÊ½
--tbFormula = {tbMaterial£¬tbProduct}
--
--tbMaterial Ð´·¨Í¬\script\lib\awardtemplet.lua µÄtbItem£¬Ä¿Ç°Ö»ÄÜÌîµÀ¾ß£¬ºÍÇ®
--
--tbProduct Ð´·¨ÍêÈ«Í¬ \script\lib\awardtemplet.lua ÔÊÐíÎªnil


Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\string.lua")


INVENTORY_ROOM = {}

INVENTORY_ROOM.room_equipment	= 0		-- ×°±¸À¸
INVENTORY_ROOM.room_repositor	= 1		-- ÖüÎïÏä
INVENTORY_ROOM.room_trade		= 2		-- ½»Ò×À¸
INVENTORY_ROOM.room_tradeback	= 3		-- ½»Ò×¹ý³ÌÖÐ×°±¸À¸µÄ±¸·Ý
INVENTORY_ROOM.room_trade1		= 4		-- ½»Ò×¹ý³ÌÖÐ¶Ô·½µÄ½»Ò×À¸
INVENTORY_ROOM.room_immediacy	= 5		-- ¿ì½ÝÎïÆ·
INVENTORY_ROOM.room_beset		= 6		-- ÏâÇ¶
INVENTORY_ROOM.room_ext1		= 7		-- À©Õ¹Ïä1
INVENTORY_ROOM.room_ext2		= 8		-- À©Õ¹Ïä2
INVENTORY_ROOM.room_ext3		= 9		-- À©Õ¹Ïä3
INVENTORY_ROOM.room_giveitem	= 10	--¿Í»§¶Ë¸øÓè½çÃæ
INVENTORY_ROOM.room_distill		= 11	--¿óÊ¯ÌáÈ¡½çÃæ
INVENTORY_ROOM.room_enchase		= 12	--ÏâÇ¶½çÃæ
INVENTORY_ROOM.room_atlas		= 13	--»Æ½ðÍ¼Æ×
INVENTORY_ROOM.room_partnerbag	= 14	-- Í¬°é±³°üÀ¸
INVENTORY_ROOM.room_num			= 15	-- ¿Õ¼äÊýÁ¿	



	
tbActivityCompose = tbBaseClass:new()


--¹¦ÄÜ:³õÊ¼»¯ºÏ³ÉÀà
--²ÎÊý£ºÀàÃû£¨±ØÐëºÍÄãÓÃµÄ±äÁ¿ÃûÒ»ÖÂ£¬²¢ÇÒÊÇÈ«¾ÖµÄ£©£¬ºÏ³É¹«Ê½£¬ÈÕÖ¾±êÌâ
--ÎÞ
function tbActivityCompose:_init(tbFormula, szLogTitle, nRoomType)
	

	self.tbFormula = tbFormula
	self.nRoomType = nRoomType or INVENTORY_ROOM.room_equipment
	self.szLogTitle = szLogTitle or "MÆc ®inh hîp thµnh"
	
end


function tbActivityCompose:UseGiveUI()
	
	self.nRoomType = nRoomType or INVENTORY_ROOM.room_giveitem
	
	
end

--¹¦ÄÜ£º¸ù¾Ý²ÄÁÏËµÃ÷±í¼ì²éÉíÉÏ²ÄÁÏµÄÇé¿ö
--²ÎÊý£º²ÄÁÏËµÃ÷±í
--·µ»Ø£ºÊÇ·ñÍêÈ«Æ¥Åä(1/0)£¬ÉíÉÏ¸öÊýÇé¿ö£¬×î´óºÏ³É¸öÊýÇé¿ö
function tbActivityCompose:CheckMaterial(tbMaterial, nComposeCount)
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
				tbMaxSetCount[i] = floor(nCurCount / nItemNeedCount)
				if nCurCount < nItemNeedCount then
					flag =  0;
				end	
			end			
		elseif tbItem.nJxb then
			local nCash = GetCash()
			tbCount[i] = nCash
			local nNeedJxb = tbItem.nJxb * tbItem.nCount * nComposeCount
			tbMaxSetCount[i] = floor(nCash / nNeedJxb)
			if nCash < nNeedJxb then
				flag = 0
			end
		elseif tbItem.nTaskId then
			local nTaskValue = GetTask(tbItem.nTaskId)
			tbCount[i] = nTaskValue
			local nNeedValue = tbItem.nCount * nComposeCount
			tbMaxSetCount[i] = floor(nTaskValue / nNeedValue)
			if nTaskValue < nNeedValue then
				flag = 0
			end
		elseif tbItem.pGetCount then
			local nCurCount = tbItem:pGetCount()
			tbItem.nCount = tbItem.nCount or 1
			local nNeedCount = tbItem.nCount * nComposeCount
			tbCount[i] = nCurCount
			tbMaxSetCount[i] = floor(nCurCount / nNeedCount)
			if nCurCount < nNeedCount then
				flag =  0;
			end	
		end
	end
	return flag, tbCount, tbMaxSetCount;
end

--¹¦ÄÜ£º¸ù¾Ý²ÄÁÏËµÃ÷±íÅÐ¶Ï×î¶àÄÜºÏ³É¼¸¸ö
--²ÎÊý£º²ÄÁÏËµÃ÷±í
--·µ»Ø£º×î¶àºÏ³É¸öÊý
function tbActivityCompose:CanMakeMaxCount(tbMaterial)
	local _, _, tbMaxCount = self:CheckMaterial(tbMaterial, 1)
	local nMinCount = tbMaxCount[1]
	for i=2, getn(tbMaxCount) do
		if nMinCount > tbMaxCount[i] then
			nMinCount = tbMaxCount[i]
		end
	end
	return nMinCount;
end

function tbActivityCompose:MakeItem(nItemIndex)
	local tbItem = {}
	tbItem.nQuality = GetItemQuality(nItemIndex)
	tbItem.tbProp = {}
	
	if tbItem.nQuality == 1 then
		tbItem.tbProp  = {0, GetGlodEqIndex(nItemIndex)}
	elseif tbItem.nQuality == 4 then
		tbItem.tbProp  = {0, GetPlatinaEquipIndex(nItemIndex)}
	else
		local nG,nD,nP,nL,nS, nLuk = GetItemProp(nItemIndex)
		tbItem.tbProp = {nG,nD,nP,nL,nS, nLuk}
	end
	return tbItem
end

function tbActivityCompose:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local tbRecItem = self:MakeItem(nItemIndex)
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
	
	for key, value in tbItem do 
		if strfind(key, "Limit") and  type(value) == "function" then
			if value(tbItem, nItemIndex) ~= 1 then
				return
			end
		end
	end			
	return 1
end

function tbActivityCompose:GetRoomItems(nRoomType)
	
	local tbRoomItems = {}
	if nRoomType == INVENTORY_ROOM.room_giveitem then
		for i=1, 24 do
			local nItemIndex = GetGiveItemUnit(i)
			if nItemIndex and nItemIndex > 0 then
				tinsert(tbRoomItems, nItemIndex)
			end
		end
	else
		tbRoomItems = GetRoomItems(nRoomType)
	end
	return tbRoomItems
end

function tbActivityCompose:CalcItemCount(tbRoomItems, tbItem)
	local nTotalCount = 0
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex and nItemIndex > 0 then
			local nCount = GetItemStackCount(nItemIndex)
			if self:CheckItem(tbItem ,nItemIndex) == 1 then
				nTotalCount = nTotalCount + nCount
			end
		end
	end
	return nTotalCount	
end

function tbActivityCompose:ConsumeItem(tbRoomItems, nConsumeItemCount, tbItem)
	
	
	local nTotalCount = nConsumeItemCount
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex > 0 then
			local nCount = GetItemStackCount(nItemIndex)
			if self:CheckItem(tbItem ,nItemIndex) == 1 then
				
				if nCount <= nTotalCount then
					if RemoveItemByIndex(nItemIndex) == 1 then
						nTotalCount =  nTotalCount - nCount
						nIdx = nPrevIdx
					end
				else
					SetItemStackCount( nItemIndex, nCount - nTotalCount );
					nTotalCount = 0;
				end
		
				if nTotalCount == 0 then
					return 1;
				end
			end
		end
	end	
	return nil
end

--¹¦ÄÜ£º¸ù¾Ý²ÄÁÏËµÃ÷±íÏûºÄµôÏàÓ¦ÎïÆ·
--²ÎÊý£º²ÄÁÏËµÃ÷±í
--·µ»Ø£ºÊÇ·ñ³É¹¦(1/0)
function tbActivityCompose:ConsumeMaterial(tbMaterial, nConsumeCount, szLogTitle)
	local i
	nConsumeCount = nConsumeCount or 1
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.tbProp then				
			tbItem.nCount = tbItem.nCount or 1
			local nConsumeItemCount = tbItem.nCount * nConsumeCount
			if nConsumeItemCount > 0 then
				local tbProp = tbItem.tbProp
				local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  Ã¿´Î¶¼ÖØÐÂ»ñÈ¡£¬ÒÔ·ÀÖ¹ÓÐ±ä»¯
				if self:ConsumeItem(tbRoomItems, nConsumeItemCount, tbItem) ~= 1 then
					return 0;
				end
				self:ConsumeLog(nConsumeItemCount.." "..tbItem.szName, szLogTitle)
			end
		elseif tbItem.nJxb then
			local nConsumeJxb = tbItem.nJxb * tbItem.nCount * nConsumeCount
			if Pay(nConsumeJxb) == 0 then
				return 0;
			else
				Msg2Player(format("CÇn <color=yellow>%d<color> l­îng", nConsumeJxb))
				self:ConsumeLog("Jxb "..nConsumeCount.." * "..tbItem.nJxb * tbItem.nCount, szLogTitle)
			end
		elseif tbItem.nTaskId then
			local nConsumeValue = tbItem.nCount * nConsumeCount
			if GetTask(tbItem.nTaskId) < nConsumeValue then
				return 0;
			else
				SetTask(tbItem.nTaskId, GetTask(tbItem.nTaskId) - nConsumeValue)
				Msg2Player(format("Chi tr¶ <color=yellow>%d <color>%s", nConsumeValue, tbItem.szName))
				self:ConsumeLog("nTask "..nConsumeCount.." * "..tbItem.nCount, szLogTitle)
			end
		elseif tbItem.pConsume then
			local nConsumeCount = tbItem.nCount * nConsumeCount
			if tbItem:pConsume(nConsumeCount) ~= 1 then
				return 0;
			end
			self:ConsumeLog(nConsumeCount.." "..tbItem.szName, szLogTitle)
		end
	end
	return 1;
end


--¹¦ÄÜ£º¸ù¾Ý²ÄÁÏËµÃ÷±í·µ»Ø²ÄÁÏÇé¿öÐÅÏ¢
--²ÎÊý£º²ÄÁÏËµÃ÷±í
--·µ»Ø£ºÇé¿öÐÅÏ¢µÄ×Ö·û´®
function tbActivityCompose:GetMaterialList(tbMaterial)
	local szList = format("%-20s  %s","vËt phÈm ","Sè l­îng")
	local _, tbCount, tbMaxCount = self:CheckMaterial(tbMaterial, 1)
	local i;
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		
		local szColor = "<color=green>"
		if tbMaxCount[i] < 1 then
			szColor = "<color=red>"
		end
		if tbItem.nJxb then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,"Ng©n l­îng", szColor, tbCount[i], tbMaterial[i].nJxb * tbMaterial[i].nCount)
		elseif tbItem.szName and tbItem.nCount then
			szList = format("%s<enter><color=yellow>%-20s<color>  %s(%d/%d)<color>",szList,tbMaterial[i].szName, szColor, tbCount[i], tbMaterial[i].nCount)
		end
	end
	return szList
end


--¹¦ÄÜ£º¸ù¾Ý¹«Ê½ºÏ³ÉÎïÆ·
--²ÎÊý£ººÏ³É¸öÊý¡¢ºóÐø´¦Àíº¯Êý¡¢º¯ÊýµÄ²ÎÊý£¨²»¶¨²ÎÊý£©
--·µ»Ø£ºÊÇ·ñ³É¹¦(1/0)
function tbActivityCompose:Compose(nComposeCount)
	
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct
	
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
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		--Say("ÖÆ×÷Ê§°Ü£¬²¿·ÖÎïÆ·¶ªÊ§¡£",0)
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	end
	
	if type(self.tbFormula.pProductFun) == "function" then
		
		self.tbFormula:pProductFun(nComposeCount)

	end
	return 1;
end

--¹¦ÄÜ£º²úÉúºÏ³ÉGiveUI
--²ÎÊý£ºÊÇ·ñÅúÁ¿ºÏ³É
--·µ»Ø£ºÎÞ
function tbActivityCompose:ComposeGiveUI()
	
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct 
	
	local szTitle = self.tbFormula.szComposeTitle or format("§æi %s", tbProduct.szName)
	local szContent = self:GetMaterialList(tbMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbActivityCompose:GiveUIOk(nCount)
	if nCount < getn(self.tbFormula.tbMaterial) then
		return Talk(1, "", self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>")
	end
	
	self:Compose(1)
	
end
--¹¦ÄÜ£º²úÉúºÏ³É¶Ô»°
--²ÎÊý£ººÏ³É¹«Ê½£¬¶Ô»°µÄ»Øµ÷º¯Êý(×Ö·û´®¸ñÊ½)£¬»Øµ÷º¯Êý²ÎÊý£¨²»ÄÜÓÐtable£©
--·µ»Ø£ºÎÞ
function tbActivityCompose:ComposeDailog(bIsAskNumber,nMaxCount)
	--Èç¹ûÊäÈëÎª¿Õ£¬Ê¹ÓÃÄ¬ÈÏÖµ

	if self.nRoomType == INVENTORY_ROOM.room_giveitem then
		return self:ComposeGiveUI()
	end
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct
	
	local szComposeTitle = self.tbFormula.szComposeTitle or format("§æi %s", tbProduct.szName)
	
	local szMsg = format("%s yªu cÇu: <enter>%s", szComposeTitle ,self:GetMaterialList(tbMaterial))
	local tbOpt = {}
	if bIsAskNumber == 1 then
		tbOpt[1] = {"X¸c nhËn", self.AskNumber, {self, nMaxCount}}
	else
		tbOpt[1] = {"X¸c nhËn", self.Compose, {self, 1}}
	end
	tbOpt[2] = {"Hñy bá "}
	CreateNewSayEx(szMsg, tbOpt)
end


--¹¦ÄÜ£ºÐ´ÏûºÄÈÕ¼Ç
--²ÎÊý£ºÏûºÄµôµÄÎïÆ·Ãû×Ö£¨°üº¬¸öÊý£¬string£©£¬ÈÕÖ¾±êÌâ
--·µ»Ø£ºÎÞ
function tbActivityCompose:ConsumeLog(szItemName, szLogTitle)
	WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\t consume %s.",szLogTitle,GetLocalDate("%Y-%m-%d %H:%M"), GetAccount(), GetName(), szItemName))
end


function tbActivityCompose:AskNumber(nMaxCount)	
	if nMaxCount then
		nMaxCount = min(self:CanMakeMaxCount(self.tbFormula.tbMaterial),nMaxCount)
	else
		nMaxCount = self:CanMakeMaxCount(self.tbFormula.tbMaterial)
	end

	if nMaxCount < 1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
	else
		
		g_AskClientNumberEx(1, nMaxCount, "Xin mêi nhËp sè", {self.ComposeCountComfirm, {self,nMaxCount}} )
	end
end

function tbActivityCompose:ComposeCountComfirm(nMaxCount, nCount)
--	print("nCount = " .. nCount)
--	print("nMaxCount = " .. nMaxCount)
	if nCount > nMaxCount then
		Say(format("Ng­¬i nhËp sè l­îng hîp thµnh ®· v­ît qu¸<color=red>%d<color>, xin h·y nhËp l¹i", nMaxCount))
		return 0
	end
	
	local nMaxCount = self:CanMakeMaxCount(self.tbFormula.tbMaterial)
	if nCount > nMaxCount then
		nCount = nMaxCount
	end

	if self:Compose(nCount) == 0 then
		return 0;
	end
	
	
	return 1;
end




function tbActivityCompose:GetProductName()
	return  self.tbFormula.tbProduct.szName
end

function tbActivityCompose:GetFormulaByString()
	local tbMaterial = self.tbFormula.tbMaterial
	local szMsg = nil
	for i=1, getn(tbMaterial) do
		local szName
		if tbMaterial[i].nJxb then
			szName = transferDigit2CnNum(tbMaterial[i].nJxb).." l­îng"
		else
			szName = tbMaterial[i].szName.."X"..(tbMaterial[i].nCount or 1)
		end
		
		if not szMsg then
			szMsg = szName
		else
			szMsg = szMsg.."+"..szName	
		end
	end
	return szMsg
end