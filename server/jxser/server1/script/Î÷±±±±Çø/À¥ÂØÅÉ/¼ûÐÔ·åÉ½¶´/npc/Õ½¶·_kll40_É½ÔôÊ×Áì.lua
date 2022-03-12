-- ¼ûĞÔ·åÉ½¶´ÃÔ¹¬ Õ½¶·NPC É½ÔôÊ×Áì À¥ÂØ40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+20) and (HaveItem(212) == 0) and (random(0,99) < 30) then
		AddEventItem(212)
		Msg2Player("LÊy ®­îc 1 chiÕc ch×a khãa ")
		AddNote("B¹n lÊy trong ng­êi tªn thñ lÜnh cña s¬n tÆc ra 1 chiÕc ch×a khãa ")
	end
end;
