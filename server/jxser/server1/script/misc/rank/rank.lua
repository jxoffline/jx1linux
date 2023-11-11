Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\misc\\rank\\rankdata.lua")

if not tbRankClass then
	tbRankClass = tbBaseClass:new();
	tbRankClass.tbDBRank = {};	-- key
	tbRankClass.nRequestDataLimit = 5;
	tbRankClass.emStableRank = 0;
	tbRankClass.emDynamicRank = 1;
end

function tbRankClass:LoadRank(szDBKey)
	if (self.tbDBRank[szDBKey] == nil) then
		self.tbDBRank[szDBKey] = {};
		self.tbDBRank[szDBKey][self.emStableRank] = {};
		self.tbDBRank[szDBKey][self.emDynamicRank] = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index[self.emStableRank] = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index[self.emDynamicRank] = {};
	end
	
	self.tbDBRank[szDBKey].bLoading = 1;
	self.tbDBRank[szDBKey].nLoadCount = 0;
	self.tbDBRank[szDBKey].nLoadMaxCount = 0;
	
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:RequestRankCount", {szDBKey, self.emStableRank},
				"\\script\\misc\\rank\\rank.lua", "tbRankClass:ReceiveRankCount", {szDBKey, self.emStableRank});
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:RequestRankCount", {szDBKey, self.emDynamicRank},
				"\\script\\misc\\rank\\rank.lua", "tbRankClass:ReceiveRankCount", {szDBKey, self.emDynamicRank});
end

function tbRankClass:ReceiveRankCount(szDBKey, nRankType, nCount)
	local nNeedRequest = ceil(nCount/self.nRequestDataLimit);
	local tbParam = {szDBKey, nRankType, 1, self.nRequestDataLimit};
	
	if (nCount ~= nil and nCount > 0) then
		self.tbDBRank[szDBKey].bLoading = 1;
		self.tbDBRank[szDBKey].nLoadMaxCount = self.tbDBRank[szDBKey].nLoadMaxCount + nCount;
	else
		self.tbDBRank[szDBKey].bLoading = 0;
	end
	
	for i=1,nNeedRequest do
		RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:RequestRankData", tbParam,
						"\\script\\misc\\rank\\rank.lua", "tbRankClass:ReceiveRankData", clone(tbParam));
		tbParam[3] = tbParam[3] + tbParam[4];
		if (i == (nNeedRequest - 1)) then
			tbParam[4] = nCount - tbParam[4] * i;
		end
	end
end

function tbRankClass:ReceiveRankData(szDBKey, nRankType, nStartRank, nCount, tbData)
	if (self.tbDBRank[szDBKey] == nil) then
		self.tbDBRank[szDBKey] = {};
		self.tbDBRank[szDBKey].bLoading = 0;
		self.tbDBRank[szDBKey].nLoadCount = 0;
		self.tbDBRank[szDBKey].nLoadMaxCount = 0;
		self.tbDBRank[szDBKey][self.emStableRank] = {};
		self.tbDBRank[szDBKey][self.emDynamicRank] = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index[self.emStableRank] = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index[self.emDynamicRank] = {};
	end
	
	if (tbData == nil or type(tbData) ~= "table") then
		return
	end
	
	nCount = min(nCount, getn(tbData))
	
	for i=1,nCount do
		self.tbDBRank[szDBKey][nRankType][i+nStartRank-1] = clone(tbData[i]);
		self.tbDBRank[szDBKey].tbMapTitle2Index[nRankType][tbData[i].szTitle] = i+nStartRank-1;
	end
	
	self.tbDBRank[szDBKey].nLoadCount = self.tbDBRank[szDBKey].nLoadCount + nCount;
	
	if (self.tbDBRank[szDBKey].nLoadCount >=  self.tbDBRank[szDBKey].nLoadMaxCount) then
		self.tbDBRank[szDBKey].bLoading = 0;
		self:OnRankUpdate(szDBKey);
	end
end

function tbRankClass:GetRankData(szDBKey, nRankType)
	if (self.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
		return {};
	end
	
	return self.tbDBRank[szDBKey][nRankType];
end

function tbRankClass:AddRankData(szDBKey, tbRankData)
	if (self.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
		return 0;
	end
	
	if (self.tbDBRank[szDBKey].bLoading == 1) then
		return 0;
	end
	
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:AddRankData", {szDBKey, tbRankData});
end

function tbRankClass:RankDataUpdate(szDBKey, nRank, tbRankData)
	if (self.tbDBRank[szDBKey] == nil) then
		self.tbDBRank[szDBKey] = {};
		self.tbDBRank[szDBKey].bLoading = 0;
		self.tbDBRank[szDBKey].nLoadCount = 0;
		self.tbDBRank[szDBKey].nLoadMaxCount = 0;
		self.tbDBRank[szDBKey][self.emStableRank] = {};
		self.tbDBRank[szDBKey][self.emDynamicRank] = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index[self.emStableRank] = {};
		self.tbDBRank[szDBKey].tbMapTitle2Index[self.emDynamicRank] = {};
	end
	self.tbDBRank[szDBKey][self.emDynamicRank][nRank] = tbRankData;
	self.tbDBRank[szDBKey].tbMapTitle2Index[self.emDynamicRank][tbRankData.szTitle] = nRank;
end

function tbRankClass:RankDataClear(szDBKey)
	if (self.tbDBRank[szDBKey] == nil) then
		self.tbDBRank[szDBKey] = {};
	end
	self.tbDBRank[szDBKey][self.emStableRank] = {};
	self.tbDBRank[szDBKey][self.emDynamicRank] = {};
	self.tbDBRank[szDBKey].bLoading = 0;
	self.tbDBRank[szDBKey].nLoadCount = 0;
	self.tbDBRank[szDBKey].nLoadMaxCount = 0;
	self.tbDBRank[szDBKey].tbMapTitle2Index[self.emStableRank] = {};
	self.tbDBRank[szDBKey].tbMapTitle2Index[self.emDynamicRank] = {};
	self:OnRankUpdate(szDBKey);
end

function tbRankClass:RequestDelRankData(szDBKey, nRank)
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:DelRankData", {szDBKey, nRank});
end

function tbRankClass:DelRankData(szDBKey, nRank)
	if (self.tbDBRank[szDBKey] == nil or getn(self.tbDBRank[szDBKey][self.emDynamicRank]) < nRank) then
		self:LoadRank(szDBKey);
		return
	end
	
	local nTotal = getn(self.tbDBRank[szDBKey][self.emDynamicRank]);
	for i=(nRank+1),nTotal do
		self.tbDBRank[szDBKey][self.emDynamicRank][i-1] = self.tbDBRank[szDBKey][self.emDynamicRank][i];
	end
end

function tbRankClass:FindRankData(szDBKey, nRankType, szTitle)
	local tbRankData = nil;
	local nRank = 0;
	
	if (self.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
		return nRank, tbRankData;
	end
	
	if (self.tbDBRank[szDBKey].bLoading == 1) then
		return nRank, tbRankData;
	end
	
	if (self.tbDBRank[szDBKey].tbMapTitle2Index[nRankType] ~= nil) then
		nRank = self.tbDBRank[szDBKey].tbMapTitle2Index[nRankType][szTitle];
		if (nRank ~= nil) then
			tbRankData = clone(self.tbDBRank[szDBKey][nRankType][nRank]);
		else
			nRank = 0;
		end
		return nRank, tbRankData;
	end
	
	for i=1,getn(self.tbDBRank[szDBKey][nRankType]) do
		if (self.tbDBRank[szDBKey][nRankType][i] ~= nil and self.tbDBRank[szDBKey][nRankType][i].szTitle == szTitle) then
			
			tbRankData = clone(self.tbDBRank[szDBKey][nRankType][i]);
			nRank = i;
			break;
		end
	end
	
	return nRank, tbRankData;
end

function tbRankClass:IsLoading(szDBKey)
	if (self.tbDBRank[szDBKey] == nil or self.tbDBRank[szDBKey].bLoading == 1) then
		return 1;
	end
	
	return 0;
end

function tbRankClass:OnRankUpdate(szDBKey)
	if (self.tbDBRank[szDBKey] ~= nil and type(self.tbDBRank[szDBKey].OnUpdate) == "function") then
		self.tbDBRank[szDBKey]:OnUpdate();
	end
end
