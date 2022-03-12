-- µ„≤‘…Ω∂Ò∞‘∂¥ ’Ω∂∑NPC £ø£ø£ø01£®¥‰—Ã√≈40º∂»ŒŒÒ£©
-- by£∫Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(197) == 0) and (random(0,100) < 50) then			-- 50%µƒª˙¬ ≥…π¶
		AddEventItem(197)
		Msg2Player("L y Æ≠Óc ch◊a kho∏ ßÂng ")
		AddNote("T◊m Æ≠Óc ch◊a kho∏ ßÂng ")
	end
end;
