Include("\\script\\missions\\citywar_city\\head.lua");
function OnDeath(DoorIndex)
	WriteLog(GetLoop()..": Cæng nµo ®ã bÞ chÕt råi! "..DoorIndex);
	DoorI = DoorIndex
	for i = 1, g_nDoorCount do 
		D = GetMissionV(MS_DOORBEGIN + i - 1)
		if (D - DoorI == 0) then
			SetMissionV(MS_DOORBEGIN + i - 1, 0)
			AddGlobalNews("Theo tin tõ chiÕn tr­êng ®­a vÒ, mét cæng thµnh cña phe thñ ®· bÞ tÊn c«ng, t×nh thÕ rÊt nguy cÊp ");
			ClearObstacle(ObstaclePos[i][1], ObstaclePos[i][2]);
			
			--É¾µô¶ÔÓ¦µÄ¹¥³Ç³µ
			DelGcc = GetMissionV(MS_GCCBEGIN + i - 1) 
			if (DelGcc > 0) then 
				WriteLog(GetLoop()..": cæng bÞ ph¸ råi, xãa bá xe c«ng thµnh ");
				DelNpcSafe(DelGcc)
				SetMissionV(MS_GCCBEGIN + i - 1, 0);
			end;
			
			return 
		end
	end;
end;