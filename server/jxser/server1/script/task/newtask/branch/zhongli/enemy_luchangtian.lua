-------------------------------------------------------------------------
-- FileName		:	enemy_luchangtian.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	Õ½¶·_Â·³¤Ìì
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
function OnDeath()
Uworld1054 = nt_getTask(1054)
	if (Uworld1054 == 80 ) then
		SetMemberTask(1054,80,90,Uworld1054_give) 
	end
end

function Uworld1054_give()
	AddOwnExp(15000)
	AddExp_Skill_Extend(15000)
	Msg2Player("Lé Tr­êng Thiªn ®· bÞ b¹n khuÊt phôc, nhiÖm vô hoµn thµnh, b¹n cã thÓ vÒ t×m B¶o kª sßng b¹c.")
	Talk(1,"","Kh«ng ngê ta suèt ®êi ngang däc cuèi cïng l¹i bÞ b¹i d­íi tay mét tiÓu tö! Nhôc nh· thay!")
end
