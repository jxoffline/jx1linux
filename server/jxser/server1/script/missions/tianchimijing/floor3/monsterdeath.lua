Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
--Include("\\script\\lib\\awardtemplet.lua")

local nDistance = 20 * 20

function OnDeath(nNpcIndex)
	Game:WritePlayerLog(3, "GiÕt chÕt qu¸i vËt")
	local tbAward = 
	{
		--DC thiªn tr× mËt c¶nh - Modifie By DinhHQ - 20120403
		--{nJxb = 100000},
		{nExp = 50000},
	}
	local nBelongerIndex = GetPlayerIndex(nNpcIndex)
	DynamicExecuteByPlayer(nBelongerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbAward, "GiÕt chÕt qu¸i vËt ë tÇng 3 Thiªn Tr× MËt C¶nh nhËn ®­îc phÇn th­ëng.", 1)
end

function GetPlayerIndex(nNpcIndex)
	local nPlayerIndex = PlayerIndex
	local nTeamSize = CallPlayerFunction(nPlayerIndex, GetTeamSize)
	if nTeamSize == 0 then
		return nPlayerIndex
	else
		local tbTeamIndex = {}
		local nPlayerNum = 0
		local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex)
		for i=1,nTeamSize do
			local nTeamMember = CallPlayerFunction(nPlayerIndex, GetTeamMember, i)
			local nX, nY, nMapIndex = CallPlayerFunction(nTeamMember, GetPos)
			if (nMapIndex >= 0 and nMapIndex == nNpcMapIdx) then			 
				if CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
					nPlayerNum = nPlayerNum + 1
					tbTeamIndex[nPlayerNum] = nTeamMember
				end		
			end
		end
		if nPlayerNum > 1 then
			local nRandomIdx = random(1, nPlayerNum)
			return tbTeamIndex[nRandomIdx]
		else
			return tbTeamIndex[1]
		end
	end
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end