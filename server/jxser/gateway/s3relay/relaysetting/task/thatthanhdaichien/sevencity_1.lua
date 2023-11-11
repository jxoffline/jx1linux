Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	TaskName("SevenCityWar start signup")
	TaskInterval(24 * 60)
	TaskTime(18, 0)
	TaskCountLimit(0)
	OutputMsg("==========================================================")
	OutputMsg("[Start][SEVENCITY] §¨ng ký thÊt thµnh ®¹i chiÕn thø 6 18:00 hµng tuÇn")
end

function TaskContent()
	local day = tonumber(date("%w"))
	if (day == 5) then
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:StartSignup",
			0)
		OutputMsg("[SEVENCITY] B¾t ®©× ghi danh thÊt thµnh ®¹i chiÕn")
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
