Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Phng Tng- tr薾 L玦 Уi b総 u");
	TaskSetMode(1);
	
	-- 2005年1月5号(星期三)第一次开始
	TaskSetStartDay(1, 5);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 凤翔编号为1,必须跟citywar.ini中指定的一致
	if (cw_CanStart(1,3) == 1) then
		StartArena(1);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
