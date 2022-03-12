Include("\\script\\lib\\awardtemplet.lua")

function OnDeath(nNpcIndex)
	local tbAwardgive = {
		{szName = "ßi”m kinh nghi÷m", nExp = 5e5},
		{szName = "HÈ mπch Æ¨n", tbProp = {6, 1, 3203 , 0, 0 ,0}, nCount=100},
		{szName = "ßπi hÈ mπch Æ¨n", tbProp = {6, 1, 4418 , 0, 0 ,0}, nCount=1},
	}
	tbAwardTemplet:GiveAwardByList(tbAwardgive, "Nvu Nguy÷t Ca ß∂o, KillBossExp")
end
