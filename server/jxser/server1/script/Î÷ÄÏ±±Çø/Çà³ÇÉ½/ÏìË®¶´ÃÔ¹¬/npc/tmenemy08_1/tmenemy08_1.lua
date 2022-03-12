--description: ÌÆÃÅ50¼¶ÈÎÎñ Çà³ÇÉ½ÏìË®¶´ÌÆºÌ
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+60) then
		Talk(1,"","Hõ! Dï ta ®· th©n b¹i danh liÖt, cã ®¸nh b¹i ta th× ng­¬i còng ®õng hßng lÊy ®­îc '¸m khİ phæ'! Ta ®· giÊu nã trong s¬n ®éng råi, c¶ ®êi ng­¬i còng ®õng mong t×m ®­îc!")
		SetTask(2, 50*256+80)
		Msg2Player("§¸nh b¹i §­êng Hßa t¹i ®éng H­ëng Thñy Thanh Thµnh s¬n, biÕt ®­îc '¸m khİ phæ' ®­îc cÊt giÊu trong s¬n ®éng ")
		AddNote("§¸nh b¹i §­êng Hßa t¹i ®éng H­ëng Thñy Thanh Thµnh s¬n, biÕt ®­îc '¸m khİ phæ' ®­îc cÊt giÊu trong s¬n ®éng ")
	end
end;
