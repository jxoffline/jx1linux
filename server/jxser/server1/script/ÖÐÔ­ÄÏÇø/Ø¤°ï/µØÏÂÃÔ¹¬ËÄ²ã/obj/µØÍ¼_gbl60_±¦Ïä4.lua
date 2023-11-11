-- Ø¤°ïÃØ¶´ ±¦Ïä4 ³öÊ¦ÈÎÎñ£¨ËÄÂ¥£¬Ò»¸ö£¬¶ÔÓ¦²¼´ü6¡¢²¼´ü7£©
-- by£ºDan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(204) == 1)) then
		Msg2Player("B¹n thö dïngch×a khãamë chiÕc r­¬ng ")
		DelItem(204)
		if (HaveItem(206) == 0) then
			AddEventItem(206)
			AddNote("B¹n lÊy ®­îc tói v¶i thø s¸u ")
			Msg2Player("B¹n lÊy ®­îc mét chiÕc tói v¶i ")
		elseif (HaveItem(207) == 0) then
			AddEventItem(207)
			AddNote("B¹n lÊy ®­îc tói v¶i thø b¶y ")
			Msg2Player("B¹n lÊy ®­îc mét chiÕc tói v¶i ")
		else
			Msg2Player("B¹n thÊt väng v× chiÕc r­¬ng nµy trèng rçng.")
		end
	else
		Talk(1,"","B¶o r­¬ng nµy ®· khãa råi")
	end
end;
