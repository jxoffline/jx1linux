
Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("ClickNpc")


function _Detail:OnMessage(tbParam)
	
	
	local tbDailog = tbParam[1]
	local nNpcIndex = tbParam[2]
	
	local szNpcName = self.tbParam[1]
	if szNpcName == tbDailog.szNpcName and self:CheckDate() then
		
		for i=1, getn(self.tbCondition) do
			if not self:CallFunction(self.tbCondition[i], nNpcIndex) then
				return 
			end
		end
		
		for i=1, getn(self.tbAction) do
			local tfn = self.tbAction[i]
			if (tfn.szName == "AddDialogOpt") then	
				tbDailog:AddOptEntry(tfn.tbParam[1], self.pActivity.GotoDetail, {self.pActivity, tonumber(tfn.tbParam[2]), {tbDailog}})
			elseif (tfn.szName == "SetDialogTitle") then
				tbDailog.szTitleMsg = tfn.tbParam[1]
			end
		end		
	end
end