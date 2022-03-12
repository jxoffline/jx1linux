--NÈp Hoa HÂng Æua top, event PNVN - Edit by ThanhLD - 20131003
local nStartDate	 = 20131010;
local nCloseDate	 = 20131020;	
function TaskShedule()
	TaskName("Top 10 server - x’p hπng 12h")
	TaskInterval(24 * 60)
	TaskTime(12, 05)
	TaskCountLimit(0)
	OutputMsg("topten server sort list")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\activitysys\\config\\1022\\give_rose_toplist.lua",	"tbTop10:UpdateTopList", 0)	
	OutputMsg("Toplist sorted in Event Rose PNVN")
end
