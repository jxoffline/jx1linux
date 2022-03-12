STARTHOUR = 20;
STARTMIN = 0;

function getCurrTime()
	return date( "%m%d" );
end

szMainString = "GoldLottery";
szResultString = "GoldLtyResult"

function TaskShedule()
	--ÉèÖÃ·½°¸Ãû³Æ
	TaskName("Olympic Gold")
	TaskInterval(1440)
	
	
	-- 20µã00·Ö¿ªÕ½
	TaskTime(STARTHOUR , STARTMIN);
	
	TaskCountLimit(0);
end

--"GoldLottery" timestamp id  Account|RoleName

function TaskContent()
	OutputMsg("----------------Rót th¨m vÐ sè hoµng kim GoldLottery ---------------------------");
	OutputMsg(date());
	if (tonumber(getCurrTime()) ~= 820) then
		return
	end

	randomseed( tonumber( date("%m%d%H%M%S") ) )
	RecordString = szMainString.."0819" 
	ResultString = szResultString.."0819"
	result , P1, P2 = GetCustomDataFromSDB(ResultString, 0,0,"ii")
	
	if (result > 0 ) then
		OutputMsg("ID tróng th­ëng vÐ sè hoµng kim 08-19 ®ång bé "..P2.."-"..P1)
		NotifySDBRecordChanged(ResultString, 0, 0, 1)
	else
		GenGoldLottery(RecordString, ResultString)
	end

	OutputMsg("--------------------------------------------");
end

function GenGoldLottery(RdString, RsString)
	nCount , key1, key2 = GetRecordCount(RdString,0,0,0,0);
	OutputMsg("GoldLottery Count "..nCount);
	if (nCount > 0) then
		nRand =	random(1, nCount)
		bFound , P1,P2 = GetRecordInfoFromNO(RdString, 0, 0, 0, 0, nRand)
		if(bFound == 1) then
			bResult , m = GetCustomDataFromSDB(RdString, P1, P2, "i");		
			str = format("ID phÇn th­ëng trong vÐ sè hoµng kim lµ %d-%d", P1, P2);
			success = SaveCustomDataToSDBOw(RsString , 0, 0, "ii", P1,P2);
			NotifySDBRecordChanged(RsString, 0, 0 ,1);
			strNews = format("dw AddLocalNews ( [ [VÐ sè hoµng kim tróng th­ëng ngµy 19 th¸ng 8 ®· më! Sè lµ: [%d-%d]. Mêi ng­êi ch¬i tróng th­ëng mau ®Õn LÔ Quan nhËn phÇn th­ëng hoµng kim!]], 1) ", P2,P1)
			GlobalExecute(strNews);
			OutputMsg(str);
		else
			OutputMsg("KiÓm tra sè liÖu cã lçi, ch­a t×m ®­îc ng­êi tróng th­ëng")
		end
	else
		OutputMsg("Kh«ng cã ng­êi nµo tróng th­ëng nªn kh«ng cã phÇn th­ëng.")
	end
end;
