

Include("\\script\\activitysys\\activitydetail.lua")
local _Detail = ActivityDetailClass:NewType("CreateDialog")

function _Detail:RegisteMessage(gActivity)
	
end

function _Detail:OnMessage(tbParam)
	
	local tbPreDialog = tbParam[1] -- 外部参数
	
	if self:CheckDate() then
		for i=1, getn(self.tbCondition) do
			if not self:CallFunction(self.tbCondition[i]) then
				return 
			end
		end
		
		local tbDailog = DailogClass:new()
		if self.tbParam[2] ~= 1 then
			tbDailog.szTitleMsg = self.tbParam[1]
		else
			if type(self.tbParam[3]) ~= "table" then
				tbDailog.szTitleMsg = self.pActivity[self.tbParam[1]](self.pActivity)
			else
				tbDailog.szTitleMsg = self.pActivity[self.tbParam[1]](self.pActivity, unpack(self.tbParam[3]))
			end
		end
		for i=1, getn(self.tbAction) do
			local tfn = self.tbAction[i]
			if (tfn.szName == "AddDialogOpt") then	
				tbDailog:AddOptEntry(tfn.tbParam[1], self.pActivity.GotoDetail, {self.pActivity, tonumber(tfn.tbParam[2]), {tbDailog}})
			elseif (tfn.szName == "AddDialogOptFunction") then
				local tfunc = FunctionClass:new(tfn.tbParam[2], tfn.tbParam[3])
				tbDailog:AddOptEntry(tfn.tbParam[1], self.CallFunction, {self, tfunc, unpack(tfunc.tbParam)}, {tbDailog})
			end
		end
		
		tbDailog.pPreDailog = tbPreDialog
		tbDailog:Show()
	end
	
end