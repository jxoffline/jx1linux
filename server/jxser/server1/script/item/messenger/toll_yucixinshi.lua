-------------------------------------------------------------------------
-- FileName		:	toll_yucixinshi.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-08-16 15:28:15
-- Desc			:  	ĞÅÊ¹ÈÎÎñÓù´Í½ğÅÆÓÒ¼ü´¥·¢½Å±¾
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")

function main(itemindex)
	local paramvalue = GetItemParam(itemindex, 1)
	if ( paramvalue >= 5 ) then
		Msg2Player("Xin lçi! Ngù Tø lÖnh bµi - vµng cña b¹n sö dông qu¸ 5 lÇn ®· bŞ hñy ho¹i.")
	elseif ( nt_getTask(1206) < 5 ) then
		Msg2Player("Xin lçi! B¹n ch­a nhËn ®­îc danh hiÖu Ngù Tø lÖnh bµi - vµng nªn kh«ng thÓ sö dông ®­îc. H·y ®Õn chç DŞch Quan nhËn danh hiÖu nµy, c¸m ¬n!")
		return 1
	else
		if ( SetSpecItemParam(itemindex, 1, paramvalue+1) == 1 ) then
			SyncItem(itemindex)
			local Realvalue = 5 - GetItemParam(itemindex, 1)
			Msg2Player("Ngù Tø lÖnh bµi - vµng cña b¹n sau khi sö dông phôc håi 30 ®iÓm ©m trong 1 giê. HiÖn t¹i cßn sö dông ®­îc"..Realvalue.." lÇn.")
		end
		
		if ( GetSeries() == 0 ) then --½ğÏµÈËÎï±»»ğ¿Ë £¬631-635£¬½ğÄ¾Ë®»ğÍÁ
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 634, 5, 1, 64800)
		elseif ( GetSeries() == 1 ) then --Ä¾ÏµÈËÎï±»½ğ¿Ë
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 631, 5, 1, 64800)
		elseif ( GetSeries() == 2 ) then --Ë®ÏµÈËÎï±»ÍÁ¿Ë
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 635, 5, 1, 64800)
		elseif ( GetSeries() == 3 ) then --»ğÏµÈËÎï±»Ë®¿Ë
			AddSkillState( 546, 1, 1, 64800)
			AddSkillState( 633, 5, 1, 64800)
		elseif ( GetSeries() == 4 ) then --ÍÁÏµÈËÎï±»Ä¾¿Ë
			AddSkillState( 546, 1, 1, 64800)	
			AddSkillState( 632, 5, 1, 64800)				
		end
		
		return 1
	end
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local  nPayMonth1
	local nPayMonth1 = GetItemParam( nItem, 1 )
	local Realvalue = 5 - nPayMonth1
	
	szDesc = ""
	szDesc = szDesc..format( "Ngù Tø lÖnh bµi - vµng cña b¹n sau khi sö dông phôc håi 30 ®iÓm ©m trong 1 giê. HiÖn t¹i cßn sö dông ®­îc"..Realvalue.." lÇn." );
	return szDesc;
end