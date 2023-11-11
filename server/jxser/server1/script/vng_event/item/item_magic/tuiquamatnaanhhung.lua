Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local tbAward = {szName="MÆt n¹ - Anh hïng chiÕn tr­êng",tbProp={0,11,482,1,0,0},nCount=37}
local nDateTimeOut = 180*24*60
function GetDateFromNowData(nTimer)
	local nDate = floor(nTimer/(3600*24))
	return nDate;
end

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 40
	local nExpiredTimeData	= ITEM_GetExpiredTime(nItemIndex)
	local nCurTime = GetCurServerTime()
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	%tbAward.nExpiredTime = %nDateTimeOut - (7*24*60 - floor(nExpiredTimeData - nCurTime)/60)
	tbAwardTemplet:Give(%tbAward,1, {"SuDungTuiQua","MatNaAnhHungChienTruong"})
	return 0
end