
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishYesou")


function _Detail:OnMessage(tbParam)
		
	if not self:CheckDate() then
		return
	end

	local nLimNum = tbParam[1];
	local nCancelNum = tbParam[2];
	local nDemandTaksValue = self.tbParam[1];
	
	if (nLimNum - nCancelNum) < nDemandTaksValue then
		return
	end
	
	lib:DoFunByPlayer(PlayerIndex, ActivityDetailClass.OnMessage, self, {})
end


