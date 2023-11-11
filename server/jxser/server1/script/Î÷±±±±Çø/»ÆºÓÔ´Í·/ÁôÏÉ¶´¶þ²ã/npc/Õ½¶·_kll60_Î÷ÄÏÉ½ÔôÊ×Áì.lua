-- 黄河源头留仙洞迷宫2F 战斗NPC 山贼02（昆仑出师任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(12) == 0) and (random(1,99) < 50)) then
		AddEventItem(12)
		Msg2Player("L蕐 頲 kh鉧 Vi猰 д ")
		AddNote("L蕐 頲 kh鉧 Vi猰 д ")
	end
end;
