Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("HarvestPlants")

function _Detail:OnMessage(tbParam)
	
	local szThisPlant = tbParam[1]
	local nNpcIndex = tbParam[2]
	local szDestPlant = self.tbParam[1]
	
	if szThisPlant == szDestPlant and self:CheckDate() then
		
		for i=1, getn(self.tbCondition) do
			if not self:CallFunction(self.tbCondition[i], nNpcIndex) then
				return 
			end
		end
		
		for i=1, getn(self.tbAction) do
				self:CallFunction(self.tbAction[i], nNpcIndex)
		end		
	end
end