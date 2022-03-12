Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Dng Ch﹗ - b竜 danh ho祅 t蕋");
	-- 星期日
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 扬州编号为6,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(6,2) == 1) then
			EndSignUp(6);
		end
	else
		cw_endsignup_fun(0,6)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
