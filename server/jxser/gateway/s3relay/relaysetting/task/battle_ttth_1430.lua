
-- Õ½ÒÛÏµÍ³
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "Tin tøc tù ®éng - th«ng b¸o" );
	-- 10·ÖÖÓÒ»´Î
	TaskInterval( 1440 );
	-- 0Ê±0·Ö¿ªÊ¼£¨²»ÉèTaskTme, ÔòÊÇRelayÆô¶¯Ê±¾Í¿ªÊ¼£©
	TaskTime( 14, 30 );
	-- ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit( 0 );
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "BATTLE OLD startup..." );
end

function TaskContent()
	RemoteExecute("\\script\\missions\\ËÎ½ğÕ½³¡pkÕ½\\¶¨Ê±ÈÎÎñ´¥·¢.lua",	"main", 0)
	OutputMsg("---------Start Tong Kim Cò -------------------------")
end