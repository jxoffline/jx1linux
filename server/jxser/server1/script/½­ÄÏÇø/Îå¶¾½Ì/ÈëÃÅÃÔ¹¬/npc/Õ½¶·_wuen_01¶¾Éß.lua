-- Îå¶¾½ÌÎå¶¾¶´ Õ½¶·NPC ¶¾Éß01£¨Îå¶¾ÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) and (HaveItem(227) == 0) and (random(0,99) < 80) then		-- ÔÚÈÎÎñÖĞ²¢ÇÒÎŞÈÎÎñÎïÆ·
		AddEventItem(227)
		Msg2Player("B¹n nhËn ®­îc Khæng t­íc vò thø nhÊt ")
		AddNote("B¹n nhËn ®­îc Khæng t­íc vò thø nhÊt ")
	end
end;
