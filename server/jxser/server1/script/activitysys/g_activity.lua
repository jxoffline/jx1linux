
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\activitysys\\activity.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\ladderfunlib.lua")


G_ACTIVITY = {}



G_ACTIVITY.tbSet = nil
G_ACTIVITY.FunSet = {}
G_ACTIVITY.tbTemp = {}
G_ACTIVITY.tbItemScript = {}


function G_ACTIVITY:DebugMsg(...)
	if self.bDebug then
		call(print, arg)
	end
end

function G_ACTIVITY:LoadActivitys()
	
	
	for i=1, getn(self.tbSet) do
		local value = self.tbSet[i]
		value:LoadConfig(value.tbConfig, self)
	end
end


function G_ACTIVITY:OnMessage(szKey, ...)
	self:DebugMsg("G_ACTIVITY:OnMessage",szKey, arg)
	if self.FunSet[szKey] then
		for varId, pData in self.FunSet[szKey] do
			if pData and pData:CheckDate() then
			
				pData:OnMessage(arg, szKey)	
			elseif pData:IsExpired() then
				self.FunSet[szKey][varId] = nil
			end
		end
	end
end

function G_ACTIVITY:RegisteMessage(szKey, varId, pData)
	if szKey and szKey ~= "nil"then
		self.FunSet[szKey] = self.FunSet[szKey] or {}
		self.FunSet[szKey][varId] = pData
	end	
end

function G_ACTIVITY:UnRegisteMessage(szKey, varId)
	if szKey and szKey ~= "nil" and  self.FunSet[szKey] ~= nil then
		self.FunSet[szKey][varId] = nil
	end	
end


function G_ACTIVITY:RegisteItemScript(tbItem, pData)
	
	
	local tbDefProp = tbItem.tbProp
	
	local varKey = format("%d,%d,%d", tbDefProp[1],tbDefProp[2], tbDefProp[3])
	local varId = format("%d,%d,%d", tbDefProp[4],tbDefProp[5], tbDefProp[6])
	
	self.tbItemScript[varKey] = self.tbItemScript[varKey] or {}
	self.tbItemScript[varKey][varId] = pData
	
	
end

function G_ACTIVITY:UnRegisteItemScript(tbItem)
	
	
	local tbDefProp = tbItem.tbProp
	
	local varKey = format("%d,%d,%d", tbDefProp[1],tbDefProp[2], tbDefProp[3])
	local varId = format("%d,%d,%d", tbDefProp[4],tbDefProp[5], tbDefProp[6])
	
	if self.tbItemScript[varKey] then
		self.tbItemScript[varKey][varId] = nil
	end
end


function G_ACTIVITY:GetItemScript(tbItem)
	local tbProp = tbItem.tbProp
	local varKey = format("%d,%d,%d", tbProp[1], tbProp[2], tbProp[3])
	
	if self.tbItemScript[varKey] then
		
		for varId, pData in self.tbItemScript[varKey] do
			if pData:MatchItem(tbItem) then
				return pData
			end
		end
	end
end


function G_ACTIVITY:RegisteActivityDetailConfig(nActivityId, tbDetailConfig)
	if nActivityId <= 0 then
		return
	end
	
	self.tbTemp[nActivityId] = tbDetailConfig
end


function G_ACTIVITY:AddActivity(pActivity)
	self.tbSet = self.tbSet or {}
	
	tinsert(self.tbSet, pActivity)
end
