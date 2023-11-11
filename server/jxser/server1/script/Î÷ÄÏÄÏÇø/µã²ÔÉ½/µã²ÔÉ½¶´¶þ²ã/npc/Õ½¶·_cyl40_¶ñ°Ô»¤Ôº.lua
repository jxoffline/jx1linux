-- µ„≤‘…Ω∂Ò∞‘∂¥ ’Ω∂∑NPC £ø£ø£ø02£®¥‰—Ã√≈40º∂»ŒŒÒ£©
-- by£∫Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(196) == 0) and (random(0,100) < 40) then				-- 40%µƒª˙¬ ≥…π¶
		AddEventItem(196)
		Msg2Player("L y Æ≠Óc ch◊a kho∏ sæt ")
		AddNote("T◊m ra ch◊a kho∏ sæt ")
	end
end;
