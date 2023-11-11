-------------------------------------------------------------------------
-- FileName		:	enemy_lushanxiang.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:06:22
-- Desc			:	Õ½¶·_Äþ½«¾ü£¿
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 80 ) then
		SetMemberTask(1002,80,90,zhongtask2) 
	end
end

function zhongtask2()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("B¹n h·y quay vÒ t×m Phã Nam B¨ng.")
	Talk(1,"","Ta cø t­ëng m×nh lµ Thiªn h¹ ®Ö nhÊt kho¸i thñ, kh«ng ngê ng­¬i cßn nhanh h¬n ta.")
end

		
