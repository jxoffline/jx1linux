--description: ÇàÂÝµºÉ½¶´µÐÈË
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 60*256+40) and (HaveItem(96) == 0) and (random(0,99) < 25) then
		AddEventItem(96)
		Msg2Player("§o¹t l¹i Thiªn V­¬ng Di Th­ tõ tay bän s¸t thñ Kim quèc. ")
--		SetTask(3, 66)
		AddNote("Trong s¬n ®éng Thanh Loa ®¶o, ®¸nh b¹i tªn cÇm ®Çu bän s¸t thñ §å Nh©n, ®o¹t l¹i Thiªn V­¬ng Di Th­. ")
	end
end;	
