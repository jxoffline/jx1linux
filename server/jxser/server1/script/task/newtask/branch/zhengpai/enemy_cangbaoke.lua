-------------------------------------------------------------------------
-- FileName		:	enemy_cangbaoke.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 15:04:14
-- Desc			:	Õ½¶·_²Ø±¦¿Í
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\lib_setmembertask.lua")

function OnDeath()
Uworld1050 = nt_getTask(1050)
	if ( Uworld1050 == 40 ) then
		AddEventItem(504)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn Kú phæ Thiªn Tµn §Şa KhuyÕt.")
	end
	if ( GetItemCount(504) >= 5 ) then
		Talk(1,"","B¹n lÊy ®­îc 5 quyÓn Thiªn Tµn §Şa KhuyÕt kú phæ, h·y tha cho Tµng B¶o Kh¸ch.")
	end
end

