--citydefence.lua
-- ÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³Ç

function TaskShedule()
	TaskName("VÖ quèc Phong Háa liªn thµnh");	

	-- Ò»ÌìÒ»´Î£¬µ¥Î»·ÖÖÓ
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(19, 30);
	OutputMsg(format("'VÖ quèc liªn thµnh' ®· b¾t ®Çu %d:%d...", 19, 30));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("it is not saturday or sunday,so citydefence will not open")
		return
	end
	if (weekdate == 6) then
		OutputMsg("'VÖ quèc liªn thµnh'   phe Kim ®· b¾t ®Çu b¸o danh.");
		GlobalExecute("dw CityDefence_OpenMain(2)");
	else
		OutputMsg("'VÖ quèc liªn thµnh'   Tèng ®· b¾t ®Çu b¸o danh.");
		GlobalExecute("dw CityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6 and weekdate ~= 0) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
