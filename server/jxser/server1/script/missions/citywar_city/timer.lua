Include("\\script\\missions\\citywar_city\\head.lua");

function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE);
	SetMissionV(MS_NEWSVALUE, V+1);
	if (timestate == 2) then --¿ªÕ½ÁË
		ReportBattle(V);
	end;
end;

function ReportBattle(V)
--Õ½¶·½øÐÐ¹ý³ÌÖÐ£¬ÏµÍ³¶¨ÆÚÍ¨ÖªÊ¯±®µÄÇé¿ö
	gametime = (floor(GetMSRestTime(MISSIONID,13) / 18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str = format("HiÖn t¹i %s ®ang trong giai ®o¹n tranh ®o¹t quyÕt liÖt! Thêi gian cßn d­ %d phót %d gi©y; hiÖn t¹i %d Long trô ®· håi phôc thuéc tÝnh", GetGameCity(), RestMin, RestSec, MS_SYMBOLCOUNT);
	for i = 1, MS_SYMBOLCOUNT do 
		if (GetMissionV(MS_SYMBOLBEGIN + i - 1)  == 1) then
			str = str .. "Phe phßng thñ "	;
		else 	
			str = str .. "Phe tÊn c«ng ";
		end;
	end;

	--2004.11.5¹Ø±ÕÏòÈ«Çò·¢ËÍ¹ã²¥µÄ¹¦ÄÜ
	--if (mod(V, 18) == 0) then 
	--	AddGlobalNews(str)
	--else
		Msg2MSAll(MISSIONID, str)
	--end;
end;
 