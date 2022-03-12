-- Ø¤°ïÃØ¶´ ±¦Ïä1 ³öÊ¦ÈÎÎñ£¨Ò»Â¥£¬Ò»¸ö£¬¶ÔÓ¦²¼´ü1¡¢²¼´ü2£©
-- by£ºDan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 1) then
		Msg2Player("B¹n thö dïngch×a khãamë chiÕc r­¬ng ")
		DelItem(203)
		i = 0
		if ((HaveItem(211) == 0) and (random(0,99) < 60)) then
			AddEventItem(211)
			AddNote("LÊy ®­îc chiÕc tói thø nhÊt ")
			i = i + 1
		end
		if ((HaveItem(201) == 0) and (random(0,99) < 60)) then
			AddEventItem(201)
			AddNote("LÊy ®­îc chiÕc tói thø hai ")
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
