--description: ≥…∂º“∞Õ‚“∞÷Ì  ¿ΩÁ»ŒŒÒ
--author: yuanlan	
--date: 2003/4/1

function OnDeath()
	Uworld11 = GetTask(11)
	if (Uworld11 < 255) and (Uworld11 >= 1) and (random(0,99) < 10) then		-- »ŒŒÒ÷–£¨10%º∏¬ 
		if (Uworld11 < 10) then					-- µΩ¥Ô Æ÷ª∫Û≤ª‘Ÿº∆ ˝
			Uworld11 = Uworld11 + 1
			SetTask(11,Uworld11)
			Msg2Player("Ta Æ∑ gi’t ch’t 1 con heo rıng chuy™n qu y nhi‘u d©n lµng, tr≠Ìc mæt tÊng cÈng Æ∑ gi’t ch’t "..(Uworld11 - 1).."Con ")
		else
			SetTask(11,100)
			Msg2Player("Ta Æ∑ gi’t ch’t 10 con heo rıng, c„ th” trÎ v“ phÙc m÷nh Æ≠Óc rÂi ")
		end
	end
end;
