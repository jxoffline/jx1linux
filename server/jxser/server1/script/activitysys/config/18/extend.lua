Include("\\script\\activitysys\\config\\18\\head.lua")
Include("\\script\\activitysys\\config\\18\\variables.lua")
Include("\\script\\activitysys\\config\\18\\awardlist.lua");
pActivity.nPak = curpack()

pActivity.tbTypeData = {
	--[TypeName] = {tbItem, TaskId, max_count}
	["yellow"]			= {ITEM_YELLOW_ROSE_BAG,TSK_YELLOW_BAG, TSK_USE_YELLOW_BAG, MAX_YELLOW, MAX_EXCHANGE_YELLOW},
	["green"]				= {ITEM_GREEN_ROSE_BAG, TSK_GREEN_BAG, TSK_USE_GREEN_BAG, MAX_GREEN, MAX_EXCHANGE_GREEN},
	["red"]					= {ITEM_RED_ROSE_BAG, TSK_RED_BAG, TSK_USE_RED_BAG, MAX_RED, MAX_EXCHANGE_RED},
	["yellow_adv"]	= {ITEM_YELLOW_ROSE_BAG_ADV, TSK_YELLOW_BAG_ADV, TSK_USE_YELLOW_BAG_ADV, MAX_YELLOW_ADV, MAX_EXCHANGE_YELLOW_ADV},
	["green_adv"]		= {ITEM_GREEN_ROSE_BAG_ADV, TSK_GREEN_BAG_ADV, TSK_USE_GREEN_BAG_ADV, MAX_GREEN_ADV, MAX_EXCHANGE_GREEN_ADV},
	["red_adv"]			= {ITEM_RED_ROSE_BAG_ADV, TSK_RED_BAG_ADV, TSK_USE_RED_BAG_ADV, MAX_RED_ADV, MAX_EXCHANGE_RED_ADV},
}

pActivity.tbDisplayOrder = {
	[1] = pActivity.tbTypeData["yellow"],
	[2] = pActivity.tbTypeData["green"],
	[3] = pActivity.tbTypeData["red"],
	[4] = pActivity.tbTypeData["yellow_adv"],
	[5] = pActivity.tbTypeData["green_adv"],
	[6] = pActivity.tbTypeData["red_adv"],
}

function pActivity:GetQueryInfo()
	local nSex = GetSex() + 1

	local szText = format("%s<enter><enter>", %TEXT_DLG_EXCHANGED_TITLE)
	
	for i=1,getn(self.tbDisplayOrder) do
		local tbCurItem = self.tbDisplayOrder[i]
		local nCurCount = self:GetTask(tbCurItem[2])
		--TEXT_FMT_QUERY_DISPLAY
		local szShowColor = "red"
		if nCurCount >= tbCurItem[5][nSex] then
			szShowColor = "green"
		end
		szText = szText..format("%20s:<color=%s>%d/%d<color><enter>", tbCurItem[1].szName, szShowColor, nCurCount, tbCurItem[5][nSex])
	end
	return szText
end

function pActivity:GetExchangeBagDlgTitle(szColor)
	return %TEXT_ROSE_SELECT_WAY
end

function pActivity:ExchangeRoseBag(szType)
	local tbCompose = self.tbCompose[szType]
	local tbTypeData = self.tbTypeData[szType]
	if (not tbCompose) or (not tbTypeData) then
		return
	end
	
	local nSex = GetSex() + 1
	local nCurCount = self:GetTask(tbTypeData[2])
	local MAX = tbTypeData[5][nSex]
	
	local nCurMax = MAX - nCurCount
	if nCurMax <= 0 then
		Talk(1, "", %TEXT_ROSE_CANT_EXCHANGE_MORE)
		return
	end
	
	tbCompose:ComposeDailog(1, nCurMax)
end

function pActivity:UseBagCheck(szType)
	local tbTypeData = self.tbTypeData[szType]
	if (not tbTypeData) then
		return
	end
	
	if not self:CheckActivityDate() then
		return 
	end
	
	local nSex = GetSex() + 1
	local nCurCount = self:GetTask(tbTypeData[3])
	local MAX = tbTypeData[4][nSex]
	
	if nCurCount >= MAX then
		Talk(1, "", %TEXT_ROSE_CANT_USE_MORE)
		return
	end
	
	if not PlayerFunLib:CheckCashLimit(1900000000,"default") then
		return
	end
	
	return 1
end

function pActivity:CheckActivityDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nStartDate > nDate then
		Talk(1, "", %TEXT_ACT_NOT_START)
		return 
	end
	
	if self.nEndDate <= nDate then
		Talk(1, "", %TEXT_ACT_END)
		return 
	end
	return 1
end

function pActivity:UseAdvRoseBag(strType)
	local tbTypeData = self.tbTypeData[strType]
	local nUsedCount =  self:GetTask(tbTypeData[3])
	local tbSpecAward_B = %tbAward_B[strType]
	local tbSpecAward_A = %tbAward_A[strType]
	local tbTmpLog = {
		["yellow_adv"] = "TuiHuongHoaHongVang",
		["green_adv"] = "TuiHuongHoaHongLuc",
		["red_adv"] = "TuiHuongHoaHongDo",
	}
	if tbSpecAward_B and tbSpecAward_B[nUsedCount] then		
		tbAwardTemplet:Give(tbSpecAward_B[nUsedCount], 1, {%EVENT_LOG_TITLE, format("SuDung%sDat%d", tbTmpLog[strType],nUsedCount)})		
	else
		tbAwardTemplet:Give(%tbAward_D, 1, {%EVENT_LOG_TITLE, "SuDung"..tbTmpLog[strType]})
	end	
	if tbSpecAward_A and tbSpecAward_A[nUsedCount] then
			tbAwardTemplet:Give(tbSpecAward_A[nUsedCount], 1, {%EVENT_LOG_TITLE, format("SuDung%sDatMoc%d", tbTmpLog[strType], nUsedCount)})
	end
end