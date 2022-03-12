--description: ãê¾©¸®ÌúËş¶ş²ãµĞÈË
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetBit(GetTask(21),2)
	if (UTask_tr == 50*256+20) and (UTask_trsub01 == 0) and (HaveItem(161) == 0) and (random(0,99) < 50) then
		AddEventItem(161)
		Msg2Player("NhËn ®­îc chiÕc ch×a khãa thø hai ")
		AddNote("T¹i tÇng thø hai ThiÕt Th¸p, ®¸nh b¹i vÖ binh, LÊy ®­îc ch×a khãa më c¬ quan thø hai ")
	end
end;
