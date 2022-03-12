Include("\\script\\mission\\dungeon\\datamanager.lua")
Include("\\script\\mission\\dungeon\\dungeons\\shiliantang\\shiliantangdata.lua")

local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	local nNextHour = nStartHour
	local nNextMinute = 0;
	
	if (nStartMinute <= 10) then
		nNextMinute = 10;
	else
		nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	end
	
	if nNextMinute >= 60 then	
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) + 10
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

function TaskShedule()
	-- 设置方案名称
	TaskName( "Dugeon Timer" );
	local  nInterval = 10
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	TaskTime(nNextHour, nNextMinute);
	TaskInterval(nInterval)
	TaskCountLimit(0);
	-- 输出启动消息
	OutputMsg( "Dugeon Timer Begin, Interval 10 Min" );
	
	tbDDManager:RegTemplate(925, sltData);
	tbDDManager:LoadData();
end

function TaskContent()
	if (GetProductRegion() ~= "vn") then
		return
	end
	
	tbDDManager:Breath();
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end