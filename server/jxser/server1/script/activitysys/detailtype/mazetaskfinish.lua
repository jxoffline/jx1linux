Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("MazeTaskFinish")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local tbPlayer = tbParam[1]
	local nTaskId = tbParam[2]
	local szTaskList = self.tbParam[1]
	if tbPlayer == nil then
		print("Error: PlayerList is nil!!!")
		return
	end
	
	if nTaskId == nil then
		print("Error: nTaskId is nil!!!")
		return 
	end
	
	if szTaskList ~= nil then
		if nTaskId <= 0 or lib:CheckInList(szTaskList, nTaskId) ~= 1 then
				return
		end
	end
		
	for _, player in tbPlayer do
		local nPlayerIndex = player.m_PlayerIndex
		lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {});
	end
	
end
