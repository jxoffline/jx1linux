-- Ê±¼äµÄÌôÕ½±ÈÈü¶¨Ê±Æ÷

INTERVAL_TIME = 60	-- Ã¿Ð¡Ê±´¥·¢
-- INTERVAL_TIME = 10	-- Ã¿Ð¡Ê±´¥·¢

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
	TaskName("Thi ®Êu 'Th¸ch thøc thêi gian'");	

	-- 60·ÖÖÓÒ»´Î
	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("Thi ®Êu 'Th¸ch thøc thêi gian' c¨n cø theo giê trªn Server   %d:%d...", h, m));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);

	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()
	OutputMsg("®ang bao danh thi ®Êu 'Th¸ch thøc thêi gian'");
	-- ´¥·¢GameServerÉÏµÄ½Å±¾
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "Thêi gian b¸o danh 'Th¸ch thøc thêi gian' ®· b¾t ®Çu, c¸c ®éi tr­ëng h·y mau ®Õn NhiÕp ThÝ TrÇn ë c¸c thµnh thÞ b¸o danh. Thêi gian b¸o danh lµ 10 phót."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
