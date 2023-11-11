Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\lib\\baseclass.lua")
IncludeLib("FILESYS")
IncludeLib("TASKSYS")

tbDailyTask = tbBaseClass:new()
tbDailyTask.TSK_DAILY_TASK_COMPLETE_STATE = 0;
tbDailyTask.nStateBit = 0;
tbDailyTask.szConfigPath = nil;
tbDailyTask.szTaskName = "unknown";
tbDailyTask.tbTaskList = {}

function tbDailyTask:_init()
	if (self.szConfigPath ==  nil) then
		return 1;
	end
	
	if type(self.szConfigPath) == "string" then
		if TabFile_Load(self.szConfigPath, self.szConfigPath) == 0 then
			print(format("%s Task Load Config %s failed", self.szTaskName, self.szConfigPath));
			WriteLog(format("%s Task Load Config %s failed", self.szTaskName, self.szConfigPath));
			return nil;
		end
	elseif type(self.szConfigPath) == "table" then
		for i=1,getn(self.szConfigPath) do
			if TabFile_Load(self.szConfigPath[i], self.szConfigPath[i]) == 0 then
				print(format("%s Task Load Config %s failed", self.szTaskName, self.szConfigPath[i]));
				WriteLog(format("%s Task Load Config %s failed", self.szTaskName, self.szConfigPath[i]));
				return nil;
			end
		end
	end
	
	return self:LoadDataFromConfig();
end

function tbDailyTask:_CheckCanAccept()
	if (self.TSK_DAILY_TASK_COMPLETE_STATE == nil or self.TSK_DAILY_TASK_COMPLETE_STATE == 0 or
		self.nStateBit == nil or self.nStateBit <= 0 or self.nStateBit > 32) then
		return nil;
	end
	
	local nAllState = PlayerFunLib:GetTaskDailyCount(self.TSK_DAILY_TASK_COMPLETE_STATE);
	local nMyState = GetBit(nAllState, self.nStateBit);
	
	if (nMyState == 0) then
		return 1;
	end
	
	return nil;
end

function tbDailyTask:GetTaskData(nID)
	return self.tbTaskList[nID];
end

function tbDailyTask:_CompleteTask()
	if (self.TSK_DAILY_TASK_COMPLETE_STATE == nil or self.TSK_DAILY_TASK_COMPLETE_STATE == 0 or
		self.nStateBit == nil or self.nStateBit <= 0 or self.nStateBit > 32) then
		return nil;
	end
	
	local nAllState = PlayerFunLib:GetTaskDailyCount(self.TSK_DAILY_TASK_COMPLETE_STATE);
	nAllState = SetBit(nAllState, self.nStateBit, 1);
	PlayerFunLib:SetTaskDaily(self.TSK_DAILY_TASK_COMPLETE_STATE, nAllState)
	return 1;
end


-- 以下函数需要重载
function tbDailyTask:Init()
	return self:_init();
end

function tbDailyTask:LoadDataFromConfig()
	print(format("%s Task Load Data From Config %s failed", self.szTaskName, self.szConfigPath));
	WriteLog(format("%s Task Load Data From Config %s failed", self.szTaskName, self.szConfigPath));
	return nil;
end

function tbDailyTask:CheckCanAccept()
	return self:_CheckCanAccept();
end

function tbDailyTask:AcceptTask()
	return self:CheckCanAccept();
end

function tbDailyTask:IsHaveTask()
	return nil;
end

function tbDailyTask:IsHaveTask()
	return nil;
end

function tbDailyTask:CancelTask()
	return nil;
end

function tbDailyTask:CheckCompleteTask()
	return nil;
end

function tbDailyTask:CompleteTask()
	return self:_CompleteTask();
end
