
Include("\\script\\activitysys\\functionlib.lua")

tbYanhuaNpc = {}
tbYanhuaNpc.tbData = {}
function tbYanhuaNpc:Create(tbAward, tbFunLimit)
	
	if not(tbFunLimit.pfun()) then
			Msg2Player("Sö dông qu¸ nhiÒu ph¸o hoa råi!")
			return
	end

	local nPosX, nPosY, nMapIndex = GetPos()
	local nNpcIndex = AddNpcEx(1575, 1, 5, nMapIndex, nPosX, nPosY, 1, " ", 0)
	self.tbData[nNpcIndex] = {szPlayerName = GetName(), nCount = 0, tbAward=tbAward};
	AddTimer(18*15, "tbYanhuaNpc:OnTime", nNpcIndex)
end

function tbYanhuaNpc:CalcDistance(nx1, ny1, nx2, ny2)
	return ( (nx1-nx2)^2 + (ny1-ny2)^2 )
end;

function tbYanhuaNpc:OnTime(nNpcIndex, nTimerId)

	local tbData = self.tbData[nNpcIndex]

	if not tbData then
		if nNpcIndex > 0 then
			DelNpc(nNpcIndex)
		end
		return 0,0
	end
	
	
	
	tbData.nCount = tbData.nCount + 1
	
	local nPlayerIndex = SearchPlayer(tbData.szPlayerName)
	
	if nPlayerIndex > 0 then
		
		local nNpcX, nNpcY, nNpcMapIndex = GetNpcPos(nNpcIndex)
		local nX, nY, nMapIndex = lib:DoFunByPlayer(nPlayerIndex, GetPos)
		
		if nNpcMapIndex == nMapIndex and self:CalcDistance(nX/32, nY/32, nNpcX/32, nNpcY/32) <= 144 then
			
			lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbData.tbAward, "µãÈ¼ÑÌ»¨½±Àø")
			
		end
	end
	
	if tbData.nCount >= 60 then
		if nNpcIndex > 0 then
			DelNpc(nNpcIndex)
		end
		return 0,0
	else
		return 18*15, nNpcIndex
	end
	
end