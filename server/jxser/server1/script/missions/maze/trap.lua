Include("\\script\\missions\\maze\\gate.lua")
Include("\\script\\global\\playerlist.lua")

function main(id)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (player ~= nil) then
		GateList:Trap(id, player)
	end
end
