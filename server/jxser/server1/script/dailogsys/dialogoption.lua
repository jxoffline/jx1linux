do return end
Include("\\script\\lib\\pfunction.lua")
Include("\\script\\lib\\functionset.lua")
Include("\\script\\lib\\rangevalue.lua")
if not DailogOptionClass then
	DailogOptionClass = tbBaseClass:new()
end

function DailogOptionClass:_init(bIsClear)
	if bIsClear == 0 then
		return 
	end
	self.DateRange = RangeValueClass:new()
	self.szMsg = ""
	self.szEntry = ""
	self.szConfirmTips = ""
	self.pFunctionSet = FunctionSetClass:new()
end

function DailogOptionClass:GetEntry(szNpcName, nSelectId, szMsg, bIsConfirm, nItemIndex)
	if self.szEntry and self.szEntry ~= "" then
		return self.szEntry
	else
		self.szNpcName = szNpcName or self.szNpcName
		self.nSelectId = nSelectId or self.nSelectId
		return format("%s/#%s:%s([[%s]],%d,%d,%d)", szMsg or self.szMsg, "G_DIALOG", "OnSelect", self.szNpcName, self.nSelectId, bIsConfirm or 0, nItemIndex)	
	end
	
end

function DailogOptionClass:OnSelect(bIsConfirm, nItemIndex)
	
	
	
	
	local pFunctionSet = self.pFunctionSet
	for i=1, getn(pFunctionSet.tbConditionList) do
		local tbCondition = pFunctionSet.tbConditionList[i]
		if tbCondition:exec(self) ~= 1 then
			--print("²»·ûºÏÌõ¼þ")
			return
		end
	end
	
	if self.szConfirmTips and self.szConfirmTips ~= "" and bIsConfirm ~= 1 then
		return Say(self.szConfirmTips, 2,  self:GetEntry(nil, nil, "X¸c nhËn", 1, nItemIndex), "Hñy bá /OnCancel")
	end 
	
	for i=1, getn(pFunctionSet.tbActionList) do
		
		local tbAction = pFunctionSet.tbActionList[i]
		--print("Ö´ÐÐ", tbAction.szName)
		
		if tbAction.szClassName == "PlayerFunLib" and tbAction.szName == "ShowSubDailog" then
			tbAction:exec(self, self.szNpcName, nItemIndex)
		else
			tbAction:exec(self)	
		end
		
	end
end

DailogOptionClass:_init()