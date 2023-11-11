Include("\\script\\lib\\composeex.lua")

ITEM_UNLOCK_BOOK = {tbProp={6,1,3916,1,0,0},szName="MÎ s∏ch k‹ n®ng c p 150"}
ITEM_UNLOCK_BOOK_MTL_ID = 3917

tbLvUp150L21Limit = {}

tbLvUp150L21Limit.TSK_L21_AVAILABLE = 4035
tbFormula = {
	szName = format("HÓp thµnh %s",ITEM_UNLOCK_BOOK.szName),
	tbMaterial = {
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,1,0,0},szName="K‹ n®ng c p 150 c p 21 (1)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,2,0,0},szName="K‹ n®ng c p 150 c p 21 (2)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,3,0,0},szName="K‹ n®ng c p 150 c p 21 (3)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,4,0,0},szName="K‹ n®ng c p 150 c p 21 (4)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,5,0,0},szName="K‹ n®ng c p 150 c p 21 (5)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,6,0,0},szName="K‹ n®ng c p 150 c p 21 (6)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,7,0,0},szName="K‹ n®ng c p 150 c p 21 (7)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,8,0,0},szName="K‹ n®ng c p 150 c p 21 (8)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,9,0,0},szName="K‹ n®ng c p 150 c p 21 (9)"},
		{tbProp={6,1,ITEM_UNLOCK_BOOK_MTL_ID,10,0,0},szName="K‹ n®ng c p 150 c p 21 (10)"},
	},
	tbProduct = ITEM_UNLOCK_BOOK,
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
}

tbLvUp150L21Limit.pCompose = tbActivityCompose:new(tbFormula, "150SkillLv21", INVENTORY_ROOM.room_equipment)

tbLvUp150L21Limit.tbSkillData = {
	[1055] = 1,
	[1056] = 2,
	[1057] = 3,
	[1059] = 4,
	[1060] = 5,
	[1058] = 6,
	[1066] = 7,
	[1067] = 8,
	[1069] = 9,
	[1070] = 10,
	[1071] = 11,
	[1061] = 12,
	[1062] = 13,
	[1114] = 14,
	[1063] = 15,
	[1065] = 16,
	[1075] = 17,
	[1076] = 18,
	[1074] = 19,
	[1073] = 20,
	[1079] = 21,
	[1078] = 22,
	[1080] = 23,
	[1081] = 24,
	[1110] = 25,
}

function tbLvUp150L21Limit:IsAvailable(nSkillId)
	local nBitPos = self.tbSkillData[nSkillId]
	if not nBitPos then
		return 1
	end
	return GetBit(GetTask(self.TSK_L21_AVAILABLE), nBitPos)
end

function tbLvUp150L21Limit:SetAvailable(nSkillId)
	local nBitPos = self.tbSkillData[nSkillId]
	if not nBitPos then
		print("error!!! \\script\\skill\\lvlup150_l21_limit.lua nBitPos = nil")
		return
	end
	
	local nTaskValue = GetTask(self.TSK_L21_AVAILABLE)
	nTaskValue = SetBit(nTaskValue, nBitPos, 1)
	SetTask(self.TSK_L21_AVAILABLE, nTaskValue)
	return
end

function tbLvUp150L21Limit:SetAvoid(nSkillId)
	local nBitPos = self.tbSkillData[nSkillId]
	if not nBitPos then
		print("error!!! \\script\\skill\\lvlup150_l21_limit.lua nBitPos = nil")
		return
	end
	
	local nTaskValue = GetTask(self.TSK_L21_AVAILABLE)
	nTaskValue = SetBit(nTaskValue, nBitPos, 0)
	SetTask(self.TSK_L21_AVAILABLE, nTaskValue)
	return
end

function tbLvUp150L21Limit:UnlockLv21(nItemIndex, nSkillId)
	if IsMyItem(nItemIndex) == 1 and HaveMagic(nSkillId) == 20 then
		RemoveItemByIndex(nItemIndex)
		self:SetAvailable(nSkillId)
	end
end

function tbLvUp150L21Limit:ShowMenu(nItemIndex)
	local tbOpt = {}
	for nSkillId, nBitPos in self.tbSkillData do
		if type(nSkillId) == "number" then
			local nSkillLevel = HaveMagic(nSkillId)
			if nSkillLevel == 20 and self:IsAvailable(nSkillId) == 0 then --
				tinsert(tbOpt, {GetSkillName(nSkillId), self.UnlockLv21, {self, nItemIndex, nSkillId}})
			end
		end
	end
	
	tinsert(tbOpt, {" ß„ng"})
	CreateNewSayEx("C p ÆÈ hi÷n tπi cÒa bπn c„ th” mÎ ra giÌi hπn k‹ n®ng c p 150 c p 21 sau. Xin ch‰n k‹ n®ng:", tbOpt)
end

function tbLvUp150L21Limit:Compose()
	self.pCompose:ComposeDailog()
end

function main(nItemIndex)
	local nG, nD, nP = GetItemProp(nItemIndex)
	if nG == 6 and nD == 1 and nP == 3917 then
		return 1
	end
	tbLvUp150L21Limit:ShowMenu(nItemIndex)
	return 1
end
