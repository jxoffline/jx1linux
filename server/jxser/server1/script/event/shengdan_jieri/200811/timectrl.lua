shengdan0811_StartTime = 081205
shengdan0811_EndTime = 090105

function shengdan0811_IsActTime()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	return nDate >= shengdan0811_StartTime and nDate < shengdan0811_EndTime
end