Include("\\script\\lib\\pfunction.lua")

TaskDetailClass = {}
TaskDetailClass.PublicFunSet = {}
TaskDetailClass.PublicFunSet["Message"] = {}
TaskDetailClass.PublicFunSet["Condition"] = {}
TaskDetailClass.PublicFunSet["Action"] = {}

function TaskDetailClass:Init(pTask)
	self.szClassName = "TaskDetailClass"
	self.m_nCurStepId = 0
	self.m_nNextStepId = 0
	self.m_tbTargetPos = {}
	self.tbMessage = {}
	self.tbCondition = {}
	self.tbAction = {}
	self.pTask = pTask
end

function TaskDetailClass:New(pTask)
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	tb:Init(pTask)
	return tb
end

function TaskDetailClass:NewFun(szFunName, szKindName)
	if self.PublicFunSet[szKindName] == nil then
		self.PublicFunSet[szKindName] = {}
	end
	if self.PublicFunSet[szKindName][szFunName] == nil then
		local tb = FunctionClass:new(szFunName)
		self.PublicFunSet[szKindName][szFunName] = tb
	end
	return self.PublicFunSet[szKindName][szFunName]
end

function TaskDetailClass:CreateFun(szFunName, szKindName, pTask, tbParam)
	local tbTemplate = self.PublicFunSet[szKindName][szFunName] or self
	local tb = tbTemplate:new(szFunName, tbParam)
	tb.pTask = pTask
	return tb
end

function TaskDetailClass:CallFunction(tbFun, ...)
	if tbFun.szClassName == "ThisTask" then
		tbFun.Class = self.pTask
		tbFun.fn = self.pTask[tbFun.szName]
	else
		print("Ch­a biÕt hµm sè", tbFun.szClassName, tbFun.szName)
		return
	end
	return tbFun:exec(arg)
end


function TaskDetailClass:GetParam(tbParamSelf, tbParamEx)
	local tbParam = {}
	if tbParamSelf ~= nil then
		for i = 1, getn(tbParamSelf) do
			tinsert(tbParam, tbParamSelf[i])
		end
	end
	if tbParamEx ~= nil then
		for i = 1, getn(tbParamEx) do
			tinsert(tbParam, tbParamEx[i])
		end
	end
	return tbParam
end

function TaskDetailClass:CheckCondition(tbParam)
	for i = 1, getn(self.tbCondition) do
		local tbCondition = self.PublicFunSet["Condition"][self.tbCondition[i].szName]
		if tbCondition ~= nil then
			local tbAllParam = self:GetParam(self.tbCondition[i].tbParam, tbParam)
			if self.tbCondition[i]:Exec(tbAllParam) ~= 1 then
				return
			end
		elseif self:CallFunction(self.tbCondition[i], tbParam) ~= 1 then
			return
		end
	end
	return 1
end

function TaskDetailClass:ExecAction(tbParam)
	for i = 1, getn(self.tbAction) do
		local tbAction = self.PublicFunSet["Action"][self.tbAction[i].szName]
		if tbAction ~= nil then
			local tbAllParam = self:GetParam(self.tbAction[i].tbParam, tbParam)
			self.tbAction[i]:Exec(tbAllParam)
		else
			self:CallFunction(self.tbAction[i], tbParam)
		end
	end
end

function TaskDetailClass:OnMessage(tbParam)
	local nFlag = 0
	for i = 1, getn(self.tbMessage) do
		local tbMessage = self.PublicFunSet["Message"][self.tbMessage[i].szName]
		if tbMessage ~= nil then
			local tbAllParam = self:GetParam(self.tbMessage[i].tbParam, tbParam)
			if self.tbMessage[i]:Exec(tbAllParam) == 1 then
				nFlag = 1
				break
			end
		elseif self:CallFunction(self.tbMessage[i], tbParam) == 1 then
			nFlag = 1
			break
		end
	end	
	
	if nFlag == 0 and getn(self.tbMessage) > 0 then
		return
	end
	
	if self:CheckCondition(tbParam) == 1 then		
		self:ExecAction(tbParam)	
	end
end

function TaskDetailClass:LoadConfig(tbDetail, tbTask, nDetailId)
	self.m_nCurStepId = tbDetail.m_nCurStepId
	for i=1, getn(tbDetail.tbMessage) do
		local tb = tbDetail.tbMessage[i]
		if tb then
			if self.PublicFunSet["Message"][tb[1]] ~= nil then
				local tbMessage = self:CreateFun(tb[1], "Message", tbTask, tb[2])
				tinsert(self.tbMessage, tbMessage)
			else
				local tfn = FunctionClass:new(tb[1], tb[2])
				tinsert(self.tbMessage, tfn)
			end
		end
	end
	for i=1, getn(tbDetail.tbCondition) do
		local tb = tbDetail.tbCondition[i]
		if tb then
			if self.PublicFunSet["Condition"][tb[1]] ~= nil then
				local tbCondition = self:CreateFun(tb[1], "Condition", tbTask, tb[2])
				tinsert(self.tbCondition, tbCondition)
			else
				local tfn = FunctionClass:new(tb[1], tb[2])
				tinsert(self.tbCondition, tfn)
			end
		end
	end
	for i=1, getn(tbDetail.tbAction) do
		local tb = tbDetail.tbAction[i]
		if tb then
			if self.PublicFunSet["Action"][tb[1]] ~= nil then
				local tbAction = self:CreateFun(tb[1], "Action", tbTask, tb[2])
				tinsert(self.tbAction, tbAction)
			else
				local tfn = FunctionClass:new(tb[1], tb[2])
				tinsert(self.tbAction, tfn)
			end
		end
	end
	tbTask:RegisterMessage(self, nDetailId)
end