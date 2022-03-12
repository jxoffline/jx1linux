Include("\\script\\mission\\dungeon\\dungeonlog.lua");
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\objbuffer_head.lua")

if not tbDungeonData then
	tbDungeonData = tbBaseClass:new()
	tbDungeonData.BREATH_TIME_THRESHOLD = 5*60; --10分钟
	tbDungeonData.szShareKey = "DUNGEON_DATA";
	tbDungeonData.nTemplateId = 0;
	tbDungeonData.nDungeonId = 0;
	tbDungeonData.nSaveId = 0;
	tbDungeonData.nBreathTime = 0;
	tbDungeonData.tbData = {};
end

function tbDungeonData:_Initialize(nTemplateId, nDungeonId, nSaveId)
	self.nTemplateId = nTemplateId;
	self.nDungeonId = nDungeonId;
	self.nSaveId = nSaveId;
end

function tbDungeonData:Load()
	if (self.nTemplateId == 0 or self.nSaveId == 0) then
		return
	end
	
	local handle = OB_Create()
	local nRet = OB_LoadShareData(handle, self.szShareKey, self.nTemplateId, self.nSaveId);

	if nRet ~= 1 then
		tbDungeonLog:WriteLog("%s\t[ERROR]Load Dungeon Failed\t%0.f\t%0.f\t%0.f",date("%Y-%m-%d %H:%M:%S"), self.nSaveId, self.nDungeonId, self.nTemplateId);
		OB_Release(handle);
		return
	end
	
	self.tbData =  ObjBuffer:PopObject(handle);	
	OB_Release(handle);
	tbDungeonLog:WriteLog("%s\tLoad Dungeon Success\t%0.f\t%0.f\t%0.f",date("%Y-%m-%d %H:%M:%S"), self.nSaveId, self.nDungeonId, self.nTemplateId);
	if (type(self.tbData) == "table") then
		for data_key,data_value in self.tbData do
			tbDungeonLog:WriteLog("%s\t%s",tostring(data_key), tostring(data_value));
		end
	end

	return 1;
end

function tbDungeonData:Save()
	if (self.nTemplateId == 0 or self.nSaveId == 0 or self.tbData == nil) then
		return
	end
	
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, self.tbData);
	local nRet = OB_SaveShareData(handle, self.szShareKey, self.nTemplateId, self.nSaveId);
	if nRet ~= 1 then
		tbDungeonLog:WriteLog("%s\t[ERROR]Save Dungeon Failed\t%0.f\t%0.f\t%0.f",date("%Y-%m-%d %H:%M:%S"), self.nSaveId, self.nDungeonId, self.nTemplateId);
		OB_Release(handle);
		return
	end
	OB_Release(handle);
	tbDungeonLog:WriteLog("%s\tSave Dungeon Success\t%0.f\t%0.f\t%0.f",date("%Y-%m-%d %H:%M:%S"), self.nSaveId, self.nDungeonId, self.nTemplateId);
	if (type(self.tbData) == "table") then
		for data_key,data_value in self.tbData do
			tbDungeonLog:WriteLog("%s\t%s",tostring(data_key), tostring(data_value));
		end
	end
	return 1;
end

function tbDungeonData:SetData(varKey, verValue)
	if (varKey == nil) then
		return
	end
	
	if(type(self.tbData) ~= "table") then
		self.tbData = {};
	end
	
	self.tbData[varKey] = verValue;
	
	return 1;
end

function tbDungeonData:GetData(varKey)
	if (varKey == nil) then
		return
	end
	
	if(type(self.tbData) ~= "table") then
		self.tbData = {};
	end
	
	return self.tbData[varKey];
end

function tbDungeonData:GetOwner()
	return self:GetData("strDungeonOwner");
end

function tbDungeonData:SetOwner(strOwner)
	return self:SetData("strDungeonOwner", strOwner);
end

function tbDungeonData:GetEnterPos()
	return self:GetData("tbEnterPos");
end

function tbDungeonData:SetEnterPos(tbEnterPos)
	return self:SetData("tbEnterPos", tbEnterPos);
end

--强制更新时间
function tbDungeonData:UpdateBreathTime()
	self.nBreathTime = GetSysCurrentTime();
end

function tbDungeonData:CheckAlive()
	local nNow = GetSysCurrentTime();
	if ((nNow - self.nBreathTime) > self.BREATH_TIME_THRESHOLD) then
		return
	end
	return 1;
end
