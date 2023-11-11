function TaskShedule()
	TaskName( "Chi’n dﬁch T≠¨ng D≠¨ng (TËng Kim) 20:00" );
	TaskInterval( 1440 );
	TaskTime( 19, 50 );
	TaskCountLimit( 0 );
	OutputMsg("[Start] TËng Kim 20:00");
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
