IncludeLib("SETTING");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

tbHappyBox = {}
tbHappyBox.tbAward = {
	[1] = {szName = "ßi”m Kinh Nghi÷m", nExp_tl =10e9},
	[2] = {szName = "ßi”m Kinh Nghi÷m", nExp_tl =5e9},
	[3] = {szName = "ßi”m Kinh Nghi÷m", nExp_tl =3e9},
}
tbHappyBox.tbTSK_Info = {
	[0] = {nTaskID = 2986,nStartBit = 24,nBitCount = 1,nMaxValue = 1},
	[1] = {nTaskID = 2991,nStartBit = 28,nBitCount = 1,nMaxValue = 1},
}

function tbHappyBox:CheckCondition()
	local nTransLife = ST_GetTransLifeCount()
	local nRes = 1
	if nTransLife < 4 or nTransLife > 5 then
		nRes = nil
	end
	if nTransLife == 4 and GetLevel() < 150 then
		nRes = nil
	end
	if not nRes then
		Talk(1, "", "ßi“u ki÷n sˆ dÙng vÀt ph»m nµy: trÔng sinh 4 Æºng c p 150 Æ’n 199 ho∆c trÔng sinh 5 kh´ng giÌi hπn Æºng c p")
		return nil
	else
		return 1
	end	
end

function main(nItemIdx)
	if not tbHappyBox:CheckCondition() then
		return 1
	end
	local nItemParam = GetItemParam(nItemIdx, 1)
	if not tbHappyBox.tbTSK_Info[nItemParam] then
		return 1
	end
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(tbHappyBox.tbTSK_Info[nItemParam], 0, "MÁi ng≠Íi ch¨i chÿ sˆ dÙng 1 l«n HÈp quµ vui vŒ", "==") then
		return 1
	end
	local nTransLife = ST_GetTransLifeCount()
	local nLevel = GetLevel()
	local tbFinalAward
	if nTransLife == 4 then
		if nLevel >= 150 and nLevel <= 159 then
			tbFinalAward = tbHappyBox.tbAward[1]
		end
		if nLevel >= 160 and nLevel <= 199 then
			tbFinalAward = tbHappyBox.tbAward[2]
		end
	elseif nTransLife == 5 then
		tbFinalAward = tbHappyBox.tbAward[3]
	end
	tbVNG_BitTask_Lib:setBitTask(tbHappyBox.tbTSK_Info[nItemParam], 1)
	tbAwardTemplet:Give(tbFinalAward, 1, {"HopQuaVuiVe", "SuDungHopQuaVuiVe", "Param: "..nItemParam})
end