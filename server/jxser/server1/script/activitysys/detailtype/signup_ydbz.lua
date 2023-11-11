Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("SignUpYDBZ")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local nPlayerIndex = tbParam[1]
	
	if nPlayerIndex <= 0 then
		return
	end

	lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
	
end
