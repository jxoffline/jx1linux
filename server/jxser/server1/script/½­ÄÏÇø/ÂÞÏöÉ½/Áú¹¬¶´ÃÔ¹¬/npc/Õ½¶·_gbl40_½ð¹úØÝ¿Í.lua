-- 罗霄山 战斗NPC 埋伏金兵 丐帮40级任务
-- by：Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 40*256+10) and (HaveItem(236) == 0) and (random(0,100) < 33) then		--33%几率
		AddEventItem(236)
		AddNote("Цnh b筰 m ph鬰 binh ngi Kim, ph竧 hi謓 ra b鴆 m藅 h祄 li猲 minh ")
		Msg2Player("Цnh b筰 m ph鬰 binh ngi Kim, ph竧 hi謓 ra b鴆 m藅 h祄 li猲 minh ")
	end
end;
