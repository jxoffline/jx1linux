szMainString = "Lottery";
nMaxServerCount = 8;

function GameSvrConnected(dwGameSvrIP)
	SyncLottery(dwGameSvrIP, szMainString);
end

function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Dù ®o¸n Olympic")
	
	--ÉèÖÃ¼ä¸ôÊ±¼ä£¬µ¥Î»Îª·ÖÖÓ
	TaskInterval(10)
	
	--ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit(0)
end

function TaskContent()
	OutputMsg("--------------"..date().."--------------------");
	CheckLotteryState("RelaySetting\\Lottery.txt", szMainString, nMaxServerCount);
	OutputMsg("----------------------------------");
end

