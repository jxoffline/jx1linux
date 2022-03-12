-- 战役系统
-- Fanghao_Wu 2004-12-6
local nStartDate	 = 20110202;
local nCloseDate	 = 20110205;		

function TaskShedule()
	-- 设置方案名称
	TaskName( "сn giao th鮝 2011" );
	TaskInterval( 1440 );
	TaskTime( 21, 0 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "Giao thua 2011 start..." );
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M%S"));

	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\vng_event\\LunarYear2011\\giao_thua\\giao_thua_2011.lua",	"GiaoThua_2011:CallAddNpc", 0)
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
