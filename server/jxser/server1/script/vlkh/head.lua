VLKH1_EXTPOINT = 3
nBit_GetTLL = 1
nBit_GetKimTiger = 2
nBit_GetKimTiger2 = 3
nBit_GetHoaTiger = 4
nBit_GetHoaTiger2 = 5
nBit_GetTKCD = 6
nBit_GetCLBHB = 7

function CheckGetBonusVLKH1(numExtpoint, numBit)
	local nValuePoint	= GetExtPoint(numExtpoint)
	local nBit = GetBit(nValuePoint, numBit)
	
	if (nBit < 1) then
		return 1
	end
	if (nBit > 0) then
		return 0
	end
end

function SetBit2GetBonusVLKH1(numExtpoint, numBit, numValue)
	local nValuePoint	= GetExtPoint(numExtpoint);
	local nBit = SetBit(nValuePoint, numBit, numValue);
	local nBitTemp = nBit - nValuePoint;
	AddExtPoint(numExtpoint, nBitTemp);
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function GetBonusTLL(nCount)
	if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetTLL)~= 1) then
		Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang cÒa Æπi hi÷p kh´ng ÆÒ 60 ´ trËng.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetTLL,1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,2352,1,0,0)
		SyncItem(nIndex)
	end
	Msg2Player(format("ßπi hi÷p vıa nhÀn Æ≠Óc %d Th≠¨ng lang L÷nh", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."NhÀn th≠Îng Th≠¨ng Lang L÷nh sË l≠Óng "..nCount)
end

function GetBonusTKCD(nCount)
	if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetTKCD)~= 1) then
		Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang cÒa Æπi hi÷p kh´ng ÆÒ 60 ´ trËng.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetTKCD,1)
	for i=1, nCount do
		local nIndex = AddItem(6,1,2263,1,0,0)
		SetSpecItemParam(nIndex,1,2000000000)
		SyncItem(nIndex)
	end
	Msg2Player(format("ßπi hi÷p vıa nhÀn Æ≠Óc %d Tˆ Kim Ch©n ßan", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."NhÀn th≠Îng Tˆ Kim Ch©n ßan sË l≠Óng "..nCount)
end

function GetBonusKimTiger(nCount, nTime)
	if (nTime ==1) then
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetKimTiger)~= 1) then
			Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
			return
		end
	else
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetKimTiger2)~= 1) then
			Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
			return
		end
	end
	
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang kh´ng ÆÒ 60 ´ trËng.");
		return
	end
	--set bit khi user get item
	if (nTime == 1) then
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetKimTiger,1)
	else
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetKimTiger2,1)
	end
	
	for i=1, nCount do
		local nIndex = AddItem(0,10,16,10,0,0)
		ITEM_SetExpiredTime(nIndex, 259200);
		SyncItem(nIndex)
	end
	Msg2Player(format("ßπi hi÷p vıa nhÀn Æ≠Óc %d Kim Tinh Bπch HÊ V≠¨ng", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."NhÀn th≠Îng Kim Tinh Bπch HÊ V≠¨ng sË l≠Óng "..nCount)
end

function GetBonusHoaTiger(nCount, nTime)
	if (nTime == 1) then
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetHoaTiger)~= 1) then
			Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
			return
		end
	else
		if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetHoaTiger2)~= 1) then
			Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
			return
		end
	end
	
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang kh´ng ÆÒ 60 ´ trËng.");
		return
	end
	--set bit khi user get item
	if (nTime ==1) then
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetHoaTiger,1)
	else
		SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetHoaTiger2,1)
	end
	
	
	for i=1, nCount do
		local nIndex = AddItem(0,10,15,10,0,0)
		ITEM_SetExpiredTime(nIndex, 259200);
		SyncItem(nIndex)
	end
	Msg2Player(format("ßπi hi÷p vıa nhÀn Æ≠Óc %d H·a Tinh Kim HÊ V≠¨ng", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."NhÀn th≠Îng H·a Tinh Kim HÊ V≠¨ng sË l≠Óng "..nCount)
end

function GetBonusCLBHBVLKH1(nCount)
	if (CheckGetBonusVLKH1(VLKH1_EXTPOINT, nBit_GetCLBHB)~= 1) then
		Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi !");
		return
	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Hµnh trang kh´ng ÆÒ 60 ´ trËng.");
		return
	end
	--set bit khi user get item
	SetBit2GetBonusVLKH1(VLKH1_EXTPOINT,nBit_GetCLBHB,1)
	
	for i=1, nCount do
		local nIndex = AddItem(6,1,30032,1,0,0)
		ITEM_SetExpiredTime(nIndex, 43200);
		SyncItem(nIndex)
	end
	Msg2Player(format("ßπi hi÷p vıa nhÀn Æ≠Óc %d C©u Lπc BÈ HÂng Bao", nCount))
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Bonus VLKH1"..GetAccount().."\t"..GetName().."\t".."NhÀn th≠Îng C©u Lπc BÈ HÂng Bao sË l≠Óng "..nCount)
end