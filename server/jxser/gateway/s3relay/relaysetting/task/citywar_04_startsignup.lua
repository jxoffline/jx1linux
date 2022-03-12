Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi謓 Kinh-b竜 danh b総 u");
	-- 星期五
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 汴京编号为4,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(4,1) == 1) then
			StartSignUp(4);
		end
	else
		cw_startsignup_fun(5,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
