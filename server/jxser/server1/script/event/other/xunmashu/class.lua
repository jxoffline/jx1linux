Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\event\\other\\xunmashu\\taskctrl.lua")
if not tbXunMaShu0903 then
	tbXunMaShu0903 = tbBaseClass:new()
end

local tbActData = 
{
	nStartDate			= 20090322,
	nEndDate			= 20090419,
	nComposeEndDate		= 20090420,
	nItemExpiredTime	= 20090427,
	
	nMinLevel	= 50,
	bIsCharged	= 1,
	szClassName = "tbXunMaShu0903",
	tbTask	= tbXunMaShu0903_tbTasktCtrl,
}

function tbXunMaShu0903:_init(tbActData)
	for i,j in tbActData do
		self[i] = j
	end
	if self.tbTask then
		self.tbTask:_init(self.nStartDate, self.nEndDate)
	end
	
end

function tbXunMaShu0903:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	
	return self.nStartDate <= nCurDate and nCurDate <= self.nEndDate
end

function tbXunMaShu0903:IsPlayerEligible()
	
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

tbXunMaShu0903:_init(tbActData)