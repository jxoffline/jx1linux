-- Ω£∏Û Òµ¿µ¡æ≠»À√‘π¨ ’Ω∂∑NPC £ø£ø 30º∂»ŒŒÒ
-- by£∫Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7)
	if (UTask_sl == 30*256+20) and (HaveItem(27) == 0) and (random(0,99) < 40) then
		AddEventItem(27)
		Msg2Player("Mang v“ Thuy“n nh≠Óc ba la mÀt Æa t©m kinh ")
		AddNote("Mang v“ Thuy“n nh≠Óc ba la mÀt Æa t©m kinh ")
	end
end;
