--description: 唐门40级任务 青城山五种特色怪物（耿子奇宠物2）
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if (UTask_tm == 40*256+20) then	
		SetTaskTemp(4,SetBit(GetTaskTemp(4),2,1))		-- 只要在任务中，就强迫设置临时变量第2位
	end
end;
