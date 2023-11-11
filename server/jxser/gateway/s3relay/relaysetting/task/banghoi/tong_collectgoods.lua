-- 帮会招募弟子活动
Include("\\script\\gb_taskfuncs.lua");
function TaskShedule()
	FESTIVAL_SHREWMOUSE = "Thu th藀 v藅 ph萴 bang h閕";
	TaskName("Thu th藀 v藅 ph萴 bang h閕");	
	TaskInterval(15);
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);
	TaskTime(nBeginTime, 0);
	OutputMsg("[Start] Ho箃 чng Thu Th藀 V藅 Ph萴 - 02:00 , 05:00, 08:00, 11:00, 14:00, 17:00, 20:00, 23:00");
	TaskCountLimit(0);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 3);
end

function TaskContent()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	nResult = hourcheck(nHour, nMin);
	if (nResult == 0) then
		return
	end

	OutputMsg("Ho箃 ng thu th藀 v藅 ph萴 bang h閕  b総 u cho b竜 danh.");
	GlobalExecute("dwf \\script\\missions\\tong\\collectgoods\\collg_gmscript.lua collg_opencellectgoods( 827 )");	--827为帮会收集物品活动准备场的mapid
end

function hourcheck(nHour, nMin)
	if (mod(nHour, 3) ~= 2) then
		return 0;
	end
	if (nMin > 55) then
		return 0;
	end;
	return 1;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
