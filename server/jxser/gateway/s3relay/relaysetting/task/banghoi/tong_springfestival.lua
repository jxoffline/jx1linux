-- °ï»á¸ÏÀÏ»¢»î¶¯
Include("\\script\\gb_taskfuncs.lua");
function TaskShedule()
	FESTIVAL_SHREWMOUSE = "TONG_SPFESTIVAL";
	TaskName("TONG_SPFESTIVAL");	
	TaskInterval(15);
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);

	TaskTime(nBeginTime, 0); 
	OutputMsg("[Start] Ho¹t §éng §¸nh Niªn Thó - 01:00 - 04:00 - 07:00 - 10:00 - 13:00 - 16:00 - 19:00 - 22:00");
	
	TaskCountLimit(0);	
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
	GlobalExecute("dwf \\script\\missions\\tong\\tong_springfestival\\sf_gmscript.lua tong_openspringfestival( 823 )");--823ÎªTONG_SPFESTIVAL×¼±¸³¡mapid
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
