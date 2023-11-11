
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishVLMC_VNG")


function _Detail:OnMessage(tbParam)
	if not self:CheckDate() then
		return
	end
	local strType = tbParam[1];
	local strDemandType = self.tbParam[1];
	
	if strDemandType and strDemandType ~= strType then
		return
	end
	lib:DoFunByPlayer(PlayerIndex, ActivityDetailClass.OnMessage, self, {})
end


