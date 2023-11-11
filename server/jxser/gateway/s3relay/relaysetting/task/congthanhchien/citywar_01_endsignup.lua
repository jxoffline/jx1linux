Include("\\RelaySetting\\Task\\congthanhchien\\citywar_head.lua")
function TaskShedule()
	TaskName("Ph≠Óng T≠Íng- b∏o danh hoµn t t");
	TaskInterval(1440);		
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
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
