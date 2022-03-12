-- Êñ¸ÔÉ½ Õ½¶·NPC ½ğ±ø Ø¤°ï30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 30*256+20) then			--30¼¶ÈÎÎñÖĞ
		SetTask(8,30*256+30)
		AddNote("§¸nh b¹i qu©n Kim mai phôc, c¸c ®Ö tö C¸i Bang vèn mÊt tİch ®Òu bŞ qu©n Kim mai phôc b¾t ®i. ")
		Msg2Player("§¸nh b¹i qu©n Kim mai phôc, c¸c ®Ö tö C¸i Bang vèn mÊt tİch ®Òu bŞ qu©n Kim mai phôc b¾t ®i. ")
	end
end;
