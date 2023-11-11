-------------------------------------------------------------------------
-- FileName		:	enemy_qijifeng.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-1-5 15:04:14
-- Desc			:	Õ½¶·_Æë¼´·ç
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1053 = nt_getTask(1053)
	if ( Uworld1053 == 60 ) then
		SetMemberTask(1053,60,70,zhengbranch4) 
	end
end

function zhengbranch4()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("B¹n ®· ®¸nh b¹i TÒ Tøc Phong, tr­íc khi l©m chung nãi mét c©u rÊt khã hiÓu. B¹n c¶m thÊy nªn quay vÒ hái Ng¹o V©n T«ng.")
	Talk(1,"","Ha ha! Ng­¬i t­ëng lµ Nh¹c Phi do ta giÕt sao? Ta cho ng­¬i biÕt ®õng hßng t×m ra thñ ph¹m......")
end
