--description: 天忍教20级任务 小灰驴
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+50) and (HaveItem(126) == 0) then
		SetPropState()
		AddEventItem(126)
		Msg2Player("T譵 頲 Ti觰 Kh玦 la 甶 l筩. ")
		AddNote("T譵 頲 Ti觰 Kh玦 la. ")
	end
end;	
