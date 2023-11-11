Include([[\script\missions\libfestival\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_CO_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CO_MAPID[2]);
	StartMissionTimer(CO_MISSIONID, CO_FAIRY_SMALLTIMERID, CO_INTERVER);	--刷怪计时器
	StartMissionTimer(CO_MISSIONID, CO_REPORT_SMALLTIMERID, CO_RUNINTERVER);     --报道计时器
	SubWorld = OldSubWorld;
end;

function EndMission()
	EndMission_add();
	StopMissionTimer(CO_MISSIONID, CO_FAIRY_SMALLTIMERID);
	StopMissionTimer(CO_MISSIONID, CO_REPORT_SMALLTIMERID);
end;

function OnLeave()
	SetLogoutRV(0);
end



