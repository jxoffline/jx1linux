Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\event\\funv_jieri\\200903\\taskctrl.lua")
if not tbFunv0903 then
	tbFunv0903 = tbBaseClass:new()
end

local tbActData = 
{
	nStartDate			= 20090306,
	nEndDate			= 20090315,
	nComposeEndDate		= 20090316,
	nItemExpiredTime	= 20090401,
	
	nMinLevel	= 50,
	bIsCharged	= 1,
	szClassName = "tbFunv0903",
	tbTask	= tbFunv0903_tbTasktCtrl,
}

function tbFunv0903:_init(tbActData)
	for i,j in tbActData do
		self[i] = j
	end
	if self.tbTask then
		self.tbTask:_init(self.nStartDate, self.nEndDate)
	end
	
end

function tbFunv0903:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nStartDate <= nCurDate and nCurDate <= self.nEndDate
end

function tbFunv0903:IsPlayerEligible()
	
	if self.nMinLevel and GetLevel() < self.nMinLevel then
		return nil, format("Kh´ng ÆÒ c p %d", self.nMinLevel)
	end
	
	if self.nMaxLevel and GetLevel() > self.nMaxLevel then
		return nil, format("ß∑ v≠Ót qu∏ c p %d", self.nMaxLevel)
	end
	
	if self.bIsCharged and self.bIsCharged == 1 and IsCharged() ~= 1 then
		return nil, "ßπi hi÷p v…n ch≠a nπp thŒ µ!"
	end
	return 1
end

tbFunv0903:_init(tbActData)