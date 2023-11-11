EncounterMap = {};

function EncounterMap:new(nMapID)
	local tb  = {};
	tb.nMapID = nMapID;				 -- 地图ID
	tb.tbPlayerList = {}
	tb.nTotalNum = 0

	tb.nGameStartTime = 0;			  -- 比赛开启时间 

	for k, v in self do
		tb[k] = v;
	end
	return tb;
end

function EncounterMap:Create(nMapID)
	local tbMap = self:new(nMapID);
	tbMap.nGameStartTime = GetSysCurrentTime();
	return tbMap;
end

function EncounterMap:GetTotalNum()
	return self.nTotalNum;--getn(self.tbCamp[1]) + getn(self.tbCamp[2]);
end

function EncounterMap:IsValid()
	if self.nMapID <= 0 then
		return nil;
	end
	
	if self.nTotalNum < DungeonGlobalData.PLAY_NUM_LOWER_LIMIT then
		return nil
	end

	if self.nTotalNum > DungeonGlobalData.PLAY_NUM_UPPER_LIMIT then
		return nil
	end
	
	return 1;
end

function EncounterMap:IsFull()
	if self:GetTotalNum() >= DungeonGlobalData.PLAY_NUM_UPPER_LIMIT then
		return 1;
	end
	return nil;
end

function EncounterMap:IsWait()
	local nCurTime = GetSysCurrentTime();
	if nCurTime - self.nGameStartTime < DungeonGlobalData.MAP_WAIT_TIME then
		return 1;
	end
	return nil;
end

function EncounterMap:IsStart()
	local nCurTime = GetSysCurrentTime();
	if nCurTime - self.nGameStartTime >= DungeonGlobalData.MAP_WAIT_TIME then
		return 1;
	end
	return nil;
end

function EncounterMap:GetCampByName(szRoleName)
	if szRoleName == nil then
		return -1;
	end
	
	local nCamp = self.tbPlayerList[szRoleName]
	if nCamp then
		return nCamp
	end

	return -1;
end


function EncounterMap:AddPlayer(szRoleName)
	if self:GetTotalNum() >= DungeonGlobalData.PLAY_NUM_UPPER_LIMIT then
		return
	end
	if self.tbPlayerList[szRoleName] then
		return self.tbPlayerList[szRoleName]
	end
	
	local nCamp1Num, nCamp2Num = 0, 0
	for k, v in self.tbPlayerList do
		if v == 1 then
			nCamp1Num = nCamp1Num + 1
		elseif v == 2 then
			nCamp2Num = nCamp2Num + 1
		else
			OutputMsg(format("Camp error, [%s]=%s", szRoleName, tostring(v)))
		end
	end
	
	local nCamp
	if nCamp1Num > nCamp2Num then
		nCamp = 2
	elseif nCamp1Num < nCamp2Num then
		nCamp = 1
	else
		nCamp = random(1,2)
	end
	
	if nCamp then
		self.tbPlayerList[szRoleName] = nCamp
		self.nTotalNum = self.nTotalNum + 1
	end
	
	return nCamp
end

function EncounterMap:GetMapIDByPlayerName(szRoleName)
	if self.tbPlayerList[szRoleName] then
		return self.nMapID
	end
	
	return -1
end
