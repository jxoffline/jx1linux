Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

tbVNG_GiveExpAward_Box = {}
tbVNG_GiveExpAward_Box.KEYLOG = "LOG_FEATURE_CTC"
tbVNG_GiveExpAward_Box.tbBitTaskAllBox = {
	["B¶o R­¬ng Tèng Kim"] = {
		nTaskID = 2772,
		nStartBit = 1,
		nBitCount = 14,
		nMaxValue = 5000,
	},	
}
function tbVNG_GiveExpAward_Box:ExpAward(nValue, strItemName)		
	local tbBitTSK_Exp = self.tbBitTaskAllBox[strItemName]
	if not tbBitTSK_Exp then
		return
	end
	--KiÓm tra reset exp daily
	tbCheckTaskDaily2ReSet:OnLogin()
	local nFactor = 10000
	local nTskExpValue = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp)
	if nTskExpValue >= tbBitTSK_Exp.nMaxValue then
		Msg2Player(format("H«m nay ®· nhËn ®ñ <color=yellow>%d <color> kinh nghiÖm, kh«ng thÓ nhËn thªm.", tbBitTSK_Exp.nMaxValue*nFactor))
		return
	end
		
	if (nTskExpValue + nValue/nFactor) > tbBitTSK_Exp.nMaxValue then
		nValue = (tbBitTSK_Exp.nMaxValue - nTskExpValue)*nFactor
	end
	local nNextValue = nTskExpValue + nValue/nFactor
	%tbVNG_BitTask_Lib:setBitTask(tbBitTSK_Exp, nNextValue)
	AddOwnExp(nValue)
	Msg2Player(format("B¹n ®· nhËn ®­îc %d ®iÓm kinh nghiÖm kh«ng thÓ céng dån", nValue))
	tbLog:PlayerActionLog(self.KEYLOG.."Use: "..strItemName.."GetExp: "..nValue)
end

--reset daily tÊt c¶ bit cña c¸c lo¹i r­¬ng
function tbVNG_GiveExpAward_Box:ResetExpDailyBoxFeature()
	for key, val in self.tbBitTaskAllBox do
		%tbVNG_BitTask_Lib:setBitTask(val, 0)
	end
end