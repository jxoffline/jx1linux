-------------------------------------------------------------------------
-- FileName		:	enemy_ruanmingyuan.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	Õ½¶·_ÈîÃ÷Ô¶
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1060 = nt_getTask(1060)
	if ( Uworld1060 == 100 ) then
		SetMemberTask(1060,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("B¹n ®· h¹ gôc NguyÔn Minh ViÔn, cã thÓ trë vÒ phôc mÖnh víi Th¸c B¹t Hoµi Xuyªn.")
	Talk(1,"","NghiÖp lín ch­a thµnh, chÕt kh«ng cam t©m.....")
end
