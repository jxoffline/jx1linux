-------------------------------------------------------------------------
-- FileName		:	enemy_wulinrenwuyinshuangtong.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	’Ω∂∑_Œ‰¡÷»ÀŒÔ“¸À´Õ´
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1054 = nt_getTask(1054)
Uworld1012 = nt_getTask(1012)
	if ( Uworld1054 == 130 ) and ( Uworld1012 >= 30 ) then
		nt_setTask(1012,0)
		SetMemberTask(1054,130,140,zhengbranch2) 
	elseif ( Uworld1054 == 130 ) then
		Uworld1012 = Uworld1012 + 10
		nt_setTask(1012,Uworld1012)
		Talk(1,"","Kh´ng ph∂i ng≠¨i l y sao?")
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("Bπn Æ∑ l y Æ≠Óc B∂o ki’m, c„ th” quay v“ giao cho Lπc Thanh Thu.")
	Talk(1,"","B∂o ki’m Î Æ©y, ng≠¨i l y Æi.")
end


