Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	TaskName( "TÊng chÿ huy Chi’n dﬁch TËng Kim" );
	TaskSetMode(1);
	TaskSetStartDay(1, 3);
	TaskInterval(7);
	TaskTime(2, 0);
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("****************Create XIANGYANG New Battle********")
	battle_StartNewIssue(1, 1 );	
	battle_StartNewIssue(1, 2 );	
	battle_StartNewIssue(1, 3 );	
	OutputMsg("***************************************************")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
