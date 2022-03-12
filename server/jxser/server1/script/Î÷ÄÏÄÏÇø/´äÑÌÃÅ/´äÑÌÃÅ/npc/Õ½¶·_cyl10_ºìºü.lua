-- ´äÑÌÃÅ Õ½¶·NPC ??? 10¼¶ÈÎÎñ£¨´äÓğô¢£©
-- by£ºDan_Deng(2003-07-25)

function OnDeath()
	UTask_cy = GetTask(6);
	if (UTask_cy == 10*256+10) and (HaveItem(0) == 0) and (random(0,100) < 75) then			--ÈÎÎñÖĞ£¬75%»úÂÊ³öÏÖ
		AddEventItem(0) 
		Msg2Player("NhËn ®­îc Thóy Vò tr©m ")
		AddNote("NhËn ®­îc Thóy Vò tr©m ")
	end
end;
