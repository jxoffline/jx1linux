Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("§¹i Lý-b¸o danh b¾t ®Çu");
	-- ÐÇÆÚ¶þ
	TaskInterval(1440);
	
	-- 18µã00·Ö¿ªÊ¼
	TaskTime(18, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ´óÀí±àºÅÎª3,±ØÐë¸úcitywar.iniÖÐÖ¸¶¨µÄÒ»ÖÂ
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,1) == 1) then
			StartSignUp(3);
		end
	else
		cw_startsignup_fun(2,3)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
