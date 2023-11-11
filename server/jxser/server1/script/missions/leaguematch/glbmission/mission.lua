Include( "\\script\\missions\\leaguematch\\head.lua" )

function InitMission()
	--Æô¶¯Timer
	SetGlbValue(GLB_WLLS_TIME, 0)
	StartGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_SCHEDULE, WLLS_TIMER_PREP_FREQ*WLLS_FRAME2TIME)

	RunMission(WLLS_MSID_GLB)
end

function RunMission()
end

function EndMission()
	StopGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_SCHEDULE);
	StopGlbMSTimer(WLLS_MSID_GLB, WLLS_TIMERID_COMBAT);
end
