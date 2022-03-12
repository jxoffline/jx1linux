Include([[\script\missions\tong\collectgoods\head.lua]]);

function OnTimer()
	local nTimerState = GetMissionV(COLLG_MS_TIMERSTATE) + 1;
	nTimerState = mod(nTimerState, 3);
	SetMissionV(COLLG_MS_TIMERSTATE, nTimerState);	--进行0, 1, 2之间转换0－清除怪，1刷怪
	
	if (1 == nTimerState) then
		collg_putfairy();
		return
	elseif (0 == nTimerState) then
		collg_clearfairy();
		return
	end;
end;