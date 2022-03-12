Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
tbvng_ChestExpAward = {}
tbvng_ChestExpAward.MAX_EXP_PER_DAY = 50
tbvng_ChestExpAward.TSK_DAY = 2744
--tbvng_ChestExpAward.TSK_EXP = 2742
tbvng_ChestExpAward.tbBitTask = {
	["Tèng Kim BÝ B¶o"] = {
		nTaskID = 2705,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["B¶o r­¬ng v­ît ¶i"] = {
		nTaskID = 2705,
		nStartBit = 8,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["B¶o R­¬ng Thñy TÆc"] = {
		nTaskID = 2705,
		nStartBit = 15,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["TÝn Sø B¶o R­¬ng"] = {
		nTaskID = 2705,
		nStartBit = 22,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["Viªm §Õ BÝ B¶o"] = {
		nTaskID = 2706,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["VÖ Trô LÔ Bao"] = {
		nTaskID = 2706,
		nStartBit = 8,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["C«ng Thµnh LÔ Bao (míi)"] = {
		nTaskID = 2706,
		nStartBit = 15,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["Thiªn Tr× BÝ B¶o"] = {
		nTaskID = 3080,
		nStartBit = 1,
		nBitCount = 7,
		nMaxValue = 50,
	},
	["B¶o R­¬ng KiÕm Gia"] = {
		nTaskID = 3080,
		nStartBit = 9,
		nBitCount = 7,
		nMaxValue = 50,
	},
}
function tbvng_ChestExpAward:ExpAward(nValue, strItemName)
	local nTskDayValue = GetTask(self.TSK_DAY)
	local now = tonumber(GetLocalDate("%Y%m%d"))
	local tbBitTSK_Exp = self.tbBitTask[strItemName]
	if not tbBitTSK_Exp then
		return
	end
	if (now ~= nTskDayValue) then
		SetTask(self.TSK_DAY, now)
		for key, val in self.tbBitTask do
			%tbVNG_BitTask_Lib:setBitTask(val, 0)
		end
	else
		if %tbVNG_BitTask_Lib:isMaxBitTaskValue(tbBitTSK_Exp) == 1 then
			Msg2Player(format("H«m nay ®· nhËn ®ñ <color=yellow>%d <color>triÖu kinh nghiÖm, kh«ng thÓ nhËn thªm.", self.MAX_EXP_PER_DAY))
			return
		end
	end
	
	local nTskExpValue = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp)
	if (nTskExpValue + nValue/1e6) > self.MAX_EXP_PER_DAY then
		nValue = (self.MAX_EXP_PER_DAY - nTskExpValue)*1e6
	end
	--SetTask(self.TSK_EXP, GetTask(self.TSK_EXP) + nValue/1e6)
	local nNextValue = nTskExpValue + nValue/1e6
	%tbVNG_BitTask_Lib:setBitTask(tbBitTSK_Exp, nNextValue)
	AddOwnExp(nValue)
	Msg2Player(format("B¹n ®· nhËn ®­îc %d ®iÓm kinh nghiÖm kh«ng thÓ céng dån", nValue))
	local strTongName, nResult = GetTong()
	if nResult == 0 then
		strTongName = "Kh«ng"
	end
	local nMapID, _, _ = GetWorldPos()
	local strItemProp = nValue.." exp"
	local nDaylyExp = %tbVNG_BitTask_Lib:getBitTask(tbBitTSK_Exp) * 1e6
	local strExtraInfo = "Kinh nghiÖm ®· nhËn trong ngµy: "..nDaylyExp
	local strLog = GetLocalDate("%Y-%m-%d %H:%M:%S").."\t".."Sö dông "..strItemName.."\t"..GetAccount().."\t"..GetName().."\t"..GetLevel().."\t"..ST_GetTransLifeCount().."\t".."NhËn kinh nghiÖm".."\t".."Kinh nghiÖm".."\t"..strItemProp.."\t".."1".."\t"..strTongName.."\t"..nMapID.."\t"..strExtraInfo
	WriteLog(strLog);	
end