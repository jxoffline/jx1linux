--description: ½£¸óÊñµÀËøÔÆ¶´µĞÈË
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) and (HaveItem(159) == 0) then					--È¡Ïû¶ÔÈÎÎñÎïÆ·ÓĞÎŞµÄÅĞ¶Ï£¬ÒÔ±ãÖØ×öÈÎÎñ
		AddEventItem(159)
		Msg2Player("B¾t dÔ dµng tªn hä Liªu, trªn ng­êi h¾n t×m ®­îc mét bøc mËt th­ viÕt göi triÒu ®×nh nhµ Tèng. ")
--		SetTask(4, 45)
		AddNote("B¾t ®­îc tªn hä Liªu t¹i KiÕm C¸c §éc ®¹o, To¶ V©n ®éng, lÊy ®­îc mét bøc mËt th­ göi cho Tèng quèc. ")
	end
end;
