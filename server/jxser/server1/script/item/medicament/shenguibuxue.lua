
local tbP2Lvl = 
{
	["6,1,2581"] = 6,
	["6,1,2582"] = 5,
	["6,1,2583"] = 4,
}

function main(nItemIndex)
	local nG,nD, nP = GetItemProp(nItemIndex)
	local szMsg = format("%d,%d,%d", nG,nD,nP)
	local nSkillLevel = %tbP2Lvl[szMsg]
	if nSkillLevel then
		AddSkillState(987, nSkillLevel, 1, 10)
		
	else
		return 1
	end
end