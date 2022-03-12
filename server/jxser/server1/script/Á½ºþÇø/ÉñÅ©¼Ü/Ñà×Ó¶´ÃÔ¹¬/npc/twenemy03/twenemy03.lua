--description: ÉñÅ©¼Ü Ñà×Ó¶´µÐÈË
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 30*256+20) and (HaveItem(145) == 0) and (random(0,99) < 50) then
		AddEventItem(145)
		Msg2Player("§¸nh b¹i bän c­íp, ®o¹t l¹i Thiªn V­¬ng lÖnh. ")
--		SetTask(3, 35)
		AddNote("T¹i Miªu LÜnh YÕn Tö ®éng ®¸nh b¹i tªn B¸o Tö cÇm ®Çu bän c­íp ®o¹t l¹i Thiªn V­¬ng lÖnh. ")
	end
end;
