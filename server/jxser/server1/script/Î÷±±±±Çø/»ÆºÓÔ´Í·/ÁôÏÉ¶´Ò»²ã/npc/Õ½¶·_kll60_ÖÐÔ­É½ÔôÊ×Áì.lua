-- 黄河源头留仙洞迷宫1F 战斗NPC 山贼01（昆仑出师任务）
-- by：Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if (UTask_kl == 60*256+20) and (HaveItem(11) == 0) and (random(1,99) < 60) then
		AddEventItem(11)
		Msg2Player("L蕐 頲 Ph鬰 Hy t醓 ")
		AddNote("L蕐 頲 Ph鬰 Hy t醓 ")
	end
end;
