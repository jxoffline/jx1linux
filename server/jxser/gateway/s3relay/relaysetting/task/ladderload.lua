-- 战役系统
-- Fanghao_Wu 2004-12-6
function GameSvrConnected(dwGameSvrIP)
	SyncAllLadder(dwGameSvrIP)
end;
function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	-- 设置方案名称
	TaskName( "Relay B秐g x誴 h筺g" );
	-- 10分钟一次
	TaskInterval( 2440 );
	-- 设置触发次数，0表示无限次数
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "Ladder startup..." );
	for i=10001, 10300 do 
		LoadLadder(i)
	end
	
end

function TaskContent()
	OutputMsg( "SDBLadder Loaded" );
end