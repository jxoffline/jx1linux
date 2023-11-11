Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\playerlist.lua")

function OnDeath(nKillerIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local maze = MazeList:Find(player)
	if (maze ~= nil) then
		maze:Kill(player)
	end
end
