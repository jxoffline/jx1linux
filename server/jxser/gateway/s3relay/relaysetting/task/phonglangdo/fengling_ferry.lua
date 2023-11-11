function TaskShedule()
	TaskName("Phong L¨ng ®é")
	local nStartHour = tonumber(date("%H")) + 1;
	if (nStartHour == 23) then
		nStartHour = 0;
	end;
	TaskTime(nStartHour, 0);
	TaskInterval(60) 
	TaskCountLimit(0)
	OutputMsg("=======================================================")
	OutputMsg("[Start]		Phong L¨ng §é B¾t §Çu Vµi C¸c Giê");
	OutputMsg("	02:00 - 04:00 - 06:00 - 08:00 - 10:00 - 12:00");
	OutputMsg("	14:00 - 16:00 - 18:00 - 20:00 - 22:00 - 24:00");

end

function TaskContent()
	local TB_TIME_START =
	{
		0,2,4,6,8,10,12,14,16,18,20,22,
	}
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_TIME_START do
		if (nhour == ndate_hour) then
			GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end