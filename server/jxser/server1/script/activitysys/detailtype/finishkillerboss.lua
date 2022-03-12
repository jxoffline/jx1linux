Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("FinishKillerBoss")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	local nTaskLevel = self.tbParam[1]
	local nPlayerIndex = tbParam[1]
	local myTaskNumber = tbParam[2]
	local myOrgValue = tbParam[3]
	local myTaskValue  = tbParam[4]
	
	local nTmpLevel = (ceil(myOrgValue/20)+1)*10
	if nTaskLevel ~= nTmpLevel then
		return
	end
	
	local nMemCount = lib:DoFunByPlayer(nPlayerIndex, GetTeamSize)
	local myMemberTask
	
	if nMemCount == 0 then
		myMemberTask = lib:DoFunByPlayer(nPlayerIndex, GetTask, myTaskNumber)
		if myMemberTask == myOrgValue then
			lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
		end
	else
		for i = 1, nMemCount do
			local nTmpPlayerIndex = lib:DoFunByPlayer(nPlayerIndex, GetTeamMember, i)
			myMemberTask = lib:DoFunByPlayer(nTmpPlayerIndex, GetTask, myTaskNumber)
			if myMemberTask == myOrgValue then	-- 符合了条件的队友才执行	
				lib:DoFunByPlayer(nTmpPlayerIndex, ActivityDetailClass.OnMessage, self, {})
			end
		end
	end
	
		
end

