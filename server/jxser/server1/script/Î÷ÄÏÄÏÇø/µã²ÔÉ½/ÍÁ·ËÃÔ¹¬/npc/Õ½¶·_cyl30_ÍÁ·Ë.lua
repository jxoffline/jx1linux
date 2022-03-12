-- µ„≤‘…Ω ’Ω∂∑NPC Õ¡∑À£®¥‰—Ã√≈30º∂»ŒŒÒ£©
-- by£∫Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 30*256+20) and (random(0,100) < 50) then				-- 30º∂»ŒŒÒ÷–£¨50%ª˙¬ 
		SetTask(6,30*256+30)
		AddNote("ß∑ c¯u ch∏u g∏i cÒa ßoπn Hoa N´ng tı tay t™n thÊ phÿ Î ßi”m H≠¨ng s¨n. ")
		Msg2Player("ß∑ c¯u ch∏u g∏i cÒa ßoπn Hoa N´ng tı tay t™n thÊ phÿ Î ßi”m H≠¨ng s¨n. ")
	end
end;
