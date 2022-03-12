
Include("\\script\\lib\\string.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\g_activity.lua")

Include("\\script\\item\\class\\virtualitem.lua")
Include("\\script\\global\\itemset.lua")

PlayerFunLib = {}


function PlayerFunLib:GetActivityTask(nTaskId)

	return GetTask(nTaskId)
end

function PlayerFunLib:SetActivityTask(nTaskId, nValue)

	return SetTask(nTaskId, nValue)
end

function PlayerFunLib:GetTaskDailyCount(nTaskId)
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	return mod(nTaskValue, 256)
end


--Ö÷½ÇÓÐ¹ØµÄ ÅÐ¶Ï

function PlayerFunLib:CheckInMap(szMapList, szFailMsg)
	
	local nMapId = GetWorldPos();
	
	if type(szMapList) == "number" and szMapList == nMapId then
		return 1
	end
	
	if lib:CheckInList(szMapList, nMapId) then
		return 1
	end
	
	lib:ShowMessage(szFailMsg)
	return nil;

end

function PlayerFunLib:CheckExtPoint(nExtPointId, nValue, szFailMsg, szOption)
	
	nValue = lib:NumberParamTrans(nValue)
	
	if lib:OptionFunction(GetExtPoint(nExtPointId), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end


function PlayerFunLib:CheckBT_PL_BATTLEPOINT(nValue, szOption)
	nValue = lib:NumberParamTrans(nValue)
	if lib:OptionFunction(BT_GetData(PL_TOTALPOINT), nValue, szOption) then
		return 1

	end
end


function PlayerFunLib:IsCharged(szFailMsg)
	
	if( GetExtPoint(0) >= 1 ) then
		return 1;
	else
		if szFailMsg == "default" then
			szFailMsg = "Yªu cÇu cÇn ph¶i n¹p thÎ."
		end
		lib:ShowMessage(szFailMsg)
		return nil
	end;
	
end

function PlayerFunLib:IsFightState(nFightState, szFailMsg)
	if GetFightState() ~= nFightState then
		lib:ShowMessage(szFailMsg)
		return nil;
	else
		return 1;
	end
end

function PlayerFunLib:IsHaveTong(szFailMsg)
	
	local szTongName = GetTongName();
	if szTongName == "" or szTongName == nil then
		lib:ShowMessage(szFailMsg)
		return nil;
	else
		return 1;
	end
end


function PlayerFunLib:CheckLevel(nLevel, szFailMsg, szOption)
	
	nLevel = lib:NumberParamTrans(nLevel)
	if lib:OptionFunction(GetLevel(), nLevel,szOption) then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("CÊp ph¶i ®¹t ®Õn <color=yellow>%d<color>.", nLevel)
		end
		lib:ShowMessage(szFailMsg)
	end
end


function PlayerFunLib:CheckTongTask(szTaskId, nTargetValue, szFailMsg, szOption)
	local szTongName, nTongID = GetTongName();
	szTaskId = getglobal(szTaskId)
	if not szTaskId then
		error("Miss Include tong_header.lua")
	end
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end
	nValue = lib:NumberParamTrans(nValue)
	
	
	if lib:OptionFunction(TONG_GetTaskValue(nTongID, szTaskId, nValue), nTargetValue, szOption)  then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTotalLevel(nLevel, szFailMsg, szOption)
	
	
	nLevel = lib:NumberParamTrans(nLevel)
	
	if ST_IsTransLife() == 1 or lib:OptionFunction(GetLevel(), nLevel,szOption) then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("CÊp ph¶i ®¹t ®Õn<color=yellow>%d<color> hoÆc ®· chuyÓn sinh", nLevel)
		end
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckIsTransLife(szFailMsg)
	if ST_IsTransLife() == 1 then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckTransLifeCount(nCount, szFailMsg, szOption)
	nCount = lib:NumberParamTrans(nCount)
	if lib:OptionFunction(ST_GetTransLifeCount() , nCount,szOption) then
		return 1
	else
		szFailMsg = format(szFailMsg, nCount)
		lib:ShowMessage(szFailMsg)
	end
end


function PlayerFunLib:CheckFreeBagCell(nCount, szFailMsg)
	
	nCount = lib:NumberParamTrans(nCount)
	
	if CalcFreeItemCellCount() >= nCount then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.", nCount)
		end
		lib:ShowMessage(szFailMsg)
	end
	
end

function PlayerFunLib:CheckFreeBagCellWH(nW, nH, nCount, szFailMsg)
	
	nCount = lib:NumberParamTrans(nCount)
	
	if CountFreeRoomByWH(nW, nH) >= nCount then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nW, nH)
		end
		lib:ShowMessage(szFailMsg)
	end
	
end

function PlayerFunLib:CheckCashLimit(nMaxCount, szFailMsg)
	nMaxCount = lib:NumberParamTrans(nMaxCount)
	if GetCash() < nMaxCount then
		return 1
	else
		if szFailMsg == "default" then
			szFailMsg = format("V× sù an toµn vËt dông cña b¹n, xin ®¶m b¶o tiÒn mang theo kh«ng v­ît qu¸ %d l­îng", nMaxCount)
			
		end
		lib:ShowMessage(szFailMsg)		
	end
	
end

function PlayerFunLib:CheckCash(nCount, szFailMsg)

	nCount = lib:NumberParamTrans(nCount)
	if GetCash() >= nCount then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckItemInBag(szItemInfo, nCount, szFailMsg)
	local tbItem =lib:ParseAward(szItemInfo)
	local tbProp = tbItem.tbProp
	nCount = lib:NumberParamTrans(nCount)
	
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) >= nCount then
		return 1
	else
		szFailMsg = format(szFailMsg, nCount)
		lib:ShowMessage(szFailMsg)
	end
end

function PlayerFunLib:CheckItemInPlayer(szItemInfo, nCount, szFailMsg)
	local tbItem =lib:ParseAward(szItemInfo)
	local tbProp = tbItem.tbProp
	nCount = lib:NumberParamTrans(nCount)
	
	if CalcItemCount(-1,tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < nCount then
		return 1
	else		
		lib:ShowMessage(szFailMsg)
		
	end
end

function PlayerFunLib:CheckItemListInBag(nAwardTableId, szFailMsg)
	
	local tbItemList = lib:ParseAwardTable(nAwardTableId)
	
	if not tbItemList then
		return 1
	end
	for i=1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local tbProp = tbItem.tbProp
	
		tbItem.nCount = tbItem.nCount or 1
		if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
			lib:ShowMessage(szFailMsg)
			return nil			
		end
	end
	return 1
end





function PlayerFunLib:CheckSpecialInBag(szKey, nCount, szFailMsg)
	nCount = lib:NumberParamTrans(nCount)
	
	local tbSet = getglobal(szKey)
	
	if not tbSet then
		error(szKey.." is nil")
	end
	
	local tbItem = tbVirtualItemClass:new(tbSet, nCount)
	
	if tbItem:IsHave() == 1 then
		
		return 1
	else		
		lib:ShowMessage(szFailMsg)
		
	end
end



function PlayerFunLib:CheckTaskBit(nTaskId, nBit, nValue, szFailMsg)
	szFailMsg = szFailMsg or ""
	
	if GetBit(self:GetActivityTask(nTaskId), nBit) == nValue then
		return 1
	else
		lib:ShowMessage(szFailMsg)
		return
	end
	
end



function PlayerFunLib:CheckTask(nTaskId, nValue, szFailMsg, szOption)
	
	
	nValue = lib:NumberParamTrans(nValue)
	
	if lib:OptionFunction(self:GetActivityTask(nTaskId), nValue, szOption) then
		return 1
	else
		szFailMsg = format(szFailMsg, nValue)
		lib:ShowMessage(szFailMsg)
	end
	
end

function PlayerFunLib:CheckTaskDaily(nTaskId, nValue, szFailMsg, szOption)
	nValue = lib:NumberParamTrans(nValue)
	
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	
	
	if lib:OptionFunction(mod(nTaskValue, 256), nValue, szOption) then
		return 1
	else
		lib:ShowMessage(szFailMsg)
	end
	
end

function PlayerFunLib:GetTaskDaily(nTaskId)
	
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	
	return mod(nTaskValue, 256)
	
end

--Ö÷½ÇÓÐ¹Ø ¶¯×÷

function PlayerFunLib:AddActivityPoint(nValue, bStack)
	local szPath = "\\script\\activitysys\\config\\4\\extend.lua"
	if bStack == 1 then
		DynamicExecuteByPlayer(PlayerIndex, szPath, "pActivity:AddPoint", nValue)
	else
		DynamicExecuteByPlayer(PlayerIndex, szPath, "pActivity:AddPointNoStack", nValue)
	end
end


function PlayerFunLib:AddTask(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	self:SetActivityTask(nTaskId, self:GetActivityTask(nTaskId) + nValue)
end


function PlayerFunLib:AddTaskDaily(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	
	local nTaskValue =  self:GetActivityTask(nTaskId)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	
	if floor(nTaskValue/256) ~= nCurDate then
		nTaskValue = nCurDate * 256
		self:SetActivityTask(nTaskId, nTaskValue)
	end
	
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:SetTaskDaily(nTaskId, nValue)
	nValue = lib:NumberParamTrans(nValue)
	
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nTaskValue =  nCurDate * 256
	
	self:SetActivityTask(nTaskId, nTaskValue + nValue)	
end

function PlayerFunLib:ConsumeEquiproomItem(szItemInfo, nCount)
	
	nCount = lib:NumberParamTrans(nCount)
	local tbItem =lib:ParseAward(szItemInfo)
	local tbProp = tbItem.tbProp
	
	ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	
end

function PlayerFunLib:ConsumeEquiproomItemList(nAwardTableId)
	
	local tbItemList = lib:ParseAwardTable(nAwardTableId)
	
	if not tbItemList then
		return 1
	end
	for i=1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local tbProp = tbItem.tbProp
	
		tbItem.nCount = tbItem.nCount or 1
		
		ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	end
end

function PlayerFunLib:ConsumeEquiproomSpecial(szKey, nCount)
	nCount = lib:NumberParamTrans(nCount)
	
	
	nCount = lib:NumberParamTrans(nCount)
	
	local tbSet = getglobal(szKey)
	
	if not tbSet then
		error(szKey.." is nil")
	end
	
	local tbItem = tbVirtualItemClass:new(tbSet, nCount)
	if tbItem:pConsume(nCount) then
		return 1
	else		
		lib:ShowMessage(szFailMsg)
		
	end	
end



function PlayerFunLib:GiveRandomMask(szList, szLogTitle, szAction)
	--"261,262,244,245,247,139-151,209-212,214,216,217", "shaoxia lvl 3"
	local tbResult = {}
	local tbList = lib:Split(szList,",")
	for i=1, getn(tbList) do
		local b = tonumber(tbList[i])
		if b ~= nil then
			tinsert(tbResult, b)
		else
			local c = lib:Split(tbList[i],"-")
			for j = tonumber(c[1]), tonumber(c[2]) do
				tinsert(tbResult, j)
			end
		end
	end
	
	local nIdx = random(1, getn(tbResult))
	
	local tbItem = { tbProp = {0, 11, tbResult[nIdx], 1, 0, 0}}
	
	szAction = szAction or ""
	tbAwardTemplet:Give(tbItem, 1, {szLogTitle, szAction})
end

function PlayerFunLib:GetItem(szBuff, nCount, szLogTitle, szAction)
	nCount = lib:NumberParamTrans(nCount)
	szAction = szAction or ""
	tbAwardTemplet:Give(lib:ParseAward(szBuff), nCount, {szLogTitle, szAction})
	
end


function PlayerFunLib:GetAward(nAwardTableId, nCount, szLogTitle, nExpTaskId, szOption, szAction)
	

	
	nCount = lib:NumberParamTrans(nCount)
	szAction = szAction or ""
	tbAwardTemplet:Give(lib:ParseAwardTable(nAwardTableId, nExpTaskId, szOption), nCount, {szLogTitle, szAction})
end



function PlayerFunLib:SetTaskBit(nTaskId, nBit, nValue)
	nValue = lib:NumberParamTrans(nValue)
	self:SetActivityTask(nTaskId, SetBit(self:GetActivityTask(nTaskId), nBit, nValue ))
end

function PlayerFunLib:PayExtPoint(nExtPointId, nConsumePoint)
	nConsumePoint = lib:NumberParamTrans(nConsumePoint)
	if PayExtPoint(nExtPointId, nConsumePoint) == 1 then
		
		return 1
	else
		Msg2Player(format("§¹i hiÖp ®· nép ®iÓm sè kh«ng ®ñ %d", nConsumePoint))
		
		return 
	end
end

function PlayerFunLib:SimpleMsg(szKey, szMsg)
	szMsg = lib:StringParamTrans(szMsg)	
	if (szKey == "Msg2Player") then
		Msg2Player(szMsg)
	elseif szKey == "Talk" then
		Talk(1, "", szMsg)
	elseif (szKey == "Msg2AllWorld") then
		LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg , "", "")
	elseif (szKey == "GlobalNews") then
		AddGlobalNews(szMsg)
	end
end

function PlayerFunLib:ShowSubDailog(szNpcName, szTitle, pDailog)
	local szNpcName = szNpcName
	
	
	local gDialog = getglobal("G_DIALOG")
	local gActivity = getglobal("G_ACTIVITY")
	
	if not gDialog or  not gActivity then
		print("error showdailog fail")
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = szTitle
	tbDailog.pPreDailog = pDailog
	
	gActivity:OnMessage("SetDailogTitle", tbDailog)
	gActivity:OnMessage("DailogOption", tbDailog)
	gActivity:OnMessage("ComposeDailogOption", tbDailog)
	gActivity:OnMessage("SubDailogOption", tbDailog)
	tbDailog:Show()
end

function PlayerFunLib:AddExp(nExp, bFlag, szLogTitle, szAction)
	
	nExp = lib:NumberParamTrans(nExp) 
	local tbExp = {}
	if bFlag == 1 then
		tbExp = {nExp_tl = nExp}
	else
		tbExp = {nExp = nExp}
	end
	szAction = szAction or ""
	
	tbAwardTemplet:Give(tbExp, 1, {szLogTitle, szAction})
end



function PlayerFunLib:SetTongTask(szTaskId, nValue)
	local szTongName, nTongID = GetTongName();
	szTaskId = getglobal(szTaskId)
	if not szTaskId then
		error("Miss Include tong_header.lua")
	end
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end
	nValue = lib:NumberParamTrans(nValue)
	TONG_ApplySetTaskValue(nTongID, szTaskId, nValue);
end

function PlayerFunLib:AddTongTask(szTaskId, nValue)
	local szTongName, nTongID = GetTongName();
	szTaskId = getglobal(szTaskId)
	if not szTaskId then
		error("Miss Include tong_header.lua")
	end
	if szTongName == nil or szTongName == "" then
		error("Have not a Tong")
	end
	nValue = lib:NumberParamTrans(nValue)
	TONG_ApplyAddTaskValue(nTongID, szTaskId, nValue);
end

function PlayerFunLib:AddSkillState(nSkillId, nLevel, nStatetype, nTime, IsNoClearOnDeath)
	
	if nStatetype == 3 then
		nTime = GetCurServerTime() + floor(nTime/18)
		nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
		nStatetype = 2
	end
	AddSkillState(nSkillId, nLevel, nStatetype, nTime, IsNoClearOnDeath)
end