Include("\\script\\missions\\tongcastle\\tongcastle.lua")

function main(nTrapId)
	local _,_, nMapIndex = GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	TongCastle:TrapMoveTo(nMapId, nTrapId)
end
