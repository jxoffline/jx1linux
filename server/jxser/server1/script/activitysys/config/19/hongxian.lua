Include("\\script\\activitysys\\config\\19\\extend.lua")

ValentineNumber = 1

function main(nItemIdx)
	pActivity:GetValentineRandNumber(ValentineNumber)
	return 1
end