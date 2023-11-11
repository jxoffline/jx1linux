
-- 战斗人物夏侯复死亡脚本
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function OnDeath()
	SetMemberTask(1003,110,120,task_level30_05) 
end
