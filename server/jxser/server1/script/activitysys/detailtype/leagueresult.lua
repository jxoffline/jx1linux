
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("LeagueResult")


function _Detail:OnMessage(tbParam)
		
	if not self:CheckDate() then
		return
	end

	local nLevel = tbParam[1];
	local nResule = tbParam[2];
	local nDemandLevel = self.tbParam[1];
	local nDemandResule = self.tbParam[2];
	-- print(nLevel, nResule,nDemandLevel,nDemandResule)
	if (nLevel ~= nDemandLevel) then
		return
	end
	
	if (nDemandResule ~= -1) then		-- -1为不论胜负，~= -1 需要判定胜负是否符合要求
		if (nResule ~= nDemandResule) then
			return
		end
	end
	
	lib:DoFunByPlayer(PlayerIndex, ActivityDetailClass.OnMessage, self, {})
end


