-------------------------------------------------------------------------
-- FileName		:	newtaskprize.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-20 21:52:16
-- Desc			:	ĞÂÈÎÎñÌØÊâ½±Àø
-- 					ÒÔÃ¿¸öÍæ¼Ò³öÊ¦Ê±µÄÃÅÅÉÎªÕóÓªµÄÅĞ¶Ï
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\clearskillpoint.lua")
Include("\\script\\task\\newtask\\master\\extent_prize.lua")

function prize()
Uworld1000 = nt_getTask(1000)
Uworld1001 = nt_getTask(1001)
Uworld1002 = nt_getTask(1002)
Uworld1003 = nt_getTask(1003)
local curCamp = nt_getCamp()
		if ( Uworld1001 == 50 ) then  --and ( )  È±ÉÙ½±Àø±äÁ¿ÅĞ¶Ï
			if ( curCamp == 0 ) then
				AddItem(0,10,2,1,1,1)  --Ôö¼Ó20¼¶Âí
				AddGoldItem(0,184) --Ôö¼ÓÒ»Ë«20ÅÜµÄĞ¬×Ó
				Msg2Player("B¹n nhËn ®­îc 1 con tuÊn m· cÊp 20 vµ 1 ®«i giµy tèc ®é")
			end
				nt_setTask(1001,60)
		elseif ( Uworld1001 == 120 ) then
			if ( curCamp == 0 ) then
				AddGoldItem(0,177)  --Ôö¼ÓÀ¶Ã±×Ó
				Msg2Player("B¹n nhËn ®­îc 1 chiÕc mò.")
			end
				nt_setTask(1001,130)
		elseif ( Uworld1001 == 190 ) then
			if ( curCamp == 0 ) then
				ClearMagicPoint()  --Ôö¼Ó40¼¶Ê±Ï´µãµÄ¹¦ÄÜ
				Msg2Player("B¹n nhËn ®­îc 1 c¬ héi tÈy ®iÓm kü n¨ng miÔn phİ ")
			end
				nt_setTask(1001,200)
		elseif ( Uworld1001 == 260 ) then
			if ( curCamp == 0 ) then
				AddItem(6,1,71,1,1,1)  --Ôö¼ÓÒ»¸öÏÉ²İÂ¶
				Msg2Player("B¹n nhËn ®­îc 1 b×nh Tiªn Th¶o Lé ")	
			end	
				nt_setTask(1001,270)
		elseif ( Uworld1001 == 320 )  or ( Uworld1002 == 310 ) or ( Uworld1003 == 430 ) then  
			local	taskgoldenprize = random(1,9)
					if ( taskgoldenprize == 1 ) then
						AddGoldItem(0,168)  --Ôö¼ÓÒ»¼ş»Æ½ğ×°±¸
					elseif ( taskgoldenprize == 2 ) then
						AddGoldItem(0,169)
					elseif ( taskgoldenprize == 3 ) then
						AddGoldItem(0,170)
					elseif ( taskgoldenprize == 4 ) then
						AddGoldItem(0,171)
					elseif ( taskgoldenprize == 5 ) then
						AddGoldItem(0,172)
					elseif ( taskgoldenprize == 6 ) then
						AddGoldItem(0,173)
					elseif ( taskgoldenprize == 7 ) then
						AddGoldItem(0,174)
					elseif ( taskgoldenprize == 8 ) then
						AddGoldItem(0,175)
					elseif ( taskgoldenprize == 9 ) then
						AddGoldItem(0,176)
					end
					if ( Uworld1001 == 320 ) then
						nt_setTask(1001,1000)
					elseif ( Uworld1002 == 310) then
						nt_setTask(1002,1000)
					elseif ( Uworld1003 == 430 ) then
						nt_setTask(1003,1000)
					end
					Msg2Player("B¹n nhËn ®­îc 1 mãn b¶o khİ ")	
					WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."NhËn ®­îc 1 bé trang bŞ Hoµng Kim sau khi hoµn thµnh nhiÖm vô chİnh tuyÕn")	
		end
end

function prize1()
Uworld1000 = nt_getTask(1000)
Uworld1001 = nt_getTask(1001)
Uworld1002 = nt_getTask(1002)
Uworld1003 = nt_getTask(1003)
local curCamp = nt_getCamp()
		if ( Uworld1002 == 50 ) then 
			if ( curCamp == 1 ) then
				AddItem(0,10,2,1,1,1)  --Ôö¼Ó20¼¶Âí
				AddGoldItem(0,184) --Ôö¼ÓÒ»Ë«20ÅÜµÄĞ¬×Ó
				Msg2Player("B¹n nhËn ®­îc 1 con tuÊn m· cÊp 20 vµ 1 ®«i giµy tèc ®é")
			end
			nt_setTask(1002,60)
		elseif ( Uworld1002 == 100 ) then
			if ( curCamp == 1 ) then
				AddGoldItem(0,177)  --Ôö¼ÓÀ¶Ã±×Ó
				Msg2Player("B¹n nhËn ®­îc 1 chiÕc mò.")
			end
			nt_setTask(1002,110)
		elseif ( Uworld1002 == 170 )  then
			if ( curCamp == 1 ) then
				ClearMagicPoint()  --Ôö¼Ó40¼¶Ê±Ï´µãµÄ¹¦ÄÜ
				Msg2Player("B¹n nhËn ®­îc 1 c¬ héi tÈy ®iÓm kü n¨ng miÔn phİ ")
			end
			nt_setTask(1002,180)
		elseif  ( Uworld1002 == 230 ) then
			if ( curCamp == 1 ) then
				AddItem(6,1,71,1,1,1)  --Ôö¼ÓÒ»¸öÏÉ²İÂ¶
				Msg2Player("B¹n nhËn ®­îc 1 b×nh Tiªn Th¶o Lé ")
			end
			nt_setTask(1002,240)		
		end
end
