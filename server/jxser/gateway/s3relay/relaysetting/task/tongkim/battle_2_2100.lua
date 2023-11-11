function TaskShedule()
	TaskName( "ChiÕn dÞch quèc chiÕn Tèng Kim 21:00" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	OutputMsg("[Start] Quèc ChiÕn Tèng Kim 21:00 Thø 2 Hµng TuÇn");
end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg  = format("Chiªu c¸o thiªn h¹:\"%s\" ®ång thêi chiÕm lÜnh c¶ L©m An lÉn BiÖn Kinh, bang chñ cã thÓ trùc tiÕp ®¨ng c¬ thµnh thiªn tö!", CW_GetOccupant(4));
			local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();		
			NW_SetTask(0, 1);
			return
		end
		
		local szMsg  = format("TiÒn tuyÕn mËt b¸o! Tèng quèc \"%s\" vµ Kim Quèc \"%s\" tranh ®o¹t ng«i vÞ Thiªn Tö ®· b¾t ®Çu, xin mêi c¸c t­íng sü h·y ®Õn chç b¸o danh Tèng Kim phÝa m×nh ®Ó tham chiÕn!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
