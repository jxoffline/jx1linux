if pingzi0805 == nil then


pingzi0805 = 
{
	szClassName			= "pingzi0805",
	ActTime_S			= 20080611,
	ActTime_E			= 20080713,
	TSK_Version			= 1976,
	TSK_Recipe1Count	= 1977,
	TSK_ExpLimit		= 1978,
	nMaxRecipe1Count	= 100,
	nMaxExpLimit		= 1500000000
	
}

function pingzi0805:ResetTask()
	local nDateH = tonumber(GetLocalDate("%Y%m%d"))
	--活动开始，到兑奖结束
	if nDateH >= self.ActTime_S and nDateH <= self.ActTime_E then
		 
		if GetTask(self.TSK_Version) ~= self.ActTime_S then
			SetTask(self.TSK_Version, self.ActTime_S)
			SetTask(self.TSK_Recipe1Count, 0)
			SetTask(self.TSK_ExpLimit, 0)
		end
	end
	
end

function pingzi0805:IsActTime()
	local nDateH = tonumber(GetLocalDate("%Y%m%d"))
	return nDateH >= self.ActTime_S and nDateH <= self.ActTime_E
	
end


end