--Bao L× X× Tµi Léc - Edit by ThanhLD - 20131204
local nStartDate	 = 20140120;
local nCloseDate	 = 20140223;	
function TaskShedule()
	TaskName("Reset sè l­îng - 0h")
	TaskInterval(24 * 60)
	TaskTime(0, 01)
	TaskCountLimit(0)
	OutputMsg("reset value")
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < %nStartDate or nDate > %nCloseDate then
		print("ko fai thoi gian hoat dong Bao li xi")
		return 
	end	
	RemoteExecute("\\script\\activitysys\\config\\1026\\get_item.lua","ResetValueBLX", 0)
	OutputMsg("Reset so luong bao li xi tai loc - event tet 2014")
end
