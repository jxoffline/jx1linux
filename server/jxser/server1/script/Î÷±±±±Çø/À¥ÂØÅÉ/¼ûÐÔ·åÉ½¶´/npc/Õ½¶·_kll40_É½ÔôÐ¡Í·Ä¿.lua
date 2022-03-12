-- ¼ûĞÔ·åÉ½¶´ÃÔ¹¬ Õ½¶·NPC É½ÔôĞ¡Í·Ä¿ À¥ÂØ40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+10) then			--´ø×ÅÈÎÎñ
		SetTask(9,40*256+20)
		Msg2Player("§¸nh b¹i tªn s¬n tÆc tiÓu ®Çu môc, th× ra HuyÕt Hån ThÇn KiÕm ®· bŞ thñ lÜnh cña tªn tiÓu s¬n tÆc kia cÊt giÊu ")
		AddNote("§¸nh b¹i tªn s¬n tÆc tiÓu ®Çu môc, th× ra HuyÕt Hån ThÇn KiÕm ®· bŞ thñ lÜnh cña tªn tiÓu s¬n tÆc kia cÊt giÊu ")
	end
end;
