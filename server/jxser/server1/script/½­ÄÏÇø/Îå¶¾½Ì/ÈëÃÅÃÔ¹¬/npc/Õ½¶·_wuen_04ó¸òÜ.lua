-- Îå¶¾½ÌÎå¶¾¶´ Õ½¶·NPC ó¸òÜ01£¨Îå¶¾ÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if ((Uworld37 == 10) and (HaveItem(225) == 0) and (random(0,99) < 80)) then		-- ÔÚÈÎÎñÖĞ²¢ÇÒÎŞÈÎÎñÎïÆ·
		AddEventItem(225)
		Msg2Player("B¹n nhËn ®­îc Khæng t­íc vò thø t­ ")
		AddNote("B¹n nhËn ®­îc Khæng t­íc vò thø t­ ")
	end
end;
