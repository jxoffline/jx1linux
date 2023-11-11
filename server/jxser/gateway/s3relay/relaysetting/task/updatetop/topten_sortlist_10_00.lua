--HÖ thèng tiÕp nhËn ®¨ng ký vµ xÕp h¹ng 10 ng­êi level cao nhÊt server - Created by DinhHQ - 20110614
local nStartDate	 = 20170707;
local nCloseDate	 = 20220717;	
function TaskShedule()
	TaskName("Top 10 server - xÕp h¹ng 10h")
	TaskInterval(24 * 60)
	TaskTime(00, 00)
	TaskCountLimit(0)
	OutputMsg("==========================================================");
	OutputMsg("[Start] Update Top 10 Ng­êi Level Cao NhÊt 00:00 H»ng Ngµy (§¨ng ký t¹i Npc §ua TOP BLH)")
end

function TaskContent()
	--local nDate = tonumber(date("%Y%m%d"))
	--if nDate < %nStartDate or nDate > %nCloseDate then
	--	return 
	--end
	RemoteExecute("\\script\\vng_feature\\top10\\vngtop10.lua",	"tbTop10:UpdateTopList", 0)
	OutputMsg("Toplist sorted")
end
