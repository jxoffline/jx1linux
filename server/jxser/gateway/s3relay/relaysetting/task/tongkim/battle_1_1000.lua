function TaskShedule()
	TaskName( "Chi’n dﬁch T≠¨ng D≠¨ng (TËng Kim) 10:50" );
	TaskInterval( 1440 );
	TaskTime( 9, 50 );
	TaskCountLimit( 0 );
	OutputMsg("==========================================================");
	OutputMsg("[Start] TËng Kim 10:00");
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
