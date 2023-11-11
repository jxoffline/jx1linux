--description: ÌÆÃÅ³öÊ¦ÈÎÎñ ÖñË¿¶´µÚÒ»²ã¹ÖÎï
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 60*256+20) and (HaveItem(99) == 0) and (random(0,99) <= 40)) then		--ÈÎÎñÖĞÇÒÃ»ÓĞÔ¿³×¶şÊ±£¬¸ÅÂÊÎª50%
		AddEventItem(99) 
		Msg2Player("NhËn ch×a khãa thø 2 ")
--		SetTask(2, 64)
		AddNote("T¹i tÇng thø 1 Tróc T¬ §éng, ®¸nh b¹i g· ®Çu lÜnh lç m·ng, lÊy ®­îc ch×a khãa vµo tÇng thø 2. ")
	end
end;
