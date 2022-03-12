Include("\\script\\event\\2011dayanqunxia\\event.lua")

local nStartDate = 20110123000
local nEndDate = 201102210000

function TaskShedule()
	
	TaskName("§¹i YÕn QuÇn HiÖp 24h xÕp h¹ng Töu L­îng")

	-- Ò»ÌìÒ»´Î£¬µ¥Î»·ÖÖÓ
	TaskInterval(1440)
	-- ÉèÖÃ´¥·¢Ê±¼ä
	TaskTime(0, 0)
	OutputMsg("Trong thêi gian diÔn ra ho¹t ®éng §¹i YÕn QuÇn HiÖp, sÏ c¨n cø vµo Töu L­îng cña ng­êi ch¬i vµo lóc 24h mçi ngµy tiÕn hµnh xÕp h¹ng")
	-- Ö´ĞĞÎŞÏŞ´Î
	TaskCountLimit(0)
end

function TaskContent()
	local nCurDate = tonumber(tbQunXia:GetLocalDate("%Y%m%d%H%M"))
	if nCurDate < %nStartDate or nCurDate > %nEndDate then
		return
	end
	tbQunXia:PaiMing()
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end