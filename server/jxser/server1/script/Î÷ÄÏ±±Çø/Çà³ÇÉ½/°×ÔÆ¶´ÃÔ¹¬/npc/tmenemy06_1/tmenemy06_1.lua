--description: 唐门30级任务 青城山白云洞绑匪
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+20) then 
		Talk(1,"","H�! Mu鑞 nh b筰 ta �! ng tng r籲g d� d祅g 畂箃 頲 'H醓 Kh� Ph�'. Th祅h th藅 n鉯 v韎 ngi, 'H醓 Kh� Ph�' 產ng  trong rng b竨. Ch譨 kh鉧 rng ta  trong ng, ngi c� gi醝 h穣 v祇 ng m� t譵!")
		SetTask(2, 30*256+30)
		AddNote("Цnh b筰 Чi u M鬰 Cu錸g Sa, bi誸 頲 Ho� Kh� Ph� 頲 c蕋 trong m閠 b秓 rng. C莕 ph秈 t譵 頲 ch譨 kh鉧! ")
		Msg2Player("Цnh b筰 Чi u M鬰 Cu錸g Sa, bi誸 頲 Ho� Kh� Ph� 頲 c蕋 trong m閠 b秓 rng. C莕 ph秈 t譵 頲 ch譨 kh鉧! ")
	end
end;	
