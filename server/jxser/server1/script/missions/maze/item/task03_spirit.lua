Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

function main()
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (player) then
		local maze = MazeList:Find(player)
		if (not maze) then
			return 1
		end
		local room = maze:FindRoomWithPlayer(player)
		if (not room) then
			return 1
		end
		local task = room.m_Task
		if (not task or task.m_TaskId ~= 3) then
			return 1
		end
		if (task:CallBoss(player) == 1) then
			return 0
		end
	end
	return 1
end
