Include("\\script\\lib\\pfunction.lua")
Include("\\script\\lib\\composeex.lua")
--Include VNG lib - Modified by DinhHQ - 20110816
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\objbuffer_head.lua")

ActivityDetailClass = {}

ActivityDetailClass.tbTemplate = {}

function ActivityDetailClass:_init(pActivity)
	self.nId = 0;
	self.nStartDate = nil
	self.nEndDate = nil
	self.szName = ""
	self.szType = nil
	self.tbParam = {}
	self.tbCondition = {}
	self.tbAction = {}
	self.pActivity = pActivity	
end

function ActivityDetailClass:new()
	local tb = {}
	for key, value in self do
		if type(value) == "function" then
			tb[key] = value
		end
	end
	return tb
end

function ActivityDetailClass:NewType(szType)	
	if not self.tbTemplate[szType] then
		local tb = self:new()
		tb.szType = szType
		self.tbTemplate[szType] = tb
	end
	return self.tbTemplate[szType]
end

function ActivityDetailClass:Create(szType, pActivity)
	local tbTemplate = self.tbTemplate[szType] or self
	
	local tb = tbTemplate:new()
	tb.szType = szType
	tb:_init(pActivity)
	return tb
end

function ActivityDetailClass:CheckDate()
	
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
		return nil
	end
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		return nil
	end
	return 1
end

function ActivityDetailClass:IsExpired()
	
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		return 1
	end
end


local _pack_ = function(...) return arg end

function ActivityDetailClass:CallFunction(tfn, ...)
	local nPlayerIndex = PlayerIndex
	if tfn.szClassName == "ThisActivity" then
		tfn.Class = self.pActivity
		tfn.fn = self.pActivity[tfn.szName]
	else
		local nPak = curpack()
		if self.pActivity and self.pActivity.nPak then
			nPak = usepack(self.pActivity.nPak)
		end
		tfn:GetGlobal()
		if self.pActivity and self.pActivity.nPak then
			usepack(nPak)
		end
	end
	
	if tfn.szName == "DynamicExecute" then
		return tfn:exec({PlayerIndex})
	else
		if tfn.szName == "dostring" then
			return tfn:exec()
		else
			local nPak = curpack()
			if self.pActivity and self.pActivity.nPak then
				nPak = usepack(self.pActivity.nPak)
			end
			
			local tbRet = {}
			if nPlayerIndex then
				tbRet = %_pack_(CallPlayerFunction(nPlayerIndex, tfn.exec, tfn, arg))
			else
				tbRet = %_pack_(tfn:exec(arg))
			end
				
			if self.pActivity and self.pActivity.nPak then
				usepack(nPak)
			end
			return unpack(tbRet)
		end
	end
	
	
end

function ActivityDetailClass:LoadConfig(Config, nActivityId, gActivity)
	
	self.nId = Config.nId
	self.nActivityId = nActivityId
	
	self.szName = Config.szName
	self.nStartDate = Config.nStartDate
	self.nEndDate = Config.nEndDate
	
	self.szType = Config.szMessageType
	self.tbParam = Config.tbMessageParam

	self.tbCondition = {}
	self.tbAction = {}
	--载入条件
	for i=1, getn(Config.tbCondition) do
		local tb = Config.tbCondition[i]
		
		if tb then
			local tfn = FunctionClass:new(tb[1], tb[2])
			tinsert(self.tbCondition, tfn)
		end
	end
	--载入动作
	for i=1, getn(Config.tbActition) do
		local tb = Config.tbActition[i]
		if tb then
			local tfn = FunctionClass:new(tb[1], tb[2])
			tinsert(self.tbAction, tfn)
		end
	end
	
	self:Init()
	self:RegisteMessage(gActivity)
	
end

function ActivityDetailClass:Init()
	return 1
end

function ActivityDetailClass:RegisteMessage(gActivity)
	
	if self.szType and self.szType ~= "nil"then

		self.pActivity:RegisteMessage(self.szType, self, gActivity)
	end
end




function ActivityDetailClass:OnMessage(tbParam)
	
	if self:CheckDate() then
		for i=1, getn(self.tbCondition) do
			if not self:CallFunction(self.tbCondition[i], unpack(tbParam)) then
				return 
			end
		end
		for i=1, getn(self.tbAction) do
			self:CallFunction(self.tbAction[i], unpack(tbParam))
		end
	end
end
