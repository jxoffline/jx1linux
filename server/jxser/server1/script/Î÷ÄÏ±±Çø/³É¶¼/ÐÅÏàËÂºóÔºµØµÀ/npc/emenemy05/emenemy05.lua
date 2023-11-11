--description: ∂Î·“≈… –≈œ‡À¬∫Û‘∫µÿµ¿µ–»À
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if (UTask_em == 50*256+60) and (HaveItem(23) == 1) and (random(0,99) < 30) then							--æ»≥ˆ¥»∫£∑Ω’…µƒ∏≈¬  «30%
		Msg2Player("ß∏nh bπi t™n Ph∂n T®ng Æ«u mÙc, c¯u tho∏t ph≠¨ng tr≠Óng Tı H∂i, giao Kim tuy’n tÛ t≠Óng Kim Cang kinh cho ´ng ta. ")
		DelItem(23)
		SetTask(1, 50*256+80)
		AddNote("ß∏nh bπi t™n Ph∂n T®ng Æ«u mÙc, c¯u tho∏t ph≠¨ng tr≠Óng Tı H∂i, giao Kim tuy’n tÛ t≠Óng Kim Cang kinh cho ´ng ta. ")
	end
end;	
