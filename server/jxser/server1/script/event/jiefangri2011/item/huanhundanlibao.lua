--»¹»êµ¤Àñ°ü

Include("\\script\\lib\\awardtemplet.lua")

local tbItem = {szName="Hoµn Hån §¬n",tbProp={6,1,2837,1,0,0},}

function main(nIndexItem)
	
	if CountFreeRoomByWH(1, 1, 1) < 1 then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", 1, 1, 1))
		return 1
	end
--Fix item with them same expired time cannot be stacked - Modified by Dinh HQ - 20110427
--	local nH = GetLocalDate("%H")
--	local nM = GetLocalDate("%M")
--	local nTime = (24 - nH - 1) * 60 + (60 - nM)
--	%tbItem.nExpiredTime = 30 * 24 * 60 + nTime
	
	local nY = tonumber(GetLocalDate("%Y"))
	local nM =  tonumber(GetLocalDate("%m"))
	local nD =  tonumber(GetLocalDate("%d"))
	nD = nD + 14
	if nD > 30 then
		nD = nD - 30
		nM = nM + 1
	end
	if nM > 12 then
		nM = 1
		nY = nY + 1
	end
	local nNextExpiredTime = (nY * 100 + nM) * 100 + nD
	%tbItem.nExpiredTime = nNextExpiredTime
	
	tbAwardTemplet:Give(%tbItem, 5, {"jiefangri2011","use_huanhundanlibao"})
	return 0
end



