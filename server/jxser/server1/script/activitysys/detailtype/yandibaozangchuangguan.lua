Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("YDBZguoguan")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local nPlayerIndex = tbParam[1];
	local nIndex = tbParam[2];
	
	if (nIndex and self.tbParam[1] and (nIndex ~= self.tbParam[1])) then
		return
	end

	lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
	
end
