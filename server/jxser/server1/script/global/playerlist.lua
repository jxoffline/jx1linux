Include("\\script\\lib\\player.lua")

PlayerList = {m_Map = {}}

function PlayerList:AddPlayer(index, player)
	if (not player) then
		player = Player:New(index)
	end
	self.m_Map[index] = player
end

function PlayerList:DelPlayer(index)
	self.m_Map[index] = nil
end

function PlayerList:GetPlayer(index)
	return self.m_Map[index]
end
