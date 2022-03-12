-------------------------------------------------------------------------
-- FileName		:	enemy_elang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	’Ω∂∑_∂Ò¿«
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1051 = nt_getTask(1051)
	if ( Uworld1051 == 120 ) then
		SetMemberTask(1051,120,130,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("Bπn Æ∑ gi’t Æ≠Óc ∏c lang, c„ th” quay v“ t◊m Cung A Ng≠u.")
	Talk(1,"","A.............................")
end


