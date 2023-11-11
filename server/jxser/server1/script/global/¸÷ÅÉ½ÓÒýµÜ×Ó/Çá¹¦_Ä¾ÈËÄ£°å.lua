--两湖区 巴陵县 木人死亡 新手村练级任务(不可重复的任务)
-- Update: Dan_Deng(2003-08-09)

function lEarn()
	UTask_world32 = GetTask(32)
	if (UTask_world32 >= 140) and (UTask_world32 < 190) then
		SetTask(32,GetTask(32)+1)
	end
end;
