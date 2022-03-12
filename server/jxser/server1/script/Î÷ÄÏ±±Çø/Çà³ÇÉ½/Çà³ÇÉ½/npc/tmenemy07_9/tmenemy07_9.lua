--description: ÌÆÃÅ40¼¶ÈÎÎñ Çà³ÇÉ½ÆÕÍ¨¹ÖÎï4
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(46) == 0)) then					--Ã»ÓĞó¸òÜµÄÆ¤
		AddEventItem(46) 
		Msg2Player("LÊy ®­îc ®u«i bß c¹p ")
		AddNote("LÊy ®­îc ®u«i bß c¹p ")
	end
end;
