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

local _IsOpenModule = function ()
	
	return gb_GetModule("chunjie2009_dangboss")
end

Include("\\script\\gb_modulefuncs.lua")

function TaskShedule()
	--…Ë÷√∑Ω∞∏√˚≥∆
	TaskName("Hoπt ÆÈng Æ u ng≠u")
	
	local  nInterval = 60
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(nInterval) --nInterval∑÷÷”“ª¥Œ
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	
	
	TaskCountLimit(0)

	
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "Hoπt ÆÈng Æ u ng≠u",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	
	
	if %_IsOpenModule() ~= 1 then
		return 
	end

	
	if nDate < 100610 or nDate > 100627 then
		return
	end
	local flag = 0
	
	
		
	if (nTime >= 2000 and nTime < 2200) then
		flag = 1
	end
	if flag == 1 then
		local szMsg = "Hoπt ÆÈng Æ u ng≠u Æ∑ bæt Æ«u,  m‰i ng≠Íi c„ th” Æ’n b∏o danh Î ch≠Îng Æ®ng cung n˜ Î L©m An"
		local szExec = format("dwf \\script\\missions\\dangboss\\dangbaossclass.lua tbDangBoss:StartGame()")
		OutputMsg(szMsg)
		GlobalExecute(szExec)
		
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end