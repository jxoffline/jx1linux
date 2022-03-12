-- function TaskShedule()
-- 	--设置方案名称
-- 	TaskName("Phong L╪g ")
-- 	local nStartHour = tonumber(date("%H")) + 1;
	
-- 	if (nStartHour >= 24) then
-- 		nStartHour = 0;
-- 	end;
	
-- 	TaskTime(nStartHour, 0);
	
-- 	--设置间隔时间，单位为分钟
-- 	TaskInterval(60) --60分钟一次
	
-- 	--设置触发次数，0表示无限次数
-- 	TaskCountLimit(0)
-- 	OutputMsg("=================Phong l╪g ==================");
-- end

function TaskShedule()
	TaskName("Phong L╪g ")
	TaskInterval(1440) --60分钟一次
	TaskTime(14, 0);
	TaskCountLimit(0)
	OutputMsg("=================Phong l╪g ==================");
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end