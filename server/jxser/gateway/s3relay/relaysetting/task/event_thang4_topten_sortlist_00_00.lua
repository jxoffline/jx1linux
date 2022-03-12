--H÷ thËng ti’p nhÀn Æ®ng k˝ vµ x’p hπng 10 ng≠Íi level cao nh t server - Created by DinhHQ - 20110614
local nStartDate	 = 20130401;
local nCloseDate	 = 20130430;	
function TaskShedule()
	TaskName("Top 10 server - x’p hπng 0h")
	TaskInterval(24 * 60)
	TaskTime(0, 05)
	TaskCountLimit(0)
	OutputMsg("topten server sort list")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		return 
	end
	RemoteExecute("\\script\\activitysys\\config\\1003\\give_item_toplist.lua",	"tbTop10:UpdateTopList", 0)
	OutputMsg("Toplist sorted")
end
