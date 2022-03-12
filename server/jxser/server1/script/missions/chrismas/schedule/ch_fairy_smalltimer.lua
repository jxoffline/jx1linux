Include([[\script\missions\chrismas\ch_head.lua]]);

function OnTimer()
	local nTimerState = GetMissionV(MS_TIMERSTATE) + 1;
	nTimerState = mod(nTimerState, 3);
	SetMissionV(MS_TIMERSTATE, nTimerState);	--进行0, 1, 2之间转换0－清除怪，1刷怪
	
	if (1 == nTimerState) then
		putfairy();
		return
	elseif (0 == nTimerState) then
		clearfairy();
		return
	end;
end;