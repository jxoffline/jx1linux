
ItemClass = {}
function ItemClass:_init()
	self.szName = ""
	self.tbProp = {} --{nItemGenre, nDetailType, nParticualrType, nLevel, nSeries, nLuck}
	self.nVersion = 4--默认版本号，目前用的是4
	self.nRandSeed = 0 --0表示不指定随机种子
	self.nQuality = 0 --0普通 1 黄金  4白金
	self.tbParam = {0,0,0,0,0,0}--用于魔法属性 or 自定义参数（二者选一，因此装备不可自定义参数）
	self.nUpgradeLevel = nil
	self.nCurDurability = nil 
	self.nMaxDurability = nil
	self.nExpiredTime = nil
	self.nLeftUsageTime = nil
	self.nItemLockState = nil
	self.nBindState = nil
	self.nCount = 1
end

function ItemClass:Pack(...)
	return arg
end

--生成空数据的道具
function ItemClass:New()
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	self:_init()
	return tb
end

--根据纯数据生成一个物品
function ItemClass:NewFormPureData(tbItem)
	local tb = self:New()
	for key, value in tbItem do
		if type(value) ~= "function" then
			tb[key] = value
		end
	end
	return tb
end

--根据物品Index生成道具数据
function ItemClass:NewFromItemIndex(nItemIndex)
	local tb = self:New()
	
	tb.szName			= GetItemName(nItemIndex)
	tb.nRandSeed		= ITEM_GetItemRandSeed(nItemIndex)
	tb.nQuality 		= GetItemQuality(nItemIndex)
	tb.nBindState		= GetItemBindState(nItemIndex)
	tb.tbParam			= GetItemAllParams(nItemIndex)
	tb.nUpgradeLevel	= GetPlatinaLevel(nItemIndex)
	tb.nExpiredTime		=  ITEM_GetExpiredTime(nItemIndex)
	tb.nLeftUsageTime	= ITEM_GetLeftUsageTime(nItemIndex)
	
	--暂时没有锁魂
	
	if tb.nQuality == 1 then
		tb.tbProp = {0, GetGlodEqIndex(nItemIndex)}
	elseif tb.nQuality == 4 then
		tb.tbProp = {0, GetPlatinaEquipIndex(nItemIndex)}
	else
		tb.tbProp = self:Pack(GetItemProp(nItemIndex))
	end
	
		
	if IsItemStackable(nItemIndex) == 1 then --叠加物品看叠加数，没耐久
		tb.nCount = GetItemStackCount(nItemIndex)
	else--非叠加物品看耐久
		tb.nCurDurability = GetCurDurability(nItemIndex)
		tb.nMaxDurability = GetMaxDurability(nItemIndex)	
	end
		
	return tb
end

--获取道具的纯数据，不包含函数
function ItemClass:GetPureData()
	local tb = {}
	for key, value in self do
		if type(value) ~= "function" then
			tb[key] = value
		end
	end
	return tb
end

function ItemClass:AddStackCount(nItemIndex, nAddCount)
	if nAddCount <= 0 then
		return 0
	end
	local nOrgStackCount = GetItemStackCount(nItemIndex)
	local nMaxStackCount = GetItemMaxStackCount(nItemIndex)
	local nStackCount = nOrgStackCount + nAddCount
	if nStackCount >= nMaxStackCount then
		nStackCount = nMaxStackCount
	end
	SetItemStackCount(nItemIndex, nStackCount)
	return nStackCount - nOrgStackCount --返回增加了几个叠加数
end


function ItemClass:CreateItem(nPlayerIndex, nCopysCount, varLogTitle)
	local nItemIndex = self:GenBaseItem()
	self:SetExtProperty(nItemIndex)
	return nItemIndex
end

--给玩家增加一个道具
function ItemClass:AddToPlayer(nPlayerIndex, nCopysCount, varLogTitle)
	local nCount = (self.nCount or 1) * nCopysCount
	
	for i=1, nCount do 
		local nItemIndex = self:GenBaseItem()
		if nItemIndex > 0 then
			if IsItemStackable(nItemIndex) == 1 then --对于叠加物品,优化循环次数为 ceil(topCount / MaxStackCount)
				i = i + self:AddStackCount(nCount - i)
			end
			self:SetExtProperty(nItemIndex)
			lib:DoFunByPlayer(nPlayerIndex, AddItemByIndex, nItemIndex)
		end
	end
	local szLog = ""
	self:WriteLog(varLogTitle, szLog)
end

function ItemClass:WriteLog(varLogTitle, szLog)
	
end

--服务器生成一个物品基本数据（原始数据）
function ItemClass:GenBaseItem()
	local nRow = 0
	if self.nQuality and (self.nQuality == 1 or tbItem.self == 4) then
		nRow = 1
	end
	local uRandSeed	= tonumber(format("%u", self.nRandSeed))
	
	local nItemGenre		= self.tbProp[1] or 0
	local nDetailType		= (self.tbProp[2] or 0) - nRow
	local nParticualrType	= self.tbProp[3] or 0
	local nLevel			= self.tbProp[4] or 0
	local nSeries			= self.tbProp[5] or random(0,4)
	local nLuck				= self.tbProp[6] or 0
	
	return NewItemEx(self.nVersion,uRandSeed,self.nQuality,
		nItemGenre, nDetailType, nParticualrType, nLevel, nSeries, nLuck, 		
		self.tbParam[1] or 0,
		self.tbParam[2] or 0,
		self.tbParam[3] or 0,
		self.tbParam[4] or 0,
		self.tbParam[5] or 0,
		self.tbParam[6] or 0,
		self.nUpgradeLevel)
end

--设置额外的属性
function ItemClass:SetExtProperty(nItemIndex)		
	if IsItemStackable(nItemIndex) ~= 1 then --对于不可叠加的道具
		if self.nCurDurability then --设置当前耐久度
			SetCurDurability(nItemIndex, self.nCurDurability)
		end
		
		if self.nMaxDurability then -- 设置最大耐久度
			SetMaxDurability(nItemIndex, self.nMaxDurability)
		end
	end
	if self.nExpiredTime then
		ITEM_SetExpiredTime(nItemIndex, self.nExpiredTime)-- 设置有效期
	end
	
	if self.nUsageTime or self.nLeftUsageTime then
		ITEM_SetLeftUsageTime(nItemIndex, self.nUsageTime or self.nLeftUsageTime) -- 设置使用期
	end
	
	if self.nItemLockState == 1 then --设置锁魂
		LockItem(nItemIndex);
	end
	
	if self.nBindState then
		SetItemBindState(nItemIndex, self.nBindState)--根据nBindState绑定物品
	end
end