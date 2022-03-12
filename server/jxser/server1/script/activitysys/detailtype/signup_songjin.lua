Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("SignUpSongJin")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local nPlayerIndex = tbParam[1]
	local nBattleLevel = tbParam[2]
	
	if (nBattleLevel and self.tbParam[1] and (nBattleLevel ~= self.tbParam[1])) then
		return
	end

	lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
	
end
