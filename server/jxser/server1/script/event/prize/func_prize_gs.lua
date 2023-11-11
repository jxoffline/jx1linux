if MODEL_GAMESERVER ~= 1 then
	return 
end

Include("\\script\\event\\prize\\func_prize_def.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\misc\\eventsys\\type\\harvestplant.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\yandibaozang\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\event\\tianlu_tree\\head.lua")
Include("\\script\\event\\prize\\lang.lua")
Include("\\script\\trip\\define.lua")

-- Modify award -  by ThanhLD - 20130619
tbFuncPrize.tbAward = 
{
	[1] = {nExp = 6000000},
	[2] = {nExp = 30000000},
	[3] = {nExp = 35000000},
	[4] = {nExp = 45000000},
	[5] = {nExp = 55000000},
	[6] = {nExp = 60000000},
	[7] = 
	{
		{nExp = 70000000},
		{
			{nExp = 30000000, nRate = 30},
			{tbProp = {6, 1, 30229, 1, 0,0}, nBindState = -2, nCount = 10, nRate = 9},
			{tbProp = {6,1,3203, 1, 0,0}, nBindState = -2, nCount = 500, nRate = 1},
		}
	},
	[8] = 
	{
		{nExp = 70000000},
		{
			{nExp = 30000000, nRate = 30},
			{tbProp = {6, 1, 30229, 1, 0,0}, nBindState = -2, nCount = 10, nRate = 9},
			{tbProp = {6,1,3203, 1, 0,0}, nBindState = -2, nCount = 500, nRate = 1},
		}
	},
}

function tbFuncPrize:DoneTask(nId)
	self:UpdateTask()
	SetBitTask(self.TSK_STATE, nId, 1, 1)
	SyncTaskValue(self.TSK_STATE)
end

function tbFuncPrize:OnFinishSongJin(nBattleLevel, tbPlayerList)
	for i = 1, getn(tbPlayerList) do
		local tbPlayer = tbPlayerList[i]
		if CallPlayerFunction(tbPlayer.nIndex, GetTask, 751) >= 3000 then
			CallPlayerFunction(tbPlayer.nIndex, self.DoneTask, self, self.STATE_BIT_SONGJIN)
		end
	end
end

function tbFuncPrize:OnPassChuanGuan(nBatch, tbPlayerList, nLevel)
	if nBatch ~= 10 then
		return
	end
	for i = 1, getn(tbPlayerList) do
		local nPlayerIndex = tbPlayerList[i]
		if CallPlayerFunction(nPlayerIndex, GetTask, %TSK_Longxuewan_avail) >= 0 then
			CallPlayerFunction(nPlayerIndex, self.DoneTask, self, self.STATE_BIT_CHUANGUAN)
		end
	end
end

function tbFuncPrize:OnPassYanDiBaoZang(nNpcWay)
	if nNpcWay ~= 4 then
		return
	end
	if GetByte(GetTask(%YDBZ_ITEM_YANDILING), 1) == 1 then
		self:DoneTask(self.STATE_BIT_YANDIBAOZANG)
	end
end
	
function tbFuncPrize:UpdateTask()
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

	local nDays, nCurTime = self:CalcUpdateTask()
	if nDays == nil or nCurTime == nil then
		return 
	end
	SetBitTask(self.TSK_STATE, 0, self.STATE_BIT_DAYS, 0)
	if nDays > 8 then
		nDays = 8
	end
	SetBitTask(self.TSK_STATE, self.STATE_BIT_DAYS, self.STATE_BIT_DAYS_LEN, nDays)
	SetTask(self.TSK_TIME, nCurTime)
	SyncTaskValue(self.TSK, nCurTime)
	SyncTaskValue(self.TSK_STATE)
end




function tbFuncPrize:OnBoardFengLingDu()
	self:DoneTask(self.STATE_BIT_FENGLINGDU)
end

function tbFuncPrize:OnPlant(nNpcIndex)
	if PlayerFunLib:GetTaskDaily(%TSK_DAYLY_PLANT_NUM) >= 5 then
		self:DoneTask(self.STATE_BIT_TIANLUTREE)
	end
end

function tbFuncPrize:OnAward(nId)

	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

--Close on Public Server - by ThanhLD - 20130619
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return
	end
	self:UpdateTask()
	local nDays = GetBitTask(self.TSK_STATE, self.STATE_BIT_DAYS, self.STATE_BIT_DAYS_LEN)
	if nDays ~= nId then
		return Talk(1, "", format(%NOT_ENOUGH_DAYS, nId))
	end
	
	if self:CheckFinish() ~= 1 then
		return Talk(1, "", %NOT_ENOUGH_TASK_FINISH)
	end
	local nFlag = GetBitTask(self.TSK_STATE, self.STATE_BIT_AWARDED, 1)
	if nFlag == 1 then
		return Talk(1, "", %ALREADY_GET_PRIZE)
	end
	if nId >= 7 then
		if CalcFreeItemCellCount() < self.BAG_LIMIT then
			return Talk(1, "", %MSG_NOT_ENOUGH_BAG_CELL)
		end
	end
	local pAward = self.tbAward[nId]
	if not pAward then
		return
	end
	tbAwardTemplet:Give(pAward, 1, {"FuncPrize", format("Get award %d", nId)})
	SetBitTask(self.TSK_STATE, self.STATE_BIT_AWARDED, 1, 1)
	SyncTaskValue(self.TSK_STATE)
end

function tbFuncPrize:SetDays(nDays)
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	
	local a = self:GetCurTime()
	SetTask(self.TSK_TIME, a - self.ONE_DAY * nDays)
	SyncTaskValue(self.TSK_TIME)
end

EventSys:GetType("SongJin"):Reg("OnFinish", tbFuncPrize.OnFinishSongJin, tbFuncPrize)  -- ËÎ½ð
EventSys:GetType("ChuanGuan"):Reg("OnPass", tbFuncPrize.OnPassChuanGuan, tbFuncPrize)  -- ´³¹Ø£¨Ê¹ÓÃÁúÑªÍè£©
EventSys:GetType("YanDiBaoZang"):Reg("OnPass", tbFuncPrize.OnPassYanDiBaoZang, tbFuncPrize)  -- Ñ×µÛ´³¹Ø
EventSys:GetType("FengLingDu"):Reg("OnBoard", tbFuncPrize.OnBoardFengLingDu, tbFuncPrize)  -- Ñ×µÛ´³¹Ø
EventSys:GetType("HarvestPlants"):Reg("tianlu_tree", tbFuncPrize.OnPlant, tbFuncPrize)