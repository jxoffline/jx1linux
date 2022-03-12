Include("\\script\\mission\\dungeon\\dungeonlog.lua");
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")

if not tbDDManager then
	tbDDManager = {}
	tbDDManager.tbDungeonTempletList = {}
	tbDDManager.tbRunningDungeonList = {}
	tbDDManager.tbSavedDungeonList = {}
	tbDDManager.tbOwner2Dungeon = {}; 
end

function tbDDManager:LoadData()
	
	local handle = OB_Create();
	
	for nTemplateId,tbTemplate in self.tbDungeonTempletList do
		if(nTemplateId ~= "n" and type(tbTemplate) == "table" and type(tbTemplate.nTemplateId) == "number") then
			self.tbSavedDungeonList[nTemplateId] = {};
			self.tbOwner2Dungeon[nTemplateId] = {};
			self.tbRunningDungeonList[nTemplateId] = {};
			
			local nRecord = GetRecordCount("DUNGEON_DATA",nTemplateId,0,1,0);
			-- 储存的时候不按DungeonId来存,会有冲突
			local nId = 1;
			for i=1,nRecord do
				self.tbSavedDungeonList[nTemplateId][nId] = tbTemplate:new({});
				self.tbSavedDungeonList[nTemplateId][nId]:Initialize(0, nId);
				local nRet = self.tbSavedDungeonList[nTemplateId][nId]:Load();
				if (nRet == 1) then
					local strOwner = self.tbSavedDungeonList[nTemplateId][nId]:GetOwner();
					if (type(strOwner) ~= "string" or strOwner == "") then
						--读取不到所有者
						tbDungeonLog:WriteLog("%s\t[ERROR]Can't Get Dungeon Owner Load Failed\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nId, nTemplateId, strOwner);
					else
						if (self.tbOwner2Dungeon[nTemplateId][strOwner] ~= nil) then
							--同一种类型的副本已经存在
							tbDungeonLog:WriteLog("%s\t[ERROR]Duplicate Dungeon Load Failed\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nId, nTemplateId, strOwner);
							
							-- 记录下副本的存档数据
							if (type(self.tbSavedDungeonList[nTemplateId][nId].tbData) == "table") then
								for data_key,data_value in self.tbSavedDungeonList[nTemplateId][nId].tbData do
									tbDungeonLog:WriteLog("%s\t%s",tostring(data_key), tostring(data_value));
								end
							end
						else
							self.tbOwner2Dungeon[nTemplateId][strOwner] = {};
							self.tbOwner2Dungeon[nTemplateId][strOwner].bSaved = 1;
							self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId = nId;
							self.tbSavedDungeonList[nTemplateId][nId].nSaveId = nId;
							nId = nId + 1;
						end --self.tbOwner2Dungeon[nTemplateId][strOwner] ~= nil
					end --if (type(strOwner) ~= "string") or strOwner == "") then
				end --if (nRet == 1) then
			end --for i=1,nRecord do
		end --if(k ~= "n" and type(tbTemplate) == "table" and type(tbTemplate.nTemplateId) == "number") then
	end --for k,tbTemplate in self.tbDungeonTempletList do
	OB_Release(handle);
end

function tbDDManager:CheckExist(nTemplateId,strOwner, nGSId)
	local tbDungeon, bSaved = self:FindDungeon(nTemplateId, strOwner, nGSId)
	
	local tbRetData = nil;
	
	if (tbDungeon ~= nil) then
		tbRetData = clone(tbDungeon.tbData);
		tbRetData.nDungeonId = tbDungeon.nDungeonId;
		tbRetData.nTemplateId = tbDungeon.nTemplateId;
		tbRetData.strOwner = tbDungeon:GetOwner();
	end

	return tbRetData, bSaved;
end

function tbDDManager:OpenDungeon(nTemplateId,nDungeonId,strOwner)
	if (type(nDungeonId) ~= "number" or nDungeonId == 0) then
		tbDungeonLog:WriteLog("%s\t[ERROR]Open Dungeon Failed Illegal Param",date("%Y-%m-%d %H:%M:%S"));
		return
	end
	
	local tbDungeon,bSaved = self:FindDungeon(nTemplateId,strOwner);
	
	if (tbDungeon ~= nil) then
		if (bSaved ~= 1) then
			tbDungeonLog:WriteLog("%s\t[ERROR]Reopen Dungeon Failed\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nTemplateId,nDungeonId,strOwner);
			return
		end
		-- 将其移动至Running列表
		local nOldId = self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId;
		self.tbOwner2Dungeon[nTemplateId][strOwner].bSaved = 0;
		self.tbRunningDungeonList[nTemplateId][nDungeonId] = tbDungeon;
		self.tbSavedDungeonList[nTemplateId][nOldId] = nil;
		self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId = nDungeonId;
		tbDungeon.nDungeonId = nDungeonId;
		tbDungeon.nSaveId = 0;
		
		tbDungeonLog:WriteLog("%s\tOpen Saved Dungeon\t%0.f\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nOldId, nTemplateId, nDungeonId, strOwner);
		if (type(tbDungeon.tbData) == "table") then
			for data_key,data_value in tbDungeon.tbData do
				tbDungeonLog:WriteLog("%s\t%s",tostring(data_key), tostring(data_value));
			end
		end
	else
		if (self.tbDungeonTempletList[nTemplateId] == nil) then
			tbDungeonLog:WriteLog("%s\t[ERROR]Open Dungeon Failed Not Found Template\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nTemplateId, strOwner);
			return
		end
		--直接开启新的
		tbDungeon = self.tbDungeonTempletList[nTemplateId]:new({});
		tbDungeon.tbData = clone(self.tbDungeonTempletList[nTemplateId].tbData);
		tbDungeon:Initialize(nDungeonId);
		tbDungeon:SetOwner(strOwner);
		self.tbOwner2Dungeon[nTemplateId][strOwner] = {};
		self.tbRunningDungeonList[nTemplateId][nDungeonId] = tbDungeon;
		self.tbOwner2Dungeon[nTemplateId][strOwner].bSaved = 0;
		self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId = nDungeonId;
		tbDungeon.nSaveId = 0;
		tbDungeonLog:WriteLog("%s\tOpen New Dungeon\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner);
	end
	
	tbDungeon:UpdateBreathTime();
	return 1;
end

function tbDDManager:CloseDungeon(nTemplateId,nDungeonId,strOwner)
	local tbDungeon, bSaved = self:FindDungeon(nTemplateId,strOwner);
	if (tbDungeon == nil) then
		tbDungeonLog:WriteLog("%s\t[ERROR]Close Dungeon Failed Not Find Dungeon\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner);
		return
	end
	
	if (tbDungeon.nDungeonId ~= nDungeonId) then
		tbDungeonLog:WriteLog("%s\t[ERROR]Close Dungeon Failed DungeonId Mismatched\t%0.f\t%0.f\t%s\t%0.f",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner, tbDungeon.nDungeonId);
		return
	end
	
	if (tbDungeon:GetOwner() ~= strOwner) then
		tbDungeonLog:WriteLog("%s\t[ERROR]Close Dungeon Failed Dungeon Owner Mismatched\t%0.f\t%0.f\t%s\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner, tbDungeon:GetOwner());
		return
	end
	
	if (bSaved == 1) then
		tbDungeonLog:WriteLog("%s\t[ERROR]Close Saved Dungeon Failed\t%0.f\t%0.f\t%s\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner, tbDungeon:GetOwner());
		return
	end
	
	self.tbOwner2Dungeon[nTemplateId][strOwner] = nil;
	self.tbRunningDungeonList[nTemplateId][nDungeonId] = nil;
	
	tbDungeonLog:WriteLog("%s\tClose Dungeon Success\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner);

	return 1;
end

function tbDDManager:DungeonBreath(nTemplateId,nDungeonId,strOwner)
	local tbDungeon,_ = self:FindDungeon(nTemplateId,strOwner);
	if (tbDungeon == nil or tbDungeon:GetOwner() ~= strOwner) then
		tbDungeonLog:WriteLog("%s\t[ERROR]Dungeon Breath Failed Not Find Dungeon\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner);
		return
	end
	
	local tbDungeonInfo = self.tbOwner2Dungeon[nTemplateId][strOwner];
	if (tbDungeonInfo.bSaved == 1) then
		-- 将其移动至Running列表
		local nOldId = tbDungeonInfo.nDungeonId;
		self.tbSavedDungeonList[nTemplateId][nOldId] = nil;
		self.tbRunningDungeonList[nTemplateId][nDungeonId] = tbDungeon;
		tbDungeonInfo.nDungeonId = nDungeonId;
		tbDungeon.nSaveId = 0;
	end
	
	--tbDungeonLog:WriteLog("%s\tDungeon Breath\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"),nDungeonId, nTemplateId, strOwner);
	tbDungeon:UpdateBreathTime();
end

function tbDDManager:Breath()
	tbDungeonLog:WriteLog("%s\tDungeon Manager Breath",date("%Y-%m-%d %H:%M:%S"));
	--遍历正在运行的副本
	for nTemplateId,tbDungeonList in self.tbRunningDungeonList do
		if(nTemplateId ~= "n" and type(tbDungeonList) == "table") then
			for nDungeonId, tbDungeon in tbDungeonList do
				if (nDungeonId ~= "n" and tbDungeon:CheckAlive() ~= 1) then
					--将其移动至saved表
					local nNewId = getn(self.tbSavedDungeonList[nTemplateId]) + 1;
					local strOwner = tbDungeon:GetOwner();
					self.tbSavedDungeonList[nTemplateId][nNewId] = tbDungeon;
					self.tbOwner2Dungeon[nTemplateId][strOwner] = {} 
					self.tbOwner2Dungeon[nTemplateId][strOwner].bSaved = 1;
					self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId = nNewId;
					self.tbRunningDungeonList[nTemplateId][nDungeonId] = nil;
					tbDungeon.nSaveId = nNewId;
					tbDungeon.nDungeonId = 0;
					
					tbDungeonLog:WriteLog("%s\tDungeon Moved To SaveList\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner);
				end
			end --for nDungeonId, tbDungeon in tbDungeonList do
		end --if(nTemplateId ~= "n" and type(tbDungeonList) == "table") then
	end --for nTemplateId,tbDungeonList in self.tbRunningDungeonList do
	
	--清空存档数据
	ClearRecordOnShareDB("DUNGEON_DATA");
	
	local nSavingIndex = 1;
	-- 将所有副本存盘
	for nTemplateId,tbDungeonList in self.tbSavedDungeonList do
		if(nTemplateId ~= "n" and type(tbDungeonList) == "table") then
			for nDungeonId, tbDungeon in tbDungeonList do
				if (nDungeonId ~= "n") then
					tbDungeon.nSaveId = nSavingIndex;
					if (tbDungeon:Save() == 1) then
						nSavingIndex = nSavingIndex + 1;
					end
				end
			end
		end
	end
	
	for nTemplateId,tbDungeonList in self.tbRunningDungeonList do
		if(nTemplateId ~= "n" and type(tbDungeonList) == "table") then
			for nDungeonId, tbDungeon in tbDungeonList do
				if (nDungeonId ~= "n") then
					tbDungeon.nSaveId = nSavingIndex;
					if (tbDungeon:Save() == 1) then
						nSavingIndex = nSavingIndex + 1;
					end
				end
			end
		end
	end
	tbDungeonLog:WriteLog("%s\tDungeon Manager Breath End",date("%Y-%m-%d %H:%M:%S"));
end

function tbDDManager:CallFun(nTemplateId,nDungeonId,strOwner,strFun,varValue, nGSId)
	local tbDungeon,bSaved = tbDDManager:FindDungeon(nTemplateId,strOwner);
	if (tbDungeon == nil or bSaved == 1 or tbDungeon.nDungeonId ~= nDungeonId or 
		tbDungeon:GetOwner() ~= strOwner or type(tbDungeon[strFun]) ~= "function") then
		tbDungeonLog:WriteLog("%s\t[ERROR]Dungeon Call Fun Illegal\t%0.f\t%0.f\t%s\t%s\t%s",date("%Y-%m-%d %H:%M:%S"), nDungeonId, nTemplateId, strOwner, strFun, tostring(varValue));
		return
	end
	
	return tbDungeon[strFun](tbDungeon,varValue);
end

function tbDDManager:RegTemplate(nTemplateId, tbTemplate)
	self.tbDungeonTempletList[nTemplateId] =  tbTemplate;
	tbTemplate.nTemplateId = nTemplateId;
	tbDungeonLog:WriteLog("%s\tRegister Dungeon template\t%0.f",date("%Y-%m-%d %H:%M:%S"), nTemplateId);
end

function tbDDManager:FindDungeon(nTemplateId,strOwner, nGSId)
	if (type(self.tbOwner2Dungeon[nTemplateId]) ~= "table") then
		self.tbOwner2Dungeon[nTemplateId] = {};
		return
	end
	
	if (type(self.tbOwner2Dungeon[nTemplateId][strOwner]) ~= "table" or 
		type(self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId) ~= "number" or
		type(self.tbOwner2Dungeon[nTemplateId][strOwner].nDungeonId) == 0 ) then
		self.tbOwner2Dungeon[nTemplateId][strOwner] = nil;
		return
	end
	
	local tbDungeonInfo = self.tbOwner2Dungeon[nTemplateId][strOwner];
	local tbDungeonList = nil;
	local szDungeonType = "Running";
	
	if (tbDungeonInfo.bSaved == 1) then
		-- 在上次存档的副本中
		tbDungeonList = self.tbSavedDungeonList;
		szDungeonType = "Saved"
	else
		--在当前运行的副本中
		tbDungeonList = self.tbRunningDungeonList;
	end
	
	if (type(tbDungeonList[nTemplateId]) ~= "table") then
		tbDungeonLog:WriteLog("%s\t[ERROR]%s Dungeon Data Lost\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), szDungeonType, tbDungeonInfo.nDungeonId, nTemplateId, strOwner);
		tbDungeonList[nTemplateId] = {}
		self.tbOwner2Dungeon[nTemplateId][strOwner] = nil;
		return
	end
	
	if (type(tbDungeonList[nTemplateId][tbDungeonInfo.nDungeonId]) ~= "table") then
		tbDungeonLog:WriteLog("%s\t[ERROR]%s Dungeon Data Lost\t%0.f\t%0.f\t%s",date("%Y-%m-%d %H:%M:%S"), szDungeonType, tbDungeonInfo.nDungeonId, nTemplateId, strOwner);
		self.tbOwner2Dungeon[nTemplateId][strOwner] = nil;
		return
	end
	
	return tbDungeonList[nTemplateId][tbDungeonInfo.nDungeonId], tbDungeonInfo.bSaved;
end
