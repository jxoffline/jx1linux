--³¤¸èÃÅ½ûµØ¡¡¼ÀÌ³ÈÎÎñ
Include("\\script\\gb_taskfuncs.lua")
LG_PARTNER_JITAN_NAME = "TÕ ®µn"
function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName( "Tr­êng Ca M«n cÊm ®Þa   NhiÖm vô tÕ ®µn" );
	--Æô¶¯ºóµÄÕýµã¿ªÊ¼
	local h, m = GetNextTime();
	TaskTime(h, m);
	TaskInterval( 60 );
	TaskCountLimit( 0 );
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 0)
	end
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "Tr­êng Ca M«n cÊm ®Þa   NhiÖm vô tÕ ®µn" );
end

function TaskContent()
	for i = 1, 5 do
		gb_SetTask(LG_PARTNER_JITAN_NAME, i, 1)
	end
	GlobalExecute("dw Msg2SubWorld ( [ [Trong Tr­êng Ca M«n cÊm ®Þa, linh lùc cña s¸t ®µn ®· håi sinh. Nã ®ang kªu gäi b¹n ®ång hµnh cña b¹n, nã cÇn chóng nh©n kinh b¸i. D¾t b¹n ®ång hµnh cña b¹n th«ng qua <color=yellow>M«n nh©n Tr­êng Ca M«n<color> x©m nhËp th¸m hiÓm cÊm ®Þa.]]) ")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
