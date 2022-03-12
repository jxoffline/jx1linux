-- Õ½ÒÛÏµÍ³
-- Fanghao_Wu 2004-12-6
Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "Tæng chØ huy ChiÕn dŞch Tèng Kim" );
	TaskSetMode(1);

	--Ã¿ÖÜµÄ£¨ĞÇÆÚÒ»)¿ªÊ¼ĞÂµÄÒ»ÂÖ
	TaskSetStartDay(1, 3);

	-- Ò»ÖÜÒ»¸öÑ­»·
	TaskInterval(7);
	TaskTime(2, 0);
	TaskCountLimit(0);
end

function TaskContent()
	OutputMsg("****************Create XIANGYANG New Battle********")
	battle_StartNewIssue(1, 1 );	
	battle_StartNewIssue(1, 2 );	
	battle_StartNewIssue(1, 3 );	
	OutputMsg("***************************************************")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
