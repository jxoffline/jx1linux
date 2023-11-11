Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetLevel() < 120) then
		player:Say("CÊp 120 trë lªn míi cã thÓ sö dông Ngäc Long LÖnh Bµi.")
	elseif (MazePermission:CheckPermission(player) == 1) then
		player:Say("Mçi ng­êi ch¬i chØ ®­îc sö dông Ngäc Long LÖnh Bµi mét lÇn")
	else
		MazePermission:Permit(player, nil)
		AddStatDataCanEnterMazeCount(1)
		return 0
	end
	return 1
end
