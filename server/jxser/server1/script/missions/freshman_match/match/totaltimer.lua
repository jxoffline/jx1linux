Include("\\script\\missions\\freshman_match\\match\\head.lua")
function OnTimer()
	state = GetMissionV( MS_STATE ) ;
	if (state == 0) then
		return
	end;
	SetMissionV( MS_STATE, 3 );
print("match over!!!!**************************************************************over")
	CloseMission( MISSIONID )
end