Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L﹎ An - C玭g th祅h chi課 b総 u ");
	-- 星期日
	TaskInterval(1440);
	
	-- 20点00分开战
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 临安编号为7,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(7,4) == 1) then
			StartCityWar(7);
		end
	else
		cw_start_fun(0,7)	--4代表周4,1代表cw_CanStart(6,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
