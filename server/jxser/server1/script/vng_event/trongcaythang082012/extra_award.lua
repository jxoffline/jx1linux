Include("\\script\\vng_event\\trongcaythang082012\\awardlist.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\trongcaythang082012\\plant.lua")
tbTreeExtAward = {}
tbTreeExtAward.nStartDate = 201304290000
tbTreeExtAward.nEndDate = 201305092400
tbTreeExtAward.tbTSK_Bits = {
	["500"] = {
		nTaskID = 2948,
		nStartBit = 24,
		nBitCount = 1,
		nMaxValue = 1,
	},
	["1000"] = {
		nTaskID = 2948,
		nStartBit = 25,
		nBitCount = 1,
		nMaxValue = 1,
	},
	["1500"] = {
		nTaskID = 2948,
		nStartBit = 26,
		nBitCount = 1,
		nMaxValue = 1,
	},
	["2000"] = {
		nTaskID = 2948,
		nStartBit = 27,
		nBitCount = 1,
		nMaxValue = 1,
	},
}
function tbTreeExtAward:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end
function tbTreeExtAward:Main()
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian diÔn ra ch­¬ng tr×nh.")
		return
	end
	local tb = {
		"NhËn phÇn th­ëng ®¹t mèc 500 lÇn sö dông H¹t Gièng C©y §a/#tbTreeExtAward:ProcessAward('500')",
		"NhËn phÇn th­ëng ®¹t mèc 1000 lÇn sö dông H¹t Gièng C©y §a/#tbTreeExtAward:ProcessAward('1000')",
		"NhËn phÇn th­ëng ®¹t mèc 1500 lÇn sö dông H¹t Gièng C©y §a/#tbTreeExtAward:ProcessAward('1500')",
		"NhËn phÇn th­ëng ®¹t mèc 2000 lÇn sö dông H¹t Gièng C©y §a/#tbTreeExtAward:ProcessAward('2000')",
		"§ãng/OnCancel",
	}
	local nCurCount = tbSeed:GetPlantCount(2)
	Describe(format("Ta phôc tr¸ch trao phÇn th­ëng cho c¸c vÞ ®¹i hiÖp cã sè lÇn sö dông H¹t Gièng C©y §a ®¹t mèc 500, 1000, 1500, 2000\nSè lÇn sö dông hiÖn t¹i cña ®¹i hiÖp lµ <color=yellow>%s<color>", nCurCount), getn(tb), tb)
end

function tbTreeExtAward:ProcessAward(nCount)
	if CountFreeRoomByWH(4, 5) < 1 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n cÇn chõa trèng 4x5 « trèng trong hµnh trang råi míi nhËn th­ëng.")
		return
	end
	local strCount = tostring(nCount)
	local nCurCount = tbSeed:GetPlantCount(2)
	if nCurCount < tonumber(nCount) then
		Talk(1, "", format("VÞ ®¹i hiÖp ®©y sè lÇn sö dông h¹t gièng C©y §a vÉn ch­a ®¹t ®Õn %s, kh«ng thÓ nhËn phÇn th­ëng nµy.", nCount))
		return
	end
	if tbVNG_BitTask_Lib:IsMaxValue(self.tbTSK_Bits[strCount]) == 1 then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!")
		return
	end
	if not %tbAward_F[strCount] then
		return
	end
	local tbTmpAward = %tbAward_F[strCount]
	if not tbTmpAward.nSelective then
		tbVNG_BitTask_Lib:setBitTask(self.tbTSK_Bits[strCount], 1)
		tbAwardTemplet:Give(tbTmpAward, 1, {LOG_HEAD, "NhanPhanThuongDatMoc"..strCount})
	else
		local tbDialog = {}
		for i = 1, getn(tbTmpAward) do		
			tinsert(tbDialog, format("%s/#tbTreeExtAward:ProcessSelectiveAward(%s, %d)", tbTmpAward[i].szName, strCount, i))
		end
		Describe("Xin h·y chän phÇn th­ëng:", getn(tbDialog), tbDialog)
	end
end

function tbTreeExtAward:ProcessSelectiveAward(strUsedCount, nSelectIdx)
	strUsedCount = tostring(strUsedCount)
	if tbVNG_BitTask_Lib:IsMaxValue(self.tbTSK_Bits[strUsedCount]) == 1 then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.tbTSK_Bits[strUsedCount], 0, "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi!", "==") ~= 1 then
		return
	end
	if CountFreeRoomByWH(4, 5) < 1 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n cÇn chõa trèng 4x5 « trèng trong hµnh trang råi míi nhËn th­ëng.")
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbTSK_Bits[strUsedCount], 1)
	tbAwardTemplet:Give(%tbAward_F[strUsedCount][nSelectIdx], 1, {LOG_HEAD, "NhanPhanThuongDatMoc"..strUsedCount})
end

-- pEventType:Reg("Ch­ëng §¨ng Cung N÷", "NhËn phÇn th­ëng ®¹t mèc sö dông h¹t gièng C©y §a", tbTreeExtAward.Main, {tbTreeExtAward})