-------------------------------------------------------------------------
-- FileName		:	enemy_shengyin.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	Õ½¶·_Ê¢Òü
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1061 = nt_getTask(1061)
	if ( Uworld1061 == 100 ) then
		SetMemberTask(1061,100,110,zhengbranch2) 
	end
end

function zhengbranch2()
	AddOwnExp(600000)
	AddExp_Skill_Extend(600000)
	Msg2Player("B¹n ®· h¹ gôc ThÞnh Do·n, h·y quay vÒ phôc mÖnh Th¸c B¹t Hoµi Xuyªn.")
	Talk(1,"","Kim CÈu! GiÕt ta, thµnh T­¬ng D­¬ng còng kh«ng bÞ c¸c ng­¬i ph¸ ®­îc! ChØ cÇn toµn d©n mét lßng, kh«ng cã viÖc g× kh«ng thÓ!")
end

