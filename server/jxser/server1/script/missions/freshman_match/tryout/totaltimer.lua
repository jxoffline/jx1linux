Include("\\script\\missions\\championship\\tryout\\head.lua")
function OnTimer()
	state = GetMissionV( MS_STATE ) ;
	if (state == 0) then
		return
	end;
	SetMissionV( MS_STATE, 3 );
	CloseMission( MISSIONID )
end