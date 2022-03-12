--description: ÌìÍõ°ï ¶´Í¥ºşµ×µÚ2²ãË®¹Ö¡¡ÌìÍõ50¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 50*256+20) and (HaveItem(95) == 0) and (random(0,99) < 33) then
		AddEventItem(95)
		Msg2Player("§¸nh b¹i thñy qu¸i, lÊy ®­îc ®¸ ngò s¾c t­îng tr­ng cho h¹nh phóc, b×nh an. ")
--		SetTask(3, 55)
		AddNote("T×m thÊy Thñy qu¸i ë tÇng s¬n ®éng, ®¸nh b¹i nã lÊy ®­îc ®¸ Ngò S¾c ")
	end
end;
