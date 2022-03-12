--°ï»áÎ¬»¤½Å±¾
--by luobaohang 06/03/10
IncludeLib("TONG")
-- °ï»áÎ¬»¤¶¨Ê±Æ÷
INTERVAL_TIME = 1440	-- Ã¿24Ð¡Ê±´¥·¢7´Î
function TaskShedule()
	TaskName("B¶o tr× hµng ngµy");
	-- 1440·ÖÖÓÒ»´Î
	TaskInterval(INTERVAL_TIME);
	-- ÉèÖÃ´¥·¢Ê±¼ä(0µã0·Ö)
	TaskTime(0, 0);
	-- Ö´ÐÐÎÞÏÞ´Î
	TaskCountLimit(0);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("Khëi ®éng b¶o tr× bang héi.......................")
	while (nTongID ~= 0)do
		OutputMsg("§ang tiÕn hµnh b¶o tr× bang:  "..TONG_GetName(nTongID))
		TONG_ApplyMaintain(nTongID)
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
