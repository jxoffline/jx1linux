-- °ï»áÕÐÄ¼µÜ×Ó»î¶¯
Include("\\script\\gb_taskfuncs.lua");
function TaskShedule()
	FESTIVAL_SHREWMOUSE = "Thu thËp vËt phÈm bang héi";
	TaskName("Thu thËp vËt phÈm bang héi");	

	-- 3¸öÐ¡Ê±Ò»´Î£¬µ¥Î»·ÖÖÓ
	TaskInterval(15);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	local nNowHour = tonumber(date("%H"));
	local nBeginTime = mod(nNowHour + 1, 24);--Çó³öÎ´À´3±¶Êý+ 1 µÄÖÓÍ·
	
	TaskTime(nBeginTime, 0);
	OutputMsg(format("Ho¹t ®éng thu thËp vËt phÈm bang héi b¾t ®Çu lóc %d:%d…", nBeginTime, 0));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 3);
end

function TaskContent()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	nResult = hourcheck(nHour, nMin);
	if (nResult == 0) then
		return
	end

	OutputMsg("Ho¹t ®éng thu thËp vËt phÈm bang héi ®· b¾t ®Çu cho b¸o danh.");
	GlobalExecute("dwf \\script\\missions\\tong\\collectgoods\\collg_gmscript.lua collg_opencellectgoods( 827 )");	--827Îª°ï»áÊÕ¼¯ÎïÆ·»î¶¯×¼±¸³¡µÄmapid
end

function hourcheck(nHour, nMin)
	if (mod(nHour, 3) ~= 2) then
		return 0;
	end
	if (nMin > 55) then
		return 0;
	end;
	return 1;
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
