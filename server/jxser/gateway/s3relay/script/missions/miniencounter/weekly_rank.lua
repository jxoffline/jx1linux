-- File Description
-- 符离冲突战每周排名数据

-- Include Files
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\objbuffer_head.lua");

-- Global Data
tbMiniEncounterRank		  = {};
tbMiniEncounterRank.SAVE_KEY = "EVENT_MiniencounterRank";
tbMiniEncounterRank.TOP_N	= 100;
tbMiniEncounterRank.DEBUG	= 1;
tbMiniEncounterRank.tbData   = {};

-------------------------------------------------------
-- tbMiniEncounterRank.tbData = {					--
--	 [1] = { -- 上周排名						   --
--						[szName]= {nRank, nScore}, [szName] = {nRank, nScore}
--	 },											--
--	 [2] = { -- 本周数据						   --
--						[szName]= {nRank, nScore}, [szName] = {nRank, nScore}
--	 },											--
--	 [3] = nWeek,								  --
-- };												--
-------------------------------------------------------

function sort_fun(a, b)
	return a[2] > b[2];
end

function tbMiniEncounterRank:DebugPrint(s)
	if self.DEBUG then
		OutputMsg(s);
	end
end

function tbMiniEncounterRank:SaveData()
	if self.tbData == nil or getn(self.tbData) == 0 then -- If data not existed, do nothing
		return
	end

	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, self.tbData)
	OB_SaveShareData(hObject, self.SAVE_KEY, 0, 0)
	OB_Release(hObject)
end

function tbMiniEncounterRank:LoadData()
	self.tbData = self.tbData or {};

	if self.tbData ~= nil and getn(self.tbData) ~= 0 then
		return
	end

	local hObject = OB_Create();
	OB_LoadShareData(hObject, self.SAVE_KEY, 0, 0);
	if OB_IsEmpty(hObject) ~= 1 then
		self.tbData = ObjBuffer:PopObject(hObject);
	end
	OB_Release(hObject);

	-- 装载数据不存在，构建一个新表
	if self.tbData == nil or getn(self.tbData) == 0 then
		self.tbData = {};
		self.tbData[1] = {};
		self.tbData[2] = {};
		self.tbData[3] = -1;
	end
	
	--self:PrintData()
end

function tbMiniEncounterRank:SwitchData(nWeek)
	if self.tbData == nil or getn(self.tbData) == 0 then
		self:LoadData();
	end

	if self.tbData ~= nil and getn(self.tbData) >= 2 then
		self.tbData[1] = self.tbData[2];
		self.tbData[2] = {};
		self.tbData[3] = nWeek;
	end
end

-- gs传过来的一场比赛的数据格式为
-- {
--		 [szName] = nScore,
--		 ......
--		 [szName] = nScore,
-- };
function tbMiniEncounterRank:RecordResult(ParamHandle, ResultHandle)
	if self.tbData == nil or getn(self.tbData) == 0 then
		self:LoadData();
	end
	
	local tbGSData = ObjBuffer:PopObject(ParamHandle);
	if type(tbGSData) ~= "table" then
		OutputMsg("tbMiniEncounterRank:RecordResult() gets a dirty data from gs!");
		return
	end
	
	local nCurWeek = tonumber(date("%W"))
	if self.tbData[3] ~= nCurWeek then
		self:SwitchData(nCurWeek);
	end

	--self:DebugPrint("[MSG] :) Data before insertion : ")
	--self:PrintData();
	-- 记到本周数据
	
	for k, v in tbGSData do
		self.tbData[2][k] = {0, v}
	end
	
	local tbSorted = {}
	for k, v in self.tbData[2] do
		tinsert(tbSorted, {k, v[2]})
	end
	
	sort(tbSorted, sort_fun)
	
	local tbNewData = {}
	for i = 1, 100 do
		local tbPlayer = tbSorted[i]
		if not tbPlayer then
			break
		end
		tbNewData[tbPlayer[1]] = {i, tbPlayer[2]}
	end

	self.tbData[2] = tbNewData
	self:SaveData()

	--self:DebugPrint("[MSG] : MiniEncounter Rank: ")
	--self:PrintData();
end

function tbMiniEncounterRank:QueryPersonalData(ParamHandle, ResultHandle)
	if self.tbData == nil or getn(self.tbData) == 0 then
		self:LoadData();
	end
	
	local nCurWeek = tonumber(date("%W"))
	if self.tbData[3] ~= nCurWeek then
		self:SwitchData(nCurWeek)
	end

	local nResult = -1
	local szRoleName = ObjBuffer:PopObject(ParamHandle)
	if szRoleName then
		local tbData = self.tbData[1][szRoleName]
		if tbData then
			nResult = tbData[1]
		end
	end
		
	ObjBuffer:PushObject(ResultHandle, nResult)
end

function tbMiniEncounterRank:PrintData()
	
	self:DebugPrint("Lask Week");
	for k, v in self.tbData[1] do
		self:DebugPrint(format("[%d] =   %s,   %d ,", v[1], k, v[2]));
	end

	self:DebugPrint("This Week");
	for k, v in self.tbData[2] do
		self:DebugPrint(format("[%d] =   %s,   %d ,", v[1], k, v[2]));
	end

	--self:DebugPrint(format("	[3] = %d", self.tbData[3]));
end


--tbMiniEncounterRank.tbData = {{},{},1}
--tbMiniEncounterRank:SaveData()

tbMiniEncounterRank:LoadData()
