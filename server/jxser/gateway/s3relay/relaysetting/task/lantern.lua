--»¨µÆ»î¶¯
--Ã¿Íí19£º00~21£º00 Ã¿15·ÖÖÓ ÔÚ»ªÉ½£¬Çà³ÇÉ½£¬µã²ÔÉ½£¬ÎäÒÄÉ½
--ËÄ¸öµØµã·Ö±ð ²úÉú300¸ö»¨µÆ
LANTERN_DATE_START	= 20080611
LANTERN_DATE_END	= 20080713
LANTERN_TIME_START 	= 1900
LANTERN_TIME_END	= 2100

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Ho¹t ®éng 'Hoa §¨ng'");
	TaskTime(19, 00);
	TaskInterval(15);
	TaskCountLimit(0);
	OutputMsg("Khëi ®éng häat ®éng Hoa ®¨ng"..date("%H%M"));
end

function TaskContent()
	local nTime	= tonumber(date("%H%M"));
	local nDate	= tonumber(date("%Y%m%d"));
	
	if (nDate >= LANTERN_DATE_START and nDate <= LANTERN_DATE_END and nTime >= LANTERN_TIME_START and nTime <= LANTERN_TIME_END) then
		if (nTime == LANTERN_TIME_END) then
			GlobalExecute("dw del_all_lantern()");
			return 0;
		end
		GlobalExecute("dw Msg2SubWorld([[B¹n h·y nhanh ch©n ®Õn Thanh Thµnh s¬n, Vò Di S¬n, §iÓm Th­¬ng s¬n, Hoa s¬n! ChØ cÇn gi¶i ®¸p ®óng 3 c©u ®è sÏ nhËn ®­îc phÇn th­ëng phong phó vµ hÊp dÉn!]])");
		GlobalExecute("dw create_lanterns()");
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end