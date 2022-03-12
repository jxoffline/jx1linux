
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




function TaskShedule()
	--…Ë÷√∑Ω∞∏√˚≥∆
	TaskName("ping_an_ji_jie")
	
	local  nInterval = 30
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(nInterval) --nInterval∑÷÷”“ª¥Œ
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	

	TaskCountLimit(0)

	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "ping_an_ji_jie",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end



function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	
	if nDate < 091211 or nDate > 100124 then
		return
	end

	
	local flag = 0
	
	if ((nTime >= 1900 and nTime < 1930 ) or (nTime >= 1230 and nTime < 1300 )) and ( nWeek == 5 or nWeek == 6 or nWeek == 0) then
		flag = 1		
	end
	
	
	if flag == 1 then
		
		local szExeMsg = "dwf \\script\\missions\\killbossmatch\\ready.lua tbKillBossMatch_ready:StartGame()"
		OutputMsg(szExeMsg)
		GlobalExecute(szExeMsg)
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", "Hoπt ÆÈng mÔa an lµnh bæt Æ«u, k›nh mÍi c∏c ÆÂng Æπo Æ’n ´ng giµ tuy’t b∏o danh tham gia"))
		--tbPos[nId], tbPos[4] = tbPos[4], tbPos[nId]
	end
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end