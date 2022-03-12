--description: ÌìÈÌ½ÌÊ¥¶´¶ş²ãµĞÈË¶¾Ğ«Íõ¡¡ÌìÈÌ³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) and (HaveItem(102) == 0) then
		AddEventItem(102)
		Msg2Player("LÊy ®­îc mét chiÕc ch×a khãa. ")
		AddNote("T¹i tÇng hai Th¸nh ®éng, ®¸nh b¹i §éc YÕt V­¬ng lÊy ®­îc ch×a khãa më r­¬ng b¸u. ")
	end
end;
