-------------------------------------------------------------------------
-- FileName		:	passerby_shaolinkongji.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:22:22
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")

function main()
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 ~= 0 ) then
		shaolinkongji()
	end
end
