function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	AddGlobalNews(PRE_STRGLAOBALNEWS);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 1);
	SetGlbValue(GLB_CO_PHASE, 1);	--可以开始报名了
	StartMissionTimer(CO_PREPAREMISSIONID, CO_PREPARETIME, CO_RUNINTERVER); --
end;

function EndMission()
	StopMissionTimer(CO_PREPAREMISSIONID, CO_PREPARETIME);
	SetGlbValue(GLB_CO_PHASE, 2); --禁止再进来报名
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
	
	festival_gameover(CO_MAPID[1], CO_PREPAREMISSIONID);
end;

function OnLeave()
end
