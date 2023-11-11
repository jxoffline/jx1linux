function TaskShedule()
	-- 设置方案名称
	TaskName( "Chi課 d辌h Tng Dng (T鑞g Kim) 12:50" );
	TaskInterval( 1440 );
	TaskTime( 11, 50 );
	TaskCountLimit( 0 );
	OutputMsg("[Start] T鑞g Kim 12:00");
end

function TaskContent()
--	Battle_StartNewRound( 1, 1 );
--	Battle_StartNewRound( 1, 2 );
	Battle_StartNewRound( 1, 3 );
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
