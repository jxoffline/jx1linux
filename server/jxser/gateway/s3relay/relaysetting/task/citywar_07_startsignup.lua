Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L﹎ An - b竜 danh b総 u");
	-- 星期六
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 临安编号为7,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(7,1) == 1) then
			StartSignUp(7);
		end
	else
		cw_startsignup_fun(6,7)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
