Include("\\script\\task\\150skilltask\\taskdetail.lua")
Include("\\script\\missions\\basemission\\lib.lua")

TASK_CURSTEP = 2885
TaskClass = {}

function TaskClass:Init()
	self.szClassName = "TaskClass"
	self.m_szTaskName = ""
	self.m_nTaskId = 0
	self.m_tbDetailSet = {}
end

function TaskClass:New()
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	tb:Init()
	return tb
end

function TaskClass:AddStep(nAddValue, nTaskId, nBase)
	local nTaskValue = GetTask(nTaskId)
	SetTask(nTaskId, nTaskValue+nAddValue*nBase)
	SyncTaskValue(nTaskId)
	Msg2Player("<color=yellow>NhiÖm vô hoµn thµnh <color>")
end

function TaskClass:LoadConfig(tbTask, g_Task)
	local tb = self:New()
	for key, value in tbTask do 
		if key ~= "tbConfig" and key ~= "tbMissionDialog" then
			tb[key] = value 
		end
	end
	for i = 0, getn(tbTask.tbConfig) do
		local tbTaskDetail = TaskDetailClass:New(tb)
		tbTaskDetail:LoadConfig(tbTask.tbConfig[i], tb, i)
	end
	tb.tbMissionDialog = {}
	for i = 0, getn(tbTask.tbMissionDialog) do
		local tbTmpDialong = {}
		for j = 1, getn(tbTask.tbMissionDialog[i]) do
			tbTmpDialong[j] = tbTask.tbMissionDialog[i][j]
		end
		tb.tbMissionDialog[i] = tbTmpDialong
	end
	local tbNpcPos = tbTask.tbConfig.tbNpcPos
	if tbNpcPos ~= nil then
		for i = 1, getn(tbNpcPos) do
			basemission_CallNpc(tbNpcPos[i])
		end
	end
	g_Task:RegisterMessage(tb)
end

function TaskClass:GotoDetail(nDetailId, tbParam)
	if self.m_tbDetailSet[nDetailId] then
		self.m_tbDetailSet[nDetailId]:OnMessage(tbParam)
	else
		print(format("Warrning nDetailId %d is nil", nDetailId) )
	end
end

function TaskClass:GetTaskValue(nTaskId)
	local nTaskValue = GetTask(nTaskId)
	return nTaskValue
end

function TaskClass:OnMessage(tbParam)
	local nTaskStepId = floor(self:GetTaskValue(TASK_CURSTEP) / self.m_nBase)
	local nCurDetailId = -1
	for i = 0, getn(self.m_tbDetailSet) do 
		local nTmpStepId = self.m_tbDetailSet[i].m_nCurStepId
		if  nTmpStepId ~= nil and nTmpStepId == nTaskStepId then
			nCurDetailId = i
			local tbTaskDetail = self.m_tbDetailSet[nCurDetailId]
			if tbTaskDetail ~= nil then
				tbTaskDetail:OnMessage(tbParam)
			else
				print("NhiÖm vô gi¸n ®o¹n, kh«ng hoµn thµnh liªn tôc")
			end
		end
	end
end

function TaskClass:UnRegisterMessage(nDetailId)
	if nDetailId == nil or nDetailId < 0 then
		return
	end
	if self.m_tbDetailSet[nDetailId] ~= nil then
		self.m_tbDetailSet[nDetailId] = nil
	end
end

function TaskClass:RegisterMessage(tbDetail, nDetailId)
	if tbDetail == nil then
		return
	end
	self:UnRegisterMessage(nDetailId)
	self.m_tbDetailSet[nDetailId] = tbDetail
end
