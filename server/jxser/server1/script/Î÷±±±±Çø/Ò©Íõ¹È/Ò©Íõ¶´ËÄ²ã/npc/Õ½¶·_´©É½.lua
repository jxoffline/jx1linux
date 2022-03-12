-- Î÷±±±±Çø Ò©Íõ¹È Ò©Íõ¶´ËÄ²ã Õ½¶·_´©É½.lua  £¨Ð¡¶ùÊ§×ÙÈÎÎñ£©
-- By: Dan_Deng(2004-05-27)

function OnDeath(sel)
	Uworld42 = GetTask(42)
	if (Uworld42 >= 20) and (Uworld42 < 29) then
		SetTask(42,Uworld42 + 1)
		Msg2Player("GiÕt chÕt 1 tªn Xuyªn s¬n. ")
	elseif (Uworld42 == 30) or (Uworld42 == 29) then
		SetTask(42,30)
		Msg2Player("§· giÕt chÕt 10 tªn Xuyªn s¬n, cã thÓ b¸o cho l·o ®¹o nh©n quÌ. ")
	end
end
