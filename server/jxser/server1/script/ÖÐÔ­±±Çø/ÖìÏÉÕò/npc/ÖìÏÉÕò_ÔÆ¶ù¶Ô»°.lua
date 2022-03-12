
-- ÖìÏÉÕòÔÆ¶ù½Å±¾
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main()

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue == 10) then -- Ğ°½ÌÖ÷ÏßÕıÊ½Æô¶¯
		task_level20_00();
		return
	elseif (myTaskValue == 20) then
		Say("Cßn ch­a chiu ®i? Th¸i C«ng c«ng ë c¹nh thµnh m«n hoµng cung ë L©m An.",0);
		return
	elseif (myTaskValue == 50) then -- Óëãê¾©µÄ²Ì¹«¹«¶Ô»°½áÊø£¬µÃµ½ÌìÏãÓñÖ¬¸à
		task_level30_01();
		return
	elseif (myTaskValue == 130) or (myTaskValue == 120) then -- »Øµ½ÖìÏÉÕòÓëÔÆ¶ùµÄ¶Ô»°
		task_level30_07();
		return
	end

	
	Say("Nh×n n­íc ch¶y d­íi cÇu khiÕn ta cø thÊy lßng m×nh b©ng khu©ng! Gi¸ nh­ hiÖn giê lµ thêi b×nh th× hay biÕt mÊy!",0);

end