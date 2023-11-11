Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
function main()
	if PlayerFunLib:VnCheckInCity ("default") ~= 1 then
		return 1
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, yªu cÇu chõa Ýt nhÊt <color=red>2<color> « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy.")
		return 1
	end
	local tbBitTskLimitUse = {
		nTaskID = 2930,
		nStartBit = 2,
		nBitCount = 13,
		nMaxValue = 5000,
	}
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBitTskLimitUse, tbBitTskLimitUse.nMaxValue, "Sö dông vËt phÈm ®· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông thªm", "<") ~= 1 then
		return 1
	end
	tbVNG_BitTask_Lib:addTask(tbBitTskLimitUse, 1)
	local tbTmpAward = {
		[1] = {szName = "§iÓm kinh nghiÖm", nExp =30e6, nCount = 1, nRate = 50},
		[2] = {
			nRate = 50,
			[1] = {szName="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=1, nBindState = -2},
			[2] = {szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=10},
		},
	}
	tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoNoel", "SuDungHopQuaGiangSinh"})
end