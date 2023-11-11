-- ÂŞÏöÉ½ÄõÁú¶´ Õ½¶·NPC Ç¿µÁ£¨Îå¶¾50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+20) and (random(0,99) < 33) then		-- ÔÚÈÎÎñÖĞ£¬°´»úÂÊ´ò³ö¡£
		AddEventItem(88)
		AddNote("LÊy l¹i Ngäc San H« ")
		Msg2Player("LÊy l¹i Ngäc San H« ")
	end
end;
