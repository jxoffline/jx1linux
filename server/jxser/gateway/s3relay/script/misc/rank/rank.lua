Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\misc\\rank\\rankdata.lua")

if not tbRankClass then
	tbRankClass = tbBaseClass:new();
end

tbRankClass.tbDBRank = {};	-- key
tbRankClass.nRequestDataLimit = 5;
tbRankClass.emStableRank = 0;
tbRankClass.emDynamicRank = 1;

function tbRankClass:LoadRank(szDBKey)
	OutputMsg(format("Load Rank %s",szDBKey));
	if tbRankClass.tbDBRank[szDBKey] == nil then
		tbRankClass.tbDBRank[szDBKey] = {};
	end
	
	tbRankClass.tbDBRank[szDBKey][self.emStableRank] = {};
	tbRankClass.tbDBRank[szDBKey][self.emDynamicRank] = {};
	local tbStableList = tbRankClass.tbDBRank[szDBKey][self.emStableRank];
	local tbDynamicList = tbRankClass.tbDBRank[szDBKey][self.emDynamicRank];
	
	local handle = OB_Create();
	
	local nRecord = GetRecordCount(szDBKey,self.emStableRank,0,1,0);
	OutputMsg(format("Load Stable Rank count %d",nRecord));
	local nIdx = 1;
	for i=1,nRecord do
		OB_LoadShareData(handle, szDBKey, self.emStableRank, i);
		tbStableList[nIdx] = ObjBuffer:PopObject(handle);
		if (tbStableList[nIdx] ~= nil) then
			nIdx = nIdx + 1;
		end
	end
	
	local nRecord = GetRecordCount(szDBKey, self.emDynamicRank,0,1,0);
	nIdx = 1;
	OutputMsg(format("Load Dynamic Rank count %d",nRecord));
	for i=1,nRecord do
		OB_LoadShareData(handle, szDBKey, self.emDynamicRank, i);
		tbDynamicList[nIdx] = ObjBuffer:PopObject(handle);
		if (tbDynamicList[nIdx] ~= nil) then
			nIdx = nIdx + 1;
		end
	end
	OB_Release(handle);
	
	OutputMsg(format("Load Rank %s end",szDBKey));
end

function tbRankClass:RequestRankCount(szDBKey, nRankType)
	if (tbRankClass.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
	end

	return getn(tbRankClass.tbDBRank[szDBKey][nRankType]);
end

function tbRankClass:RequestRankData(szDBKey, nRankType, nStartRank, nCount)
	local tbRank = self.tbDBRank[szDBKey];
	if (tbRank == nil) then
		self:LoadRank(szDBKey);
	end
	
	local tbRetData = {};
	local nEndRank = min((nStartRank + nCount - 1), getn(tbRank[nRankType]));
	
	for i=nStartRank,nEndRank do
		tbRetData[i-nStartRank+1] = tbRank[nRankType][i];
	end
	
	return tbRetData;
end

function tbRankClass:GetRankData(szDBKey, nRankType)
	if (self.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
	end
	
	return self.tbDBRank[szDBKey][nRankType];
end

function tbRankClass:AddRankData(szDBKey, tbRankData)
	if (self.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
	end

	if (tbRankData == nil) then
		return
	end
	
	local bFound = 0;
	local nRank = 0;
	local tbDynamicList = self.tbDBRank[szDBKey][self.emDynamicRank];
	for i=1,getn(tbDynamicList) do
		local tbLocalData = tbDynamicList[i];
		if (tbRankData ~= nil and tbLocalData ~= nil and tbRankData.szTitle == tbLocalData.szTitle) then
			tbDynamicList[i] = clone(tbRankData);
			nRank = i;
			bFound = 1;
			break;
		end
	end
	
	if (bFound == 0) then
		nRank = getn(tbDynamicList) + 1;
		tinsert(tbDynamicList, nRank, clone(tbRankData))
	end
	
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, tbRankData);
	OB_SaveShareData(handle, szDBKey, self.emDynamicRank, nRank);
	OB_Release(handle);
	
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:RankDataUpdate", {szDBKey, nRank, tbRankData});
end

function tbRankClass:RankDataClear(szDBKey)
	if tbRankClass.tbDBRank[szDBKey] == nil then
		tbRankClass.tbDBRank[szDBKey] = {};
	end
	self.tbDBRank[szDBKey][self.emStableRank] = {};
	self.tbDBRank[szDBKey][self.emDynamicRank] = {};
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:RankDataClear", {szDBKey});
end

function tbRankClass:DelRankData(szDBKey, nRank)
	if (self.tbDBRank[szDBKey] == nil) then
		self:LoadRank(szDBKey);
	end
	
	local tbDynamicList = self.tbDBRank[szDBKey][self.emDynamicRank];
	
	for i=(nRank+1),getn(tbDynamicList)+1 do
		tbDynamicList[i-1] = tbDynamicList[i];
	end
	tremove(tbDynamicList, getn(tbDynamicList));
	
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:DelRankData", {szDBKey, nRank});
end

function rank_gt(a, b) 
	return a.nValue > b.nValue 
end

-- todo ÐòÁÐ»¯
function tbRankClass:SortAndSave(szDBKey)
	OutputMsg(format("Save Rank %s Start!!",szDBKey));
	local tbRank = self.tbDBRank[szDBKey];
	if (tbRank == nil) then
		self:LoadRank(szDBKey);
	end
	
	OutputMsg("Bé läc");

	local tbStableList = tbRank[self.emStableRank];
	local tbDynamicList = tbRank[self.emDynamicRank];
	
	-- Èç¹ûÓÐ¹ýÂËº¯Êý
	if (tbRank.pFilterFun ~= nil and type(tbRank.pFilterFun) == "function") then
		tbDynamicList = tbRank.pFilterFun(tbDynamicList);
	end

	OutputMsg("B¶ng xÕp h¹ng");
	
	-- ÅÅÃû
	sort(tbDynamicList, rank_gt);
	
	OutputMsg("NhËt ký");
	-- ÈÕÖ¾¼ÇÂ¼¾ÉµÄÅÅÃû,ºÍÐÂ²úÉúµÄÅÅÃû
	local logfilename = "\\relay_log\\"..date("%Y_%m_%d").."\\rank_"..szDBKey.."_save.log";
	WriteStringToFile(logfilename, format("Old %s rank\n", szDBKey));
	for i=1,getn(tbStableList) do
		-- ÅÅÃû×Ô¶¨ÒåÊý¾ÝÈç¹û¿ÉÒÔÈ¡µÃ
		local tbRankData = tbStableList[i];
		local szDataString = "";
		if (tbRank.pToStringFun ~= nil and type(tbRank.pToStringFun) == "function") then
			szDataString = tbRank.pToStringFun(tbRankData);
		end
		
		szDataString = format("%0.f\t\t%0.f\t\t%s\t\t%s\n", i, tbRankData.nValue, tbRankData.szTitle, szDataString);
		WriteStringToFile(logfilename, szDataString);
		--OutputMsg(szDataString);
	end
	
	WriteStringToFile(logfilename, format("New %s rank\n", szDBKey));
	for i=1,getn(tbDynamicList) do
		-- ÅÅÃû×Ô¶¨ÒåÊý¾ÝÈç¹û¿ÉÒÔÈ¡µÃ
		local tbRankData = tbDynamicList[i];
		local szDataString = "";
		if (tbRank.pToStringFun ~= nil and type(tbRank.pToStringFun) == "function") then
			szDataString = tbRank.pToStringFun(tbRankData);
		end
		
		szDataString = format("%0.f\t\t%0.f\t\t%s\t\t%s\n", i, tbRankData.nValue, tbRankData.szTitle, szDataString);
		WriteStringToFile(logfilename, szDataString);
		--OutputMsg(szDataString);
	end
	
	OutputMsg("Kho chøa");
	self.tbDBRank[szDBKey][self.emStableRank] = {};
	tbStableList = self.tbDBRank[szDBKey][self.emStableRank];
	-- ±ØÐëÒª¿½±´Ã¿Ò»Ïî
	for i=1,getn(tbDynamicList) do
		tinsert(tbStableList, i, clone(tbDynamicList[i]))
		--tbStableList[i] = clone(tbDynamicList[i]);
	end
	
	--Çå¿ÕÔ­ÓÐµÄSDB
	ClearRecordOnShareDB(szDBKey);
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:RankDataClear", {szDBKey});
	
	--±£´æ¼ÇÂ¼
	for i=1,getn(tbStableList) do
		local handle = OB_Create();
		ObjBuffer:PushObject(handle, tbStableList[i]);
		OB_SaveShareData(handle, szDBKey, self.emStableRank, i);
		OB_SaveShareData(handle, szDBKey, self.emDynamicRank, i);
		OB_Release(handle);
	end
	
	RemoteExc("\\script\\misc\\rank\\rank.lua", "tbRankClass:LoadRank", {szDBKey});

	OutputMsg(format("Save Rank %s End!!",szDBKey));
end