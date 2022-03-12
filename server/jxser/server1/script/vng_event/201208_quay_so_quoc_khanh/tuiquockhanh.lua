--item nhÀn Æ≠Óc tı promotion quay sË th∏ng 8 - Created by DinhHQ - 20120821
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
_pExpAward = function(nItemCount, szLogTitle) 
	local tbBitTskExpLimit = {
		nTaskID = 2950,
		nStartBit = 1,
		nBitCount = 9,
		nMaxValue = 400
	}
	if tbVNG_BitTask_Lib:IsMaxValue(tbBitTskExpLimit) == 1 then
		Msg2Player("ß∑ Æπt giÌi hπn kinh nghi÷m sˆ dÙng TÛi Mıng QuËc Kh∏nh")
		return
	end
	local nCurTSKValue = tbVNG_BitTask_Lib:getBitTask(tbBitTskExpLimit)
	tbVNG_BitTask_Lib:addTask(tbBitTskExpLimit, 3)
	local nExp2Add = tbVNG_BitTask_Lib:getBitTask(tbBitTskExpLimit) - nCurTSKValue
	if nExp2Add > 0 then
		local tb = {szName = "ßi”m Kinh Nghi÷m", nExp=nExp2Add*1e7,}
		tbAwardTemplet:Give(tb, 1, {"QuaySoMungQuocKhanh", "SuDungTuiMungQuocKhanh"})	
	end	
end
function main(nItemIdx)
	if CalcFreeItemCellCount() < 3 then
		Talk(1, "", "ß” tr∏nh m t m∏t tµi s∂n, xin h∑y chıa 3 ´  trËng trong hµnh trang rÂi mÌi sˆ dÙng vÀt ph»m")
		return 1
	end
	local tbTmpAward = {
		[1] = {
			[1] = {
				{szName="Ch©n Nguy™n ß¨n (trung)",tbProp={6,1,30228,1,0,0},nCount=2, nBindState = -2},
				{szName="HÈ Mπch ß¨n",tbProp={6,1,3203,1,0,0},nCount=5,},
			},
			nRate = 50
		},
		[2] =	{pFun = function (nItemCount, szLogTitle) %_pExpAward() end, nRate = 50},	
	}
	tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "SuDungTuiMungQuocKhanh"})
end