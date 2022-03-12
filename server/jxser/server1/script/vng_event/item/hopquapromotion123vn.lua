Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main(nItemIdx)
	if PlayerFunLib:VnCheckInCity ("default") ~= 1 then
		return 1
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, yªu cÇu chõa Ýt nhÊt <color=red>2<color> « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy.")
		return 1
	end
	local tbBitTskLimitUse = {
		nTaskID = 2930,
		nStartBit = 15,
		nBitCount = 3,
		nMaxValue = 3,
	}
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTskLimitUse, tbBitTskLimitUse.nMaxValue, "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm", "<") ~= 1 then
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTskLimitUse, 1)
	local tbTmpAward = {
		[0] = {
			--{szName="XÝch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1, nRate = 0},
			{szName = "§iÓm kinh nghiÖm", nExp =600e6, nCount = 1},
			--{szName="M¶nh XÝch L©n",tbProp={6,1,3391,1,0,0},nCount=2, nRate = 0},
		},
		[1] = {
			{szName="XÝch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1, nRate = 15},
			{szName = "§iÓm kinh nghiÖm", nExp =600e6, nCount = 1, nRate = 65},
			{szName="M¶nh XÝch L©n",tbProp={6,1,3391,1,0,0},nCount=2, nRate = 20},
		},
	}
	local nItemParam = GetItemParam(nItemIdx, 1)	
	tbAwardTemplet:Give(tbTmpAward[nItemParam], 1, {"HopQuaPromotion", "SuDungHopQuaMayMan"})
end