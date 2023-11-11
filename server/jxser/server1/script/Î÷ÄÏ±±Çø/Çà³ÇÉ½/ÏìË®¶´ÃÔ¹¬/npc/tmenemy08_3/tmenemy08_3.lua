--description: ÌÆÃÅ50¼¶ÈÎÎñ Çà³ÇÉ½ÏìË®¶´¹ÖÎï
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 50*256+80) and (HaveItem(48) == 0)) then					--Ã»ÓĞ°µÆ÷Æ×
		AddEventItem(48) 
--		SetTask(2, 59)
		AddNote("§¸nh b¹i kÎ ®Şch ë ®éng H­ëng Thñy, lÊy ®­îc '¸m khİ phæ' ")
		Msg2Player("LÊy ®uîc ¸m khİ phæ ")
	end
end;
