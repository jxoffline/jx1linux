
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local _MakeItem = function (...)
	return {tbProp= arg}
end

function main(nItemIndex)
	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	local tbItem = %_MakeItem(GetItemProp(nItemIndex))
	local pScript = G_ACTIVITY:GetItemScript(tbItem)
	if pScript then
		return pScript:UseItem(nItemIndex)
	else
		return 1
	end	
end