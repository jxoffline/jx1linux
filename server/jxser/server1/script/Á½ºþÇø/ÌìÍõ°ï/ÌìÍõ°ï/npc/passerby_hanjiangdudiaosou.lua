-------------------------------------------------------------------------
-- FileName		:	passerby_hanjiangdudiaosou.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:08:56
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function main()
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 ~= 0 ) then
		hanjiangdudiaosou()
	end
end
