
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FLD_Collect_Item_VNG")


function _Detail:OnMessage(tbParam)
	if not self:CheckDate() then
		return
	end
	lib:DoFunByPlayer(PlayerIndex, ActivityDetailClass.OnMessage, self, {})
end


