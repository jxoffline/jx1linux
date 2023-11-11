Include("\\script\\lib\\awardtemplet.lua")

local szPrompt_bag = "Xin h·y kiÓm tra kh«ng gian hµnh trang vÉn cßn ®ñ « trèng."
local szPrompt_exp = "§iÓm kinh nghiÖm hiÖn t¹i cña ®¹i hiÖp kh«ng ®ñ ®Ó ®æi sè l­îng Ch©n Nguyªn nhiÒu nh­ vËy."
local tbAwardItem = {tbProp={6,1,30227,1,0,0},}
nMaxNum = 999
local tbExpConsume = {
	[0]=1000000, 
	[1]=1000000, 
	[2]=1000000,
	[3]=2000000, 
	[4]=3000000, 
	[5]=4000000,
}

function Zhenyuan_award(nAvailExp, nCount)
	local nReduceExp = %tbExpConsume[ST_GetTransLifeCount()] * nCount
	if nAvailExp>=nReduceExp then
		if CalcFreeItemCellCount() >= nCount then
			ReduceOwnExp(nReduceExp)
			tbAwardTemplet:Give(%tbAwardItem, nCount, {"zhenyuandan"})
		else
			Msg2Player(%szPrompt_bag)
		end
	else
		Msg2Player(%szPrompt_exp)
	end
end