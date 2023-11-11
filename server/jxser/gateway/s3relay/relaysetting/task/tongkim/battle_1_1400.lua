function TaskShedule()
	TaskName( "Chi課 d辌h Tng Dng (T鑞g Kim) 14:00" );
	TaskInterval( 1440 );
	TaskTime( 13, 50 );
	TaskCountLimit( 0 );
	OutputMsg("[Start] T鑞g Kim 14:00");
end

function TaskContent()
--	Battle_StartNewRound( 1, 1 );	-- GM指令，启动低级新战局
--	Battle_StartNewRound( 1, 2 );	-- GM指令，启动中级新战局
	Battle_StartNewRound( 1, 3 );	-- GM指令，启动高级新战局
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
