Include("\\script\\event\\beidoulingpai\\head.lua")
Include("\\script\\event\\beidoulingpai\\taskhead.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\yandibaozang\\head.lua")
Include("\\script\\event\\tianlu_tree\\head.lua")
Include("\\script\\event\\beidoulingpai\\lang.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")


function tbBeidouActivity:IsActive()
	if self.LOCKED == 0 then
		return self:IsOpenTime()
	end
end

function tbBeidouActivity:IsOpenTime()

	local nHour = tonumber(GetServerDate("%H"))

	if nHour < self.nStartHour or nHour > self.nEndHour then 
		return
	end
	return 1
end

function tbBeidouActivity:ActivityOption()
	if self:IsActive()~= 1 then 
		return Talk(1, "", %MSG_NO_OPEN)
	end
	local nTranLife = ST_GetTransLifeCount()	
	if (GetLevel() < 150 and nTranLife <1 ) then
		return Talk(1, "", "Chÿ nh˜ng bªng h˜u c p 150 trÎ l™n ho∆c Æ∑ trÔng sinh mÌi Æ≠Óc tham gia")
	end
	local szTitle = %MSG_TITLE
	local tbOpt = 
	{
		{%MSG_WANT_TASK_OPT, self.Want_BDTask, {self}},
		{%MSG_SUBMIT_TASK_OPT, self.Submit_BDTask, {self}},
		{%MSG_CANCEL_TASK_OPT, self.Cancel_BDTask, {self}},
		{%MSG_QUERY_TASK_OPT, self.QueryTask, {self}},
		{format(%MSG_GET_AWARD,10), self.SubmitToken10, {self}},
		{format(%MSG_GET_AWARD,13), self.SubmitToken13, {self}},
		{%MSG_END_DIALOG}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbBeidouActivity:QueryTask()
	local nPalyerTaskId = GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_ID, self.TSK_BIT_ID_LEN)
	if nPalyerTaskId == 0 then
		return Talk(1, "", %MSG_ERR_NO_TASK)
	end
	local szTaskInfo
	if GetBitTask(self.TSK_AWARD_STATE, self.TSK_BIT_DOUBLE_AWARD, 1) == 1 then
		szTaskInfo = format(%MSG_CURR_TASK.."<color=yellow>"..%MSG_DOUBLE_AWARD.."<color>",%tbBDTaskList[nPalyerTaskId].szShow)
	else
		szTaskInfo = format(%MSG_CURR_TASK,%tbBDTaskList[nPalyerTaskId].szShow)
	end
	Talk(1, "", szTaskInfo)
end

function tbBeidouActivity:UpdateTask()
	local nLastAcceptTskTime = GetTask(self.TSK_ACCEPT_TIME)
	local nCurrTime = GetCurServerTime()
	local nLastAcceptDay = FormatTime2Date(nLastAcceptTskTime)
	local nCurrDay = FormatTime2Date(nCurrTime)
	
	if nCurrDay ~= nLastAcceptDay then
		SetTask(self.TSK_TASK_STATE, 0)
		SetTask(self.TSK_ACCEPT_TIME, nCurrTime)
		SetTask(self.TSK_FINISH_COUNT, 0)
		SetTask(self.TSK_HOUR_COUNT, 0)
		return
	end
	local nCurrHour = tonumber(GetServerDate("%H"))
	local nLastAcceptHour = tonumber(FormatTime2String("%H", nLastAcceptTskTime))
	if nCurrHour > nLastAcceptHour then
		SetTask(self.TSK_TASK_STATE, 0)
		SetTask(self.TSK_ACCEPT_TIME, nCurrTime)
		SetTask(self.TSK_HOUR_COUNT, 0)
	end
end

function tbBeidouActivity:Want_BDTask()
	self:UpdateTask()
--	if self:IsOpenTime() ~= 1 then
--		return Talk(1, "", format("…Ÿœ¿ƒ™º±£¨ªÓ∂Øø™∑≈ ±º‰ «%d:00µΩ%d:00",self.nStartHour, self.nEndHour))
--	end
	
	local tbPlayerTaskId = GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_ID, self.TSK_BIT_ID_LEN)
	if tbPlayerTaskId ~= 0 then
		return Talk(1, "", %MSG_ALREADY_HAVE_TASK)
	end
	
	local nFinishTaskCount = GetTask(self.TSK_FINISH_COUNT)
	if nFinishTaskCount >= self.PER_DAY_MAX_TSK_COUNT then
		return Talk(1, "", format(%MSG_ERR_TASK_DAY_LIMIT, self.PER_DAY_MAX_TSK_COUNT))
	end
	
	nFinishTaskCount = GetTask(self.TSK_HOUR_COUNT)
	if nFinishTaskCount >= self.PER_HOUR_MAX_TSK_COUNT then
		return Talk(1, "", format(%MSG_ERR_TASK_HOUR_LIMIT, self.PER_HOUR_MAX_TSK_COUNT))
	end
	
	self:Assign_BDTask()
end


function tbBeidouActivity:Assign_BDTask()
	local nTaskId = random(1, getn(%tbBDTaskList))

	SetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_ID, self.TSK_BIT_ID_LEN, nTaskId)
	SetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_DONE, 1, 0)
	if GetBitTask(self.TSK_AWARD_STATE, self.TSK_BIT_XUELINGDAN, 1) == 1 then -- π”√¡À±±∂∑—™¡Èµ§
		SetBitTask(self.TSK_AWARD_STATE, self.TSK_BIT_DOUBLE_AWARD, 1, 1)
		SetBitTask(self.TSK_AWARD_STATE, self.TSK_BIT_XUELINGDAN, 1, 0)
	end
--Ghi log khi nhan nhiem vu -by ThanhLD - 20130625
	tbLog:PlayerActionLog(self.LOG_TITLE,"NhÀn nhi÷m vÙ Bæc ß»u",%tbBDTaskList[nTaskId].szShow )	
	Msg2Player(format(%MSG_GET_TASK, %tbBDTaskList[nTaskId].szShow))
end


function tbBeidouActivity:CheckWithTask(nTaskId)
	if self:IsActive() ~= 1 then
		return
	end
	if GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_ID, self.TSK_BIT_ID_LEN) ~= nTaskId then
		--print("wrong npc")
		return
	end
	local nPlayerTaskDone = GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_DONE, 1)
	if nPlayerTaskDone == 1 then
		return
	end
	return 1
end

function tbBeidouActivity:CheckOverTime()
	local nAcceptTime = GetTask(self.TSK_ACCEPT_TIME)
	if nAcceptTime + self.ONE_HOUR < GetCurServerTime() then
		return 0
	end
	return 1
end

function tbBeidouActivity:CompleteTask(nTaskId)
	if not self:CheckWithTask(nTaskId) then 
		return 
	end
	
	if self:CheckOverTime() ~= 1 then
		Say(%MSG_TASK_FAIL, 0)
		SetTask(self.TSK_AWARD_STATE, 0)
		SetTask(self.TSK_TASK_STATE, 0)
		return 0
	else
		SetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_DONE, 1, 1)
		Msg2Player(%MSG_FINISH_TASK)
		return 1
	end
end
-- Kiem tra Ngu hanh  item	
function tbBeidouActivity:CheckSeriesItem(nPlayerTaskId)	
	local index = %tbBDTaskList[nPlayerTaskId].nItemListIndex	
	local tbItem = %tbBD_ItemList[index]	
	
	local tbRoomItems = GetRoomItems(0)	
	local nItemIdx
	for i=1, getn(tbRoomItems) do
		nItemIdx = tbRoomItems[i]
		local nSeries = GetItemSeries(nItemIdx)			
		nG, nD, nP =GetItemProp(nItemIdx)
		nLevel = GetItemLevel(nItemIdx)
		if (tbItem.tbProp[4]== -1 or  tbItem.tbProp[5] ==-1) then				
				return 1		
		end
		local nQualityItem =  GetItemQuality(nItemIdx)			
		if (nG == tbItem.tbProp[1] and nD == tbItem.tbProp[2] and nP == tbItem.tbProp[3] and nLevel== tbItem.tbProp[4] and nSeries == tbItem.tbProp[5] and nQualityItem == 0 ) then				
			return 1
		end			
	end
	return 0
end

function tbBeidouActivity:Submit_BDTask()
	local nPlayerTaskId = GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_ID, self.TSK_BIT_ID_LEN)
	local nPlayerTaskDone = GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_DONE, 1)
	if nPlayerTaskId == 0 then
		return Talk(1, "", %MSG_ERR_NO_TASK)
	end
	local nTaskType = %tbBDTaskList[nPlayerTaskId].nTaskType
	if self:CheckOverTime() ~= 1 then
		SetTask(self.TSK_AWARD_STATE, 0)
		SetTask(self.TSK_TASK_STATE, 0)
		return Talk(1, "", %MSG_TASK_FAIL)
	end
	
	
	if nTaskType == 1 and nPlayerTaskDone == 0 then --npc∂‘ª∞»ŒŒÒ
		return Talk(1, "", %MSG_NO_FINISH_TASK) 
	end
	
	if  nTaskType == 2 or nTaskType == 0 then --≤Œº”π¶ƒ‹∫Õ ’ºØ»ŒŒÒ
		local index = %tbBDTaskList[nPlayerTaskId].nItemListIndex
		local tbItem = %tbBD_ItemList[index]
		if PlayerFunLib:CheckItemInBag(tbItem, tbItem.nCount, format(%MSG_NO_ITEM,tbItem.szName)) ~= 1 then
			return
		end
		if (self:CheckSeriesItem(nPlayerTaskId)~=1 ) then
			return Talk(1,"",format(%MSG_NO_ITEM,tbItem.szName))
		end
	end		
	if self:GiveAward(nTaskType, nPlayerTaskId) == 1 then
		SetTask(self.TSK_TASK_STATE, 0)
		local nFinishTaskCount = GetTask(self.TSK_FINISH_COUNT)
		SetTask(self.TSK_FINISH_COUNT,nFinishTaskCount+1)
		local nHourTaskCount = GetTask(self.TSK_HOUR_COUNT)
		SetTask(self.TSK_HOUR_COUNT, nHourTaskCount+1)
		SetBitTask(self.TSK_AWARD_STATE, self.TSK_BIT_DOUBLE_AWARD, 1, 0)
	end
end

function tbBeidouActivity:GiveAward(nTaskType, nPlayerTaskId)
	local awardTimes = 1
	if GetBitTask(self.TSK_AWARD_STATE, self.TSK_BIT_DOUBLE_AWARD, 1) == 1 then
		awardTimes = 2
	end
	if PlayerFunLib:CheckFreeBagCell(5, "default") ~= 1 then 
		return 
	end
--Modify Award Exp and Item  - by ThanhLD -20130621
	local index = %tbBDTaskList[nPlayerTaskId].nItemListIndex
	local tbExp = {}	
	if nTaskType == 1 then 
		tbExp.nExp = 8000000 * awardTimes		
	elseif nTaskType == 0 or nTaskType == 2 then
		local tbItem = %tbBD_ItemList[index]
		tbExp.nExp = tbItem.nAwardExp * awardTimes
			
		local tbRoomItems = GetRoomItems(0)	
		local nItemIdx
		for i=1, getn(tbRoomItems) do
			nItemIdx = tbRoomItems[i]
			local nSeries = GetItemSeries(nItemIdx)			
			nG, nD, nP =GetItemProp(nItemIdx)
			nLevel = GetItemLevel(nItemIdx)
			if (tbItem.tbProp[4]== -1 or  tbItem.tbProp[5] ==-1) then					
				PlayerFunLib:ConsumeEquiproomItem(tbItem, tbItem.nCount)	
				break	
			end
			local nQualityItem =  GetItemQuality(nItemIdx)
			if (nG == tbItem.tbProp[1] and nD == tbItem.tbProp[2] and nP == tbItem.tbProp[3] and nLevel== tbItem.tbProp[4] and nSeries == tbItem.tbProp[5] and nQualityItem == 0 ) then
				RemoveItemByIndex(nItemIdx)
				break	
			end	
		end	
		--PlayerFunLib:ConsumeEquiproomItem(tbItem, tbItem.nCount)		
	end
	--Modify ExpiredTime item, by ThanhLD, 20130624
	local nNexDay = FormatTime2Date(GetCurServerTime()+86400)	
	local tbBD_LenhBai = {szName = "L÷nh bµi Bæc ß»u", tbProp = {6,1,3508,1,0,0}, nBindState = -2, nExpiredTime=nNexDay}
	
	tbAwardTemplet:Give( tbExp, 1, {self.LOG_TITLE, "get exp"})
	tbAwardTemplet:Give(tbBD_LenhBai, awardTimes,{self.LOG_TITLE, format("get a %s",tbBD_LenhBai.szName)})
	tbAwardTemplet:Give({szName = "Ch©n Nguy™n ß¨n (ßπi)", tbProp = {6,1,30229,0,0,0}, nCount = 1,nBindState=-2}, 1, {"NhiemVuBacDau", "NhanDuoc1ChanNguyenDon"})
	return 1
end

function tbBeidouActivity:Cancel_BDTask()
	if self:IsOpenTime() ~= 1 then 
		return
	end
	local nPalyerTaskId = GetBitTask(self.TSK_TASK_STATE, self.TSK_BIT_TASK_ID, self.TSK_BIT_ID_LEN)
	if nPalyerTaskId == 0 then
		return Talk(1, "", %MSG_ERR_NO_TASK)
	end
	
	SetTask(self.TSK_TASK_STATE, 0)
	SetTask(self.TSK_AWARD_STATE, 0)
	local nFinishTaskCount = GetTask(self.TSK_FINISH_COUNT)
	SetTask(self.TSK_FINISH_COUNT,nFinishTaskCount+1)
	local nHourTaskCount = GetTask(self.TSK_HOUR_COUNT)
	SetTask(self.TSK_HOUR_COUNT, nHourTaskCount+1)
	Msg2Player(format(%MSG_CANCEL_TASK, %tbBDTaskList[nPalyerTaskId].szShow))
end

function tbBeidouActivity:SubmitToken10()
	if self:IsOpenTime() ~= 1 then 
		return
	end
	local nExp
	local tbProp = %tbBD_Token.tbProp
	local nTokenCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	if nTokenCount < self.TOKEN_NUM_AWARD10 then
		return Talk(1, "", format(%MSG_ERR_NO_ENOUGH_COUNT,%tbBD_Token.szName))
	end

	PlayerFunLib:ConsumeEquiproomItem(%tbBD_Token, self.TOKEN_NUM_AWARD10)
	tbAwardTemplet:Give(self.tbAward10, 1, {self.LOG_TITLE, format("get award %s %d",%tbBD_Token.szName, self.TOKEN_NUM_AWARD10)})
end

function tbBeidouActivity:SubmitToken13()
	if self:IsOpenTime() ~= 1 then 
		return
	end
	local nExp
	local tbProp = %tbBD_Token.tbProp
	local nTokenCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	if nTokenCount < self.TOKEN_NUM_AWARD13 then
		return Talk(1, "", format(%MSG_ERR_NO_ENOUGH_COUNT,%tbBD_Token.szName))
	end
	
	if PlayerFunLib:CheckFreeBagCell(10, "default") ~= 1 then
		return
	end
	
	PlayerFunLib:ConsumeEquiproomItem(%tbBD_Token, self.TOKEN_NUM_AWARD13)
	tbAwardTemplet:Give(self.tbAward13, 1, { self.LOG_TITLE, format("get award %s %d",%tbBD_Token.szName, self.TOKEN_NUM_AWARD13)})
	return
end

function tbBeidouActivity:GiveTokens(nTokenId)
	if CalcFreeItemCellCount() < 1 then
		--print("not enough free beg cell")
		return
	end
	tbAwardTemplet:Give(%tbBD_ItemList[nTokenId], 1, {self.LOG_TITLE, format("get %s token", %tbBD_ItemList[nTokenId].szName)})
end

function tbBeidouActivity:OnFinishSongJin(nBattleLevel, tbPlayerList)
	if self.LOCKED == 1 then
		return 
	end
	
	for i = 1, getn(tbPlayerList) do
		local tbPlayer = tbPlayerList[i]
		if CallPlayerFunction(tbPlayer.nIndex, self.CheckCondition, self) == 1 then
			local nPoints = CallPlayerFunction(tbPlayer.nIndex, GetTask, 751)
			local nTokenIndex
			if nPoints >= 20000 then
				nTokenIndex = self.BEIDOU_TOKEN_FY4_INDEX
			elseif nPoints >= 10000 then
				nTokenIndex = self.BEIDOU_TOKEN_FY3_INDEX
			elseif nPoints >= 5000 then
				nTokenIndex = self.BEIDOU_TOKEN_FY2_INDEX
			elseif nPoints >= 2000 then
				nTokenIndex = self.BEIDOU_TOKEN_FY1_INDEX
			end
			if nTokenIndex then
				CallPlayerFunction(tbPlayer.nIndex, self.GiveTokens, self, nTokenIndex)
			end
		end
	end
end

function tbBeidouActivity:OnPassYanDiBaoZang(nNpcWay)
	if self.LOCKED == 1 then
		return 
	end
	if ST_GetTransLifeCount() < 1 and GetLevel() < self.MIN_LEVEL then
		return
	end
	if nNpcWay == 10 then
		self:GiveTokens(self.BEIDOU_TOKEN_YD2_INDEX)
	elseif nNpcWay == 6 then
		self:GiveTokens(self.BEIDOU_TOKEN_YD1_INDEX)
	end
end

function tbBeidouActivity:OnPlant(nNpcIndex)
	if self.LOCKED == 1 then
		return 
	end
	if ST_GetTransLifeCount() < 1 and GetLevel() < self.MIN_LEVEL then
		return
	end
	local nPlantNum = PlayerFunLib:GetTaskDaily(%TSK_DAYLY_PLANT_NUM)
	if mod(nPlantNum,10) == 0 then
		self:GiveTokens(self.BEIDOU_TOKEN_TL_TREE_INDEX)
	end
end

function tbBeidouActivity:OnLandingEvent(tbPlayerAll, bShuizeiTask)
	if self.LOCKED == 1 then
		return 
	end
	for i = 1, getn(tbPlayerAll) do
		CallPlayerFunction(tbPlayerAll[i], tbBeidouActivity.OnLanding, tbBeidouActivity, bShuizeiTask)		
	end	
end

function tbBeidouActivity:OnLanding(bShuizeiTask)
	if self.LOCKED == 1 then
		return 
	end
	if ST_GetTransLifeCount() < 1 and GetLevel() < self.MIN_LEVEL then
		return
	end
	local tbProp = {6,1,2015, 1, 0, 0,} --zhuigongling
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) >= 1 then
		if bShuizeiTask == 1 then
			self:GiveTokens(self.BEIDOU_TOKEN_FLD2_INDEX)
		else
			self:GiveTokens(self.BEIDOU_TOKEN_FLD1_INDEX)
		end
	end	
	
end

function tbBeidouActivity:CheckCondition()
	if ST_GetTransLifeCount() < 1 and GetLevel() < self.MIN_LEVEL then
		return
	end
	return 1
end

function tbBeidouActivity:OnPassChuanGuan(nChuangGuangCount, tbPlayerList)
	if self.LOCKED == 1 then
		return 
	end
	
	local nTokenIndex
	if nChuangGuangCount == 28 then
		nTokenIndex = self.BEIDOU_TOKEN_CG2_INDEX
	elseif nChuangGuangCount == 10 then
		nTokenIndex = self.BEIDOU_TOKEN_CG1_INDEX
	end
	
	if nTokenIndex then
		for i = 1, getn(tbPlayerList) do
			if CallPlayerFunction(tbPlayerList[i], self.CheckCondition, self) == 1 then
				CallPlayerFunction(tbPlayerList[i], self.GiveTokens, self, nTokenIndex)
			end
		end
	end
end

function tbBeidouActivity:OnFinishMessenger()
	if self.LOCKED == 1 then
		return 
	end
	if ST_GetTransLifeCount() < 1 and GetLevel() < self.MIN_LEVEL then
		return
	end
	self:GiveTokens(self.BEIDOU_TOKEN_MESSAGER_INDEX)
end
 
function tbBeidouActivity:OnFinishKillerBoss(nTaskId, TaskValue)
	if self.LOCKED == 1 then
		return 
	end
	if ST_GetTransLifeCount() < 1 and GetLevel() < self.MIN_LEVEL then
		return
	end
	local nKillerLevel = (ceil(TaskValue/20)+1)*10
	if nKillerLevel ~= 90 then
		return 
	end
	self:GiveTokens(self.BEIDOU_TOKEN_KILL_BOSS_INDEX)
end

if tbBeidouActivity.LOCKED == 0 then
	EventSys:GetType("SongJin"):Reg("OnFinish", tbBeidouActivity.OnFinishSongJin, tbBeidouActivity)
	EventSys:GetType("YanDiBaoZang"):Reg("OnPass", tbBeidouActivity.OnPassYanDiBaoZang, tbBeidouActivity)
	EventSys:GetType("HarvestPlants"):Reg("use_tianlu_seed", tbBeidouActivity.OnPlant, tbBeidouActivity)	
	EventSys:GetType("FengLingDu"):Reg("OnLanding", tbBeidouActivity.OnLandingEvent, tbBeidouActivity)
	EventSys:GetType("ChuanGuan"):Reg("OnPass", tbBeidouActivity.OnPassChuanGuan, tbBeidouActivity)
	EventSys:GetType("Messenger"):Reg("OnFinish", tbBeidouActivity.OnFinishMessenger, tbBeidouActivity)
	EventSys:GetType("KillerBoss"):Reg("OnFinish", tbBeidouActivity.OnFinishKillerBoss, tbBeidouActivity)
	local szOptName = MSG_FINISH_TASK_OPT

	for i=1, getn(tbBDTaskList) do
		local tbTask = tbBDTaskList[i]
		if tbTask.nTaskType == 1 then
			EventSys:GetType("AddNpcOption"):Reg(tbTask.szNpcName,szOptName, tbBeidouActivity.CompleteTask, {tbBeidouActivity, i}, tbBeidouActivity.CheckWithTask, {tbBeidouActivity, i} )
		end
	end
	EventSys:GetType("AddNpcOption"):Reg("Bæc ß»u L∑o Nh©n", MSG_ACTIVTY, tbBeidouActivity.ActivityOption,{tbBeidouActivity})
end