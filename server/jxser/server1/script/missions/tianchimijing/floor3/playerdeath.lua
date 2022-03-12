Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

function OnDeath(nNpcIndex)
	local nLevel = GetLevel()
	Game:WritePlayerLog(3, "Tö vong, ®¼ng cÊp"..nLevel)
	--Transfer player to city immediatly when player die - Modified By DinhHQ - 20120409
	NewWorld(78,1483,3168)
end