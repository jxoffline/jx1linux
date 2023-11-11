--description: »ªÉ½µÐÈË
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_world30 = GetByte(GetTask(30),1)
	if ((UTask_world30 == 5) and (HaveItem(50) == 0) and (random(0,99) < 50)) then
		Talk(1,"","B¹n lÊy ®­îc mét c©y Vò V­¬ng KiÕm! Nh­ng míi võa vung lªn th× nã ®· g·y lµm 3 ®o¹n! TÐ ra lµ kiÕm gi¶!")
		Msg2Player("Ph¸t hiÖn c©y Vò V­¬ng kiÕm gi¶ ")
	end
end;
