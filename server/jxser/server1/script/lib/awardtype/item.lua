IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\lib\\log.lua")
--Ghi transaction log - Modified By DinhHQ - 20110816
Include("\\script\\vng_lib\\VngTransLog.lua")

ItemType = {}

ItemType.nPak = curpack()
function ItemType:NewItemEx(tbItem)
	local nRow = 0
	if tbItem.nQuality and (tbItem.nQuality == 1 or tbItem.nQuality == 4) then
		nRow = 1
	end
	tbItem.tbParam = tbItem.tbParam or {}
	return NewItemEx(
		tbItem.nVersion or 4,
		format("%u", tbItem.nRandSeed or 0),
		tbItem.nQuality or 0,
		tbItem.tbProp[1] or 0,
		(tbItem.tbProp[2] or 0) - nRow,
		tbItem.tbProp[3] or 0,
		tbItem.tbProp[4] or 1,
		tbItem.tbProp[5] or random(0,4),
		tbItem.tbProp[6] or 0,
		tbItem.tbParam[1] or 0,
		tbItem.tbParam[2] or 0,
		tbItem.tbParam[3] or 0,
		tbItem.tbParam[4] or 0,
		tbItem.tbParam[5] or 0,
		tbItem.tbParam[6] or 0,
		tbItem.nUpgradeLevel)
end

function ItemType:SetStackCount(nItemIndex, i, nAmount)
	
	if IsItemStackable(nItemIndex) == 1 then
		local nOrgStackCount = GetItemStackCount(nItemIndex)
		local nStackCount = nOrgStackCount + nAmount - i
		local nMaxStackCount = GetItemMaxStackCount(nItemIndex)
		if nStackCount >= nMaxStackCount then
			nStackCount = nMaxStackCount
		end
		SetItemStackCount(nItemIndex, nStackCount)
		return i + nStackCount - nOrgStackCount
	else
		return i
	end
end

function ItemType:Give(tbItem, nAmount, tbLogTitle)	
	local nItemIndex	= 0;
	nAmount = (nAmount or 1) * (tbItem.nCount or 1)
	local szName = ""
	local szCode = ""
	for i = 1, nAmount do
		nItemIndex = self:NewItemEx(tbItem)
		if nItemIndex < 0 then
			break;
		end
		if szName == "" then
			szName = GetItemName(nItemIndex)
			if GetItemCmd then
				szCode = GetItemCmd(nItemIndex)
			end
		end
		i = self:SetStackCount(nItemIndex, i, nAmount)
		
		if tbItem.nCurDurability then
			SetCurDurability(nItemIndex, tbItem.nCurDurability)
		end
		
		if tbItem.nMaxDurability then
			SetMaxDurability(nItemIndex, tbItem.nMaxDurability)
		end
		
		local nPak = usepack(self.nPak)
		if tbItem.nExpiredTime then
			ITEM_SetExpiredTime(nItemIndex, tbItem.nExpiredTime)-- 设置有效期
		end
		
		if tbItem.nExpiredTime2 then
			ITEM_SetExpiredTime2(nItemIndex, tbItem.nExpiredTime2)-- 设置有效期
		end
		
		if tbItem.nUsageTime then
			ITEM_SetLeftUsageTime(nItemIndex, tbItem.nUsageTime) -- 设置使用期
		end
		usepack(nPak)
		
		if tbItem.nBindState then
			SetItemBindState(nItemIndex, tbItem.nBindState)--根据nBindState绑定物品
		end
		
		if type(tbItem.CallBack) == "function" then
			tbItem.CallBack(nItemIndex)
		end
		szName = tbItem.szName or GetItemName(nItemIndex) --同类物品因此选最后的Index名字也一样
		AddItemByIndex(nItemIndex)		
	end
	
	Msg2Player(format("Nh薾 頲 %d %s.", nAmount, szName))
	local nPlayerIndex = PlayerIndex
	local nPak = usepack(self.nPak)
	CallPlayerFunction(nPlayerIndex, self.WriteLog, self, szName, szCode, nAmount, tbLogTitle)
	usepack(nPak)
end

function ItemType:WriteLog(szName, szCode, nAmount, tbLogTitle)
	--local szCode = GetItemCmd(nItemIndex)
	if tbLogTitle then
		local szEventName = tbLogTitle[1] or ""
		local szAction = tbLogTitle[2] or "award"
		call(tbLog.PlayerAwardLog, {tbLog, szEventName, szAction, szName, szCode, nAmount}, "x")
		--Ghi transaction log - Modified By DinhHQ - 20110816
		if tbLogTitle[3] and type(tbLogTitle[3]) == "table" then
			local tb = tbLogTitle[3]
			local strAction = tb.strAction or szAction
			call(tbVngTransLog.Write, {tbVngTransLog, tb.strFolder, tb.nPromID, strAction, szName, tb.nResult}, "x")
		end
	end
end

tbAwardTemplet:RegType("tbProp", ItemType)