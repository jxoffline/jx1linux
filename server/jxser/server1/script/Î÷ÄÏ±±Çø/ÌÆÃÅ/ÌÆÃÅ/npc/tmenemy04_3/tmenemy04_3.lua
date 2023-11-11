--description: ÌÆÃÅ¹ÖÊ¯ÕóµĞÈË3 20¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(39) == 0)) then		--Ã»ÓĞ¹ÖÊ¯ÕóË¿ÅÁÈı
		AddEventItem(39)
		Msg2Player("Cã ®­îc tÊm kh¨n lôa, trªn ghi ch÷ Gi¶ ")
		AddNote("Cã ®­îc tÊm kh¨n lôa, trªn ghi ch÷ Gi¶ ")
	end
end;
