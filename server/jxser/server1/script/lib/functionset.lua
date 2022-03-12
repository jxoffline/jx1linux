Include("\\script\\lib\\pfunction.lua")

if not FunctionSetClass then
	FunctionSetClass = tbBaseClass:new()
end


function FunctionSetClass:_init()
	self.tbConditionList = {}
	self.tbActionList = {}
end

function FunctionSetClass:AddConditionByMsg(szMsg)
	local pfunction = FunctionClass:new(szMsg)
	tinsert(self.tbConditionList, pfunction)
end

function FunctionSetClass:AddActionByMsg(szMsg)
	local pfunction = FunctionClass:new(szMsg)
	tinsert(self.tbActionList, pfunction)
end

function FunctionSetClass:AddCondition(pFunction)
	tinsert(self.tbConditionList, pFunction)
end

function FunctionSetClass:AddAction(pFunction)
	tinsert(self.tbActionList, pFunction)
end

function FunctionSetClass:Exec(tbClass)
	for i=1, getn(self.tbConditionList) do
		local tbCondition = self.tbConditionList[i]
		if tbCondition:exec(tbClass) ~= 1 then
			--print("不符合条件", tbCondition.szName)
			return
		end
	end
	
	for i=1, getn(self.tbActionList) do
		
		local tbAction = self.tbActionList[i]
		--print("执行", tbAction.szName)
		tbAction:exec(tbClass)
	end
	return 1
end