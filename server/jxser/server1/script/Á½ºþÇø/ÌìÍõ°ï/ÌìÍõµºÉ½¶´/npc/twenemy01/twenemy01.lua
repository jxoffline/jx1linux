--description: ÌìÍõ°ï ÌìÍõµºÉ½¶´µĞÈË
--author: yuanlan	
--date: 2003/4/24
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 10*256+20) and (GetItemCount("Kª HuyÕt Th¹ch ") < 3) then
		AddEventItem(91)
		Msg2Player("§­îc mét viªn Kª HuyÕt Th¹ch ")
		AddNote("Trong s¬n ®éng ®¶o Thiªn V­¬ng t×m ®­îc mét viªn Kª HuyÕt Th¹ch. ")
	end
end;	
