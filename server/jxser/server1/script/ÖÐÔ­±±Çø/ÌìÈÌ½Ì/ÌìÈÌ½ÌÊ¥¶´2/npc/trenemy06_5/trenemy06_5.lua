--description: 天忍教圣洞二层敌人毒蝎王　天忍出师任务
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) and (HaveItem(102) == 0) then
		AddEventItem(102)
		Msg2Player("L蕐 頲 m閠 chi誧 ch譨 kh鉧. ")
		AddNote("T筰 t莕g hai Th竛h ng, nh b筰 чc Y誸 Vng l蕐 頲 ch譨 kh鉧 m� rng b竨. ")
	end
end;
