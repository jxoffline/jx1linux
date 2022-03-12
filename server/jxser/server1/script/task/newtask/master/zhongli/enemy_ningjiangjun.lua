-------------------------------------------------------------------------
-- FileName		:	enemy_ningjiangjun.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:05:42
-- Desc			:	Õ½¶·_Äþ½«¾ü
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 30) then
		SetMemberTask(1002,30,40,zhongtask1) --»·½Ú3end
	end
end

function zhongtask1()
	AddOwnExp(20000)
	AddExp_Skill_Extend(20000)
	Msg2Player("B¹n h·y quay vÒ t×m Phã Nam B¨ng.")
	Talk(1,"","Tõ lóc nhê v¶ Kim quèc ®Õn nay, ta biÕt sÏ cã ngµy nµy! ChØ kh«ng ngê nã ®Õn nhanh nh­ vËy!")
end

