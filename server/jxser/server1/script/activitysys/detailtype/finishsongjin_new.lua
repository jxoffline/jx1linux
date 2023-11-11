
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishSongJin")


function _Detail:OnMessage(tbParam)
	print("OnMessage TTTTTTTTTKKKKKKKKKK")
	local nBattleLevel = tbParam[1]
	local tbPlayerAll = tbParam[2]
	local tbPlayerWin = tbParam[3]
	local tbPlayerLos = tbParam[4]
	local nBattleWinLos = tbParam[5]
	
	if self:CheckDate() then
		
		local nWinLoss = tonumber(self.tbParam[1])
		local szBattleLevelList = self.tbParam[2]
		
		if lib:CheckInList(szBattleLevelList, nBattleLevel) ~= 1 then
			return
		end
		local tbPlayerList = nil
		if (nWinLoss == -2) then
			tbPlayerList = tbPlayerAll
		elseif nBattleWinLos ~= 0 and nWinLoss == 1 then --Ӯ
			tbPlayerList = tbPlayerWin
		elseif  nBattleWinLos == 0 and nWinLoss == 0 then --ƽ
			tbPlayerList = tbPlayerAll
		elseif  nBattleWinLos ~= 0 and nWinLoss == -1 then --ƽ
			tbPlayerList = tbPlayerLos
		end
		if not tbPlayerList then
			return
		end
		
		for i=1, getn(tbPlayerList) do
			local nPlayerIndex = tbPlayerList[i]
			
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
			end
		end
	end
end

