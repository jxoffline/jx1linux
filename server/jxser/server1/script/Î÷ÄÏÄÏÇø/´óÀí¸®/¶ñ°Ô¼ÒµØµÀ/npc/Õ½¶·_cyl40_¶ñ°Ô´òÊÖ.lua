-- ¥Û¿Ì≥«∂Ò∞‘√ÿµ¿ ’Ω∂∑NPC £ø£ø£ø£®¥‰—Ã√≈40º∂»ŒŒÒ£©
-- by£∫Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+10) and (random(0,100) < 40) then				-- 40%µƒª˙¬ ≥…π¶
		SetTask(6,40*256+20)
		AddNote("Gi∂i c¯u nh˜ng thi’u n˜ bﬁ bæt trong mÀt Æπo, Æ≠Óc bi’t t™n ∏c b∏ Æ∑ mang nh˜ng ng≠Íi con g∏i kh∏c Æi ßi”m Th≠¨ng s¨n rÂi. ")
		Msg2Player("ß∏nh bπi trÓ thÒ cÒa t™n ∏c b∏, gi∂i c¯u nh˜ng thi’u n˜ bﬁ bæt trong mÀt Æπo, Æ≠Óc bi’t t™n ∏c b∏ Æ∑ mang nh˜ng ng≠Íi con g∏i kh∏c Æi ßi”m Th≠¨ng s¨n rÂi. ")
	end
end;
