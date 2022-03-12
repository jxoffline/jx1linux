-- Õ½¶·_¾øÉ±.lua  £¨ÊÀ½çÈÎÎñ£ºÏ´ÇåÔ©Çü£©
-- By: Dan_Deng(2004-04-15)

function OnDeath()
	Uworld51 = GetTask(51)
	if (Uworld51 == 60) then		-- ÈÎÎñÖĞ£¬ÊÇ´òµÄµÚÒ»¸öĞ¡BOSS
		SetTask(51,61)
		Talk(1,"","Huynh ®Ö TuyÖt Tr¶m ta sÏ b¸o thï cho ng­¬i!")
	elseif (HaveItem(377) == 0) and ((Uworld51 == 62) or (Uworld51 == 70) or (Uworld51 == 80)) then		-- ÈÎÎñÖĞ£¬¿ÉÒÔµÃÃØóÅ
		Talk(1,"","§¸ng ghĞt!")
		SetTask(51,70)
		AddEventItem(377)		-- "ÌÆÃÅÃØóÅ"
		Msg2Player("B¹n giÕt chÕt Kim quèc thİch kh¸ch, ph¸t hiÖn trong ng­êi h¾n quyÓn §­êng m«n mËt cÊp ")
	end
end
