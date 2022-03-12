-------------------------------------------------------------------------
-- FileName		:	enemy_shaolinkongji.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:07:27
-- Desc			:	’Ω∂∑_…Ÿ¡÷ø’º≈
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 280 ) then
		Talk(1,"Uworld1002_give","A Di ßµ PhÀt, Th«n Kh› Î Æ©y, Th› chÒ l y Æi.")
	end
end

function zhongtask5()
	AddOwnExp(600000)
	Msg2Player("Bπn nhÀn Æ≠Óc hai bÈ Long Kh›, h∑y quay v“ t◊m Ph„ Nam B®ng.")

end

function Uworld1002_give()

	SetMemberTask(1002,280,290,zhongtask5) 
	
end
		
