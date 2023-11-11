--description: ÌìÈÌ½ÌÊ¥¶´¶ş²ã±¦Ïä ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) then
		if (HaveItem(132) == 1) then
			Talk(1,"","B¶o r­¬ng ®· rçng")
		elseif (HaveItem(102) == 1) then
			DelItem(102)
			AddEventItem(132)
--			SetTask(4, 68)
			AddNote("Më r­¬ng b¸u, lÊy ®­îc Thiªn NhÉn th¸nh th­——s¸ch da dª. ")
			Msg2Player("Më r­¬ng b¸u, lÊy ®­îc mét quyÓn s¸ch da dª. ")
		else
			Talk(1,"","Kh«ng cã ch×a khãa, kh«ng më ®­îc r­¬ng.")
		end
	else
		Talk(1,"","Kh«ng cã ch×a khãa, kh«ng më ®­îc r­¬ng.")
	end
end;
