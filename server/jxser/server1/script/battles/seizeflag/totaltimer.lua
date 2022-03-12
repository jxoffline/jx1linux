IncludeLib("BATTLE");
Include("\\script\\battles\\seizeflag\\head.lua")

function OnTimer()

State = GetMissionV(MISSIONID) ;
if (State == 0) then
return
end;

--BT_GetGameData(GAME_CAMP1)
--BT_GetGameData(GAME_CAMP2)

SetMissionV(MS_STATE,3);
CloseMission(MISSIONID)
end;