-- ÁúÖÛ±ÈÈü¶¨Ê±Æ÷

INTERVAL_TIME = 60	-- Ã¿Ğ¡Ê±´¥·¢

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

	-- 60·ÖÖÓÒ»´Î
	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("§ång hå ®Şnh giê ®ua thuyÒn rång sÏ khëi ®éng vµo %d:%d...", h, m));
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()
	OutputMsg("B¾t ®Çu b¸o danh ®ua thuyÒn rång...");
	-- ´¥·¢GameServerÉÏµÄ½Å±¾
	GlobalExecute("dw LoadScript([[\\settings\\trigger.lua]])");
end
