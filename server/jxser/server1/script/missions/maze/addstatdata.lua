

local tbTaskStartTime = {}

function SetTaskStartTime(nTaskId, nMazeId, nTime)
	if nTaskId == nil or nMazeId == nil or nTaskId == 0 then
		return 
	end
	if %tbTaskStartTime[nTaskId] == nil then
		%tbTaskStartTime[nTaskId] = {}
	end
	if %tbTaskStartTime[nTaskId][nMazeId] == nil then
		%tbTaskStartTime[nTaskId][nMazeId] = {}
	end
	if nTime == nil then
		nTime = GetCurServerTime()
	end
	%tbTaskStartTime[nTaskId][nMazeId].nTime = nTime
end

function GetTaskStartTime(nTaskId, nMazeId)
	if nTaskId == nil or nMazeId == nil or nTaskId == 0 then
		return 
	end
	if %tbTaskStartTime[nTaskId] == nil then
		return
	end
	if %tbTaskStartTime[nTaskId][nMazeId] == nil then
		return
	end
	return %tbTaskStartTime[nTaskId][nMazeId].nTime
end

function AddStatDataTaskTimeClear(nTaskId, nMazeId)
	if nTaskId == 0 then
		return
	end 
	if %tbTaskStartTime[nTaskId][nMazeId] ~= nil then
		%tbTaskStartTime[nTaskId][nMazeId] = nil
	end
	if getn(%tbTaskStartTime[nTaskId]) == 0 then
		%tbTaskStartTime[nTaskId] = nil
	end
	return
end

function AddStatDataTaskFinishedTime(nTaskId, nMazeId, nTime)
	if nTaskId == nil or nMazeId == nil or nTaskId == 0 then
		return 
	end
	local nTaskStart = GetTaskStartTime(nTaskId, nMazeId)
	if nTaskStart == nil then
		return
	end
	if nTime == nil then
		nTime = GetCurServerTime()
	end
	local nDifTime = nTime - nTaskStart
	local szTaskFinishedTimeKeyName = format("migong_wanchengshijian%d", nTaskId)
	if nDifTime > 0 then
		AddStatData(szTaskFinishedTimeKeyName, nDifTime)
	end
	AddStatDataTaskTimeClear(nTaskId, nMazeId)
end

function AddStatDataTaskStartCount(nTaskId, nCount)
	if nTaskId == nil or nTaskId == 0 then
		return 
	end
	if nCount == nil then
		nCount = 1
	end
	local szTaskStartKeyName = format("migong_kaiqi%d", nTaskId)
	AddStatData(szTaskStartKeyName, nCount)
end

function AddStatDataTaskFinishedCount(nTaskId, nCount)
	if nTaskId == nil or nTaskId == 0 then
		return 
	end
	if nCount == nil then
		nCount = 1
	end
	local szTaskFinishedKeyName = format("migong_wancheng%d", nTaskId)
	AddStatData(szTaskFinishedKeyName, nCount)
end

function AddStatDataPlayerLeaveCount(nTaskId, nCount)
	if nTaskId == nil or nTaskId == 0 then
		return 
	end
	if nCount == nil then
		nCount = 1
	end
	local szPlayerLeaveKeyName = format("migong_siwang%d", nTaskId)
	AddStatData(szPlayerLeaveKeyName, nCount)
end

function AddStatDataFinishedRoom(nCount)
	if nCount == nil then
		nCount = 1
	end
	AddStatData("migong_duiwutongguanshu", nCount)
end

function AddStatDataTeamEnterMazeCount(nCount)
	if nCount == nil then
		nCount = 1
	end
	AddStatData("migong_duiwushu", nCount)
end

function AddStatDataPlayerEnterMazeCount(nCount)
	if nCount == nil then
		nCount = 1
	end
	AddStatData("migong_renshu", nCount)
end

function AddStatDataCanEnterMazeCount(nCount)
	if nCount == nil then
		nCount = 1
	end
	AddStatData("migong_huodezigerenshu", nCount)
end