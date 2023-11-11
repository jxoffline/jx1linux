Include( "\\script\\missions\\leaguematch\\head.lua" )

function InitMission()
	SetMissionV(WLLS_MSV_MSID, WLLS_MSID_SCHEDULE);

	RunMission(WLLS_MSID_SCHEDULE)
end;

function RunMission()
end;

function EndMission()
	wlls_remove_camp(0)	--移出所有剩余人员（比赛取消或者有异常时）
end;

function OnLeave(plidx)
	--晕，好像没有这个函数就会报错！？
end;
