--description: ÎäÁêÉ½ ·üÁ÷¶´»ğòáòæ¡¡ÌìÍõ40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/26
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) and (HaveItem(93) == 0) and (random(0,99) < 50) then
		AddEventItem(93)
		Msg2Player("LÊy ®­îc v¶y th»n l»n löa. ")
		AddNote("T¹i ®éng Phôc L­u Vò L¨ng s¬n, ®¸nh b¹i th»n l»n löa lÊy ®­îc miÕng v¶y. ")
	end
end;	
