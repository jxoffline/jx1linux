Include("\\script\\lib\\awardtemplet.lua")

--Start_Date = 20090623;
BNCQ_End_Date = 20110220;	--ket thuc ho¹t dong
BNCQ_Start_Date = 20110127;
BNCQ_OneDayTime = 60 * 24;
--BNCQ_OnlineAwardItem = "B¸ch niªn chu qu¶"


--tinhpn 20100724: Bach Nien Chu Qua
BNCQ_TASKID_START_SERVERONLINE_TIME = 2778
BNCQ_TASKID_GET_TIMES = 2779
BNCQ_TASKID_ONLINE_TIME = 2780
BNCQ_TASKID_DAILY = 2781


BNCQ_TASKID_BNCQ_USE_TIMES = 2782


function OnlineAward_StartDate() --kiem tra thoi gian dien ra hoat dong online nhan thuong
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate >= BNCQ_Start_Date and nCurDate < BNCQ_End_Date) then
		return 1
	else
		return 0
	end
end

function OnlineAward_Check_TransferLife()
	if (ST_GetTransLifeCount() < 1) then
		if (GetLevel() >= 150) then
			return 1
		else
			return 0
		end
	else
			return 1
	end
end

function OnlineAward_ResetStillOnlineNewDay()
	local taskTemp = GetTask(BNCQ_TASKID_DAILY)
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	if (taskTemp ~= nCurrDate) then
		SetTask(BNCQ_TASKID_DAILY, nCurrDate)
		--SetTask(TASKID_START_SERVERONLINE_TIME, 0)
		
		local nHour = tonumber(GetLocalDate("%H"))
		local nMin = tonumber(GetLocalDate("%M"))
		local nSec = nHour*60*60 + nMin*60
		
		SetTask(BNCQ_TASKID_ONLINE_TIME, nSec)
		OnlineAward_StartTime()
	end
end


function OnlineAward_ResetDaily()
	local taskTemp = GetTask(BNCQ_TASKID_DAILY)
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	if (taskTemp ~= nCurrDate) then
		SetTask(BNCQ_TASKID_DAILY, nCurrDate)
		SetTask(BNCQ_TASKID_START_SERVERONLINE_TIME, 0)
		SetTask(BNCQ_TASKID_ONLINE_TIME, 0)
	end
end

function OnlineAward_StartTime()		
	if (GetGameTime() <= 0) then
		SetTask(BNCQ_TASKID_START_SERVERONLINE_TIME, 1)
	else
		SetTask(BNCQ_TASKID_START_SERVERONLINE_TIME, GetGameTime())
	end
end

function OnlineAward_SummaryOnlineTime()
	--if CheckIPBonus() == 1 then
		if GetTask(BNCQ_TASKID_START_SERVERONLINE_TIME) > 0 then
			local nCurTime =  GetGameTime()
			local nOnlineTime = nCurTime - GetTask(BNCQ_TASKID_START_SERVERONLINE_TIME)
			OnlineAward_AddTime(nOnlineTime)
		end
		SetTask(BNCQ_TASKID_START_SERVERONLINE_TIME, 0)
	--end
end

function OnlineAward_AddTime(nSecond)
	SetTask(BNCQ_TASKID_ONLINE_TIME, GetTask(BNCQ_TASKID_ONLINE_TIME) + nSecond)
end

function OnlineAward_PayTime(nSecond)
	if GetTask(BNCQ_TASKID_ONLINE_TIME) - nSecond >= 0 then
		SetTask(BNCQ_TASKID_ONLINE_TIME, GetTask(BNCQ_TASKID_ONLINE_TIME) - nSecond)
		return 1
	else
		return 0
	end
end

function OnlineAward_ShowTime()
	local nTime = GetTask(BNCQ_TASKID_ONLINE_TIME)
	local nHour = 0
	local nMin = 0
	local nSec = 0
	if nTime > 0 then
		nHour = floor(nTime/3600)
		nMin = floor((nTime - nHour*3600)/60)
		nSec = nTime - nHour*3600 - nMin*60
	end
	return nHour, nMin, nSec
end


