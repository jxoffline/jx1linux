Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Tng Dng - C玭g th祅h chi課 b総 u ");
	-- 星期五
	TaskInterval(1440);
	
	-- 20点00分开战
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 襄阳编号为5,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(5,4) == 1) then
			StartCityWar(5);
		end
	else
		cw_start_fun(5,5)	--4代表周4,1代表cw_CanStart(5,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
