-- ¶¨Ê±Í³¼ÆÊı¾İ

--------------------------------------------------------------------------
-- Í³¼ÆÕ½¶ÓĞÅÏ¢
LGTYPE_STATINFO 			= 10000 -- Õ½¶ÓÀàĞÍ
LGNAME_STAT_GOODS_SALE 		= "stat_goodssale" -- Õ½¶ÓÃû³Æ
LOGNAME_GOODS_SALE			= "Logs/stat_goodssale_"

---------------------------------------------------------
-- Í³¼ÆÏîÄ¿ÈÎÎñ±äÁ¿ID¶¨Òå
LG_STATITEM_TASKID_TOTAL	= 0; -- ×ÜÍ³¼Æ¼ÇÊı(LeagueMember TaskID)
LG_STATITEM_TASKID_TODAY	= 1; -- µ±ÌìÍ³¼Æ¼ÇÊı(LeagueMember TaskID)
-- 1 ~ 12 12¸öÔÂ·İµÄÍ³¼Æ¼ÇÊı
	-- 2005Äê£º501~512
	-- 2006Äê£º601~612

--LG_STAT_TASKID_CURDATE		= 0; -- µ±Ç°Í³¼ÆÈÕÆÚ(League TaskID)
--------------------------------------------------------------------------

function TaskShedule()
	TaskName("Thèng kª vËt phÈm tiªu thô ");
	
	-- 8*60·ÖÖÓÒ»´Î
	TaskInterval(8*60);
	
	-- ²»ÉèTaskTme, ÔòÊÇRelayÆô¶¯Ê±¾Í¿ªÊ¼
	-- 0µã00·Ö¿ªÊ¼
	TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	--OutputMsg("Æô¶¯ÎïÆ·ÏúÊÛÍ³¼Æ...");
end

function TaskContent()
	local logName = LOGNAME_GOODS_SALE..date("%Y%m%d%H%M%s")..".log";
	local szMsg = "";
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE)
	if (nLeagueID == 0) then
		--szMsg = "[Error]NotFound StatInfo:"..LGNAME_STAT_GOODS_SALE;
		--WriteStringToFile(logName, szMsg);
		return 0;
	end
	
	-- tab head
	szMsg = "ItemName\tTotal\tToDay\r\n" -- ÎïÆ·Ãû	×ÜÍ³¼Æ	µ±ÌìÍ³¼Æ
	WriteStringToFile(logName, szMsg);
			
	local nMemberCount = LG_GetMemberCount(nLeagueID);
	if (nMemberCount <= 0) then
		return 0;
	end
	
	OutputMsg("Thèng kª sè l­îng vËt phÈm:"..nMemberCount);
	local i = 0;
	for i = 0, nMemberCount-1 do
		local szMemberName, nJob = LG_GetMemberInfo(nLeagueID, i);
		local nTotal = LG_GetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, szMemberName, LG_STATITEM_TASKID_TOTAL);
		local nToDay = LG_GetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, szMemberName, LG_STATITEM_TASKID_TODAY);
		
		szMsg = szMemberName.."\t"..nTotal.."\t"..nToDay.."\r\n"; -- ÎïÆ·Ãû	×ÜÍ³¼Æ	µ±ÌìÍ³¼Æ
		OutputMsg("Thèng kª sè l­îng vËt phÈm:"..szMsg);
		WriteStringToFile(logName, szMsg);
	end	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
