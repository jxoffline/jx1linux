-- À¥ÂØÑ©±ªÉ½¶´ Õ½¶·NPC Ñ©±ª ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 30*256+10) and (GetItemCount("D¹ Minh Ch©u") < 3) and (random(0,99) < 60) then
			AddEventItem(111) 
			Msg2Player("LÊy ®­îc D¹ Minh ch©u ")
			AddNote("T×m thÊy D¹ Minh ch©u ")
	end
end;
