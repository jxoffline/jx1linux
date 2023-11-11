Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("YDBZ_KillMaxBoss")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	ActivityDetailClass.OnMessage(self, tbParam)

end
