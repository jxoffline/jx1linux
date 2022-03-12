

function TaskShedule()
	--设置方案名称
	TaskName("Hoa S琻 Чi Chi課")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--设置间隔时间，单位为分钟
	TaskInterval(60) --15一次
	
	--设置触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg(" =================Hoa S琻 Чi Chi課==================");
end

function TaskContent()

	local nHour = tonumber(date("%H"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	

	local bIsStart = 0
	if nHour == 10 or nHour == 22  then
		bIsStart = 1
	elseif (nHour == 15 ) and (nWeek == 6 or nWeek == 0) then
		bIsStart = 1
	end
	
	if bIsStart == 1 then
		GlobalExecute("dwf \\script\\missions\\huashanqunzhan\\missionctrl.lua startHuaShanQunZhanMission()")
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", "Hoa S琻 L穙 T萿  b総 u cho b竜 danh Hoa S琻 Чi Chi課."))
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end


