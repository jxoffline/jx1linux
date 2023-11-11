--description: ÆßÉ±¶´ËÀÇô1¡¡ÌìÈÌ10¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(51) == 0)) then			--È¡Ïû¶ÔÈÎÎñÎïÆ·ÓĞÎŞµÄÅĞ¶Ï£¬ÒÔ±ãÖØ×öÈÎÎñ
		AddEventItem(51)
		Msg2Player("LÊy ®­îc m¶nh thø nhÊt cña lÖnh bµi. ")
		AddNote("LÊy ®­îc m¶nh thø nhÊt cña lÖnh bµi trong ThÊt S¸t ®éng. ")
	end
end;
