-- »ÆºÓÔ´Í·ÁôÏÉ¶´ÃÔ¹¬3F Õ½¶·NPC É½Ôô03£¨À¥ÂØ³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 0) and (random(1,99) < 40)) then
		AddEventItem(13)
		Msg2Player("LÊy ®­îc khãa ThiÕu Ng« ")
		AddNote("LÊy ®­îc khãa ThiÕu Ng« ")
	end
end;
