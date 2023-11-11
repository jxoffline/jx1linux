--description: ÌÆÃÅ¹ÖÊ¯ÕóµĞÈË4 20¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(40) == 0)) then		--Ã»ÓĞ¹ÖÊ¯ÕóË¿ÅÁËÄ
		AddEventItem(40)
		Msg2Player("Cã ®­îc tÊm kh¨n lôa, trªn ghi ch÷ Tö ")
		AddNote("Cã ®­îc tÊm kh¨n lôa, trªn ghi ch÷ Tö ")
	end
end;
