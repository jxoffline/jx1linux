-- 武夷山迷宫 战斗NPC ？？02（五毒30级任务）
-- by：Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 30*256+20) and (HaveItem(221) == 0) and (random(0,99) < 40) then
		AddEventItem(221)
		AddNote("Цnh b筰 ph秐 , l蕐 l筰 頲 M閏 Hng жnh th藅 ")
		Msg2Player("Цnh b筰 ph秐 , l蕐 l筰 頲 M閏 Hng жnh th藅 ")
	end
end;
