Include([[\script\missions\libfestival\head.lua]]);

function OnTimer()
	local nTimerState = GetMissionV(MS_CO_TIMERSTATE) + 1;
	SetMissionV(MS_CO_TIMERSTATE, nTimerState);	
	
	ontimer_add(nTimerState);
end;
