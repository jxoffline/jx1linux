
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\event\\guoqing_jieri\\200908\\taskctrl.lua")
IncludeLib("SETTING")
local tbActData = 
{
	nStartDate			= 20090821,
	nEndDate			= 20090906,
	nComposeEndDate		= 20090907,
	nItemExpiredTime	= 20090913,
	
	nMinLevel	= 50,
	bIsCharged	= 1,
	szClassName = "tbGuoqing0908",
	tbTask	= tbGuoqing0908_tbTasktCtrl,
}
tbGuoqing0908 = tbBaseClass:new()

function tbGuoqing0908:_init(tbActData)
	for i,j in tbActData do
		self[i] = j
	end
	if self.tbTask then
		self.tbTask:_init(self.nStartDate, self.nItemExpiredTime)
	end
	
end

function tbGuoqing0908:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return self.nStartDate <= nCurDate and nCurDate < self.nComposeEndDate
end

function tbGuoqing0908:IsPlayerEligible()
	if ST_IsTransLife() ~= 1 then
		if self.nMinLevel and GetLevel() < self.nMinLevel then
		return nil, format("Kh´ng ÆÒ c p %d", self.nMinLevel)
		end
	end
	if self.nMaxLevel and GetLevel() > self.nMaxLevel then
		return nil, format("ß∑ v≠Ót qu∏ c p %d", self.nMaxLevel)
	end

	if self.bIsCharged and self.bIsCharged == 1 and IsCharged() ~= 1 then
			return nil, "ßπi hi÷p v…n ch≠a nπp thŒ µ!"
		end
	return 1
end

tbGuoqing0908:_init(tbActData)