INTERVAL_TIME = 60	

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName("§ua thuyÒn rång");	
	TaskInterval(INTERVAL_TIME);
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg("=======================================================")
	OutputMsg("[Start] §ua thuyÒn rång diÔn ra liªn tôc 24h. mçi giê 1 lÇn");
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("B¾t ®Çu b¸o danh ®ua thuyÒn rång...");
	GlobalExecute("dw LoadScript([[\\settings\\trigger.lua]])");
end
