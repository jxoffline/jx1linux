PlayerFloor2 = {}

function PlayerFloor2:OnLeaveMap()
	DisabledUseTownP(0)
	SetFightState(0)
end

function PlayerFloor2:OnEnterMap()
	DisabledUseTownP(1)--不能回城符
	SetLogoutRV(1);
	SetFightState(0)
end

function PlayerFloor2:OnDeath()
end