-- Îå¶¾½ğÉßÑªÌ¶ÃÔ¹¬ Õ½¶·NPC ÑÛ¾µÍõòşÉß01£¨Îå¶¾40¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(143) == 0) and (random(0,99) < 60) then		-- ÔÚÈÎÎñÖĞ£¬°´»úÂÊ´ò³ö¡£
		if (HaveItem(142) == 1) then
			if (random(0,99) < 60) then
				AddEventItem(143)
				DelItem(142)
				AddNote("B¾t lÊy Nh·n Kİnh v­¬ng M·ng Xµ ")
				Msg2Player("B¹n l¹i dïng X¹ h­¬ng ®Ó khèng chÕ nã, vµ cuèi cïng còng ®· b¾t ®­îc ")
			else
				Msg2Player("B¹n thö dïng X¹ h­¬ng ®Ó b¾t Nh·n Kİnh v­¬ng M·ng Xµ, vµ ®· kh«ng cÈn thËn ®Ó nã ch¹y tho¸t ")
			end
		else
			Msg2Player("KŞch ®éc cña Nh·n Kİnh v­¬ng M·ng Xµ kh«ng cã thø nµo s¸nh ®­îc. B¹n kh«ng cã thø X¹ h­¬ng ®Ó kh¾c chÕ nã th× v« ph­¬ng b¾t ®­îc nã ")
		end
	end
end;
