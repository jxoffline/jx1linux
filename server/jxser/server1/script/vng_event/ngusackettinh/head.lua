tbNSKT_head={}
tbNSKT_head.nStartDay = 20101220
tbNSKT_head.nEndDay = 20110110
tbNSKT_head.nItemExpiredTime = 20110117
tbNSKT_head.nItemExpiredTime0 = 20110110

function tbNSKT_head:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end

function tbNSKT_head:getRandomKT(nCount)
	local tbKTCount = { {nID = 30070, nCount = 0}, {nID = 30072, nCount = 0}, {nID = 30073, nCount = 0} }
	
	for i = 1, nCount do
		local nRand = random(1,3)
		if (nRand <= 3 and nRand >= 1) then
			tbKTCount[nRand].nCount = tbKTCount[nRand].nCount + 1;
		end
	end	
	return tbKTCount;
end