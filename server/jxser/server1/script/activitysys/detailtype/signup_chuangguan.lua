Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("SignUpChuangguan")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local nPlayerIndex = tbParam[1]
	local neLevel = tbParam[2]
	
	if (neLevel and self.tbParam[1] and (neLevel ~= self.tbParam[1])) then
		return
	end

	lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
	
end
