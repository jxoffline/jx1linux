Include("\\script\\activitysys\\config\\18\\head.lua")
Include("\\script\\activitysys\\config\\18\\variables.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

function TableSimpleCombine(...)
	local tbOut = {}
	for i=1,getn(arg) do
		if type(arg[i]) == "table" then
			for k,v in arg[i] do
				if k ~= "n" and type(k) == "string" then
					tbOut[k]=v
				end
			end
		end
	end
	return tbOut
end

function _CallBack(tbFormula, nCount)
	local szGDP = format("%d,%d,%d", unpack(tbFormula.tbProduct.tbProp))
	local szDate = GetLocalDate("%Y%m%d")
	local pActivity = tbFormula.pActClass
	if not pActivity then
		return
	end
	local nCountBefore = pActivity:GetTask(tbFormula.nTaskId)
	pActivity:AddTask(tbFormula.nTaskId, nCount)
	local nCountAfter = nCountBefore + nCount
	
	local tbLogInfo = %LOG_FORMAT[szGDP]
	if not tbLogInfo then
		return
	end
	%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, tbLogInfo.szAll, nCount, szDate)
	for i = nCountBefore + 1, nCountAfter do
		if tbLogInfo[i] then
			local nSex = GetSex() + 1
			%tbLog:PlayerActionLog(%EVENT_LOG_TITLE, format(tbLogInfo.Sex[nSex], i))
		end
	end
end

local tbFormula = {
	["yellow"] = {
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.004,
		tbMaterial = {
			TableSimpleCombine(ITEM_YELLOW_ROSE, {nCount=1}),
			TableSimpleCombine(ITEM_GREEN_ROSE, {nCount=1}),
		},
		tbProduct = TableSimpleCombine(ITEM_YELLOW_ROSE_BAG, {nCount=1}),		
		pProductFun = _CallBack,
		pActClass = pActivity,
		nTaskId = TSK_YELLOW_BAG,
	},
	["yellow_adv"] = {
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.004,
		tbMaterial = {
			TableSimpleCombine(ITEM_YELLOW_ROSE_BAG, {nCount=1}),			
			TableSimpleCombine(ITEM_BLUE_ROSE, {nCount=1}),
		},
		tbProduct = TableSimpleCombine(ITEM_YELLOW_ROSE_BAG_ADV, {nCount=1}),		
		pProductFun = _CallBack,
		pActClass = pActivity,
		nTaskId = TSK_YELLOW_BAG_ADV,
	},
	["green"] = {
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.004,
		tbMaterial = {
			TableSimpleCombine(ITEM_YELLOW_ROSE, {nCount=1}),
			TableSimpleCombine(ITEM_GREEN_ROSE, {nCount=1}),
			TableSimpleCombine(ITEM_WHITE_ROSE, {nCount=1}),
		},
		tbProduct = TableSimpleCombine(ITEM_GREEN_ROSE_BAG, {nCount=1}),		
		pProductFun = _CallBack,
		pActClass = pActivity,
		nTaskId = TSK_GREEN_BAG,
	},
	["green_adv"] = {
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.004,
		tbMaterial = {
			TableSimpleCombine(ITEM_GREEN_ROSE_BAG, {nCount=1}),			
			TableSimpleCombine(ITEM_BLUE_ROSE, {nCount=1}),
		},
		tbProduct =TableSimpleCombine(ITEM_GREEN_ROSE_BAG_ADV, {nCount=1}),			
		pProductFun = _CallBack,
		pActClass = pActivity,
		nTaskId = TSK_GREEN_BAG_ADV,
	},
	["red"] = {
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.004,
		tbMaterial = {
			TableSimpleCombine(ITEM_YELLOW_ROSE, {nCount=1}),
			TableSimpleCombine(ITEM_GREEN_ROSE, {nCount=1}),
			TableSimpleCombine(ITEM_WHITE_ROSE, {nCount=1}),
			TableSimpleCombine(ITEM_RED_ROSE, {nCount=1}),
		},
		tbProduct =TableSimpleCombine(ITEM_RED_ROSE_BAG, {nCount=1}),
		pProductFun = _CallBack,
		pActClass = pActivity,
		nTaskId = TSK_RED_BAG,
	},
	["red_adv"] = {
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.004,
		tbMaterial = {
			TableSimpleCombine(ITEM_RED_ROSE_BAG, {nCount=1}),			
			TableSimpleCombine(ITEM_BLUE_ROSE, {nCount=2}),
		},
		tbProduct = TableSimpleCombine(ITEM_RED_ROSE_BAG_ADV, {nCount=1}),			
		pProductFun = _CallBack,
		pActClass = pActivity,
		nTaskId = TSK_RED_BAG_ADV,
	},
}


pActivity.tbCompose = {
	["yellow"] = tbActivityCompose:new(tbFormula["yellow"]),
	["green"] = tbActivityCompose:new(tbFormula["green"]),
	["red"] = tbActivityCompose:new(tbFormula["red"]),
	["yellow_adv"] = tbActivityCompose:new(tbFormula["yellow_adv"]),
	["green_adv"] = tbActivityCompose:new(tbFormula["green_adv"]),
	["red_adv"] = tbActivityCompose:new(tbFormula["red_adv"]),
}
