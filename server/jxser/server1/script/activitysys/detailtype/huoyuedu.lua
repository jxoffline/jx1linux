Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("Huoyuedu")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	if self.tbParam[1] and self.tbParam[1] > tbParam[1] then
		return
	end
	
	CallPlayerFunction(PlayerIndex, ActivityDetailClass.OnMessage, self, {});
end