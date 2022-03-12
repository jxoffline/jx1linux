Include("\\script\\missions\\sevencity\\war.lua")

function main(index)
	local player = Player:New(PlayerIndex)
	local src = SubWorldIdx2ID(SubWorld)
	BattleWorld:Trap(player, src, index)
end
