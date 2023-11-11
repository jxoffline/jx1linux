function TaskShedule()
	TaskName( "MAKE GOLDBOSS 20:30" );
	TaskInterval( 1440 );
	TaskTime( 20, 30 );
	TaskCountLimit( 0 );
	OutputMsg("==========================================================");
	OutputMsg( "[Start] 10 Boss Ti”u Hoµng Kim 20:30 (Xu t hi÷n tπi c∏c m´n ph∏i)" );
	OutputMsg("==========================================================");
end

function TaskContent()
	GlobalExecute("dwf \\script\\missions\\boss\\call_small_boss.lua Call_Small_Boss()");
	OutputMsg( "Boss Ti”u Hoµng Kim 20:30 Æ∑ Æ≠Óc g‰i ra" );
end

