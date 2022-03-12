-------------------------------------------------------------------------
-- FileName		:	’Ω∂∑_‘π∂æ.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:34:32
-- Desc			:	‘π∂æ
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1001 = nt_getTask(1001)
	if (Uworld1001 == 240 ) then
		SetMemberTask(1001,240,250,newtask4)
	end
end

function newtask4()
	AddOwnExp(230000)
	AddExp_Skill_Extend(230000)
	Msg2Player("Bπn l y Æ≠Óc thÒ c p O∏n ßÈc.")
	Msg2Player("Bπn c„ th” v“ L©m An g∆p Mπnh Phµm.")
	Talk(1,"","ßÍi ng≠Íi ai cÚng mÈt l«n ch’t! Nh≠ng ch’t nh≠ th’ nµy thÀt kh´ng cam t©m!")
end

	
