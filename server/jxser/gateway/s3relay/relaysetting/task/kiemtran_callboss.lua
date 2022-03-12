--Call Boss
--2013-11-24
--by: NgaVN

nEnd = 201311302400
tbTimer = {[8]=1,[9]=2,[11]=1,[12]=2,[14]=1,[15]=2,[18]=1,[19]=2,[21]=1,[22]=2}

local _GetNextStartTime = function(nStartHour, nStartMinute, nInterval)
	local nNextHour = nStartHour
	local nNextMinute = 0;
	
	if (nStartMinute <= 10) then
		nNextMinute = 10;
	else
		nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	end
	
	if nNextMinute >= 60 then	
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) + 10
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

function TaskShedule()
	TaskName("Hoπt ÆÈng Boss trong event c¯u t´n s≠");
	local nNowHour = tonumber(date("%H"));
	local nNowMin = tonumber(date("%M"));
	local  nInterval = 10;
	local nNextHour,nNextMinute = %_GetNextStartTime(nNowHour,nNowMin,nInterval);
	
	TaskInterval(10);
	TaskTime(nNextHour, nNextMinute);
	TaskCountLimit(0);
end

function TaskContent()
	local nCurHours = tonumber(date("%H"));
	local nCurMin = tonumber(date("%M"));
	local ndate = tonumber(date("%Y%m%d"))
	if not tbTimer[nCurHours] or ndate > nEnd then
		return	
	end
	if tbTimer[nCurHours] == 2 and nCurMin > 0 then
		return
	end
	RemoteExecute("\\script\\vng_event\\eventteacherday\\bossobj.lua", "tbActivityBoss:AddBossObj",0);
	OutputMsg("=Hoπt ÆÈng Boss Ti”u xu t hi÷n=")
end
function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
