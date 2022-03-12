
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishSongJin")


function _Detail:OnMessage(tbParam)
	
	local nBattleLevel = tbParam[1]
	local tbPlayerList = tbParam[2]
		
	if self:CheckDate() then
		
		local nWinLoss = tonumber(self.tbParam[1])
		local szBattleLevelList = self.tbParam[2]
		
		if lib:CheckInList(szBattleLevelList, nBattleLevel) ~= 1 then
			return
		end
		
		for i=1, getn(tbPlayerList) do
			local tbPlayer = tbPlayerList[i]
			if tbPlayer.nIndex ~= nil and tbPlayer.nIndex > 0 then
				if nWinLoss == -2 then
					CallPlayerFunction(tbPlayer.nIndex, ActivityDetailClass.OnMessage, self, {})
				elseif tbPlayer.nResult == nWinLoss then
					CallPlayerFunction(tbPlayer.nIndex, ActivityDetailClass.OnMessage, self, {})
				end
			end
		end 
	end
end

