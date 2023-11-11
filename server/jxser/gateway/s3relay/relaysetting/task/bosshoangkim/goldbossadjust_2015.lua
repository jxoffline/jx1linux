
Include("\\script\\event\\goldboss_adjust_2011\\boss_initialize.lua")

function TaskShedule()
	TaskName( "MAKE GOLDBOSS 20:15" );
	TaskInterval( 1440 );
	TaskTime( 20, 15 );
	TaskCountLimit( 0 );
	OutputMsg("==========================================================");
	OutputMsg( "[Start] Boss Kim Th› L≠Óng 20:15" );
end

function TaskContent()
	makeboss_onlyone_pos(2)
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
