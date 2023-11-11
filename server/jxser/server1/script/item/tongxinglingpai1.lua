Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
function main()
	local nMapId, nX,nY = GetWorldPos()
	if  GameFloor1.tbMapList[nMapId] ~= 1 then
		Msg2Player("ChØ cã thÓ sö dông t¹i Thiªn Tr× MËt C¶nh tÇng 1")
		return 1
	end
	SetFightState(0)
end