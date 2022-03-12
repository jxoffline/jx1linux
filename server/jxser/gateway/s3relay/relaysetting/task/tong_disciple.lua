-- 帮会招募弟子活动
Include("\\script\\gb_taskfuncs.lua")
function TaskShedule()
	CHRISMAS_SHREWMOUSE = "TONG_SHREWMOUSE";
	TaskName("TONG_SHREWMOUSE");	

	-- 3个小时一次，单位分钟
	TaskInterval(15);
	-- 设置触发时间
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);
	
	TaskTime(nBeginTime, 0);
	OutputMsg(format("TONG_SHREWMOUSE will start at %d:%d...", nBeginTime, 0));
	-- 执行无限次
	TaskCountLimit(0);
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 3);
end

function TaskContent()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	nResult = hourcheck(nHour, nMin);
	if (nResult == 0) then
		return
	end

	OutputMsg("TONG_SPFESTIVAL is SignUp Time");
	GlobalExecute("dwf \\script\\missions\\tong\\tong_disciple\\dis_gmscript.lua tong_opendisciple( 821 )");--821为招募弟子活动准备场的mapid
end

function hourcheck(nHour, nMin)
	if (mod(nHour, 3) ~= 0) then
		return 0
	end
	if (nMin > 55) then
		return 0;
	end;
	return 1
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
