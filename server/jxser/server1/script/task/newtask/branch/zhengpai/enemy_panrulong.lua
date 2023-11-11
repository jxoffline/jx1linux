-------------------------------------------------------------------------
-- FileName		:	enemy_panrulong.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	Õ½¶·_ÅËÈçÁú
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if (Uworld1050 == 120 ) then
		SetMemberTask(1050,120,130,zhengbranch1) 
	end
end

function zhengbranch1()
	AddOwnExp(50000)
	AddExp_Skill_Extend(50000)
	Msg2Player("Phan Nh­ Long lóc s¾p chÕt nãi, h¾n ta kh«ng ph¶i lµ ng­êi hµnh thÝch Nh¹c Phi! Hoµn thµnh nhiÖm vô.B¹n cã thÓ vÒ gÆp Ng¹o V©n T«ng.")
	Talk(1,"","Phan Nh­ Long: N¨m x­a giÕt Nh¹c Phi lµ kÎ kh¸c, ta ch¼ng qua lµ mét tªn l©u la mµ th«i.")
end


