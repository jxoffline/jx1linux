Include("\\script\\missions\\tianchimijing\\floor4\\gamefloor4.lua")
function main()
	GameFloor4:MoveToTrap(PlayerIndex, "\\settings\\maps\\tianchimijing\\floor4\\fighttosafe2.txt")	
	SetFightState(0)	
end