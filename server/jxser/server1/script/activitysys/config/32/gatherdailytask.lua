Include("\\script\\activitysys\\config\\32\\dailytask.lua")

tbGatherDailyTask = tbDailyTask:new()

tbGatherDailyTask.TSK_DAILY_TASK_COMPLETE_STATE = TSK_DAILY_TASK_COMPLETE_COUNT;
tbGatherDailyTask.nStateBit = 2;
tbGatherDailyTask.szConfigPath = {"\\settings\\task\\dailytask\\gather.txt" ,"\\settings\\task\\dailytask\\gather_pos.txt"};
tbGatherDailyTask.szTaskName = "NhiÖm vô thu thËp";
tbGatherDailyTask.tbObjPos = {}
tbGatherDailyTask.TSK_GATHER_TASK_ID = TSK_GATHER_TASK_ID;

function tbGatherDailyTask:Init()
	local nRet = self:_init();
	if not nRet then
		return nil;
	end
	
	nRet = self:AddGatherObj();
	
	return nRet;
end

function tbGatherDailyTask:AddGatherObj()
	for i=1,getn(self.tbObjPos) do
		local tbPos = self.tbObjPos[i];
		local nNpcIdx = AddNpc(tbPos.nNpcRes, 1, SubWorldID2Idx(tbPos.nMapId), tbPos.nX * 32, tbPos.nY * 32, 0, tbPos.szObjName);
		if (nNpcIdx ~= nil and nNpcIdx > 0) then
			SetNpcScript(nNpcIdx, tbPos.szNpcScript);
			SetNpcParam(nNpcIdx, 1, tbPos.nTaskId);
		end
	end
	return 1;
end

function tbGatherDailyTask:LoadDataFromConfig()
	local nTotalRow = TabFile_GetRowCount(self.szConfigPath[1])
	self.tbTaskList = {}
	for nRow = 2, nTotalRow do
		local tbTask = {}
		tbTask.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "TaskId"));
		tbTask.szTaskName = TabFile_GetCell(self.szConfigPath[1], nRow, "TaskName");		
		tbTask.nMapId = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "MapId"));
		tbTask.szMapName = TabFile_GetCell(self.szConfigPath[1], nRow, "MapName");
		tbTask.szGatherName = TabFile_GetCell(self.szConfigPath[1], nRow, "GatherName");
		tbTask.tbItem = {TabFile_GetCell(self.szConfigPath[1], nRow, "G"), TabFile_GetCell(self.szConfigPath[1], nRow, "D"), TabFile_GetCell(self.szConfigPath[1], nRow, "P")};
		tbTask.nGatherCount = tonumber(TabFile_GetCell(self.szConfigPath[1], nRow, "GatherCount"));
		tinsert(self.tbTaskList, tbTask)
	end
	
	nTotalRow = TabFile_GetRowCount(self.szConfigPath[2])
	self.tbObjPos = {}
	for nRow = 2, nTotalRow do
		local tbPos = {}	
		tbPos.nMapId = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "MapId"));
		tbPos.nX = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "X"));
		tbPos.nY = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "Y"));
		tbPos.nNpcRes = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "NpcRes"));
		tbPos.szObjName = TabFile_GetCell(self.szConfigPath[2], nRow, "NpcName");
		tbPos.szNpcScript = TabFile_GetCell(self.szConfigPath[2], nRow, "NpcScript");
		tbPos.nTaskId = tonumber(TabFile_GetCell(self.szConfigPath[2], nRow, "TaskId"));
		tinsert(self.tbObjPos, tbPos)
	end
	return 1;
end

function tbGatherDailyTask:CheckCanAccept()
	if (self:_CheckCanAccept() ~= 1) then
		Talk(1,"",format("Ta ®· tÆng hoa cho s­ b¸ råi, c¸m ¬n %s ng­¬i ®· gióp ®ì.",GetSex() == 1 and "ChÞ " or "Ca Ca"))
		return nil;
	end
	return 1;
end

function tbGatherDailyTask:AcceptTask()
	if (self:CheckCanAccept() ~= 1) then
		return nil;
	end
	
	if (self:IsHaveTask() == 1) then
		local tbTask = self:GetTaskData(GetTask(self.TSK_GATHER_TASK_ID));
		if (tbTask ~= nil) then
			Talk(1,"",format("VÞ nµy %s, ng­¬i gióp ta thu thËp ®ñ<color=green>%d<color> h¹t <color=yellow>%s<color> råi ch­a? ng­¬i nhanh ch©n ®i<color=red>%s<color> thu thËp ®i, ngµy sinh nhËt cña s­ phô ta s¾p ®Õn råi.", GetSex() == 1 and "ChÞ " or "Ca Ca",  tbTask.nGatherCount, tbTask.szGatherName, tbTask.szMapName));
		end
		return nil;
	end
	
	local nTaskCount = getn(self.tbTaskList)
	
	local nId = random(1,nTaskCount)
	local tbTask = self.tbTaskList[nId]
	if tbTask == nil then
		return nil;
	end
	
	SetTask(self.TSK_GATHER_TASK_ID, nId);
	
	Talk(1,"",format("VÞ nµy %s, s­ phô cña ta nãi r»ng<color=yellow>%s<color> lµ mét loµi hoa rÊt thÇn kú, ta muèn lÊy loµi hoa nµy tÆng cho s­ phô lµm lÔ vËt, ng­¬i cã thÓ gióp ta ®Õn<color=red>%s<color>gióp ta h¸i<color=green>%d<color> ®­îc kh«ng?", GetSex() == 1 and "ChÞ " or "Ca Ca", tbTask.szGatherName, tbTask.szMapName, tbTask.nGatherCount));

	WriteLog(format("[%s]\t%s\t%s\t%s","NhiÖm vô hµng ngµy",GetName(), GetAccount(),format("NhËn nhiÖm vô thu thËp: thu thËp %d c¸i%s",tbTask.nGatherCount,tbTask.szGatherName)))

	return 1;
end

function tbGatherDailyTask:IsHaveTask()
	if GetTask(self.TSK_GATHER_TASK_ID) <= 0 then
		return nil;
	else
		return 1;
	end
end

function tbGatherDailyTask:CancelTask()
	SetTask(self.TSK_GATHER_TASK_ID, 0)
	return 1;
end

function tbGatherDailyTask:CheckCompleteTask()
	local nTskId = GetTask(self.TSK_GATHER_TASK_ID);
	local tbTask = self:GetTaskData(nTskId);
	
	if (self:IsHaveTask() ~= 1 or tbTask == nil) then
		Talk(1,"",format("VÞ nµy %s, t×m ta cã chuyÖn g× kh«ng?", GetSex() == 1 and "ChÞ " or "Ca Ca"));
		return nil;
	end
	
	if (PlayerFunLib:CheckItemInBag(format("return {tbProp={%d,%d,%d,-1,-1,0},}",tbTask.tbItem[1],tbTask.tbItem[2],tbTask.tbItem[3]), tbTask.nGatherCount, format("VÞ nµy %s, ng­¬i vÉn ch­a gióp ta h¸i ®ñ<color=green>%d<color> c©y <color=yellow>%s<color>, ng­¬i nhanh ®i<color=red>%s<color>gióp ta thu thËp, sinh nhËt cña s­ phô ta s¾p ®Õn råi ®ã.", GetSex() == 1 and "ChÞ " or "Ca Ca",  tbTask.nGatherCount, tbTask.szGatherName, tbTask.szMapName)) ~= 1) then
		return nil;
	end
		
	return 1;
end

function tbGatherDailyTask:CompleteTask()
	if (self:CheckCompleteTask() ~= 1) then
		return nil;
	end
	
	local tbTask = self:GetTaskData(GetTask(self.TSK_GATHER_TASK_ID));
	
	PlayerFunLib:ConsumeEquiproomItem(format("return {tbProp={%d,%d,%d,-1,-1,0}}",tbTask.tbItem[1],tbTask.tbItem[2],tbTask.tbItem[3]), tbTask.nGatherCount)

	SetTask(self.TSK_GATHER_TASK_ID, 0)
	self:_CompleteTask();
	
	WriteLog(format("[%s]\t%s\t%s\t%s","NhiÖm vô hµng ngµy",GetName(), GetAccount(),format("Hoµn thµnh nhiÖm vô thu thËp: thu thËp%d c¸i%s",tbTask.nGatherCount,tbTask.szGatherName)))
	AddStatData("richangrenwu_caijicishu")
	return 1;
end

function tbGatherDailyTask:CheckCanGather(G,D,P)
	local nTskId = GetTask(self.TSK_GATHER_TASK_ID);
	local tbTask = self.tbTaskList[nTskId];
	if not tbTask then
		return nil;
	end

	if (tbTask.tbItem[1] ~= G or tbTask.tbItem[2] ~= D or tbTask.tbItem[3] ~= P) then
		return nil;
	end
	
	if (PlayerFunLib:CheckItemInPlayer(format("return {tbProp={%d,%d,%d,-1,-1,0}}",tbTask.tbItem[1],tbTask.tbItem[2],tbTask.tbItem[3]), tbTask.nGatherCount, "Ng­¬i ®· thu thËp ®ñ ®¹o cô cÇn thiÕt!") ~= 1) then
		return nil;
	end
	
	return 1;
end
