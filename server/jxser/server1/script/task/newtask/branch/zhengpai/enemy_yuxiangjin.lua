-------------------------------------------------------------------------
-- FileName		:	enemy_yuxiangjin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	Õ½¶·_ÓåÏæ½ò
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
function OnDeath()
Uworld1052 = nt_getTask(1052)
Uworld1056 = nt_getTask(1056)
name = GetName()
	if ( Uworld1052 == 100 ) then
		SetMemberTask(1052,100,110,zhengbranch3) 
	elseif ( Uworld1056 == 60 ) then
		SetMemberTask(1056,60,70,zhengbranch4) 
	end
end

function zhengbranch3()
	AddOwnExp(260000)
	AddExp_Skill_Extend(260000)
	Msg2Player("B¹n tha cho Du S­¬ng T©n, hoµn thµnh nhiÖm vô. Quay vÒ t×m Ng¹o V©n T«ng.")
	Talk(1,"",name..":Du S­¬ng T©n, h«m nay ta kh«ng giÕt ng­¬i. Hy väng ng­¬i h·y trèn thËt xa ®õng bao giê lã diÖn n÷a.")
end

function zhengbranch4()
	AddOwnExp(260000)
	AddExp_Skill_Extend(260000)
	Msg2Player("B¹n ®· khuÊt phôc Du S­¬ng T©n, hoµn thµnh nhiÖm vô. Quay vÒ gÆp LiÔu Nam V©n phôc mÖnh.")
	Talk(1,"",name..":Du S­¬ng T©n, h·y ®i ®i.")
end

