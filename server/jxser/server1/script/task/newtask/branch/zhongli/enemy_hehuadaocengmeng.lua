-------------------------------------------------------------------------
-- FileName		:	enemy_hehuadaocengmeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	Õ½¶·_ºÉ»¨µÁÔøÃÎ
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1055 = nt_getTask(1055)
Uworld1012 = nt_getTask(1012)
	if ( Uworld1012 >= 20 ) and ( Uworld1055 == 100 ) then
		nt_setTask(1012,0)
		SetMemberTask(1055,100,110,zhengbranch4) 
	elseif ( Uworld1055 == 100 ) then
		Uworld1012 = Uworld1012 + 10
		nt_setTask(1012,Uworld1012)
		Talk(1,"","§õng t­ëng ng­¬i cã thÓ ®¾c ı, cßn tû muéi ta ®©y!")
	end
end

function zhengbranch4()
	AddOwnExp(60000)
	AddExp_Skill_Extend(60000)
	Msg2Player("B¹n ®· ®¸nh b¹i Hµ Hoa §¹o, cã thÓ quay vÒ gÆp Chñ nh©n L·nh Th­¬ng Tiªu côc phôc mÖnh.")
	Talk(1,""," ChÕt råi th× tèt ban ®ªm sÏ kh«ng gÆp ¸c méng.")
end
