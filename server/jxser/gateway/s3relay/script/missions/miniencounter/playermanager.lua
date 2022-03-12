Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");

EncounterPlayerManager = {};
EncounterPlayerManager.tbPrepareList   = {};							-- 排队玩家列表
EncounterPlayerManager.tbBlackList	 = {};							-- 黑名单玩家列表
EncounterPlayerManager.tbCheckTempList = {};							-- 临时检查玩家列表

function EncounterPlayerManager:IsInPrepareList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	for i = 1, getn(self.tbPrepareList) do
		if self.tbPrepareList[i] ~= nil and self.tbPrepareList[i].szRoleName == szRoleName then
			return 1;
		end
	end

	return nil;
end

function EncounterPlayerManager:IsInBlackList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	if self.tbBlackList[szRoleName] ~= nil then
		return 1;
	end

	return nil;
end

function EncounterPlayerManager:IsInCheckTempList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	for i = 1, getn(self.tbCheckTempList) do
		if self.tbCheckTempList[i] ~= nil and self.tbCheckTempList[i].szRoleName == szRoleName then
			return 1;
		end
	end

	return nil;
end

function EncounterPlayerManager:AddToPrepareList(tbPlayer)
	if tbPlayer == nil then
		return nil;
	end

	local nSignTime	   = GetSysCurrentTime();
	tbPlayer.nSignTime	= nSignTime;									  -- 报名时间：以Relay时间为准

	local nPrepareNum = getn(self.tbPrepareList);
	self.tbPrepareList[nPrepareNum + 1] = tbPlayer;

	--self:PrintPrepareList();
	return 1;
end

function EncounterPlayerManager:AddToBlackList(tbPlayer)
	if tbPlayer == nil then
		return nil;
	end

	local nLockTime	   = GetSysCurrentTime();
	tbPlayer.nLockTime	= nLockTime;									  -- 锁定时间：以Relay时间为准

	self.tbBlackList[tbPlayer.szRoleName] = tbPlayer;

	--self:PrintBlackList();
	return 1;
end

function EncounterPlayerManager:AddToCheckTempList(tbPlayer)
	if tbPlayer == nil then
		return nil;
	end

	local nCheckTempNum = getn(self.tbCheckTempList);
	self.tbCheckTempList[nCheckTempNum + 1] = tbPlayer;

	--self:PrintCheckTempList();
	return 1;
end

function EncounterPlayerManager:DelFromPrepareList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local nPrepareNum = getn(self.tbPrepareList);
	for i = 1, nPrepareNum do
		if self.tbPrepareList[i] ~= nil and self.tbPrepareList[i].szRoleName == szRoleName then
			for j = i, nPrepareNum do
				self.tbPrepareList[j] = self.tbPrepareList[j + 1];
			end
			self.tbPrepareList[nPrepareNum] = nil;
			break;
		end
	end

	--self:PrintPrepareList();
	return 1;
end

function EncounterPlayerManager:DelFromBlackList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	self.tbBlackList[szRoleName] = nil;

	--self:PrintBlackList();
	return 1;
end

function EncounterPlayerManager:DelFromCheckTempList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local nCheckTempNum = getn(EncounterPlayerManager.tbCheckTempList);
	for i = 1, nCheckTempNum do
		if self.tbCheckTempList[i] ~= nil and self.tbCheckTempList[i].szRoleName == szRoleName then
			for j = i, nCheckTempNum do
				self.tbCheckTempList[j] = self.tbCheckTempList[j + 1];
			end
			self.tbCheckTempList[nPrepareNum] = nil;
			break;
		end
	end

	--self:PrintCheckTempList();
	return 1;
end

function EncounterPlayerManager:FindInPrepareList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	for i = 1, getn(self.tbPrepareList) do
		if self.tbPrepareList[i] ~= nil and self.tbPrepareList[i].szRoleName == szRoleName then
			return self.tbPrepareList[i];
		end
	end

	return nil;
end

function EncounterPlayerManager:FindInBlackList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	for k, v in self.tbBlackList do
		if v ~= nil and v.szRoleName == szRoleName then
			return v;
		end
	end

	return nil;
end

function EncounterPlayerManager:FindInCheckTempList(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	for i = 1, getn(self.tbCheckTempList) do
		if self.tbCheckTempList[i] ~= nil and self.tbCheckTempList[i].szRoleName == szRoleName then
			return self.tbCheckTempList[i];
		end
	end

	return nil;
end

function EncounterPlayerManager:ClearPrepareList()
	self.tbPrepareList = {};
	return 1;
end

function EncounterPlayerManager:ClearBlackList()
	self.tbBlackList = {};
end

function EncounterPlayerManager:ClearCheckTempList()
	self.tbCheckTempList = {};
end

function EncounterPlayerManager:PrintPrepareList()
	for i = 1, getn(self.tbPrepareList) do
		OutputMsg("EncounterPlayerManager.tbPrepareList["..i.."] = "..self.tbPrepareList[i].szRoleName);
	end
end

function EncounterPlayerManager:PrintBlackList()
	for k, v in self.tbBlackList do
		OutputMsg ("EncounterPlayerManager.tbBlackList["..k.."] = "..v.szRoleName);
	end
end

function EncounterPlayerManager:PrintCheckTempList()
	for i = 1, getn(self.tbCheckTempList) do
		OutputMsg ("EncounterPlayerManager.tbCheckTempList["..i.."] = "..self.tbCheckTempList[i].szRoleName);
	end
end
