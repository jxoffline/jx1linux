
-- Â·ÈË²Ì¹«¹«½Å±¾
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==10) or (myTaskValue==20) then
		task_level20_02(); -- Óë²Ì¹«¹«¶Ô»°
		return
	elseif (myTaskValue==40) then -- ÒÑ¾­É±ËÀĞ¡Ì«¼à
		task_level20_05();
		return
	end
	
	Say("H«m tr­íc hoµng th­îng ®i s¨n, nh×n thÊy 1 thiÕu n÷ ngoµi th«n, vÒ t©m thÇn mª mÉn… ",0);

end