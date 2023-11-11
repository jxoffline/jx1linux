--description: ½£¸óÊñµÀËøÔÆ¶´µĞÈË
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) then	
		Msg2Player("B¾n chÕt mét tªn hä Liªu kh¸c thÕ th©n ")
	end
end;
