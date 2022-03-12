
Include("\\script\\activitysys\\activitydetail.lua")
Include("\\script\\activitysys\\functionlib.lua")

local _Detail = ActivityDetailClass:NewType("FinishMail")


function _Detail:OnMessage(tbParam)
		
	if not self:CheckDate() then
		return
	end

	local nCurType = tbParam[1];
	local nPlayerLevel = tbParam[2];
	local nCurLevel = 0;
	if (nPlayerLevel >= 60 and nPlayerLevel < 90) then
		nCurLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nCurLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nCurLevel = 3;
	else
		return
	end
	
	local nDemandType = self.tbParam[1];
	local nDemandLevel = self.tbParam[2];
	-- 判断类型，空和-2表示不具有信使种类限制
	if nDemandType and nDemandType ~= -2 and nCurType ~= nDemandType then
		return
	end
	
	if nDemandLevel and nCurLevel ~= nDemandLevel then
		return
	end

	lib:DoFunByPlayer(PlayerIndex, ActivityDetailClass.OnMessage, self, {})
end


