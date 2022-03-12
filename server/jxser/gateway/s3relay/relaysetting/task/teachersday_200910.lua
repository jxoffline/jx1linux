Include("\\script\\gb_taskfuncs.lua")

local nStartDate	 = 20091116;
local nCloseDate	 = 21091202;			

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
	TaskName("Hoπt ÆÈng nhµ gi∏o vi÷t nam----ßo∏n hoa Æ®ng");
	
	local  nInterval = 15
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(nInterval) --nInterval∑÷÷”“ª¥Œ
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	

	TaskCountLimit(0)
	OutputMsg("Hoπt ÆÈng nhµ gi∏o vi÷t nam----ßo∏n hoa Æ®ng");
end

function TaskContent()
	
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M%S"));

	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	
	--if (110000 <= nTime and nTime <= 120000) or (190000 <= nTime and nTime <= 200000) then
	if (143000 <= nTime and nTime <= 153000) or (200000 <= nTime and nTime <= 210000) then
		OutputMsg("[2009Teacher's Day] tbJiaoShi2009:AddHuaDeng()");
		GlobalExecute("dwf \\script\\event\\jiaoshi_jieri\\200910\\huadeng_fresh.lua tbJiaoShi2009:AddHuaDeng()");
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end