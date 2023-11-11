Include("\\script\\missions\\miniencounter\\map.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");

EncounterMapManager			= {};
EncounterMapManager.tbMapList  = {};				 -- tbMapList采用nMapID作为索引
EncounterMapManager.nCurrentGs = 0;				  -- 当前的Gs

function EncounterMapManager:IsInMapList(nMapID)
	if nMapID == nil then
		print(">> Error : nMapID is nil.");
		return nil;
	end

	for k, v in self.tbMapList do
		if k == nMapID then
			return 1;
		end
	end

	return nil;
end

function EncounterMapManager:AddMap(tbMap)
	if tbMap == nil then
		print(">> Error : tbMap is nil.");
		return nil;
	end

	if self:IsInMapList(tbMap.nMapId) then
		print(">> Error : The added map already exists, please check it.");
		return nil;
	end

	self.tbMapList[tbMap.nMapId] = tbMap;
	return 1;
end

function EncounterMapManager:DelMap(nMapID)
	if nMapID == nil then
		print(">> Error : nMapID is nil.");
		return nil;
	end

	self.tbMapList[nMapID] = nil;
	return 1;
end

function EncounterMapManager:FindInMapList(nMapID)
	if nMapID == nil then
		print(">> Error : nMapID is nil.");
		return nil;
	end

	for k, v in self.tbMapList do
		if k == nMapID then
			return v;
		end
	end

	return nil;
end

function EncounterMapManager:ClearMapList()
	self.tbMapList = {};
	return 1
end

function EncounterMapManager:PrintMapList()
	for k, v in self.tbMapList do
		print ("EncounterMapManager.tbMapList["..k.."] = "..v.nMapId);
	end
end
