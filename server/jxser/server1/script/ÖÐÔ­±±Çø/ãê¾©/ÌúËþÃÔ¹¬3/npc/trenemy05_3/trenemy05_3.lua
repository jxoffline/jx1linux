--description: ãê¾©¸®ÌúËşÈı²ãµĞÈË
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetBit(GetTask(21),3)
	if (UTask_tr == 50*256+20) and (UTask_trsub01 == 0) and (HaveItem(162) == 0) and (random(0,99) < 25) then
		AddEventItem(162)
		Msg2Player("NhËn ®­îc chiÕc ch×a khãa thø ba ")
		AddNote("T¹i tÇng thø ba ThiÕt Th¸p, ®¸nh b¹i vÖ binh, LÊy ®­îc ch×a khãa më c¬ quan thø ba ")
	end
end;
