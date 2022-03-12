Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("L﹎ An - b竜 danh ho祅 t蕋");
	-- 星期六
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 临安编号为7,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(7,2) == 1) then
			EndSignUp(7);
		end
	else
		cw_endsignup_fun(6,7)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
