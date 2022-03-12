Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Tng Dng - b竜 danh b総 u");
	-- 星期四
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 襄阳编号为5,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(5,1) == 1) then
			StartSignUp(5);
		end
	else
		cw_startsignup_fun(4,5)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
