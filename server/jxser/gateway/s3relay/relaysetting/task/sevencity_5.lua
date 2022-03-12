Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName("SevenCityWar close")
	TaskInterval(24 * 60)
	TaskTime(21, 30)
	TaskCountLimit(0)
	-- 输出启动消息
	OutputMsg("[SEVENCITY]task[close] loaded")
end

function TaskContent()
	local day = tonumber(date("%w"))
	-- 周五
	if (day == 5) then
		BattleWorld:Close()
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:Close",
			0)
		OutputMsg("[SEVENCITY]close")
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
