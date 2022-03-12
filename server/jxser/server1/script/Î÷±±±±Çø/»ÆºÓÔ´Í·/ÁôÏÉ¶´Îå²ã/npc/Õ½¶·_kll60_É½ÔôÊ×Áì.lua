-- 黄河源头留仙洞迷宫5F 战斗NPC 山贼05（昆仑出师任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(15) == 0) and (random(0,99) < 20)) then
		AddEventItem(15)
		Msg2Player("L蕐 頲 kh鉧 Chuy猲 H骳 ")
		AddNote("L蕐 頲 kh鉧 Chuy猲 H骳 ")
	end
end;
