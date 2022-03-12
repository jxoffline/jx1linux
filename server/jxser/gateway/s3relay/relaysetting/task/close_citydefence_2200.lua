--close_citydefence_1700.lua
--

function TaskShedule()
	TaskName("VÖ quèc Phong Háa liªn thµnh");	

	-- Ò»ÌìÒ»´Î£¬µ¥Î»·ÖÖÓ
	TaskInterval(1440);
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(22, 0);
	OutputMsg(format("'VÖ quèc liªn thµnh' ®· kÕt thóc %d:%d...", 22, 0));
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);

end

function TaskContent()
	OutputMsg("VÖ quèc liªn thµnh ®· kÕt thóc");
	GlobalExecute("dw CityDefence_CloseMain()");
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
