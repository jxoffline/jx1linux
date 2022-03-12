tbVNG_WomenDay2011 = {}
tbVNG_WomenDay2011.nStartDay = 20110307
tbVNG_WomenDay2011.nEndDay = 20110314
tbVNG_WomenDay2011.tbTaskList =
	{
		TSK100ROSE = 
			{
				nTaskID = 2749,
				nStartBit = 19,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK100ROSE_FLAG = 
			{
				nTaskID = 2749,
				nStartBit = 20,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK200ROSE = 
			{
				nTaskID = 2749,
				nStartBit = 21,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK200ROSE_FLAG = 
			{
				nTaskID = 2749,
				nStartBit = 22,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK50GIFT = 
			{
				nTaskID = 2749,
				nStartBit = 23,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK50GIFT_FLAG = 
			{
				nTaskID = 2749,
				nStartBit = 24,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK100GIFT = 
			{
				nTaskID = 2749,
				nStartBit = 25,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK100GIFT_FLAG = 
			{
				nTaskID = 2749,
				nStartBit = 26,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK150GIFT = 
			{
				nTaskID = 2749,
				nStartBit = 27,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK150GIFT_FLAG = 
			{
				nTaskID = 2749,
				nStartBit = 28,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK200GIFT = 
			{
				nTaskID = 2749,
				nStartBit = 29,
				nBitCount = 1,
				nMaxValue = 1
			},
		TSK200GIFT_FLAG = 
			{
				nTaskID = 2749,
				nStartBit = 30,
				nBitCount = 1,
				nMaxValue = 1
			},
	}
--tbVNG_WomenDay2011.nItemExpiredTime = 20110220
function tbVNG_WomenDay2011:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end
function tbVNG_WomenDay2011:CheckCondition()
	if(GetExtPoint(0) >= 1) then		
		if ST_GetTransLifeCount() > 0 or GetLevel() >= 150 then
			return 1		
		end
	end
	return 0
end