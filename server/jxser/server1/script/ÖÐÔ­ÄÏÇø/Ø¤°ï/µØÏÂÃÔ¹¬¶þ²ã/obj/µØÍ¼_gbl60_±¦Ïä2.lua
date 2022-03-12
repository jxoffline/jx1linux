-- Ø¤°ïÃØ¶´ ±¦Ïä2 ³öÊ¦ÈÎÎñ£¨¶şÂ¥£¬Á½¸ö£¬¶ÔÓ¦²¼´ü3£©
-- by£ºDan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		if (HaveItem(208) == 0) and (random(0,99) < 50) then
			Msg2Player("B¹n më chiÕc r­¬ng ®ã ra, lÊy ®­îc mét c¸i tói v¶i ")
			AddEventItem(208)
			AddNote("LÊy ®­îc chiÕc tói thø ba ")
		else
			Msg2Player("ChiÕc r­¬ng nµy kh«ng cã g× ")
		end
	else
		Talk(1,"","B¶o r­¬ng nµy ®· khãa råi")
	end
end;
