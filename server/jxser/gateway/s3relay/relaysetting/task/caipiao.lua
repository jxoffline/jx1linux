local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	
	
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	
	if nNextMinute >= 60 then
		
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

Include("\\script\\event\\other\\caipiao\\head_gc.lua")

Include("\\script\\lib\\baseclass.lua")


local tbCaiPiao_TaskShedule = function()
	local nHM = tonumber(date("%H%M"))
	local nWeekDay = tonumber(date("%W%w"))
	local nDay = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d%H%M"))
	
	local nAwardWeekDay = tbCaiPiao:GetCurAwardWeekDay()
	if 201002040000 > nDate or nDate > 201003220000 then
		return 
	end
	
	if tonumber(date("%Y%m%d")) < 20100224 then
		--ÔİÊ±²»¿ª·Å
		return 
	end
	
	
	if (nDay == 5 or nDay == 6 or nDay == 0) then
		if 0800 <= nHM and nHM < 2100  then
			if tbCaiPiao:CheckRound(nWeekDay) ~= 1 then
				tbCaiPiao:NewRound(nWeekDay)
				tbCaiPiao:DebugOut("D÷ liÖu chän sè", nWeekDay, "²»´æÔÚ,ĞÂ½¨Ò»¸ö£¬¿ªÊ¼¾ºÍ¶")
			else
				tbCaiPiao:LoadAllData(nWeekDay)
				tbCaiPiao:DebugOut("D÷ liÖu chän sè", nWeekDay, "¶ÁÈ¡£¬¿ªÊ¼¾ºÍ¶")
			end
		end
	end
	
	
	if nAwardWeekDay ~= nil then
			
		local tbTemp = tbBaseClass:NewClass(tbCaiPiao, nAwardWeekDay)
		
		if mod(nAwardWeekDay, 10) == 0 and tbTemp:CheckRound(nAwardWeekDay) ~= 1 then
			tbTemp:NewRound(nAwardWeekDay)
			tbTemp:DebugOut("ÖÜÈÕ¾¹È»Ã»ÈËÍ¶£¬±ØĞë²úÉúÒ»¸ö", nAwardWeekDay)
		end
		
		if tbTemp:CheckRound(nAwardWeekDay) == 1 then				
			tbTemp:LoadAllData(nAwardWeekDay)
			
			if tbTemp.nStage == 3 then
				tbTemp:DebugOut("ÒÑ¾­ÓĞ½á¹û", nAwardWeekDay)
			else
				tbTemp:CalcResult()
				tbTemp:DebugOut("¡¾¼ÆËã¡¿²ÊÆ±Êı¾İ", nAwardWeekDay)
			end
		else
			tbTemp:DebugOut("D÷ liÖu chän sè", nAwardWeekDay, "²»´æÔÚ£¬²»¼ÆËã½á¹û")
		end
	end
end
function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("VĞ sè ")
	
	local  nInterval = 30
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(nInterval) --nInterval·ÖÖÓÒ»´Î
	--ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı	
	
	TaskCountLimit(0)
	%tbCaiPiao_TaskShedule()
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "caipiao",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	
	%tbCaiPiao_TaskShedule()
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end