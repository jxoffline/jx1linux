-- Ñ×µÛµÄ±¦²Ø±ÈÈü¶¨Ê±Æ÷
--Ã¿ÌìÏÂÎç2µãµ½ÏÂÎç12µãÕûµã´¥·¢

Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\leaguematch\\head.lua")


function TaskShedule()
	TaskName("YANDIBAOZANG");	
	local nStartHour = tonumber(date("%H")) + 1;
	if (nStartHour == 23) then
		nStartHour = 0;
	end;
	TaskTime(nStartHour, 25);
	TaskInterval(60); 
	TaskCountLimit(0);
	OutputMsg("=======================================================")
	OutputMsg("[Start]		Viªm §Õ B¾t §Çu Vµo C¸c Giê");
	OutputMsg("	08:25 - 10:25 - 12:25 - 14:25 ");
	OutputMsg("	16:25 - 18:25 - 20:25 - 22:25 ");
end

function TaskContent()
	local TB_YDBZ_DATE_START =
	{
		8,10,12,14,16,18,20,22,
	}
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_YDBZ_DATE_START do
		if (nhour == ndate_hour) then
--			if gb_GetModule("YANDIBAOZANG") == 1 and gb_GetModule("YANDIBAOZANG_TALK") == 1 then
				OutputMsg("[YANDIBAOZANG]"..tonumber(date("%H"))..":55 StartSignUp...");
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