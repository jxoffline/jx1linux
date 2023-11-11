--description: ÆßÉ±¶´ËÀÇô3¡¡ÌìÈÌ10¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(53) == 0)) then
		AddEventItem(53)
		Msg2Player("LÊy ®­îc m¶nh thø ba cña lÖnh bµi. ")
		AddNote("LÊy ®­îc m¶nh thø ba cña lÖnh bµi trong ThÊt S¸t ®éng. ")
	end
end;
