Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Bi謓 Kinh- tr薾 L玦 Уi b総 u");
	TaskSetMode(1);
	
	-- 2005年1月7号(星期五)第一次开始
	TaskSetStartDay(1, 7);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 汴京编号为4,必须跟citywar.ini中指定的一致
	if (cw_CanStart(4,3) == 1) then
		StartArena(4);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
