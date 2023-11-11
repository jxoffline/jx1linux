-- ÂŞÏüÉ½ÃÔ¹¬ Õ½¶·NPC É«¹í01£¨Îå¶¾20¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	i = GetItemCount("§Çu ng­êi  ")
	if (UTask_wu == 20*256+10) and (i < 7) and (random(0,99) < 80) then		-- ÔÚÈÎÎñÖĞ£¬°´»úÂÊ´ò³ö¡£
		AddEventItem(85)
		if (i >= 6) then
			Msg2Player("B¹n giÕt ®­îc La Tiªu thÊt quû, lÊy ®ñ 7 c¸i ®Çu ")
			AddNote("B¹n giÕt ®­îc La Tiªu thÊt quû, lÊy ®ñ 7 c¸i ®Çu, giao cho B¹ch Doanh Doanh ")
		else
			Msg2Player("NhËn ®­îc mét c¸i ®Çu ng­êi ")
		end
	end
end;
