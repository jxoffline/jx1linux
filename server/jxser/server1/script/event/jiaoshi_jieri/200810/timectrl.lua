--2008年11月14日至 2008年11月23日24点

jiaoshi0810_StartTime = 081114
jiaoshi0810_EndTime = 081123

function jiaoshi0810_IsActTime()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	return nDate >= jiaoshi0810_StartTime and nDate <= jiaoshi0810_EndTime
	
end