--°ï»áÎ¬»¤½Å±¾
--by luobaohang 06/03/10
IncludeLib("TONG")
-- °ï»áÎ¬»¤¶¨Ê±Æ÷
INTERVAL_TIME = 999999
function TaskShedule()
	TaskName("Bang héi cò ®ang khëi ®éng");
	-- ÉèÖÃ´¥·¢Ê±¼ä(¼´Ê±Ö´ÐÐ)
	-- Ö´ÐÐ1´Î
	TaskCountLimit(1);
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("Bang héi cò ®ang khëi ®éng.......................")
	while (nTongID ~= 0)do
		if (TONG_GetDay(nTongID) <= 0)then
			OutputMsg("§ang vËn hµnh bang héi cò: "..TONG_GetName(nTongID))
			TONG_ApplyInit(nTongID)
		end	
		nTongID = TONG_GetNextTong(nTongID)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
