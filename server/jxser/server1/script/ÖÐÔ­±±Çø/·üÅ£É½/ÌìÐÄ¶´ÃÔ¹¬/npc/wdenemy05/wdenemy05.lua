--description: ·üÅ£É½ ÌìĞÄ¶´ÃÔ¹¬µĞÈË¡¡Îäµ±50¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	if (UTask_wd == 50*256+20) and (random(0,99) < 33) then
		SetTask(5, 50*256+50)
		Earn(10000)
		Msg2Player("§¸nh b¹i tªn ®Çu môc thæ phØ ThiÕt Cøc, lÊy ®­îc 1 v¹n l­îng bän chóng c­íp ®­îc. ")
		AddNote("T¹i Thiªn T©m ®éng Phôc Ng­u s¬n, ®¸nh b¹i tªn ®Çu môc thæ phØ ThiÕt Cøc, lÊy ®­îc 1 v¹n l­îng. ")
	end
end;
