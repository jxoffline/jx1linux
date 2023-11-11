-- ÁúÃÅÕò¿ì»îÁÖÃÔ¹¬ Õ½¶·NPC ½ğË¿ºïÍõ ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

function OnDeath()
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 0) and (HaveItem(117) == 1) then
			DelItem(117)
			AddEventItem(8)
			Msg2Player("Kim T¬ HÇu bÊu chÆt s¬n Lı Hång kh«ng bu«ng, b¹n thõa c¬ b¾t lÊy Kim T¬ HÇu. ")
			AddNote("B¾t ®­îc Kim T¬ HÇu. ")
		else
			Msg2Player("Kim T¬ HÇu thõa lóc b¹n nhÊt thêi l¬ ®Ônh lÎn mÊt. ")
		end
	end
end;
