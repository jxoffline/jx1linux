-- Ø¤°ïÃØ¶´ ±¦Ïä5 ³öÊ¦ÈÎÎñ£¨ÎåÂ¥£¬Á½¸ö£¬¶ÔÓ¦²¼´ü8¡¢²¼´ü9£©
-- by£ºDan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(202) == 1)) then
		Msg2Player("B¹n thö dïngch×a khãamë chiÕc r­¬ng ")
		DelItem(202)
		i = 0
		if (HaveItem(200) == 0) and (random(0,99) < 30) then
			AddEventItem(200)
			AddNote("LÊy ®­îc chiÕc tói thø 8 ")
			i = i + 1
		end
		if (HaveItem(205) == 0) and (random(0,99) < 30) then
			AddEventItem(205)
			AddNote("LÊy ®­îc chiÕc tói thø 9 ")
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
