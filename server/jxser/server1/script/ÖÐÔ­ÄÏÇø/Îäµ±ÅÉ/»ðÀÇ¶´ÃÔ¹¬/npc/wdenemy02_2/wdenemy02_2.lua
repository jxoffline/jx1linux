--description: Îäµ±É½ »ðÀÇ¶´ÃÔ¹¬µÐÈË
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+50) and (HaveItem(67) == 0) then
		Talk(2,"","Hu hu hu! V× ch¸u cÇm chiÕc Thiªn Tµm nµy míi bÞ Sãi ®á l«i ®Õn ®©y, qu¼ng ®i lµ xong th«i!","§õng vøt ®i! H·y ®­a cho ta!")
		AddEventItem(67)
		Msg2Player("Cøu ®­îc con trai «ng ¤ng chñ tiÖm t¹p hãa T­¬ng D­¬ng, nã tÆng cho b¹n 1 c¸i Thiªn Tµm. ")
--		SetTask(5, 26)
		AddNote("§¸nh b¹i sãi hoang trong Háa Lang ®éng, cøu ®­îc con trai «ng «ng chñ tiÖm t¹p hãa T­¬ng D­¬ng, cã 1 c¸i Thiªn Tµm. ")
	end
end;
