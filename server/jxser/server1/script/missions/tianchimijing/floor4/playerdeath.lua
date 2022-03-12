Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

function OnDeath(nNpcIndex)
	local nLevel = GetLevel()
	Game:WritePlayerLog(4, "Tö vong, ®¼ng cÊp"..nLevel)
	NewWorld(78,1483,3168)
end