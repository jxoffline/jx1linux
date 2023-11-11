--description: ÌÆÃÅ¹ÖÊ¯ÕóµĞÈË2 20¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(38) == 0)) then		--Ã»ÓĞ¹ÖÊ¯ÕóË¿ÅÁ¶ş
		AddEventItem(38)
		Msg2Player("Cã ®­îc tÊm kh¨n lôa, trªn ghi ch÷ SÊm ")
		AddNote("Cã ®­îc tÊm kh¨n lôa, trªn ghi ch÷ SÊm ")
	end
end;
