
--不再加载此文件
do return end
Include("\\script\\lib\\pfunction.lua")
Include("\\script\\lib\\functionset.lua")
Include("\\script\\lib\\rangevalue.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\functionlib.lua")

ComposeOptionClass = tbBaseClass:new()


function ComposeOptionClass:_init(bIsClear)
	if bIsClear == 0 then
		return 
	end
	self.DateRange = RangeValueClass:new()
	self.szMsg = ""
	self.szEntry = ""
	self.szConfirmTips = ""
	self.pFunctionSet = FunctionSetClass:new()
end



function ComposeOptionClass:MakeCompose(tbActivityDetail)
	self.szMsg = tbActivityDetail.szName
	self.bIsAskNumber = tbActivityDetail.tbParam[3]
	self.szActName = tbActivityDetail.szActName
	self.DateRange = tbActivityDetail.DateRange
	
	local pFunctionSet = tbActivityDetail.pFunctionSet
	local tbConditionList = pFunctionSet.tbConditionList
	local tbActionList = pFunctionSet.tbActionList
	 
	local tbFormula = {}
	tbFormula.pLimitFun = {}
	tbFormula.pProductFun = {}
	
	for i=1, getn(tbConditionList) do
		local tbCondition = tbConditionList[i]
		if tbCondition.szName == "AddMaterialList" then
			local tbItemList = lib:ParseAwardTable(tbCondition.tbParam[1])
			tbFormula.tbMaterial = tbItemList
		elseif tbCondition.szName == "AddOneMaterial" then
			local tbItem = lib:ParseAward(tbCondition.tbParam[2])
			tbItem.szName = tbCondition.tbParam[1]
			tbItem.nCount = tbCondition.tbParam[3]
			if tbFormula.tbMaterial then
				tinsert(tbFormula.tbMaterial, tbItem)
			else
				tbFormula.tbMaterial = {tbItem}
			end
		else
			tinsert(tbFormula.pLimitFun, tbCondition)
		end
	end
	
	for i=1, getn(tbActionList) do
		local tbAction = tbActionList[i]
		tinsert(tbFormula.pProductFun, tbAction)
	end
	
	tbFormula.szComposeTitle = tbActivityDetail.tbParam[2]
	
	tbFormula.nWidth = tonumber(tbActivityDetail.tbParam[4]) 
	
	tbFormula.nHeight = tonumber(tbActivityDetail.tbParam[5])
	
	tbFormula.nFreeItemCellLimit = tonumber(tbActivityDetail.tbParam[7])

	self.pCompose = tbActivityCompose:new(tbFormula, self.szMsg)
end


function ComposeOptionClass:GetEntry(szNpcName, nSelectId, szMsg, bIsConfirm, nItemIndex)
	if self.szEntry and self.szEntry ~= "" then
		return self.szEntry
	else
		self.szNpcName = szNpcName or self.szNpcName
		self.nSelectId = nSelectId or self.nSelectId
		return format("%s/#%s:%s([[%s]],%d,%d,%d)", szMsg or self.szMsg, "G_DIALOG", "OnSelect", self.szNpcName, self.nSelectId, bIsConfirm or 0, nItemIndex)	
	end
	
end

function ComposeOptionClass:OnSelect(bIsConfirm, nItemIndex)
	if self.bIsAskNumber == "" then
		self.bIsAskNumber = nil
	end
	
	return self.pCompose:ComposeDailog(self.bIsAskNumber, nItemIndex)
end

ComposeOptionClass:_init()