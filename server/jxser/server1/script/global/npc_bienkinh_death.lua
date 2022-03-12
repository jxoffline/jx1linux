--Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath(nNpcIndex)
	--local tbAward = {
		--{szName = "Ch©n nguyªn ®¬n", tbProp = {6, 1, 4804 , 0, 0 ,0}, nRate = 20, nCount=1},
		--{szName = "Hé m¹ch ®¬n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nRate = 50, nCount=2},
		--{szName = "§¹i hé m¹ch ®¬n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nRate = 80, nCount=1},
	--}
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "cöa biÖn kinh", 1)
	--local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 10e6}
	--tbAwardTemplet:Give(tbExpAward, 1, {"NhiÖm vô reset kinh m¹ch", "KillBossExp"})
	local tbAwardgive = {
		{szName = "§iÓm Kinh NghiÖm", nExp = 5e6},
		{szName = "Ch©n nguyªn ®¬n", tbProp = {6, 1, 4804 , 0, 0 ,0}, },
		{szName = "Hé m¹ch ®¬n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nCount=50},
		--{szName = "§¹i hé m¹ch ®¬n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nCount=1},
	}
	tbAwardTemplet:GiveAwardByList(tbAwardgive, "cöa biÖn kinh, KillBossExp")
end