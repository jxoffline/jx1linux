Include("\\script\\mission\\tongcastle\\tongcastle.lua")

function TaskShedule()	
	TaskName("tongcastle Npc reload")
	TaskInterval(1)
	-- 设置触发时间
	local nHour = tonumber(date("%H"))
	local nMinute = tonumber(date("%M")) + 1
	
	if nMinute == 60 then
		nMinute = 0
		nHour = nHour + 1
		if nHour == 24 then
			nHour = 0
		end
	end
	
	TaskTime(nHour, nMinute)
	OutputMsg("tongcastle Npc reload")
	-- 执行无限次
	TaskCountLimit(0)
	
end

function TaskContent()
	tbS3TongCastle:CheckAndReviveTree()
	tbS3TongCastle:CheckAndDeleteTree()
end

function GameSvrConnected(dwGameSvrIP)
end

function GameSvrReady(dwGameSvrIP)
end