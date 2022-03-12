-------------------------------------------------------------------------
-- FileName		:	enemy_shenfeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-01-07 15:04:14
-- Desc			:	Õ½¶·_Éò·ç
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 == 80 ) then
		SetMemberTask(1058,80,90,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(30000)
	AddExp_Skill_Extend(30000)
	Msg2Player("B¹n ®· h¹ gôc tªn Vâ sÜ gi¶ d¹ng ThÈm Phong. NhiÖm vô hoµn thµnh. Cã thÓ trë vÒ t×m Th¸c B¹t Hoµi Xuyªn!")
	Talk(1,"","§å cÈu t¹p chñng Kim Quèc!")
end

