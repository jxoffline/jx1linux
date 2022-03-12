--description: 天忍教圣洞一层敌人毒蛇精　天忍出师任务
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	Task_trtmp60 = GetTask(28)
	if (UTask_tr == 60*256+50) and (GetBit(Task_trtmp60,1) == 0) then
		SetTask(28, SetBit(Task_trtmp60,1,1))
		AddNote("L蕐 頲 kh萿 quy誸 Thi猲 мa Huy襫 Ho祅g. ")
		Msg2Player("L蕐 頲 kh萿 quy誸 Thi猲 мa Huy襫 Ho祅g. ")
	end
end;
