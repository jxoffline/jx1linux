Include("\\script\\event\\zhongqiu_jieri\\2012\\head.lua")

function TaskShedule()
	TaskName("Trung Thu 2012");
	local nStartHour = tonumber(date("%H")) + 1;
	if (nStartHour >= 24) then nStartHour = 0; end
	TaskTime(nStartHour, 0);
	TaskInterval(30);
	TaskCountLimit(0);	
	tbzhongqiu:LoadData();
end

function TaskContent()
	local nCurDay = tonumber(date("%Y%m%d"));
	if nCurDay < 20120927 or 20121101 <= nCurDay then
		return 
	end
	local nCurHours = tonumber(date("%H"));
	if nCurHours ~= 20 then
		return
	end
	local nCurMin = tonumber(date("%M"));
	if nCurMin <= 15 then
		OutputMsg("-1-");
  	-- 20:00 ->20:15 k’t qu∂
		tbzhongqiu:Fireworks();
	else
		-- 20:30 sœ reset t t c∂ d˜ li÷u v“ 0
		OutputMsg("-2-");
		tbzhongqiu:ClearData();
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
