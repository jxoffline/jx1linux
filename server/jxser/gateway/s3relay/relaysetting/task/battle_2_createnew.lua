-- ¹úÕ½ËÎ½ğ
-- DongZhi
Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

function TaskShedule()
	
	TaskName( "Quèc chiÕn Tèng Kim tæng ®iÒu ®éng" );	--ÈÎÎñÃû³Æ
	TaskTime( 20, 00 );				--Æô¶¯Ê±¼ä
	TaskInterval(1440);				--¼ä¸ôÊ±¼ä:Ò»Ìì
	TaskCountLimit(0);				--ÎŞ´ÎÊıÏŞÖÆ
	
	OutputMsg("**************** Tæng ®iÒu ®éng quèc chiÕn tèng kim nhiÖm vô khëi ®éng thµnh c«ng ****************")	
end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 then
		OutputMsg("**************** Create GUOZHAN New Battle ****************")	
		battle_StartNewIssue(2, 3);	
		OutputMsg("***********************************************************")
	end

end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
