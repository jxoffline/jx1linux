
-- ÁúÃÅÕò¶ËÄ¾Çå½Å±¾
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==400) then
		task_level60_03();
		return
	elseif (myTaskValue==409) then
		task_level60_04();
		return
	elseif (myTaskValue==420) then
		task_level60_07();
		return
	end
	
	Say("§õng cã ®i qua ®i l¹i hoµi thÕ, lµm ta chãng mÆt qu¸!",0);
	
	return
		

end