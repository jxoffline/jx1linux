--description: 唐门40级任务 青城山普通怪物2
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(44) == 0)) then					--没有蟾蜍的皮
		AddEventItem(44) 
		Msg2Player("L蕐 頲 gan r緉 ")
		AddNote("L蕐 頲 gan r緉 ")
	end
end;
