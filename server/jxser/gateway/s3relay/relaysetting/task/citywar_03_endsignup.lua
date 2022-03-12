Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("§¹i Lı-b¸o danh hoµn tÊt");
	-- ĞÇÆÚ¶ş
	TaskInterval(1440);	--Ã¿Ìì
	
	-- 19µã00·Ö½áÊø
	TaskTime(19, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ´óÀí±àºÅÎª3,±ØĞë¸úcitywar.iniÖĞÖ¸¶¨µÄÒ»ÖÂ
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,2) == 1) then
			EndSignUp(3);
		end
	else
		cw_endsignup_fun(2,3)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
