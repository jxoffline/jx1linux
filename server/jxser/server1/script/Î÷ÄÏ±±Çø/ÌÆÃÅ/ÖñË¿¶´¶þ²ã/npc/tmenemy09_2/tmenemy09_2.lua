--description: ÌÆÃÅ³öÊ¦ÈÎÎñ ÖñË¿¶´µÚ¶ş²ã¹ÖÎï
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 60*256+40) and (HaveItem(100) == 0) and (random(0,99) <= 30) then 		--¸ÅÂÊÓÉ20%¸ÄÎª30%
		AddEventItem(100) 
		Msg2Player("NhËn ®uîc ch×a khãa thø 3. ")
--		SetTask(2, 66)
		AddNote("T¹i Tróc T¬ §éng tÇng thø hai, ®¸nh b¹i kÎ thï, tiÕn vµo tÇng thø 3. ")
	end
end;	
