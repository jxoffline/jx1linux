Player = {}

function Player:OnLeaveMap()
	Msg2Player("Player:OnLeaveMap()")	
end

function Player:OnEnterMap()
	Msg2Player("Player:OnEnterMap()")	
end

function Player:OnDeath()
	Msg2Player("Player:OnDeath()")	
end