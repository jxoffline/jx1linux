Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Tng Dng - b竜 danh ho祅 t蕋");
	-- 星期四
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 襄阳编号为5,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(5,2) == 1) then
			EndSignUp(5);
		end
	else
		cw_endsignup_fun(4,5)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
