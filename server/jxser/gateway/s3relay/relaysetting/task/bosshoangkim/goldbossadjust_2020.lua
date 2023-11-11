
Include("\\script\\event\\goldboss_adjust_2011\\boss_initialize.lua")

function TaskShedule()
	TaskName( "MAKE GOLDBOSS 20:20" );
	TaskInterval( 1440 );
	TaskTime( 20, 20 );
	TaskCountLimit( 0 );
	OutputMsg("==========================================================");
	OutputMsg("[Start] Boss Mé Dung Toµn 20:20");
end

function TaskContent()
	makeboss_onlyone_pos(3)
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
