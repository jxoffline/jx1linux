-- »ÆºÓÔ´Í·ÃÔ¹¬ ±¦Ïä À¥ÂØ³öÊ¦ÈÎÎñ
-- by£ºDan_Deng(2003-07-31)

function main()
	UTask_kl = GetTask(9)
	if (UTask_kl == 60*256+20) then
		if ((HaveItem(11) == 1) and (HaveItem(12) == 1) and (HaveItem(13) == 1) and (HaveItem(14) == 1) and (HaveItem(15) == 1)) then
			DelItem(11)
			DelItem(12)
			DelItem(13)
			DelItem(14)
			DelItem(15)
			AddEventItem(16)
			AddNote("Ph¸i lÊy Ngò S¾c Th¹ch ")
			Msg2Player("B¹n dïng 5 chiÕc ch×a khãa treo phİa trªn ®Ó më r­¬ng lÊy Ngò S¾c Th¹ch ")
		else
			Talk("Kh«ng cã 5 chiÕc ch×a khãa kia, b¹n kh«ng thÓ më ®­îc r­¬ng ®Ó lÊy ®¸ ")
		end
	else
		Talk(1,"","B¶o r­¬ng nµy ®· khãa råi")
	end
end;
