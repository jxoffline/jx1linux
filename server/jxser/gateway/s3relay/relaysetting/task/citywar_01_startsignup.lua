Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Phng Tng- b竜 danh b総 u");
	
	-- 星期三
	TaskInterval(1440);
	
	-- 18点00分开始
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 凤翔编号为1,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(1,1) == 1) then
			StartSignUp(1);
		end;
	else
		cw_startsignup_fun(3,1);
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
