--description: Îäµ±É½ »ğÀÇ¶´ÃÔ¹¬µĞÈË
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+20) and (HaveItem(66) == 0) then
		AddEventItem(66)
		Msg2Player("T×m ®­îc Thiªn Tµm ®¹o bµo bŞ r¸ch. ")
--	SetTask(5, 23)	
		AddNote("Vµo Háa Lang ®éng, ®¸nh b¹i sãi löa lÊy ®­îc Thiªn Tµm ®¹o bµo bŞ c¾n r¸ch. ")
	end
end;
