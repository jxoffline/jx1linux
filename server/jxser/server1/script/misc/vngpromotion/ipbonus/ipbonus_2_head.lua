IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\basic.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

IP_EXTPOINT 								= 4 								-- Ext used for IP Bonus
IP_BIT 											= 1 								-- Bit check
IP_Name										= "IP Bonus 3"				-- Event Name
IP_SWITCH 									= 1 								-- Open or close event

TASKID_ONLINE_TIME					= 2931							-- Total online time
TASKID_START_ONLINE_TIME	= 2932							-- Login Time

TASKID_GET_LAST_DATE			= 2933
TASKID_GET_TIMES					= 2934 							--NhËn Lam B¶o H¹p 6 lÇn/ngµy
TASKID_USE_LAST_DATE 			= 2935
TASKID_GREEN_USE_TIMES 		= 2936
TASKID_YELLOW_USE_DATE		= 2937							-- New Task, must check?

--TASKID_CUR_GREEN_EXP			= 2635
TASKID_CUR_GREEN_EXP			= 2787							-- Reset current Green Exp

MAX_GREEN_EXP						= 30e8
GREEN_ITEM_EXP						= 20e6

YELLOW_ITEM_EXP						= 1e9

TASKID_DAILY_X2TONGKIM		= 2785							-- Reset daily TK
TASKID_COUNT_X2TONGKIM		= 2786							-- Count quest TK
TASKID_RECIEVE_BONUS_TK	= 2784							

IPBONUS_EVENT_START_DATE = 201203220000
IPBONUS_EVENT_END_DATE = 201204052400
TASKID_ONLINE_TIME_GET_YELLOW_BOX					= 2929							-- Total online time to get yellow box
tbBITTSK_CHECK_GET_YELLOW_BOX = {
	nTaskID = 2930,
	nStartBit = 1,
	nBitCount = 1,
	nMaxValue = 1,
}

function IpBonus_Start()		
	if CheckIPBonus() == 1 then
		SetTask(TASKID_START_ONLINE_TIME, GetGameTime())
		IpResetTask()
	end
end

function IpBonus_Close()
	if CheckIPBonus() == 1 then
		if GetTask(TASKID_START_ONLINE_TIME) > 0 then
			local nCurTime =  GetGameTime()
			local nOnlineTime = nCurTime - GetTask(TASKID_START_ONLINE_TIME)
			IpBonus_Add(nOnlineTime)
		end
		SetTask(TASKID_START_ONLINE_TIME, 0)
	end
end

function IpResetTask()
 	nDate = tonumber(date("%Y%m%d"))
 	if nDate ~= GetTask(TASKID_GET_LAST_DATE) then
 		SetTask(TASKID_GET_TIMES,0)
 		SetTask(TASKID_GET_LAST_DATE,nDate)
 	end 	
 	if nDate ~= GetTask(TASKID_USE_LAST_DATE) then
 		SetTask(TASKID_GREEN_USE_TIMES,0)
 		SetTask(TASKID_USE_LAST_DATE,nDate)
 	end
end

function IpBonus_Add(nSecond)
	SetTask(TASKID_ONLINE_TIME, GetTask(TASKID_ONLINE_TIME) + nSecond)
	SetTask(TASKID_ONLINE_TIME_GET_YELLOW_BOX, GetTask(TASKID_ONLINE_TIME_GET_YELLOW_BOX) + nSecond)
end

function IpBonus_Minus(nSecond)
	if GetTask(TASKID_ONLINE_TIME) - nSecond >= 0 then
		SetTask(TASKID_ONLINE_TIME, GetTask(TASKID_ONLINE_TIME) - nSecond)
		return 1
	else
		return 0
	end
end

function IpBonus_Minus_Yellow_Box(nSecond)
	if GetTask(TASKID_ONLINE_TIME_GET_YELLOW_BOX) - nSecond >= 0 then
		--SetTask(TASKID_ONLINE_TIME_GET_YELLOW_BOX, GetTask(TASKID_ONLINE_TIME_GET_YELLOW_BOX) - nSecond)
		return 1
	else
		return 0
	end
end

function ShowTime()
	local nTime = GetTask(TASKID_ONLINE_TIME)
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

function ShowTimeYellowBox()
	local nTime = GetTask(TASKID_ONLINE_TIME_GET_YELLOW_BOX)
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

function IsIPBonus()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= IPBONUS_EVENT_START_DATE and nCurDate < IPBONUS_EVENT_END_DATE and IP_SWITCH == 1 then
		return 1
	end	
	return nil
end

function CheckIPBonus()
	local nExtValue = GetExtPoint(IP_EXTPOINT)	
	if (GetBit(nExtValue,IP_BIT) == 1) then
		return 1
	else
		return 0
	end
end

function IsCharged()
	if (GetExtPoint(0) >= 1) then
		return 1;
	else
		return 0;
	end;
end;

function GetNextExpireTime(nCurTime, nDay)
	local nEndYear = floor(nCurTime / 10000 );
	if (nEndYear == 0) then
		nCurTime = nCurTime + 65536;
		nEndYear = floor( nCurTime / 10000 );
	end;
	local nEndMonth = mod( floor( nCurTime / 100 ), 100 );
	local nEndDay = mod( nCurTime, 100 );
	
	nEndDay = nEndDay + nDay
	if (nEndMonth == 1 or nEndMonth == 3 or nEndMonth == 5 or nEndMonth == 7 or nEndMonth == 8 or nEndMonth == 10) then
		if (nEndDay > 31) then
			nEndDay = nEndDay - 31
			nEndMonth = nEndMonth + 1
		end
	elseif (nEndMonth == 4 or nEndMonth == 6 or nEndMonth == 9 or nEndMonth ==11) then
		if (nEndDay > 30) then
			nEndDay = nEndDay - 30
			nEndMonth = nEndMonth + 1
		end
	elseif (nEndMonth == 2) then
		if mod(nEndYear,4) == 0 and mod(nEndYear,100) == 0 then
			if (nEndDay > 29) then
				nEndDay = nEndDay - 29
				nEndMonth = nEndMonth + 1
			end
		else
			if (nEndDay > 28) then
				nEndDay = nEndDay - 28
				nEndMonth = nEndMonth + 1
			end
		end
	elseif (nEndMonth == 12) then
		if (nEndDay > 31) then
			nEndDay = nEndDay - 31
			nEndMonth = 1
			nEndYear = nEndYear + 1
		end
	end	
	
	if nEndMonth < 10 then
		nEndMonth = "0"..nEndMonth
	end
	if nEndDay < 10 then
		nEndDay = "0"..nEndDay
	end
	local nNextDate = nEndYear..nEndMonth..nEndDay
	return tonumber(nNextDate)
end