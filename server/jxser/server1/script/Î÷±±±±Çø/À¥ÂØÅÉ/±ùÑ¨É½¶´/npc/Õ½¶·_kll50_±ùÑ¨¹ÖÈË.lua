-- ±ùÑ¨ÃÔ¹¬ Õ½¶·NPC ±ùÑ¨¹ÖÈË£¨À¥ÂØ50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-31)

function OnDeath()
	if (GetTask(9) == 50*256+127) and (HaveItem(10) == 0) then
		AddEventItem(10)
		AddNote("§¸nh b¹i ®­îc qu¸i nh©n trong b¨ng ®éng vµ lÊy ®­îc n¾m tãc trªn ®Çu cña h¾n ")
		Msg2Player("§¸nh b¹i ®­îc qu¸i nh©n trong b¨ng ®éng vµ lÊy ®­îc n¾m tãc trªn ®Çu cña h¾n ")
	end
end;
