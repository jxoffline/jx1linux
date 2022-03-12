Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Th祅h Й-b竜 danh b総 u");
	-- 星期一
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 成都编号为2,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(2,1) == 1) then
			StartSignUp(2);
		end
	else
		cw_startsignup_fun(1,2)
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
