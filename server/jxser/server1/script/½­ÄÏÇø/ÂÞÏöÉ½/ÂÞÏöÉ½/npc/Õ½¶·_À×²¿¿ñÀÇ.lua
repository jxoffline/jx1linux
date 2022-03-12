-- ½­ÄÏÇø ÂÞÏüÉ½ Õ½¶·_À×²¿¿ñÀÇ.lua £¨ÏûÃð²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-28)

function OnDeath()
	Uworld43 = GetTask(43)
	if (Uworld43 >= 20) and (Uworld43 < 29) then			-- Ã»É±¹»10¸ö
		SetTask(43,Uworld43 + 1)
		Msg2Player("B¹n giÕt ®­îc mét tªn L«i bé Cuång Lang ")
	elseif (Uworld43 == 29) or (Uworld43 == 30) then		-- ÒÑ¾­É±¹»10¸ö
		SetTask(43,30)
		Msg2Player("B¹n giÕt ®­îc m­êi mÊy tªn L«i bé Cuång Lang, quay l¹i xem Lang chñ cã ph¶n øng g× kh«ng. ")
	end
end
