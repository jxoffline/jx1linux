Include("\\script\\lib\\baseclass.lua")
tbVirtualItemClass = tbBaseClass:new()


function tbVirtualItemClass:_init(tbItem, nCount, szName)
	self.tbSet = tbItem
	self.nCount = nCount or 1
	self.szName = szName
end


function tbVirtualItemClass:IsHave(nNeedCount)
	nNeedCount = nNeedCount or self.nCount
	local nCount = 0
	for i=1, getn(self.tbSet) do
		local tbItem = self.tbSet[i]
		local tbProp = tbItem.tbProp
		nCount = nCount + CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], -1)
		if nCount >= nNeedCount then
			return 1
		end
	end
end

function tbVirtualItemClass:pGetCount()
	local nCount = 0
	for i=1, getn(self.tbSet) do
		local tbItem = self.tbSet[i]
		local tbProp = tbItem.tbProp
		nCount = nCount + CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], -1)
	end
	
	return  nCount
end
function tbVirtualItemClass:pConsume(nConsumeCount)
	for i=1, nConsumeCount do
		local flag = nil
		for j=1, getn(self.tbSet) do
			local tbItem = self.tbSet[j]
			local tbProp = tbItem.tbProp
			if ConsumeEquiproomItem(1 , tbProp[1], tbProp[2], tbProp[3], -1) == 1 then
				flag = 1
				break;
			end
		end
		if flag ~= 1 then
			return 
		end
	end
	return 1
end