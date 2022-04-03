Include("\\script\\global\\meridian\\vnmeridan_head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
tbVnMeridanTaskCount = {
	[30227] = 1,--ch©n nguyªn ®¬n tiÓu
	[30228] = 5,--ch©n nguyªn ®¬n trung
	[30229] = 10,--ch©n nguyªn ®¬n ®¹i
}
tbVnMeridanLog = {
	[30227] = "SuDungChanNguyenDonTieu",--ch©n nguyªn ®¬n tiÓu
	[30228] = "SuDungChanNguyenDonTrung",--ch©n nguyªn ®¬n trung
	[30229] = "SuDungChanNguyenDonDai",--ch©n nguyªn ®¬n ®¹i
}
function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if not tbVnMeridanTaskCount[nP] then
		return 1
	end
	if not PlayerFunLib:VnCheckInCity ("default") then
		return 1
	end
	local strItemName = GetItemName(nItemIndex)
	local nBITTSK_IDX = tbVnMeridanHead.nMAX_MERIDAN_TSK_IDX
	local nLimitCount = tbVnMeridanHead.tbBitTask[nBITTSK_IDX].nMaxValue
	local nCurCount = tbVnMeridanHead:GetDailyTaskCount(nBITTSK_IDX)
	if tbVnMeridanHead:CheckTaskLimit(nBITTSK_IDX) ~= 1 then
		Talk(1, "", format("Mçi ngµy chØ cã thÓ hÊp thô tèi ®a %d ®iÓm Ch©n Nguyªn", nLimitCount))
		return 1
	end
	local nNewCount = 0
	if nCurCount + tbVnMeridanTaskCount[nP] > nLimitCount then
		nNewCount = nLimitCount
	else
		nNewCount = nCurCount  + tbVnMeridanTaskCount[nP]
	end
	tbVnMeridanHead:SetDailyTaskCount(nBITTSK_IDX, nNewCount)
	SetTask(4000, GetTask(4000) + nNewCount - nCurCount)
	Msg2Player(format("Sö dông %s thµnh c«ng, nhËn ®­îc %d ®iÓm Ch©n Nguyªn", strItemName, nNewCount - nCurCount))
	tbLog:PlayerActionLog("KinhMach", tbVnMeridanLog[nP])
end