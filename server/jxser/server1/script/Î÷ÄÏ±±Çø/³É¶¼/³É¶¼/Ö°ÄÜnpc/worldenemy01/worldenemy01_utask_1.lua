--description: 成都野外野猪 世界任务战斗死亡
--author: yuanlan	
--date: 2003/4/1



function worldenemy01_UTask_1()

Task0009 = GetTaskTemp(9)

if (Task0009 < 10) then		--到达十只后不再计数
	Task0009 = Task0009 + 1	
	SetTaskTemp(9, Task0009)
end;
	
end;	
