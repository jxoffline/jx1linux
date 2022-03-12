Include("\\script\\missions\\miniencounter\\map.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");

EncounterMapManager		   = {};
EncounterMapManager.tbMapList = {};


function EncounterMapManager:IsInMapList(nMapID)
	if nMapID == nil then
		print(">> Error : nMapID is nil.");
		return nil;
	end

	for i = 1, getn(self.tbMapList) do
		if self.tbMapList[i] ~= nil and self.tbMapList[i].nMapID == nMapID then
			return 1;
		end
	end

	return nil;
end

function EncounterMapManager:AddMap(tbMap)

	if tbMap == nil then
		OutputMsg(">> Error : tbMap is nil.");
		return nil;
	end

	if not tbMap:IsValid() then
		OutputMsg(">> Error : The added map is invalid, please check it.");
		return nil;
	end

	if self:IsInMapList(tbMap.nMapID) then
		OutputMsg(">> Error : The added map already exists, please check it.");
		return nil;
	end

	tinsert(self.tbMapList, tbMap)
	return 1;
end

function EncounterMapManager:DelMap(nMapID)
	if nMapID == nil then
		print(">> Error : nMapID is nil.");
		return nil;
	end

	local nMapNum = getn(self.tbMapList);
	for i = 1, nMapNum do
		if self.tbMapList[i] ~= nil and self.tbMapList[i].nMapID == nMapID then
			tremove(self.tbMapList, i)
			break
		end
	end

	return 1;
end

function EncounterMapManager:FindInMapList(nMapID)
	if nMapID == nil then
		print(">> Error : nMapID is nil.");
		return nil;
	end

	for i = 1, getn(self.tbMapList) do
		if self.tbMapList[i] ~= nil and self.tbMapList[i].nMapID == nMapID then
			return self.tbMapList[i];
		end
	end

	return nil;
end

function EncounterMapManager:ClearMapList()
	self.tbMapList = {};
	return 1;
end

function EncounterMapManager:PrintMapList()
	print("[Function Stack] - EncounterMapManager:PrintMapList - mapmanager.lua");
	for i = 1, getn(self.tbMapList) do
		print ("EncounterMapManager.tbMapList["..i.."] = "..self.tbMapList[i].nMapID);
	end
end

