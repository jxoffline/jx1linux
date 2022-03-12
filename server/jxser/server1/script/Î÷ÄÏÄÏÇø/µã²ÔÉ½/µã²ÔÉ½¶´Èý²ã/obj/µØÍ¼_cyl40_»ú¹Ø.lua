-- µã²ÔÉ½¶ñ°Ô¶´ Â·ÈËNPC »ú¹Ø£¨´äÑÌÃÅ40¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) then
		if (HaveItem(197) == 1) and (HaveItem(196) == 1) and (HaveItem(198) == 1) then		--´ø×Å40¼¶ÈÎÎñ²¢ÇÒÔ¿³×ÆëÈ«
			DelItem(197)
			DelItem(196)
			DelItem(198)
			SetTask(6,40*256+30)
			AddNote("§¸nh b¹i trî thñ cña tªn ¸c b¸, lÊy ba ch×a khãa më cöa ba phßng tèi cøu nh÷ng thiÕu n÷ bŞ b¾t kh¸c. ")
			Msg2Player("§¸nh b¹i trî thñ cña tªn ¸c b¸, lÊy ba ch×a khãa më cöa ba phßng tèi cøu nh÷ng thiÕu n÷ bŞ b¾t kh¸c. ")
		else
			Msg2Player("B¹n t×m ra c¬ quan phßng tèi giam c¸c thiÕu n÷, nh­ng cÇn cã 3 chiÕc ch×a khãa míi më ®­îc c¬ quan nµy. ")
		end
	else
		Msg2Player("ë ®©y cã mét c¬ quan nh­ng kh«ng biÕt dïng lµm g×. ")
	end
end;
