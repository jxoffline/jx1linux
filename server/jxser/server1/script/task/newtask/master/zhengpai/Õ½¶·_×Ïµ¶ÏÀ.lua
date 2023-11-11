-------------------------------------------------------------------------
-- FileName		:	’Ω∂∑_◊œµ∂œ¿.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:35:34
-- Desc			:	◊œµ∂œ¿
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 170 ) then
		SetMemberTask(1001,170,180,newtask3)
	end
end

function newtask3()
	AddOwnExp(100000)
	AddExp_Skill_Extend(100000)
	Msg2Player("Bπn Æ∑ l y Æ≠Óc Cˆu Hi÷n Chi Chÿ, quay v“ ßπi L˝ g∆p Mπc S«u phÙc m÷nh.")
	Talk(1,"","Ta bπi d≠Ìi tay ng≠¨i, Æ∑ phÙ lﬂng huynh Æ÷ ph„ th∏c. Chÿ c„ th” l y c∏i ch’t Æ” b∏o Æ∏p, ng≠¨i Æ∑ l y Æ≠Óc n„ rÂi, h∑y bi’n Æi.")
end
