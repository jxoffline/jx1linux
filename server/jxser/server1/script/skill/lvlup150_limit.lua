Include("\\script\\skill\\lang.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

tbLvUp150Limit = {}
tbLvUp150Limit.Item2SkillLevel = {}
tbLvUp150Limit.Item2SkillLevel[4149] = 22
tbLvUp150Limit.Item2SkillLevel[4150] = 23
tbLvUp150Limit.Item2SkillLevel[4151] = 24
tbLvUp150Limit.Item2SkillLevel[4152] = 25
tbLvUp150Limit.Item2SkillLevel[4153] = 26


tbLvUp150Limit.TSK_LIMIT_LEVEL = {}
tbLvUp150Limit.TSK_LIMIT_LEVEL[21] = 4035 -- can not change
tbLvUp150Limit.TSK_LIMIT_LEVEL[22] = 4067
tbLvUp150Limit.TSK_LIMIT_LEVEL[23] = 4068
tbLvUp150Limit.TSK_LIMIT_LEVEL[24] = 4069
tbLvUp150Limit.TSK_LIMIT_LEVEL[25] = 4070
tbLvUp150Limit.TSK_LIMIT_LEVEL[26] = 4071

tbLvUp150Limit.tbSkillData = {
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
	[1369] = 26,
	[1384] = 27,
}

function tbLvUp150Limit:IsAvailable(nSkillLevel, nSkillId)
	local nCurrLevelTaskId = self.TSK_LIMIT_LEVEL[nSkillLevel]
	local nBitPos = self.tbSkillData[nSkillId]
	
	if not nBitPos then
		return
	end
	if not nCurrLevelTaskId then
		return
	end
	return GetBitTask(nCurrLevelTaskId, nBitPos, 1)
end

function tbLvUp150Limit:SetAvailable(nSkillLevel, nSkillId)
	local nTaskId = self.TSK_LIMIT_LEVEL[nSkillLevel]
	local nBitPos = self.tbSkillData[nSkillId]
	if not nBitPos then
		print("error!!! \\script\\skill\\lvlup150_limit.lua nBitPos = nil")
		return
	end
	
	SetBitTask(nTaskId, nBitPos,1, 1)
	return
end

function tbLvUp150Limit:SetAvoid(nSkillLevel, nSkillId)
	local nTaskId = self.TSK_LIMIT_LEVEL[nSkillLevel]
	local nBitPos = self.tbSkillData[nSkillId]
	if not nBitPos then
		print("error!!! \\script\\skill\\lvlup150_limit.lua nBitPos = nil")
		return
	end
	
	SetBitTask(nTaskId, nBitPos, 1, 0)
	return
end

function tbLvUp150Limit:UnlockLevel(nItemIndex,nSkillLevel, nSkillId)
	if IsMyItem(nItemIndex) == 1 then
		RemoveItemByIndex(nItemIndex)
		self:SetAvailable(nSkillLevel, nSkillId)
		Msg2Player(format(%LVLUP150_MSG_UNLOCK,GetSkillName(nSkillId), nSkillLevel))
	end
end

function tbLvUp150Limit:ShowMenu(nItemIndex)
	_,_, p = GetItemProp(nItemIndex)
	local nSkillLevel = self.Item2SkillLevel[p]

	local tbOpt = {}
	for nSkillId, nBitPos in self.tbSkillData do
		if type(nSkillId) == "number" then
			if GetCurrentMagicLevel(nSkillId,0) == nSkillLevel-1 and  self:IsAvailable(nSkillLevel, nSkillId) == 0 then
				tinsert(tbOpt, {GetSkillName(nSkillId), self.UnlockLevel, {self, nItemIndex,nSkillLevel, nSkillId}})
			end
		end
	end
	
	tinsert(tbOpt, {" §ãng"})
	CreateNewSayEx(format("HiÖn t¹i ng­¬i cã thÓ më nh÷ng giíi h¹n d­íi ®©y cña kÜ n¨ng 150 cÊp %d. H·y lùa chän kÜ n¨ng: ", nSkillLevel), tbOpt)
end


function main(nItemIndex)
	tbLvUp150Limit:ShowMenu(nItemIndex)
	return 1
end
