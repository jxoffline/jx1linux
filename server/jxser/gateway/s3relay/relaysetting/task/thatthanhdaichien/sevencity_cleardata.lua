Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	TaskName("SevenCityWar clear data after war")
	TaskInterval(24 * 60)
	TaskTime(23, 50)
	TaskCountLimit(0)
	OutputMsg("[Start][SEVENCITY] X„a d˜ li÷u th t thµnh Æπi chi’n 23:50")
end

function TaskContent()
	local day = tonumber(date("%w"))
	if (day == 5) then
		BattleWorld:Clear()
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:Prepare",
			0)
		OutputMsg("[SEVENCITY] X„a d˜ li÷u th t thµnh Æπi chi’n")
	end
end
