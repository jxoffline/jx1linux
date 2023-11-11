
-- 任务系统库支持
IncludeLib("TASKSYS");

Include("\\script\\task\\system\\task_main.lua");

TASKSTAT_START 	= 1
TASKSTAT_FINISH = 2
TASKSTAT_AWARD	= 3

-- 确定任务开始的回调函数
function OnMenuTaskStart(taskid)
	local taskname = TaskName(taskid);
	if (taskname ~= nil and OnCheckTaskStart(taskname) == 1) then
		-- 设置任务开始
		if (StartTask(taskname) == 1) then
			SetTaskStatus(taskname, TASKSTAT_START);
			OnTaskStart(taskname);
		end
	end
end

-- 完成任务
function FinishTask(taskname)
	-- CloseTask(taskname);
	OnTaskFinish(taskname);
	SetTaskStatus(taskname, TASKSTAT_FINISH);
	OnTaskSay(taskname, TASKSTAT_FINISH);
end

-- 确认任务完成的回调函数
function OnMenuTaskFinish(taskid)
	local taskname = TaskName(taskid);
	if (taskname ~= nil and OnCheckTaskFinish(taskname, 1) == 1) then
		-- 设置任务完成
		FinishTask(taskname);
	end
end

-- 确认任务领奖的回调函数
function OnMenuTaskAward(taskid)
	local taskname = TaskName(taskid);
	if (taskname ~= nil and OnAward(taskname) == 1) then
		CloseTask(taskname);
		SetTaskStatus(taskname, TASKSTAT_AWARD);
	end
end

-- 杀怪事件
function OnEventKillNpc(player_index, taskno, mapid, npctemp, npccount, npcpower, npclevel)
	local taskname = TaskName(taskno);
	if (taskname ~= nil and OnCheckTaskFinish(taskname, 2) == 1) then
		-- 设置任务完成
		FinishTask(taskname);
	end
end

-- 查找任务NPC并对话
function OnEventTalkNpc(npc_index)
	-- 获取第一个任务
	local taskname = FirstTask();
	if (taskname == nil) then
		return 0;
	end

	-- NPC名字
	local npcname = GetNpcName(npc_index);
	
	if (npcname == nil) then
		return 0;
	end
	
	-- 台湾版需要转换过的 NPC NAME
	npcname = NpcName2Replace(npcname);

	-- 地图名字
	local x, y, subworld = GetNpcPos(npc_index);
	local mapname = SubWorldName(subworld);
	if (mapname == nil) then
		return 0;
	end

	-- 查找每一个任务
	while (taskname ~= nil) do
		if (TalkWithNpc(taskname, npcname, mapname) == 1) then
			return 1;
		else
			taskname = NextTask();
		end
	end
	return 0;
end

-- 和任务NPC对话
function TalkWithNpc(taskname, npcname, mapname)
	if (OnTaskNpcTalk(npcname, mapname, taskname) ~= 1) then
		return 0;
	end
	local status = GetTaskStatus(taskname);
	local result = 1;
	if (status ~= nil) then
		OnTaskSay(taskname, status);
	else
		result = 0;
		print(format("Task[%s]'s status is nil!!!", taskname));
	end
	return result;
end
