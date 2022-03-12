Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi謓 Kinh-b竜 danh ho祅 t蕋");
	-- 星期五
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 汴京编号为4,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(4,2) == 1) then
			EndSignUp(4);
		end
	else
		cw_endsignup_fun(5,4)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
