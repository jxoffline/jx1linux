--description: ÌÆÃÅôä´äºşµĞÈË 20¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+40) and (HaveItem(41) == 0) then			-- ¸ÅÂÊÓÉ50%¸ÄÎª100%
		AddEventItem(41) 
		Msg2Player("Cã ®­îc d©y chuyÒn vµng ")
		AddNote("T¹i hå PhØ Thóy kÕ bªn §­êng Gia B¶o, ®¸nh b¹i Xİch DiÖm Ng¹c, lÊy ®­îc d©y chuyÒn vµng ")
	end
end;
