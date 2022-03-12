Include("\\script\\activitysys\\activitydetail.lua")

local _Detail = ActivityDetailClass:NewType("Chuanguan")

function _Detail:OnMessage(tbParam)
	
	if not self:CheckDate() then
		return
	end
	
	if self.tbParam[1] and lib:CheckInList(self.tbParam[1], tbParam[1]) ~= 1 then
		return
	end
	
	local tbAllPlayer = tbParam[2];
	local nLevel = tbParam[3];
	
	if (nLevel and self.tbParam[2] and (nLevel ~= self.tbParam[2])) then
		return
	end
	
	for i = 1, getn(tbAllPlayer) do 
		CallPlayerFunction(tbAllPlayer[i], ActivityDetailClass.OnMessage, self, {});
	end
end


