Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Tng Dng - tr薾 L玦 Уi b総 u");
	TaskSetMode(1);
	
	-- 1月6号(星期四)第一次开始
	TaskSetStartDay(1, 6);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 襄阳编号为5,必须跟citywar.ini中指定的一致
	if (cw_CanStart(5,3) == 1) then
		StartArena(5);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
