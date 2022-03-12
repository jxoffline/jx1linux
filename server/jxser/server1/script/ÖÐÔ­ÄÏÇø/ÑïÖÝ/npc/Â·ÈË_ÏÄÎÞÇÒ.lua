-------------------------------------------------------------------------
-- FileName		:	Â·ÈË_ÏÄÎÞÇÒ.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 13:44:25
-- Desc			:	
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\zhengpai\\zhengpaitasknpc.lua")

function main()
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 ~= 0 ) then
		xiawuqie()
	end
end
