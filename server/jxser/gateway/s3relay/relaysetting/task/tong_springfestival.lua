-- 帮会赶老虎活动
Include("\\script\\gb_taskfuncs.lua");
function TaskShedule()
	FESTIVAL_SHREWMOUSE = "TONG_SPFESTIVAL";
	TaskName("TONG_SPFESTIVAL");	

	-- 3个小时一次，单位分钟
	TaskInterval(15);
	
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);--求出未来3倍数+ 1 的钟头

	TaskTime(nBeginTime, 0); -- 设置触发时间
	OutputMsg(format("TONG_SPFESTIVAL will start at %d:%d...", nBeginTime, 0));
	
	TaskCountLimit(0);	-- 执行无限次
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 3);
end

function TaskContent()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nResult = hourcheck(nHour, nMin);
	if (nResult == 0) then
		return
	end

	OutputMsg("TONG_SPFESTIVAL is SignUp Time");
	GlobalExecute("dwf \\script\\missions\\tong\\tong_springfestival\\sf_gmscript.lua tong_openspringfestival( 823 )");--823为TONG_SPFESTIVAL准备场mapid
end

function hourcheck(nHour, nMin)
	if (mod(nHour, 3) ~= 1) then
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
