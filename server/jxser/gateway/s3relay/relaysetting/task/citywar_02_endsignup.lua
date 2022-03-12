Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Th祅h Й-b竜 danh ho祅 t蕋");
	-- 星期一

	-- 一周一个循环
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 成都编号为2,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(2,2) == 1) then
			EndSignUp(2)
		end
	else
		cw_endsignup_fun(1,2);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
