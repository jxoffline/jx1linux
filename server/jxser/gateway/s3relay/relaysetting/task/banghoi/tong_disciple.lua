-- °ï»áÕÐÄ¼µÜ×Ó»î¶¯
Include("\\script\\gb_taskfuncs.lua")
function TaskShedule()
	CHRISMAS_SHREWMOUSE = "TONG_SHREWMOUSE";
	TaskName("TONG_SHREWMOUSE");	
	TaskInterval(15);
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);
	
	TaskTime(nBeginTime, 0);
	OutputMsg("[Start] Ho¹t §éng CHiªu Mé §Ö Tö - 03:00 - 06:00 - 09:00 - 12:00 - 15:00 - 18:00 - 21:00");
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
	GlobalExecute("dwf \\script\\missions\\tong\\tong_disciple\\dis_gmscript.lua tong_opendisciple( 821 )");--821ÎªÕÐÄ¼µÜ×Ó»î¶¯×¼±¸³¡µÄmapid
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
