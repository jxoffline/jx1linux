--¡Ÿ∞≤ª π¨√ÿµ¿ ’Ω∂∑NPC ª π¨Œ¿ ø£®ÿ§∞Ô50º∂»ŒŒÒ£©
-- by£∫Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 50*256+40) and (random(0,99) < 20) then				--10%º∏¬ £®∏ƒŒ™20£¨º”¥Û“ª±∂2004-01-13£©
		SetTask(8,50*256+50)
		AddNote("ß∏nh ng∑ t™n v÷ s‹ cÒa Hoµng cung Æang b∂o v÷ Tµo c´ng c´ng. ")
		Msg2Player("ß∏nh ng∑ t™n v÷ s‹ cÒa Hoµng cung Æang b∂o v÷ Tµo c´ng c´ng. ")
	end
end;
