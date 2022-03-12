--description: ÌÆÃÅ30¼¶ÈÎÎñ Çà³ÇÉ½°×ÔÆ¶´°ó·Ë2
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 0) and (random(0,99) < 50) then		-- ¸ÅÂÊÓÉ33%¸ÄÎª50%
		AddEventItem(98)
		Msg2Player("LÊy ®­îc ch×a khãa ")
		AddNote("§¸nh b¹i PhØ TiÓu §Çu Môc, lÊy ®­îc ch×a khãa ")
	end
end;
