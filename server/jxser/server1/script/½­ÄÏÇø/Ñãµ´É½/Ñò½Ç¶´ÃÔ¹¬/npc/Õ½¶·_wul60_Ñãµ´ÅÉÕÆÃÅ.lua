-- Ñãµ´É½Ñò½Ç¶´ÃÔ¹¬ Õ½¶·NPC ´óBOSS01£¨Îå¶¾³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 60*256+20) and (HaveItem(222) == 0) and (random(0,99) < 50) then
		AddEventItem(222)
		AddNote("B¹n ®¸nh b¹i ®­îc tªn ®Çu lÜnh cña Nh¹n §·ng ph¸i, lÊy l¹i Tõ §éc Chu cho Ngò §éc Gi¸o ")
		Msg2Player("B¹n ®¸nh b¹i ®­îc tªn ®Çu lÜnh cña Nh¹n §·ng ph¸i, lÊy l¹i Tõ §éc Chu cho Ngò §éc Gi¸o ")
	end
end;
