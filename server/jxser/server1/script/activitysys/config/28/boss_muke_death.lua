Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local tbAward = {
		{szName = "CÈm nang thay ®æi trêi ®Êt", tbProp = {6, 1, 1781 , 1, 0 ,0}, nRate = 100, tbParam = {60}},
	}
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "TiÕt trång c©y 2011, Méc Kh¸ch r¬i ra", 1)
end
