function TaskShedule()
	TaskName("Thi ®Êu 'Th¸ch thøc thêi gian'");	
	local nStartHour = tonumber(date("%H")) + 1;
	if (nStartHour == 23) then
		nStartHour = 0;
	end;
	TaskTime(nStartHour, 0);
	TaskInterval(60) 
	TaskCountLimit(0)
	OutputMsg("=======================================================")
	OutputMsg("[Start]		 V­ît ¶i B¾t §Çu Vµo C¸c Giê");
	OutputMsg("	01:00 - 03:00 - 05:00 - 07:00 - 09:00 - 11:00");
	OutputMsg("	13:00 - 15:00 - 17:00 - 19:00 - 21:00 - 23:00");
end

function TaskContent()
	local TB_TIME_START =
	{
		1,3,5,7,9,11,13,15,17,19,21,23,
	}
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_TIME_START do
		if (nhour == ndate_hour) then
			OutputMsg("®ang bao danh thi ®Êu 'Th¸ch thøc thêi gian'");
			GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
			szMsg = "Thêi gian b¸o danh 'Th¸ch thøc thêi gian' ®· b¾t ®Çu, c¸c ®éi tr­ëng h·y mau ®Õn NhiÕp ThÝ TrÇn ë c¸c thµnh thÞ b¸o danh. Thêi gian b¸o danh lµ 10 phót."
			GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
