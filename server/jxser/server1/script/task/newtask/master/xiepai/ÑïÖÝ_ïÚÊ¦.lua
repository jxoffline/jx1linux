
-- ÓëĞ°½ÌÏà¹ØÈËÎïÑïÖİïÚÊ¦½Å±¾
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

myTaskValue = GetTask(1003)

	if (myTaskValue==100) then
		task_level30_03();
		return
	elseif (myTaskValue==109) then
		task_level30_03_01(); -- ÔÙÅĞ¶ÏÒ»´ÎµÈ¼¶ÊÇ·ñ´ïµ½ 30 ¼¶
		return
	end

Say("NghÒ b¶o tiªu lÊy nói rõng lµm nhµ! Mçi lÇn ®i lµ mét lÇn kh«ng mong ngµy vÒ! Nh­ng ta vÉn yªu nã!",0);

end