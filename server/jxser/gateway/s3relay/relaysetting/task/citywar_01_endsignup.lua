Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Phng Tng- b竜 danh ho祅 t蕋");
	-- 星期三
	TaskInterval(1440);	--每天
	
	-- 19点00分结束
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 凤翔编号为1,必须跟citywar.ini中指定的一致
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(1,2) == 1) then
			EndSignUp(1);
		end;
	else
		cw_endsignup_fun(3,1);
	end;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
