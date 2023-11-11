function main()

State = GetMissionV(1) ;
if (State == 0) then
return
end;

MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
if ( GetMSIdxGroup(1, MSDIdx) == 1) then 
if (GetMissionV(1) == 2) then 
SetFightState(1)
SetCurCamp(1)
SetPunish(0)
end;
end;
end;
--974£¬ 4171