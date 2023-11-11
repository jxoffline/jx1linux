-------------------------------------------------------------------------
-- FileName		:	路人_公子笑.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 21:57:43
-- Desc			:	
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhengpai\\zhengpaitasknpc.lua")

function main()
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 ~= 0 ) then
		gongzixiao()
	end
end
