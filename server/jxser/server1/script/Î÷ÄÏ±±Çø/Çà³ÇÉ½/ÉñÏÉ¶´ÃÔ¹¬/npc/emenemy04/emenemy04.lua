--description: 峨嵋派 青城山神仙洞敌人
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em == 40*256+10) then	
		SetTask(1, 40*256+20)
	end
end;
