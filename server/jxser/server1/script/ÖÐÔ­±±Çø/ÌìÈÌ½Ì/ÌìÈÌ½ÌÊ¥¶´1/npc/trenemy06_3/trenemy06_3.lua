--description: ÌìÈÌ½ÌÊ¥¶´Ò»²ãµĞÈËĞ«×Ó¾«¡¡ÌìÈÌ³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	Task_trtmp60 = GetTask(28)
	if (UTask_tr == 60*256+50) and (GetBit(Task_trtmp60,3) == 0) then
		SetTask(28, SetBit(Task_trtmp60,3,1))
		AddNote("LÊy ®­îc khÈu quyÕt giang hå X· T¾c. ")
		Msg2Player("LÊy ®­îc khÈu quyÕt giang hå X· T¾c. ")
	end
end;
