-------------------------------------------------------------------------
-- FileName		:	enemy_xuzili.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:08:09
-- Desc			:	Õ½¶·_Ðì×ÔÁ¦
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")

function OnDeath()
Uworld1002 = nt_getTask(1002)
	if (Uworld1002 == 150 ) then
		SetMemberTask(1002,150,160,zhongtask3) 
	end
end

function zhongtask3()
	AddOwnExp(100000)
	AddExp_Skill_Extend(100000)
	Msg2Player("B¹n nhËn ®­îc B¹ch Long Tøc, quay vÒ t×m LÖ Thu Thñy.")
	Talk(1,"","Mét mãn b¶o bèi h¹i ng­êi, thËt kh«ng ®¸ng chót nµo......")
end


		
