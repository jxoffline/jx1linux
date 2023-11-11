Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("OnLogin")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local nOldPlayer = PlayerIndex;
	lib:DoFunByPlayer(tbParam[1], ActivityDetailClass.OnMessage, self, {});
	PlayerIndex = nOldPlayer;
	
end


