-- Õ½¶·_ÔÆ²»Ð°.lua Õ½¶·ÔÆ²»Ð°ËÀÍö½Å±¾
-- By: Xiao_Yang(2004-04-29)

function OnDeath()
	if (GetTask(124) == 35) then
		AddEventItem(387)
		SetTask(124,40)
		Talk(1,"","Ng­¬i. ThËt qu¸ ¸c ®éc! ")
		Msg2Player("B¹n ®¸nh b¹i V©n BÊt Tµ. Lôc so¸t trong ng­êi h¾n t×m thÊy thuèc gi¶i Kú §éc ¢m D­¬ng TiÕu  ")
		SetFightState(0)
		NewWorld(185,1612,3204)
	end
end
