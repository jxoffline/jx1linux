STARTHOUR = 22;
STARTMIN = 30;

FIRSTDAY = 816;--8ÔÂ16ÈÕ×÷ÎªµÚÒ»´Î¿ª»Æ½ð²ÊÆ±Ê±¼ä
GoldResultTab = {};--¸÷Ê±¼äÀï»Æ½ð²ÊÆ±µÄ½á¹û


function GameSvrConnected(dwGameSvrIP)
	nIntervalDay = tonumber(getCurrTime()) - FIRSTDAY;
	for i = 1, nIntervalDay do 
		if (GoldResultTab[i] ~= 0 or GoldResultTab[i] ~= nil) then 
			strsomeday = format("%.4d", FIRSTDAY + i - 1)
			ResultString = szResultString..strsomeday
			result , P1, P2 = GetCustomDataFromSDB(ResultString, 0, 0, "ii")
			if (result > 0) then 
				NotifySDBRecordChanged(ResultString, 0 ,0 ,1);		
			end
		end;
	end;
end;

function GameSvrReady(dwGameSvrIP)
end

function getCurrTime()
	return date( "%m%d" );
end

szMainString = "GoldLottery";
szResultString = "GoldLtyResult"

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Olympic Gold")
	TaskInterval(1440)
	
	
	-- 22µã00·Ö¿ªÊ¼¾º½±
	TaskTime(STARTHOUR , STARTMIN);
	
	TaskCountLimit(0);
end

--"GoldLottery" timestamp id 

function TaskContent()
	OutputMsg("----------------Rót th¨m vÐ sè hoµng kim GoldLottery -----------------");
	OutputMsg(date());
	if (tonumber(getCurrTime()) >= 903 ) then 
		OutputMsg("Ho¹t ®éng vÐ sè olympic ®· kÕt thóc, ®ãng chøc n¨ng vÐ sè hoµng kim!")
		return
	end

	randomseed( tonumber( date("%m%d%H%M%S") ) )
	nIntervalDay = tonumber(getCurrTime()) - FIRSTDAY;
	for i = 1, nIntervalDay + 1 do 
		GetGoldLotteryInfo(FIRSTDAY + i - 1)
	end;
	OutputMsg("----------------------------------------------------------");
end

function GetGoldLotteryInfo(someday)
	strsomeday = format("%.4d", someday)
	OutputMsg("Ngµy vÐ sè "..strsomeday.."--------------")
	RecordString = szMainString..strsomeday
	ResultString = szResultString..strsomeday
	result , P1, P2 = GetCustomDataFromSDB(ResultString, 0, 0, "ii")
	
	if (result > 0 ) then
		GoldResultTab[someday - FIRSTDAY + 1] = P2
		OutputMsg("ID vÐ sè hoµng kim ®ång bé "..P2.."-"..P1)
		NotifySDBRecordChanged(ResultString, 0, 0, 1)
	else
		GenGoldLottery(RecordString, ResultString, someday)
	end
end;

function GenGoldLottery(RdString, RsString, someday)
	GoldResultTab[someday - FIRSTDAY + 1] = 0
	nCount = GetRecordCount(RdString,0,0,0,0);
	OutputMsg("GoldLottery Count "..nCount);
	if (nCount > 0) then
		nRand =	random(1, nCount)
		bFound , P1,P2 = GetRecordInfoFromNO(RdString, 0, 0, 0, 0, nRand)
		if(bFound == 1) then
			bResult , m = GetCustomDataFromSDB(RdString, P1, P2, "i");		
			str = format("ID phÇn th­ëng trong vÐ sè hoµng kim lµ %d-%d", P2, P1);
			success = SaveCustomDataToSDBOw(RsString, 0, 0, "ii", P1, P2);
			NotifySDBRecordChanged(RsString, 0, 0 ,1);
			nMonth = floor(someday / 100)
			nDay = mod(someday, 100);
			strNews = format("dw AddLocalNews ( [ [VÐ sè hoµng kim tróng th­ëng trong %d ngµy %d th¸ng ®· më! Sè lµ: [%d-%d]. Mêi ng­êi ch¬i tróng th­ëng mau ®Õn LÔ Quan nhËn phÇn th­ëng hoµng kim!]], 1) ", nMonth, nDay, P2,P1)
			GlobalExecute(strNews);
			GoldResultTab[someday - FIRSTDAY + 1] = P2
			OutputMsg(str);
		else
			OutputMsg("KiÓm tra sè liÖu cã lçi, ch­a t×m ®­îc ng­êi tróng th­ëng")
		end
	else
		OutputMsg("Kh«ng cã ng­êi nµo tróng th­ëng nªn kh«ng cã phÇn th­ëng.")
	end
end;
