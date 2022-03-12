-- µ„≤‘…Ω∂Ò∞‘∂¥ ’Ω∂∑NPC £ø£ø£ø03£®¥‰—Ã√≈40º∂»ŒŒÒ£©
-- by£∫Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(198) == 0) and (random(0,100) < 30) then				-- 30%µƒª˙¬ ≥…π¶
		AddEventItem(198)
		Msg2Player("L y Æ≠Óc ch◊a kho∏ Bπc ")
		AddNote("T◊m Æ≠Óc ch◊a kho∏ Bπc ")
	end
end;
