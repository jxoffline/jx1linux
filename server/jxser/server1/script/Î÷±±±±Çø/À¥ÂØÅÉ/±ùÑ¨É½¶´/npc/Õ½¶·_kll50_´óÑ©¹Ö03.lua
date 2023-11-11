-- ±ùÑ¨ÃÔ¹¬ Õ½¶·NPC ??03£¨À¥ÂØ50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	x = 3
	if (UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (GetBit(UTask_kl,x) == 0) then		--50¼¶ÈÎÎñÖĞÇÒÎ´É±¹ı´ËÖ»Ñ©¹Ö
		i = SetBit(UTask_kl,x,1)
		if (i == 50*256+64+31) then		-- ·ûºÏ³öÔ¿³×Ìõ¼ş
			SetTask(9,50*256+127)
			AddNote("Trªn ®­êng ®i B¹n giÕt ®­îc v« sè TuyÕt qu¸i, cuèi cïng t×m ®­îc chç tró Èn cña qu¸i nh©n ")
			Msg2Player("Trªn ®­êng ®i B¹n giÕt ®­îc v« sè TuyÕt qu¸i, cuèi cïng t×m ®­îc chç tró Èn cña qu¸i nh©n ")
		else
			SetTask(9,i)		-- ·ñÔò¾Í±£´æ±äÁ¿
			Msg2Player("B¹n tiÕn s©u vµo trong hang ®éng, trªn ®­êng ®i giÕt chÕt mét con TuyÕt qu¸i ")
		end
	end
end;
