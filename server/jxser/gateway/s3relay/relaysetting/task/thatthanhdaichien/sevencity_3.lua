Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	-- …Ë÷√∑Ω∞∏√˚≥∆
	TaskName("SevenCityWar prepare")
	TaskInterval(24 * 60)
	TaskTime(20, 0)
	TaskCountLimit(0)
	--  ‰≥ˆ∆Ù∂Øœ˚œ¢
	OutputMsg("[Start][SEVENCITY] Chu»n bﬁ b∏t Æ«u th t thµnh Æπi chi’n 20:00")
end

function TaskContent()
	local day = tonumber(date("%w"))
	-- ÷‹ŒÂ
	if (day == 5) then
		BattleWorld:Clear()
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:Prepare",
			0)
		OutputMsg("[SEVENCITY] Chu»n bﬁ b∏t Æ«u th t thµnh Æπi chi’n")
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
