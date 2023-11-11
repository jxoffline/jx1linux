-- 药王谷药王洞 战斗NPC 土匪 昆仑20级任务
-- by：Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 20*256+10) and (HaveItem(7) == 0) and (random(0,99) < 60) then
		AddEventItem(7) 
		Msg2Player("L蕐 頲 1 c竔 xng u l筩  ")
		AddNote("L蕐 頲 1 c竔 xng u l筩  ")
	end
end;
