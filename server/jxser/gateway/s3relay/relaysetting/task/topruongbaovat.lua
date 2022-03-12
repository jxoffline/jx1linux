--§ua top r­¬ng b¶o vËt
local nStartDate	 = 20120520;
local nCloseDate	 = 20130618;	

function TaskShedule()
	TaskName("Top 10 nh©n vËt - xÕp h¹ng løc 0h ngµy thø 2 h»ng tuÇn")
	TaskInterval(24 * 60)
	TaskTime(0,0)
	TaskCountLimit(0)
	OutputMsg("Top 10 nh©n vËt - xÕp h¹ng løc 0h ngµy thø 2 h»ng tuÇn")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	local nWeek = tonumber(date("%w"))
	if nDate < %nStartDate or nDate > %nCloseDate or nWeek ~= 1 then
		return
	end
	RemoteExecute("\\script\\activitysys\\config\\1019\\extend.lua",	"pActivity:LoadAccumulatepr", 0)
	OutputMsg("Top 10 nh©n vËt - xÕp h¹ng løc 0h ngµy thø 2 h»ng tuÇn")
end
