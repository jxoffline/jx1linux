--NhiÖm vô lÖnh bµi - Created by DinhHQ - 20110510
IncludeLib("TASKSYS");
Include("\\script\\task\\system\\task_main.lua");
IncludeLib("ITEM")
tbVngLenhBai = {}
tbVngLenhBai.TSK_UseCountPerDay = 2589;

tbVngLenhBai.tbTaskList = {
	[1] = {302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321,},--danh quai
	[2] = {201, 202, 204, 205, 207, 208, 209, 210, 217, 218, 219, 220, 221, 222, 224, 225, 226,},--vat pham
	[3] = {211, 212, 213, 214, 215, 216, 227, 228,},--khoang thach
}

function tbVngLenhBai:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end

function tbVngLenhBai:UseItem(nIndex, nTaskType)
	if self:isExpired(nIndex) == 1 then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông")
		return 1
	end
	local nNowTaskID = GetTask(ID_RANDOMTASK); 	
	local nTaskState = 0;  
	if nNowTaskID ~= 0 then
		nTaskState = GetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)));
	end;	
	local nUseState = GetTask(self.TSK_UseCountPerDay)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nPerDayUseCount = 100
	if floor(nUseState / 256) ~= nCurDate then		
		nUseState = nCurDate * 256
		SetTask(self.TSK_UseCountPerDay, nUseState)
	end	
	if mod(nUseState, 256) >= nPerDayUseCount then		
		Talk(1, "", format("Mçi ngµy mçi ng­êi ch¬i chØ ®­îc sö dông vËt phÈm nµy %d lÇn.", nPerDayUseCount))
		return 1		
	end		
	if nTaskState>0 and nTaskState<3 then
		Say("<color=green>LÖnh bµi nhiÖm vô<color>: HiÖn t¹i cã nhiÖm vô ngÉu nhiªn ch­a hoµn thµnh, vÉn muèn tiÕp nhËn nhiÖm vô míi sao?",
			2,
			format("§óng vËy, ta muèn hñy bá nhiÖm vô tr­íc ®©y/#tbVngLenhBai:ConfirmRandomBookTask(%d, %d)", nIndex, nTaskType),
			"Kh«ng ph¶i, ®îi mét l¸t ®·!/OnTaskWait");
		return 1;
	else
		local tbTempList = self.tbTaskList[nTaskType]
		if not tbTempList then
			return 1
		end
		local nItemParam = GetItemParam(nIndex, 1)
		local nTaskID = 0
		if nItemParam == 0 then
			nTaskID = tbTempList[random(1, getn(tbTempList))]
			SetSpecItemParam(nIndex, 1, nTaskID)
			SyncItem(nIndex)
		else
			nTaskID = nItemParam
		end
		SetTaskStatus(TaskName(nTaskID), 0);
		CloseTask(TaskName(nTaskID));
		SetTask(ID_RANDOMTASK_WAIT, nTaskID);		
		SyncTaskValue(ID_RANDOMTASK_WAIT);	
		SetTask(ID_RANDOMTASKTEMP, nIndex)	
		ApplyTask( TaskName(nTaskID) );		
		SetTask(self.TSK_UseCountPerDay, nUseState + 1);		
		return 1;
	end;
end;

function tbVngLenhBai:ConfirmRandomBookTask(nIndex, nTaskType)
	local tbTempList = self.tbTaskList[nTaskType]
	if not tbTempList then
		return 1
	end
	local nItemParam = GetItemParam(nIndex, 1)
	local nTaskID = 0
	if nItemParam == 0 then
		nTaskID = tbTempList[random(1, getn(tbTempList))]
		SetSpecItemParam(nIndex, 1, nTaskID)
		SyncItem(nIndex)
	else
		nTaskID = nItemParam
	end
	SetTaskStatus(TaskName(GetTask(ID_RANDOMTASK)), 0);
	CloseTask(TaskName(GetTask(ID_RANDOMTASK)));
	SetTaskStatus(TaskName(nTaskID), 0);
	CloseTask(TaskName(nTaskID));	
	SetTask(ID_RANDOMTASK_WAIT, nTaskID);		
	SyncTaskValue(ID_RANDOMTASK_WAIT);	
	SetTask(ID_RANDOMTASKTEMP, nIndex);	
	ApplyTask( TaskName(nTaskID) );
	SetTask(self.TSK_UseCountPerDay, GetTask(self.TSK_UseCountPerDay) + 1);
	return	
end;