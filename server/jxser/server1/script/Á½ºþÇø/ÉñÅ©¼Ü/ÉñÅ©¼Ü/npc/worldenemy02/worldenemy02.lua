--description: 神农架地表黑叶猴 世界任务
--author: yuanlan	
--date: 2003/4/30
-- Update: Dan_Deng(2003-09-16)暂时屏蔽任务，以后重写

function OnDeath()
	UTask_world03 = GetTask(15);
	if (1 == 0) and (UTask_world03 == 1) and (GetTaskTemp(13) < 10) then		--到达十只后不再计数
		UTask_world03 = UTask_world03 + 1	
		SetTaskTemp(13, UTask_world03)
	end
end
