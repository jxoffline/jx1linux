Include("\\script\\event\\zhongqiu_jieri\\2010\\head.lua")

function TaskShedule()
	TaskName("tbMidAut2010");
	local nStartHour = tonumber(date("%H")) + 1;
	if (nStartHour >= 24) then nStartHour = 0; end
	TaskTime(nStartHour, 0);
	TaskInterval(30);
	TaskCountLimit(0);	
	tbMidAut2010:LoadData();
end

function TaskContent()
	
	local nCurDay = tonumber(date("%Y%m%d"));
	if nCurDay < 20100920 or 20101018 <= nCurDay then
		return 
	end
	
	local nCurHours = tonumber(date("%H"));
	if nCurHours ~= 20 then
		return
	end
	
	local nCurMin = tonumber(date("%M"));
	if nCurMin <= 15 then
  	-- 20:00 开烟火
		tbMidAut2010:Fireworks();
	else
		-- 20:30 清数据
		tbMidAut2010:ClearData();
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
