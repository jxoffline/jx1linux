Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName("SevenCityWar clear data after war")
	TaskInterval(24 * 60)
	TaskTime(23, 50)
	TaskCountLimit(0)
	-- 输出启动消息
	OutputMsg("[SEVENCITY]task[clear after war] loaded")
end

function TaskContent()
	local day = tonumber(date("%w"))
	-- 周五
	if (day == 5) then
		BattleWorld:Clear()
--		RemoteExecute(
--			REMOTE_SCRIPT,
--			"RelayProtocol:Prepare",
--			0)
		OutputMsg("[SEVENCITY]clear data")
	end
end
