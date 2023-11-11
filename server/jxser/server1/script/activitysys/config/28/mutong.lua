Include("\\script\\activitysys\\config\\28\\extend.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local tbPool = {
	[100] = {{nX = 1658, nY = 3019, nR = 200}, {nX = 1661, nY = 3031, nR = 120},},
	[153] = {{nX = 1710, nY = 2941, nR = 150}, {nX = 1723, nY = 2949, nR = 350}, {nX = 1699, nY = 2950, nR = 150},
						{nX = 1710, nY = 2957, nR = 300}, {nX = 1718, nY = 5959, nR = 150},},
	[174] = {{nX = 1788, nY = 3039, nR = 150},}
}

function IsInDistance(nX, nY, tbPosList)
	for _, tbPos in tbPosList do
		local nDis = (nX - tbPos.nX)^2 + (nY - tbPos.nY)^2
--		print("nX, nY, nR,nDis", tbPos.nX, tbPos.nY, tbPos.nR, nDis)
		if tbPos.nR > nDis then
			return 1
		end
	end
	return
end

local _OnBreak = function()
	Msg2Player("L y n≠Ìc bﬁ gi∏n Æoπn.")
end

local _GetAward = function(nItemIndex)
	if nItemIndex ~= nil and nItemIndex <= 0 then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang kh´ng ÆÒ") ~= 1 then
		return 0
	end
	Msg2Player("L y n≠Ìc hoµn thµnh")
	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2736,1,0,0},},1)
	local tbAward =  {{szName = "ThÔng N≠Ìc ß«y", tbProp = {6, 1, 2737, 1, 0, 0}, nBindState = -2, nExpiredTime = 20110405},}
	tbAwardTemplet:GiveAwardByList(tbAward, "Ti’t trÂng c©y 2011, nhÀn Æ≠Óc ThÔng N≠Ìc ß«y")
end

function InMap(nMapId)
	local nFlag = 0
	for nTmpMapId, _ in %tbPool do
		if nTmpMapId == nMapId then
			nFlag = 1
			break
		end
	end
	return nFlag
end

function main(nItemIndex)
	local nMapId, nX, nY = GetWorldPos()
	if InMap(nMapId) ~= 1 then
		Msg2Player("Xin h∑y l y n≠Ìc tπi b∂n ÆÂ chÿ Æﬁnh")
		return 1
	end
	
	if IsInDistance(nX, nY, %tbPool[nMapId]) ~= 1 then
		Msg2Player("Xin h∑y Æ’n g«n Æ«m n≠Ìc l y n≠Ìc")
		return 1
	end
	
	Msg2Player("Bæt Æ«u l y n≠Ìc")
	tbProgressBar:OpenByConfig(6, %_GetAward, {nItemIndex}, %_OnBreak)
	return 1
end