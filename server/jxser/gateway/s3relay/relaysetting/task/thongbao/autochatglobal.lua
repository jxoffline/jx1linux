function GameSvrConnected(dwGameSvrIP)
end;
function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
TaskName( "GlobalExecuteCHAT" );
TaskInterval(15);
TaskCountLimit( 0 );
OutputMsg( "=================GLOBALEXCUTECHAT=================" );
end

function TaskContent()
GlobalExecute("dwf \\script\\global\\autochat.lua globalexcute()")
end