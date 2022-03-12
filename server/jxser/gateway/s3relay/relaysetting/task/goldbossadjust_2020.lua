
Include("\\script\\event\\goldboss_adjust_2011\\boss_initialize.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName( "MAKE GOLDBOSS 20：20" );
	TaskInterval( 1440 );
	TaskTime( 20, 20 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "MAKE GOLDBOSS murongquan:  20:20" );
end

function TaskContent()
	makeboss_onlyone_pos(3)
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
