-- ÎäÒÄÉ½Óñ»ª¶´ÃÔ¹¬ Õ½¶·NPC Á÷¿Ü01£¨Îå¶¾50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+10) then
		SetTask(10,50*256+20)
		AddNote("L¹i ®i lªn nói La Tiªu ®Ó ®¸nh b¹i bän c­êng ®¹o, lÊy l¹i Ngäc San H« ")
		Msg2Player("B¾t ®­îc tªn ®Çu lÜnh, míi biÕt ®­îc lµ Ngäc San H« ®· bŞ bän c­êng ®¹o Vò Di s¬n c­íp ®i, chóng vµ bän c­íp ë La Tiªu cã quan hÖ víi nhau ")
	end
end;
