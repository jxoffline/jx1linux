function main()
	if ( GetFightState() == 1 ) then
		SetPos(GetMissionV(homeoutposx), GetMissionV(homeoutposy))
		SetFightState(0)
	else
		SetPos(GetMissionV(centerposx), GetMissionV(centerposy))
		SetFightState(1)
	end
end