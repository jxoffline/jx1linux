Include("\\script\\lib\\objbuffer_head.lua")
nStartHour = 20
nEndHour = 21
nStartDate = 1301030000
nEndDate = 1301312400

local _GetStartTime = function(nNowHour, nNowMin)
	
	local nDate = tonumber(date("%y%m%d%H%M"))
	if nDate < nStartDate or nDate > nEndDate then
		return
	end
	
	nNowHour = mod(nNowHour,24)
	nNowMin = mod(nNowMin,60)
	if nNowHour < nStartHour then
		return nStartHour,0
	end
	if nNowMin >= 30 and nNowMin < 60 then
		return nNowHour+1,0
	elseif nNowMin >= 0 and nNowMin < 30 then
		return nNowHour,10
	end
end


function TaskShedule()
	TaskName("Event Thang 1 - 20:00 -> 2100");
	local nNowHour = tonumber(date("%H"));
	local nNowMin = tonumber(date("%M"));
	local nHour,nMin = %_GetStartTime(nNowHour, nNowMin)
	TaskTime(nHour, nMin);
	TaskInterval(10);
	TaskCountLimit(0);
end

function TaskContent()
	local nDate = tonumber(date("%y%m%d%H%M"));
	local nHM = tonumber(date("%H%M"));
	if tonumber(nDate) >= nStartDate and tonumber(nDate) < nEndDate then
		if nHM >= 2000 and nHM < 2100 then
			--local nPosRandom = random(1,7)
			--Msg2Player("nPosRandom = "..nPosRandom)
			--local handle = OB_Create();
			--ObjBuffer:PushObject(handle, nPosRandom)
			RemoteExecute("\\script\\activitysys\\config\\1015\\extend.lua", "pActivity:GetMerchantPos",0);
			OB_Release(handle);
			OutputMsg("Doi so Ngoc can lam");
		else
			RemoteExecute("\\script\\activitysys\\config\\1015\\extend.lua", "pActivity:ResetExchange",0);	
			OutputMsg("Reset so Ngoc");
		end
	end		
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
