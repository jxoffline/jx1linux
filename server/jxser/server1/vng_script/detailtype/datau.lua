Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("HoanThanhDaTau")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	if self.tbParam[1] and self.tbParam[1] > tbParam[1] then
		return
	end
	print("=====ActivityDetailClass:NewType(HoanThanhDaTau)")
	CallPlayerFunction(PlayerIndex, ActivityDetailClass.OnMessage, self, {});
end