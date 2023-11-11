-- ÉÙÁÖÂŞººÕóÃÔ¹¬ Õ½¶·NPC ??01£¨ÉÙÁÖ³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-04)

function OnDeath()
	UTask_sl = GetTask(7)
	if (UTask_sl == 60*256+10) then 		-- and (random(0,99) < 50)) then			-- ÔÚÈÎÎñÖĞ£¬50%»úÂÊ
		i = random(0,4)
		if (i == 1) and (HaveItem(217) == 0) then
			AddEventItem(217)
			Msg2Player("B¹n nhËn ®­îc NiÖm Ch©u. ")
			AddNote("B¹n nhËn ®­îc NiÖm Ch©u. ")
		elseif (i == 2) and (HaveItem(215) == 0) then
			AddEventItem(215)
			Msg2Player("B¹n nhËn ®­îc ThiÒn tr­îng. ")
			AddNote("B¹n nhËn ®­îc ThiÒn tr­îng. ")
		elseif (i == 3) and (HaveItem(216) == 0) then
			AddEventItem(216)
			Msg2Player("B¹n nhËn ®­îc Méc Ng­ ")
			AddNote("B¹n nhËn ®­îc Méc Ng­ ")
		elseif (i == 4) and (HaveItem(214) == 0) then
			AddEventItem(214)
			Msg2Player("B¹n nhËn ®­îc B¸t Vu. ")
			AddNote("B¹n nhËn ®­îc B¸t Vu. ")
		else			-- µÈÓÚ0Ê±£¬²»³öµÀ¾ß
			return 0
		end
	end
end;
