IncludeLib("TONG")
INTERVAL_TIME = 1440
function TaskShedule()
	TaskName("B¶o tr× hµng ngµy");
	TaskInterval(INTERVAL_TIME);
	TaskTime(0, 0);
	TaskCountLimit(0);
	OutputMsg("[Start] B¶o tr× bang héi 24:00 hµng ngµy")
end

function TaskContent()
	local nTongID = TONG_GetFirstTong()
	OutputMsg("[Start] B¶o tr× bang héi 24:00 hµng ngµy")
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
