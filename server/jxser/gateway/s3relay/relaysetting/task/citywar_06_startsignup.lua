Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Dng Ch﹗ - b竜 danh b総 u");
	-- 星期日
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 扬州编号为6,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(6,1) == 1) then
			StartSignUp(6);
		end
	else
		cw_startsignup_fun(0,6)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
