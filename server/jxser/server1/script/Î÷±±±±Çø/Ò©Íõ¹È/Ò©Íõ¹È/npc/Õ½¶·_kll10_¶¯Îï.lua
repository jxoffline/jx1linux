-- Î÷±±±±Çø Ò©Íõ¹È Õ½¶·NPC £¿£¿ £¨À¥ÂØ10¼¶ÈÎÎñ¡¢³É¶¼²ÉÒ©ÈÎÎñ¡¢È­ÇãÌìÏÂÈÎÎñ£©
-- by£ºDan_Deng(2003-07-30)
-- Update: Dan_Deng(2004-05-24)		È­ÇãÌìÏÂÈÎÎñ

function OnDeath()
	UTask_kl = GetTask(9);
	Uworld132 = GetTask(132)
	if (UTask_kl == 10*256+10) or (Uworld132 == 10) then		--ÈÎÎñÖĞ
		if (HaveItem(112) == 0) then
			AddEventItem(112)
			Msg2Player("LÊy ®­îc Tö Môc Tóc ")
		elseif (HaveItem(113) == 0) then
			AddEventItem(113)
			Msg2Player("LÊy ®­îc §Şa cÈm th¶o ")
		elseif (HaveItem(114) == 0) then
			AddEventItem(114)
			Msg2Player("LÊy ®­îc ThiÕn Th¶o ")
		elseif (HaveItem(115) == 0) then
			AddEventItem(115)
			Msg2Player("LÊy ®­îc Hæ NhÜ Th¶o ")
		elseif (random(0,99) < 50) then
			AddEventItem(116)			-- µÃµ½ÁíÍâËÄÑùºó£¬Èç¹ûÃ»ÓĞÁéÖ¥¾ÍÓĞ50%»ú»á³öÁéÖ¥
			Msg2Player("LÊy ®­îc Linh Chi ")
		end
	elseif (GetTask(75) == 10) and (GetTask(53) == 10) and (random(0,99) < 60) then		-- È­ÇãÌìÏÂÈÎÎñ£¬°´»úÂÊµÃµ½
		AddEventItem(112)
		if (GetItemCount(112) >= 3) then
			Msg2Player("§· h¸i ®­îc 3 ®ãa Tö Môc Tóc, cã thÓ quay vÒ phôc mÖnh ")
		else
			Msg2Player("H¸i ®­îc 1 ®ãa Tö Môc Tóc ")
		end
	end
end;
