-- ½­ÄÏÇø ÂÞÏüÉ½ Õ½¶·_ÔÆ²¿É½Ó¥.lua £¨ÏûÃð²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-28)

function OnDeath()
	Uworld43 = GetTask(43)
	if (Uworld43 >= 60) and (Uworld43 < 69) then			-- Ã»É±¹»10¸ö
		SetTask(43,Uworld43 + 1)
		Msg2Player("B¹n giÕt ®­îc mét tªn V©n Bé s¬n ¦ng ")
	elseif (Uworld43 == 69) or (Uworld43 == 70) then		-- ÒÑ¾­É±¹»10¸ö
		SetTask(43,70)
		Msg2Player("B¹n giÕt ®­îc m­êi mÊy tªn V©n Bé s¬n ¦ng, nh×n l¹i xem ¦ng chñ cã ph¶n øng g× kh«ng. ")
	end
end
