Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi謓 Kinh- C玭g th祅h chi課 b総 u ");
	-- 星期六
	TaskInterval(1440);
	
	-- 20点00分开战
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(4,4) == 1) then
			StartCityWar(4);
		end
	else
		cw_start_fun(6,4)	--4代表周4,1代表cw_CanStart(4,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
