
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishFengLingDu")


function _Detail:OnMessage(tbParam)
	
	local tbPlayerAll = tbParam[1];
		
	if not self:CheckDate() then
		return
	end
		
	for i=1, getn(tbPlayerAll) do
			local nPlayerIndex = tbPlayerAll[i];
			
		if nPlayerIndex ~= nil and nPlayerIndex > 0 then
			lib:DoFunByPlayer(nPlayerIndex, ActivityDetailClass.OnMessage, self, {})
		end
	end
	
end


