function OnDeath()
	if (GetTask(126) == 45) then
		SetTask(126,50)
		Msg2Player("GiÕt chÕt kÎ thÇn bİ, gi¶i cøu §oµn T­ Thµnh ")
		AddNote("GiÕt chÕt kÎ thÇn bİ, gi¶i cøu §oµn T­ Thµnh ")
		Talk(1,"Uworld126_kill","SÏ cã ng­êi ®Õn t×m ng­¬i b¸o thï cho ta. ")
	end
end

function Uworld126_kill()
	SetFightState(0)
	NewWorld(162,1531,3157)
end
