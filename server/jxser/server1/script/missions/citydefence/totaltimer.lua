Include("\\script\\missions\\citydefence\\head.lua")

function OnTimer()

State = GetMissionV(MS_STATE) ;
if (State == 0) then
return
end;

SetMissionV(MS_STATE,3);
CloseMission(MISSIONID)
end;