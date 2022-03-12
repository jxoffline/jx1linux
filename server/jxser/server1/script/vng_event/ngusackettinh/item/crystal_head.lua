Include("\\script\\lib\\awardtemplet.lua")

tbNSKT_Crystal = {}
tbNSKT_Crystal.nTaskID = 2761
tbNSKT_Crystal.nStartBit = 1
tbNSKT_Crystal.nEndBit = 17
tbNSKT_Crystal.nScaleFactor = 1e5
tbNSKT_Crystal.nMaxExp = 8e9 / tbNSKT_Crystal.nScaleFactor --8e9: diem kinh nghiem gioi han su dung vat pham

-- kiem tra han su dung item, 1: het han SD, 0: con han SD
function tbNSKT_Crystal:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end

-- kiem tra xem da an max exp tu 3 loai ket tinh chua, 1: da max, 0: chua
function tbNSKT_Crystal:isMaxItemUse()
	if (GetBitTask(self.nTaskID, self.nStartBit, self.nEndBit) >= self.nMaxExp) then
		return 1;
	else return 0;
	end
end

--kiem tra khoang trong hanh trang, 1: con o trong, 0: khong con
function tbNSKT_Crystal:checkBag(nCellCount)
	if (CalcFreeItemCellCount() < nCellCount) then
		return 0
	end
	return 1
end

--kiem tra dieu kien su dung vat pham
function tbNSKT_Crystal:checkCondition()	
	if( GetExtPoint(0) >= 1 and GetLevel()>= 50) then		
		return 1;
	else
		return 0
	end;	
end

-- luu vao task kinh nghiem da su dung
function tbNSKT_Crystal:addTask(nExp)
	local nCurExp = GetBitTask(self.nTaskID, self.nStartBit, self.nEndBit)
	local nTemp = nCurExp + nExp/self.nScaleFactor
	if (nTemp > self.nMaxExp)then
		nTemp = self.nMaxExp
	end	
	SetBitTask(self.nTaskID, self.nStartBit, self.nEndBit, nTemp)
end

-- thuong vat pham su dung item
function tbNSKT_Crystal:giveAward(tbItem, szLogTittle)
	tbAwardTemplet:GiveAwardByList(tbItem, szLogTittle)
end