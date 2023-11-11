Include("\\script\\task\\150skilltask\\task.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\string.lua")
Include("\\script\\lib\\timerlist.lua")

G_TASK = {}
G_TASK.tbConfigSet = {}
G_TASK.tbTaskName = {}
G_TASK.tbTaskId = {}
G_TASK.tbTaskSet = {}

function G_TASK:Talk(szTaskName, nGotoDetailId, nAddStepNum, nValueTaskId, nStartId, nDialogId)
	local nTaskId = self.tbTaskId[szTaskName]
	local tbDialog = self.tbTaskSet[szTaskName][nTaskId].tbMissionDialog[nDialogId]
	local nDialogCount = getn(tbDialog)
	if nDialogCount == nStartId then
		Talk(1, format("#G_TASK:ExecEx('%s', %d, %d, %d)", szTaskName, nGotoDetailId, nAddStepNum, nValueTaskId), tbDialog[nStartId])
		return
	end
	local szCallBack = format("#G_TASK:Talk('%s', %d, %d, %d, %d, %d)", szTaskName, nGotoDetailId, nAddStepNum, nValueTaskId, nStartId+1, nDialogId)
	Talk(1, szCallBack, tbDialog[nStartId])
end

function G_TASK:LoadAllConfig()
	for i = 1, getn(self.tbConfigSet) do
		local tbTaskConfig = self.tbConfigSet[i]
		if tbTaskConfig ~= nil then
			local tbTask = TaskClass:New()
			tbTask:LoadConfig(tbTaskConfig, self)
		end
	end
end

function G_TASK:AddTask(pTaskData)
	local tbTask = pTaskData or {}
	tinsert(self.tbConfigSet, tbTask)
end

function G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskNumId)
	local nTaskId = self.tbTaskId[szTaskName]
	if nTaskId == nil then
		return
	end
	local tbTask = self.tbTaskSet[szTaskName][nTaskId] 
	if tbTask == nil then
		return
	end
	if nAddStepNum ~= nil and nAddStepNum >= 0 and nTaskNumId ~= nil and nTaskNumId >= 0 then
		tbTask:AddStep(nAddStepNum, nTaskNumId, tbTask.m_nBase)
	end
	if nGotoDetailId ~= nil and nGotoDetailId > 0 then
		tbTask:GotoDetail(nGotoDetailId)
	end
end

function G_TASK:OnMessage(szTaskName, ...)
	if szTaskName == nil then
		return
	end
	local nTaskId = self.tbTaskId[szTaskName] 
	if nTaskId == nil or self.tbTaskName[nTaskId] ~= szTaskName then
		return
	end
	if self.tbTaskSet[szTaskName] == nil or self.tbTaskSet[szTaskName][nTaskId] == nil then 
		return
	end
	local tbTask = self.tbTaskSet[szTaskName][nTaskId] 
	tbTask:OnMessage(arg)
end

function G_TASK:UnRegisterMessage(szTaskName, nTaskId)
	if szTaskName == nil or nTaskId == nil or nTaskId <= 0 then
		return
	end
	if self.tbTaskName[nTaskId] ~= nil then
		self.tbTaskName[nTaskId] = nil
	end
	if self.tbTaskId[szTaskName] ~= nil then
		self.tbTaskId[szTaskName] = nil
	end

	if self.tbTaskSet[szTaskName] ~= nil then
		if self.tbTaskSet[szTaskName][nTaskId] ~= nil then
			self.tbTaskSet[szTaskName][nTaskId] = nil
		end
		self.tbTaskSet[szTaskName] = nil
	end
end

function G_TASK:RegisterMessage(tbTask)
	if tbTask == nil then
		return
	end
	local szTaskName = tbTask.m_szTaskName
	local nTaskId = tbTask.m_nTaskId
	self:UnRegisterMessage(szTaskName, nTaskId)
	self.tbTaskName[nTaskId] = szTaskName
	self.tbTaskId[szTaskName] = nTaskId
	self.tbTaskSet[szTaskName] = {}
	self.tbTaskSet[szTaskName][nTaskId] = tbTask
end
