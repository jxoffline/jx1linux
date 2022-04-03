-- NPC Ke trom kinh mach -- Thinh Nguyen
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath(nNpcIndex)
	local tbAwardgive = {
		{szName = "§iÓm Kinh NghiÖm", nExp = 5e6},
		{szName = "Ch©n nguyªn ®¬n", tbProp = {6, 1, 4804 , 0, 0 ,0}, nCount=1},
		{szName = "Hé m¹ch ®¬n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nCount=50},
		{szName = "§¹i hé m¹ch ®¬n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nCount=1},
	}
	tbAwardTemplet:GiveAwardByList(tbAwardgive, "NhiÖm vô reset kinh m¹ch, KillBossExp")
end