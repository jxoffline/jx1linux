-- Îå¶¾½ÌÎå¶¾¶´ Õ½¶·NPC ¶¾Ğ«01£¨Îå¶¾ÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) and (HaveItem(223) == 0) and (random(0,99) < 80) then		-- ÔÚÈÎÎñÖĞ²¢ÇÒÎŞÈÎÎñÎïÆ·
		AddEventItem(223)
		Msg2Player("B¹n nhËn ®­îc Khæng t­íc vò thø hai ")
		AddNote("B¹n nhËn ®­îc Khæng t­íc vò thø hai ")
	end
end;
