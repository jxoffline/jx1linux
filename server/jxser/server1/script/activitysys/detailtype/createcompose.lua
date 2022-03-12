
Include("\\script\\activitysys\\activitydetail.lua")


local _Detail = ActivityDetailClass:NewType("CreateCompose")

function _Detail:RegisteMessage(gActivity)
	
end


function _Detail:CallFunction(tfn, nComposeCount, bLimitStage)
	if tfn.szClassName == "ThisActivity" then
		tfn.Class = self.pActivity
		local varParam2 = nil
		tfn.fn = self.pActivity[tfn.szName]
		if tfn.szName == "CheckTask" or tfn.szName == "CheckTaskDaily" then		
			
			if type(tfn.tbParam[2]) == "string" then
				varParam2 = gsub(tfn.tbParam[2], "<ComposeCount>", nComposeCount)
			else
				varParam2 = tfn.tbParam[2]
			end
			return tfn.fn(tfn.Class, tfn.tbParam[1], varParam2, tfn.tbParam[3], tfn.tbParam[4])	
		elseif tfn.szName == "AddTask" or tfn.szName == "AddTaskDaily" then
			if type(tfn.tbParam[2]) == "number" then
				varParam2 = tfn.tbParam[2] * nComposeCount
			end
			return tfn.fn(tfn.Class, tfn.tbParam[1], varParam2)	
			
		else
			local tbParam = {nComposeCount}
			return tfn:exec(tbParam)
		end
		
	elseif tfn.szClassName == "PlayerFunLib" and (tfn.szName == "GetItem" or tfn.szName == "GetAward") then
		
		if type(tfn.tbParam[2]) == "number" then
			varParam2 = tfn.tbParam[2] * nComposeCount
		end
		tfn:GetGlobal()
		return tfn.fn(tfn.Class, tfn.tbParam[1], varParam2, tfn.tbParam[3], tfn.tbParam[4])
	elseif bLimitStage == 1 then
		tfn:GetGlobal()
		return tfn:exec()
	else
		for i=1, nComposeCount do
			tfn:GetGlobal()
			tfn:exec()
		end
		
	end
	
end


function _Detail:Init()	
	local tbConditionList = self.tbCondition
	local tbActionList = self.tbAction
	local tbFormula = {}
	tbFormula.pLimitFun = {}
	tbFormula.pProductFun = {}
	tbFormula.tbCondition = {}
	tbFormula.tbAction = {}
	
	for i=1, getn(tbConditionList) do
		local tbCondition = tbConditionList[i]
		if tbCondition.szName == "AddMaterialList" then
			local tbItemList = lib:ParseAwardTable(tbCondition.tbParam[1])
			tbFormula.tbMaterial = tbItemList
		elseif tbCondition.szName == "AddOneMaterial" then
			local tbItem = lib:CopyTB1(lib:ParseAward(tbCondition.tbParam[2]))
			tbItem.szName = tbCondition.tbParam[1]
			tbItem.nCount = tbCondition.tbParam[3]
			if tbFormula.tbMaterial then
				tinsert(tbFormula.tbMaterial, tbItem)
			else
				tbFormula.tbMaterial = {tbItem}
			end
		else
			tinsert(tbFormula.tbCondition, tbCondition)
		end
	end
	
	tbFormula.pLimitFun =  function(pCompose, nComposeCount)
		for i=1, getn(pCompose.tbCondition) do 
			if %self:CallFunction(pCompose.tbCondition[i], nComposeCount, 1) ~= 1 then
				return nil
			end
		end
		return 1
	end
	
	tbFormula.tbAction = tbActionList
	
	tbFormula.pProductFun = function(pCompose, nComposeCount)
		for i=1, getn(pCompose.tbAction) do 
			%self:CallFunction(pCompose.tbAction[i], nComposeCount, nil)
		end
	end
	tbFormula.szComposeTitle = self.tbParam[1]
	
	tbFormula.nWidth = tonumber(self.tbParam[3]) 
	
	tbFormula.nHeight = tonumber(self.tbParam[4])
	
	tbFormula.nFreeItemCellLimit = tonumber(self.tbParam[5])
	local nRoomType = INVENTORY_ROOM.room_equipment
	if tonumber(self.tbParam[6]) == 1 then
		nRoomType = INVENTORY_ROOM.room_giveitem
	end
	
	self.pCompose = tbActivityCompose:new(tbFormula, self.szName, nRoomType)
end


function _Detail:OnMessage(tbParam)
	if not self.pCompose then
		self:Init()
	end
	if self:CheckDate() then
		self.pCompose:ComposeDailog(tonumber(self.tbParam[2]), tonumber(self.tbParam[7]))
	end
	
end