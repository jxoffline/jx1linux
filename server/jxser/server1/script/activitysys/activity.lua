

Include("\\script\\activitysys\\activitydetail.lua")

Include("\\script\\misc\\taskmanager.lua")

ActivityClass = {}


function ActivityClass:_init()
	self.szName = ""	
	self.nStartDate = nil
	self.nEndDate = nil

	self.tbDetailSet = {}
	self.nId = 0
	
	self.tbClickNpcMessage = {}
	self.tbMessage = {}
end

function ActivityClass:new()
	local tb = {}
	for key, value in self do
		if type(value) == "function" then
			tb[key] = value
		end
	end
	tb:_init()
	return tb
end

function ActivityClass:CheckDate()
	
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate and self.nStartDate ~= 0 and self.nStartDate > nCurDate then
		return nil
	end
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		return nil
	end
	return 1
end

function ActivityClass:IsExpired()
	
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nEndDate and self.nEndDate ~= 0 and self.nEndDate <= nCurDate then
		return 1
	end
end


function ActivityClass:ExecActivityDetail(nDetailId)
	

	if not self.tbDetailSet[nDetailId] then
		print(format("Warrning nDetailId %d is nil", nDetailId) )
		WriteLog(format("Warrning nDetailId %d is nil", nDetailId))
		return
	end
	return self:GotoDetail(nDetailId, {})
end

--加载配置脚本，
function ActivityClass:LoadConfig(tbDetailConfigList, gActivity)
	self.tbDetailSet = {}
	
	for i = 1, getn(tbDetailConfigList) do
		local Config = tbDetailConfigList[i]
		if Config.szMessageType ~= "ItemScript" then
			Config.nStartDate = Config.nStartDate or self.nStartDate
			Config.nEndDate = Config.nEndDate or self.nEndDate
		end
		if not self.tbDetailSet[i] then
			local tbDetail = ActivityDetailClass:Create(Config.szMessageType, self)
			tbDetail:LoadConfig(Config, self.nId, gActivity)
			self.tbDetailSet[i] = tbDetail			
		else
			self.tbDetailSet[i]:LoadConfig(Config, self.szName, gActivity)
		end
	end
	
end
function ActivityClass:InitTaskGroup()
	if self.nGroupId then
		self.TaskGroup = TaskManager:Create(self.nGroupId, self.nVersion)
	end
end

--读取活动基本信息
function ActivityClass:Load(szPath, nRow, gActivity)
	if TabFile_Load(szPath, szPath) == 0 then
		WriteLog(format("Load %s is fail", szPath))
		return 0;
	end
	self.szName	= TabFile_GetCell(szPath, nRow, "Name")
	self.nId = tonumber(TabFile_GetCell(szPath, nRow, "Id"));
	self.nStartDate	= tonumber(TabFile_GetCell(szPath, nRow, "StartDate"))
	self.nEndDate	= tonumber(TabFile_GetCell(szPath, nRow, "EndDate"))
	self.szDescription = TabFile_GetCell(szPath, nRow, "Description")
	

	
	self.nGroupId = tonumber(TabFile_GetCell(szPath, nRow, "TaskGroup"))
	self.nVersion = tonumber(TabFile_GetCell(szPath, nRow, "TaskVersion"))
	
	self:InitTaskGroup()
	
end

function ActivityClass:GotoDetail(nDetailId, tbParam)

	if self.tbDetailSet[nDetailId] then
		self.tbDetailSet[nDetailId]:OnMessage(tbParam)
	else
		print(format("Warrning nDetailId %d is nil", nDetailId) )
		WriteLog(format("Warrning nDetailId %d is nil", nDetailId))
	end
end


function ActivityClass:OnMessage(tbParam, szType)
	local tbMessage = self.tbMessage[szType]
	
	if szType == "ClickNpc" then
		tbMessage = self.tbClickNpcMessage[tbParam[1].szNpcName]
	end

	if not tbMessage then
		return 
	end
	
	for varId, pData in tbMessage do
		if pData and pData:CheckDate() then
			pData:OnMessage(tbParam, szKey)	
		elseif pData:IsExpired() then
			tbMessage[varId] = nil
		end
		
	end
	
end

function ActivityClass:RegisteMessage(szType, pData, gActivity)
	local varId = pData.nId
	if szType == "ClickNpc" then
		local szNpcName = pData.tbParam[1]
		self.tbClickNpcMessage[szNpcName] = self.tbClickNpcMessage[szNpcName] or {}
		self.tbClickNpcMessage[szNpcName][varId] = pData
	else
		self.tbMessage[szType] = self.tbMessage[szType] or {}
		self.tbMessage[szType][varId] = pData
	end
	
	gActivity:RegisteMessage(szType, self.nId, self)
end

function ActivityClass:GetTask(nTaskIndex)
	return self.TaskGroup:GetTask(nTaskIndex);
end

function ActivityClass:GetTaskDaily(nTaskIndex)	
	local nTaskValue =  self.TaskGroup:GetTask(nTaskIndex)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self.TaskGroup:SetTask(nTaskIndex, nTaskValue)
	end
	return mod(nTaskValue, 256)
end

function ActivityClass:CheckTask(nTaskIndex, nValue, szFailMsg, szOption)
	
	
	nValue = lib:NumberParamTrans(nValue)
	
	if lib:OptionFunction(self.TaskGroup:GetTask(nTaskIndex), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
	
end

function ActivityClass:CheckTaskDaily(nTaskIndex, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)
	
	local nTaskValue =  self.TaskGroup:GetTask(nTaskIndex)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self.TaskGroup:SetTask(nTaskIndex, nTaskValue)
	end
	
	if lib:OptionFunction(mod(nTaskValue, 256), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
	
end

function ActivityClass:SetTask(nTaskIndex, nValue)
	nValue = lib:NumberParamTrans(nValue)
	self.TaskGroup:SetTask(nTaskIndex, nValue)
end

function ActivityClass:AddTask(nTaskIndex, nValue)
	nValue = lib:NumberParamTrans(nValue)
	self.TaskGroup:AddTask(nTaskIndex, nValue)
end


function ActivityClass:AddTaskDaily(nTaskIndex, nValue)
	nValue = lib:NumberParamTrans(nValue)
	
	local nTaskValue =  self.TaskGroup:GetTask(nTaskIndex)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self.TaskGroup:SetTask(nTaskIndex, nTaskValue)
	end
	
	self.TaskGroup:AddTask(nTaskIndex, nValue)	
end

function ActivityClass:SetTaskDaily(nTaskIndex, nValue)
	nValue = lib:NumberParamTrans(nValue)
	
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nTaskValue =  nCurDate * 256 + nValue
	
	self.TaskGroup:SetTask(nTaskIndex, nTaskValue)	
end

function ActivityClass:CheckTaskBit(nTaskIndex, nBitPos, nBitCount, nValue, szFailMsg, szOption)
	
	nValue = lib:NumberParamTrans(nValue)
	
	if lib:OptionFunction(self.TaskGroup:GetTaskBit(nTaskIndex, nBitPos, nBitCount), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end	
end

function ActivityClass:SetTaskBit(nTaskIndex, nBitPos, nBitCount, nValue)
	nValue = lib:NumberParamTrans(nValue)
	self.TaskGroup:SetTaskBit(nTaskIndex, nBitPos, nBitCount, nValue)
end
Include("\\script\\lib\\awardtemplet.lua")
function ActivityClass:GiveAward(szAwardName, nAwardCount, szLogTitle, szAction)
	
	if self.tbAward and self.tbAward[szAwardName] then
		nAwardCount = lib:NumberParamTrans(nAwardCount)
		szAction = szAction or ""
		tbAwardTemplet:Give(self.tbAward[szAwardName], nAwardCount, {szLogTitle, szAction})	
	end
end


