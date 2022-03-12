--Nép LÖnh Bµi TiÕn Cö THDNB15 - Created by ThanhLD - 20140325
local nStartDate	 = 20140330;
local nCloseDate	 = 20140408;	
function TaskShedule()
	TaskName("Top 10 server - xÕp h¹ng 0h")
	TaskInterval(24 * 60)
	TaskTime(0, 05)
	TaskCountLimit(0)
	OutputMsg("top3 server sort list")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\activitysys\\config\\1018\\give_lbtc.lua",	"tbTop3:UpdateTopList", 0)
	OutputMsg("Toplist sorted in event nop lbtc vldnb")
end
