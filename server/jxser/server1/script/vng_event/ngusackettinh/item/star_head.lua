Include("\\script\\lib\\awardtemplet.lua")

tbNSKT_Item_Star = {}
tbNSKT_Item_Star.nTaskID = 2762
tbNSKT_Item_Star.nStartBit = 2
tbNSKT_Item_Star.nEndBit = 9
tbNSKT_Item_Star.nMaxItemUse = 200

-- kiem tra han su dung item, 1: het han SD, 0: con han SD
function tbNSKT_Item_Star:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end

--kiem tra dieu kien su dung vat pham
function tbNSKT_Item_Star:checkCondition()	
	if( GetExtPoint(0) >= 1 and GetLevel()>= 50) then		
		return 1;
	else
		return 0
	end;	
end

-- kiem tra xem da an max 3 loai sao chua, 1: da an max, 0: chua max
function tbNSKT_Item_Star:isMaxItemUse()
	if (GetBitTask(self.nTaskID, self.nStartBit, self.nEndBit) >= 200) then
		return 1;
	else return 0;
	end
end
-- tang so luong vat pham da su dung len 1 va luu vao task
function tbNSKT_Item_Star:setUseCount()
	local nValue = GetBitTask(self.nTaskID, self.nStartBit, self.nEndBit)
	nValue = nValue + 1
	if (nValue >= self.nMaxItemUse) then
		nValue = self.nMaxItemUse
	end
	return SetBitTask(self.nTaskID, self.nStartBit, self.nEndBit, nValue)
end

-- thuong vat pham su dung item
function tbNSKT_Item_Star:giveAward(tbItem, szLogTittle)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTittle)
end