Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("§¹i Lı- trËn L«i §µi b¾t ®Çu");
	TaskSetMode(1);
	
	-- 2005Äê1ÔÂ4ºÅ(ĞÇÆÚ¶ş)µÚÒ»´Î¿ªÊ¼
	TaskSetStartDay(1, 4);

	-- Ò»ÖÜÒ»¸öÑ­»·
	TaskInterval(7);
	
	-- 20µã00·Ö¿ªÈü
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ´óÀí±àºÅÎª3,±ØĞë¸úcitywar.iniÖĞÖ¸¶¨µÄÒ»ÖÂ
	if (cw_CanStart(3,3) == 1) then
		StartArena(3);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
