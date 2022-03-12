-- Ñãµ´É½ÃÔ¹¬ Õ½¶·NPC Ö©Öë01£¨Îå¶¾10¼¶ÈÎÎñ¡¢È­ÇãÌìÏÂÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 10*256+10) then		-- ÔÚÈÎÎñÖĞ£¬°´»úÂÊ´ò³ö£¨È¡Ïû»úÂÊ£©¡£
		AddEventItem(86)			-- ÎïÆ·Ö©Öë
		if (GetItemCount(86) >= 10) then
			Msg2Player("B¹n ®· b¾t ®­îc 10 con nhÖn ®éc ")
			AddNote("B¹n ®· b¾t ®­îc 10 con nhÖn ®éc ")
		else
			Msg2Player("B¾t ®­îc mét con nhÖn ®éc ")
		end
	elseif (GetTask(75) == 10) and (GetTask(52) == 10) and (random(0,99) < 75) then		-- È­ÇãÌìÏÂÈÎÎñ£¬°´»úÂÊµÃµ½
		AddEventItem(86)
		if (GetItemCount(86) >= 7) then
			Msg2Player("§· b¾t ®­îc 7 con nhÖn ®éc, ®· cã thÓ quay vÒ, phông m¹ng ")
		else
			Msg2Player("B¾t ®­îc mét con nhÖn ®éc ")
		end
	end
end;
