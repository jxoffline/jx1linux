-- Ñ×µÛµÄ±¦²Ø±ÈÈü¶¨Ê±Æ÷
--Ã¿ÌìÏÂÎç2µãµ½ÏÂÎç12µãÕûµã´¥·¢

--by Ð¡ÀË¶à¶à
--2007.10.22
INTERVAL_TIME = 60	-- Ã¿Ð¡Ê±´¥·¢
Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\leaguematch\\head.lua")

function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 25;
end

function TaskShedule()
	TaskName("YANDIBAOZANG");	
	
	-- 60·ÖÖÓÒ»´Î
	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("[YANDIBAOZANG] Task Start At %d:%d...", h, m));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);
	-- OutputMsg("Æô¶¯×Ô¶¯¹ö¶¯¹«¸æ...");
end

function TaskContent()
	local TB_YDBZ_DATE_START =	--Æô¶¯³¡´Î(Ê±)
	{
		8,9,10,12,14,16,18,20,22,
	}
	
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_YDBZ_DATE_START do
	
		if (nhour == ndate_hour) then
			
--			if gb_GetModule("YANDIBAOZANG") == 1 and gb_GetModule("YANDIBAOZANG_TALK") == 1 then
				OutputMsg("[YANDIBAOZANG]"..tonumber(date("%H"))..":55 StartSignUp...");
				-- ´¥·¢GameServerÉÏµÄ½Å±¾
				--GlobalExecute("dw LoadScript([[\\settings\\trigger_challengeoftime.lua]])");
				GlobalExecute("dwf \\script\\missions\\yandibaozang\\yandibaozang_trigger.lua YDBZ_OnTrigger()");
				szMsg = "Ho¹t ®éng v­ît ¶i b¶o tµng viªm ®Õ ®· b¾t ®Çu b¸o danh råi, mäi ng­êi h·y nhanh chãng ®Õn B×nh B×nh c« n­¬ng ë BiÖn Kinh ®Ó ®¨ng ký nhÐ, thêi gian b¸o danh lµ 5 phót."
				GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
--			end
			break;
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end