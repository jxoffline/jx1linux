YueGeDaoPlayer = {}

function YueGeDaoPlayer:OnLeaveMap()
	SetTmpCamp(0)
	DisabledStall(0)	--°ÚÌ¯
	SetFightState(0)
end

function YueGeDaoPlayer:OnEnterMap()
	SetLogoutRV(1)
	SetTmpCamp(1)
	DisabledStall(1)	--°ÚÌ¯
	SetFightState(1)
end

function YueGeDaoPlayer:OnDeath()
end
