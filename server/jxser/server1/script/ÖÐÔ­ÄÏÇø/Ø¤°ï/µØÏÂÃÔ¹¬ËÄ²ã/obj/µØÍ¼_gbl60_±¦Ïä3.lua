-- Ø¤°ïÃØ¶´ ±¦Ïä3 ³öÊ¦ÈÎÎñ£¨ËÄÂ¥£¬Á½¸ö£¬¶ÔÓ¦²¼´ü4¡¢²¼´ü5£©
-- by£ºDan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		Msg2Player("Më b¶o r­¬ng ra.")
		i = 0
		if ((HaveItem(209) == 0) and (random(0,99) < 40)) then
			AddEventItem(209)
			AddNote("B¹n lÊy ®­îc 4 chiÕc tói v¶i ")
			i = i + 1
		end
		if ((HaveItem(210) == 0) and (random(0,99) < 40)) then
			AddEventItem(210)
			AddNote("B¹n lÊy ®­îc 5 chiÕc tói v¶i ")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("B¹n lÊy ®­îc 2 chiÕc tói v¶i ")
		elseif (i == 1) then
			Msg2Player("B¹n lÊy ®­îc mét chiÕc tói v¶i ")
		else
			Msg2Player("B¹n thÊt väng v× chiÕc r­¬ng nµy trèng rçng.")
		end
	else
		Talk(1,"","B¶o r­¬ng nµy ®· khãa råi")
	end
end;
