-------------------------------------------------------------------------
-- FileName		:	Õ½¶·_ÄÏ¹¬·ÉÔÆ.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-15 14:35:01
-- Desc			:	ÄÏ¹¬·ÉÔÆ
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\lib_setmembertask.lua")

function OnDeath()
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 290 ) then
		SetMemberTask(1001,290,300,newtask5)
	end
end

function newtask5()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("Ng­êi thÇn bİ sau khi bŞ b¹n ®¸nh b¹i, b¶o b¹n ®Õn chç M¹c SÇu ë §¹i Lı, h¾n cã chuyÖn muèn nãi víi b¹n.")
	Talk(1,"","§Õn §¹i Lı gÆp M¹c SÇu, ta sÏ cã chuyÖn nãi.")
end
