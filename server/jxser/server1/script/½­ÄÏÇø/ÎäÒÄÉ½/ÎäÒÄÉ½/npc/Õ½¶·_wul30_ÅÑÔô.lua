-- ÎäÒÄÉ½ÃÔ¹¬ Õ½¶·NPC £¿£¿01£¨Îå¶¾30¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu >= 30*256+10) and (UTask_wu < 40*256) and (HaveItem(87) == 0) and (random(0,99) < 50) then
		AddEventItem(87)
		if (UTask_wu == 30*256+10) then
			AddNote("NhËn ®­îc Méc H­¬ng §Ønh ")
			Msg2Player("NhËn ®­îc Méc H­¬ng §Ønh ")
		else
			Msg2Player("ChØ lµ Méc H­¬ng §Ønh gi¶ ")
		end
	end
end;
