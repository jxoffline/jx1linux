-- ´óÀí³Ç³çÊ¥ËÂÇ§Ñ°Ëş Õ½¶·NPC µÁÔô02£¨´äÑÌÃÅ50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-27)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy >= 50*256+32) and (UTask_cy < 50*256+50) and (HaveItem(5) == 0) then		--50¼¶ÈÎÎñÖĞÇÒÎŞµÀ¾ß
		UTask_cy = SetBit(UTask_cy,2,1)
		if (UTask_cy == 50*256+32+7) then		--Èç¹û¹»(bin(100 + 010 + 001))
			SetTask(6,50*256+32)
			AddEventItem(5)
			Msg2Player("§¸nh b¹i bän c­íp ®o¹t vÒ Vò ®ång Quan ¢m cña bän c­íp ")
			AddNote("§¸nh b¹i bän c­íp ®o¹t vÒ Vò ®ång Quan ¢m cña bän c­íp ")
		else
			SetTask(6,UTask_cy)
			Msg2Player("§¸nh b¹i bän c­íp, nh­ng kh«ng t×m thÊy Vò §ång Quan ¢m ")		--Òª²»ÒªÌáÊ¾Íæ¼Ò£¿
		end
	end
end;
