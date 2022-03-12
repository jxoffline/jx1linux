-- Ø¤°ïÃØ¶´ Õ½¶·NPC01 ³öÊ¦ÈÎÎñ£¨¶ÔÓ¦±¦Ïä1£©
-- by£ºDan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 0) then			--´ø×ÅÈÎÎñ²¢ÇÒÃ»ÓĞÔ¿³×
		AddEventItem(203)
		AddNote("T¹i tÇng thø nhÊt cña mËt ®éng, lÊy ®­îc mét chiÕc ch×a khãa ")
		Msg2Player("T¹i tÇng thø nhÊt cña mËt ®éng, lÊy ®­îc mét chiÕc ch×a khãa ")
	end
end;
