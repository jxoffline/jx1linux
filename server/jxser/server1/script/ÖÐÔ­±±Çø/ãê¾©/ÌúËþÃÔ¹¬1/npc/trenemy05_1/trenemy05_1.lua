--description: ãê¾©¸®ÌúËşÒ»²ãµĞÈË
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetBit(GetTask(21),1)
	if (UTask_tr == 50*256+20) and (UTask_trsub01 == 0) and (HaveItem(160) == 0) then
		AddEventItem(160)
		Msg2Player("NhËn ®­îc chiÕc ch×a khãa thø nhÊt ")
		AddNote("T¹i tÇng thø nhÊt ë ThiÕt th¸p, ®¸nh b¹i vÖ binh Tèng, lÊy ®­îc chiÕc ch×a khãa ®Ó më c¬ quan thø nhÊt ")
	end
end;
