Include("\\script\\missions\\newcitydefence\\head.lua")

function OnTimer()

State = GetMissionV(MS_STATE) ;
if (State == 0) then
return
end;

SetMissionV(MS_STATE,3);
SetMissionV( MS_CITYDEFENCE, 1 )
CloseMission(MISSIONID)
end;