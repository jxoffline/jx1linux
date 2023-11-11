--description: 秦陵地下一层敌人
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 30*256+20) and (HaveItem(59) == 0) then
		AddEventItem(59)
		Msg2Player("Л頲 B秓 Th筩h C竝 Huy誸 H錸g. ")
		AddNote("T筰 T莕 L╪g a, nh b筰 t猲 tr閙 B秓 Ng鋍, 頲 B秓 Th筩h C竝 Huy誸 H錸g. ")
	end
end;	
