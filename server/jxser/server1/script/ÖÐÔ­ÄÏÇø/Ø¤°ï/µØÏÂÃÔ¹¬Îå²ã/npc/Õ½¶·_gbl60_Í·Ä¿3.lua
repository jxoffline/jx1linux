-- Ø¤°ïÃØ¶´ Õ½¶·NPC03 ³öÊ¦ÈÎÎñ£¨¶ÔÓ¦±¦Ïä5£©
-- by£ºDan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(202) == 0) then			--´ø×ÅÈÎÎñ²¢ÇÒÃ»ÓĞÔ¿³×
		AddEventItem(202)
		AddNote("T¹i tÇng thø n¨m cña mËt ®éng, lÊy ®­îc mét chiÕc ch×a khãa ")
		Msg2Player("T¹i tÇng thø n¨m cña mËt ®éng, lÊy ®­îc mét chiÕc ch×a khãa ")
	end
end;
