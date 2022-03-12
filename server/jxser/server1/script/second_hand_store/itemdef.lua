IncludeLib("ITEM")
SecondHandItem = {}

function Pack(...)
	return arg
end

function SecondHandItem:new(nItemIndex)
	local tb = {}
	tb.szName = GetItemName(nItemIndex)
	tb.tbParam = GetItemAllParams(nItemIndex);
	tb.nQuality = GetItemQuality(nItemIndex);
	tb.nRandSeed = ITEM_GetItemRandSeed(nItemIndex)
	
	if tb.nQuality == 1 then
		tb.tbProp = {0, GetGlodEqIndex(nItemIndex)}
	elseif tb.nQuality == 4 then
		tb.tbProp = {0, GetPlatinaEquipIndex(nItemIndex)}
	else
		tb.tbProp = Pack(GetItemProp(nItemIndex))
	end
	
	tb.nPrice = GetItemPrice(nItemIndex)
	tb.nUpgradeLevel = GetPlatinaLevel(nItemIndex)
	
	if IsItemStackable(nItemIndex) == 1 then
		tb.nCount = GetItemStackCount(nItemIndex)
	else
		tb.nCurDurability = GetCurDurability(nItemIndex)
		tb.nMaxDurability = GetMaxDurability(nItemIndex)
		
		
	
	end
	
	tb.nWidth = GetItemWidth(nItemIndex)
	tb.nHeight = GetItemHeight(nItemIndex)


	
	tb.nExpiredTime2 = ITEM_GetExpiredTime(nItemIndex)
	
	tb.nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	
	return tb	
end

function SecondHandItem:CreateDynamicGoods(tbItem)
	local nRow = 0
	if tbItem.nQuality and (tbItem.nQuality == 1 or tbItem.tbItem == 4) then
		nRow = 1
	end
	local uRandSeed	= tonumber(format("%u", tbItem.nRandSeed or 0))
	
	local nItemGenre		= tbItem.tbProp[1] or 0
	local nDetailType		= (tbItem.tbProp[2] or 0) - nRow
	local nParticualrType	= tbItem.tbProp[3] or 0
	local nLevel			= tbItem.tbProp[4] or 0
	local nSeries			= tbItem.tbProp[5] or random(0,4)
	local nLuck				= tbItem.tbProp[6] or 0
	
	tbItem.tbParam = tbItem.tbParam or {}
	
	
	local bRet =  NewDynamicGoods(tbItem.nIdx, tbItem.nVersion or 4,uRandSeed,tbItem.nQuality,
		nItemGenre, nDetailType, nParticualrType, nLevel, nSeries, nLuck, 		
		tbItem.tbParam[1] or 0,
		tbItem.tbParam[2] or 0,
		tbItem.tbParam[3] or 0,
		tbItem.tbParam[4] or 0,
		tbItem.tbParam[5] or 0,
		tbItem.tbParam[6] or 0,
		tbItem.nUpgradeLevel)
		
		
	if bRet then
		
			
		if tbItem.nCurDurability and tbItem.nMaxDurability then --设置当前耐久度
			SetDynamicGoodsDurability(tbItem.nIdx, tbItem.nCurDurability, tbItem.nMaxDurability)
		end
		
		
		if tbItem.nCount then
			SetDynamicGoodsCount(tbItem.nIdx, tbItem.nCount)
		end
	
		
		if tbItem.nExpiredTime2 then
			SetDynamicGoodsExpiredTime(tbItem.nIdx, tbItem.nExpiredTime2)-- 设置有效期
			
		end
		
		if tbItem.nLeftUsageTime then
			SetDynamicGoodsLeftUsageTime(tbItem.nIdx, tbItem.nLeftUsageTime) -- 设置使用期
		end
	
		
		if tbItem.nBindState then
			SetDynamicGoodsBindState(tbItem.nIdx, tbItem.nBindState)--根据nBindState绑定物品
		end
		
		if tbItem.nPrice then
			SetDynamicGoodsPrice(tbItem.nIdx, 1, tbItem.nPrice)
		end
		
		
		
		
	end
	return bRet
end