--description: ÌÆÃÅ40¼¶ÈÎÎñ Çà³ÇÉ½ÆÕÍ¨¹ÖÎï3
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(45) == 0)) then					--Ã»ÓĞó¸òÜµÄÆ¤
		AddEventItem(45) 
		Msg2Player("LÊy ®­îc vá c©y anh tóc ")
		AddNote("LÊy ®­îc vá c©y anh tóc ")
	end
end;
