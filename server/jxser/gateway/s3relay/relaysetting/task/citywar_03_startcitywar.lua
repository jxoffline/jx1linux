Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("§¹i Lı- C«ng thµnh chiÕn b¾t ®Çu ");
	-- ĞÇÆÚÈı
	TaskInterval(1440);
	
	-- 20µã00·Ö¿ªÕ½
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- ´óÀí±àºÅÎª3,±ØĞë¸úcitywar.iniÖĞÖ¸¶¨µÄÒ»ÖÂ
	if (GetProductRegion() ~= "vn") then
		if (cw_CanStart(3,4) == 1) then
			StartCityWar(3);
		end
	else
		cw_start_fun(3,3)	--4´ú±íÖÜ4,1´ú±ícw_CanStart(3,4)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
