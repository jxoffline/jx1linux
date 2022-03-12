if MODEL_GAMESERVER ~= 1 then
	return 
end
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\event\\prize\\lang.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\trip\\define.lua")


tbLoginPrize = {}
tbLoginPrize.TSK_LOGIN_DATE = 4027
tbLoginPrize.TSK_LOGIN_COUNT = 4028
tbLoginPrize.EXT_POINT = 7
tbLoginPrize.EXT_POINT_BIT = 3
tbLoginPrize.CONTINUE_COST_COIN = 5
tbLoginPrize.TIME_OFFSET = 5
tbLoginPrize.ONE_DAY = 24 * 60 * 60
tbLoginPrize.tbBagCellLimit = 
{
	[21] = 7,
	[42] = 10,
}
-- Modify award -  by ThanhLD - 20130619
tbLoginPrize.tbAward = 
{
	[1] = {nExp = 1000000},
	[2] = {nExp = 1000000},
	[3] = {nExp = 1000000},
	[4] = {nExp = 2000000},
	[5] = {nExp = 2000000},
	[6] = {nExp = 2000000},
	[7] = {nExp = 10000000},
	[8] = {nExp = 3000000},
	[9] = {nExp = 3000000},
	[10] = {nExp = 3000000},
	[11] = {nExp = 4000000},
	[12] = {nExp = 4000000},
	[13] = {nExp = 4000000},
	[14] = {nExp = 20000000},
	[15] = {nExp = 5000000},
	[16] = {nExp = 5000000},
	[17] = {nExp = 5000000},
	[18] = {nExp = 6000000},
	[19] = {nExp = 6000000},
	[20] = {nExp = 6000000}, 
	[21] = 
	{
		{nExp = 30000000},
		{szName="Viªm §Õ LÖnh",tbProp = {6,1,1617, 1, 0,0}, nBindState = -2,nCount = 2},
		{szName="S¸t thñ gi¶n lÔ hép",tbProp = {6,1,2339, 1, 0,0}, nBindState = -2,nCount = 2},
		{szName="Hé M¹ch §¬n",tbProp = {6,1,3203, 1, 0,0}, nBindState = -2, nCount = 250},
	},
	[22] = {nExp = 7000000},
	[23] = {nExp = 7000000},
	[24] = {nExp = 7000000},
	[25] = {nExp = 8000000},
	[26] = {nExp = 8000000},
	[27] = {nExp = 8000000},
	[28] = {nExp = 40000000},
	[29] = {nExp = 9000000},
	[30] = {nExp = 9000000},
	[31] = {nExp = 9000000},
	[32] = {nExp = 10000000},
	[33] = {nExp = 10000000},
	[34] = {nExp = 10000000},
	[35] = {nExp = 50000000},
	[36] = {nExp = 11000000},
	[37] = {nExp = 11000000},
	[38] = {nExp = 11000000},
	[39] = {nExp = 12000000},
	[40] = {nExp = 12000000},
	[41] = {nExp = 12000000},
	[42] = 
	{
		{nExp = 60000000},
		--{tbProp = {6,1,30084, 1, 0,0}, nBindState = -2, nCount = 4},
		{szName="Phong V©n Chiªu Binh LÖnh",tbProp = {6,1,30083, 1, 0,0}, nBindState = -2, nCount = 3,nExpiredTime=10080},
		{szName="S¸t thñ gi¶n CÊp 90",tbProp={6,1,400,90,0,0},nCount=1,nBindState=-2,nExpiredTime=10080},
		{szName="Hé M¹ch §¬n",tbProp = {6,1,3203, 1, 0,0}, nBindState = -2, nCount = 250},
		{szName="Ch©n Nguyªn §¬n",tbProp = {6,1,30229, 1, 0,0}, nBindState = -2, nCount = 8},
		
	}
}

function tbLoginPrize:GetCurTime() 
	local nYear = tonumber(GetLocalDate("%Y"))
	local nMonth = tonumber(GetLocalDate("%m"))
	local nDay = tonumber(GetLocalDate("%d"))
	local nHour = tonumber(GetLocalDate("%H")) 
	if nHour < self.TIME_OFFSET then 
		return Tm2Time(nYear, nMonth, nDay, self.TIME_OFFSET) - 24 * 3600 
	else 
		return Tm2Time(nYear, nMonth, nDay, self.TIME_OFFSET) 
	end
end

function tbLoginPrize:OnLogin(bExchangeIn)

	local nTime = GetTask(self.TSK_LOGIN_DATE)
	local nCurTime = self:GetCurTime()
	local nLoginCount = GetBitTask(self.TSK_LOGIN_COUNT, 0, 16)
	local nDiff = nCurTime - nTime
	if nDiff == 0 then
		return
	elseif nDiff == self.ONE_DAY then
		nLoginCount = nLoginCount + 1
	else
		nLoginCount = 1
	end
	if nLoginCount > 43 then
		nLoginCount = 43
	end
	SetBitTask(self.TSK_LOGIN_COUNT, 0, 16, nLoginCount)
	SetTask(self.TSK_LOGIN_DATE, nCurTime)
end

function tbLoginPrize:OnLogout()
	local nTime = GetTask(self.TSK_LOGIN_DATE)
	local nCurTime = self:GetCurTime()
	local nDiff = (nCurTime - nTime) / (24 * 3600)
	local nLoginCount = GetBitTask(self.TSK_LOGIN_COUNT, 0, 16)
	if nDiff > 0 then
		nLoginCount = nLoginCount + nDiff
	end
	if nLoginCount > 43 then
		nLoginCount = 43
	end
	SetBitTask(self.TSK_LOGIN_COUNT, 0, 16, nLoginCount)
	SetTask(self.TSK_LOGIN_DATE, nCurTime)
end

function tbLoginPrize:OnAward(nId)
	-- 		do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
--Close on Public Server - by ThanhLD - 20130619
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return
	end
	self:OnLogout()
	local nValue = GetExtPoint(self.EXT_POINT)
	local nFlag = GetBit(nValue, self.EXT_POINT_BIT)	
	local nLoginCount = GetBitTask(self.TSK_LOGIN_COUNT, 0, 16)
	
	if not((nId == nLoginCount) or (nLoginCount == 43 and nId == nLoginCount - 1)) then
		return Talk(1, "", %MSG_NOT_YET_GET_AWARD)
	end
	
	if nLoginCount >= 43 then
		local szTitle = %MSG_PAY8COIN_TITLE
		local tbOpt = 
		{
			{%MSG_OPT_PAY8COIN, self.OnAward43Pay, {self}},
			{%MSG_OPT_NOT_PAY8COIN, self.OnAward43NoPay, {self}},
			{%MSG_CANCEL},
		}
		CreateNewSayEx(szTitle, tbOpt)
		return
	end
	local nNeedFreeCell = self.tbBagCellLimit[nLoginCount]
	if nNeedFreeCell and CalcFreeItemCellCount() < nNeedFreeCell then
		return Talk(1, "", %MSG_NOT_ENOUGH_BAG_CELL)
	end
	self:GiveAward(nLoginCount)
end

function tbLoginPrize:OnAward43Pay()
	-- 			do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	local nLoginCount = 42
	local nNeedFreeCell = self.tbBagCellLimit[nLoginCount]
	if nNeedFreeCell and CalcFreeItemCellCount() < nNeedFreeCell then
		return Talk(1, "", %MSG_NOT_ENOUGH_BAG_CELL)
	end
	if GetCashCoin() < self.CONTINUE_COST_COIN then
		return Talk(1, "", %MSG_NOT_ENOUGH_COIN)
	end
	if PayCoin(self.CONTINUE_COST_COIN) ~= 1 then
		return Talk(1, "", %MSG_NOT_ENOUGH_COIN)
	end
	SetBitTask(self.TSK_LOGIN_COUNT, 0, 16, nLoginCount)
	self:GiveAward(nLoginCount)
end

function tbLoginPrize:OnAward43NoPay()
	-- 			do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	local nLoginCount = 1
	local nNeedFreeCell = self.tbBagCellLimit[nLoginCount]
	if nNeedFreeCell and CalcFreeItemCellCount() < nNeedFreeCell then
		return Talk(1, "", %MSG_NOT_ENOUGH_BAG_CELL)
	end
	SetBitTask(self.TSK_LOGIN_COUNT, 0, 16, nLoginCount)
	self:GiveAward(nLoginCount)
end

function tbLoginPrize:GiveAward(nId)	
	-- 			do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end

	local pAward = self.tbAward[nId]
	local nValue = GetExtPoint(self.EXT_POINT)
	local nFlag = GetBit(nValue, self.EXT_POINT_BIT)	
	if nFlag == 1 then
		return
	end
	if not pAward then
		return
	end
	local nNewValue = SetBit(nValue, self.EXT_POINT_BIT, 1)
	local nDiff = nNewValue - nValue
	if nDiff > 0 then
		AddExtPoint(self.EXT_POINT, nDiff)
	else
		PayExtPoint(self.EXT_POINT, -nDiff)
	end
	tbAwardTemplet:Give(pAward, 1, {"LoginPrize", format("Get award %d", nId)})
	self:SendData(0)
end

function tbLoginPrize:SendData(nOpertion)
	local nValue = GetExtPoint(self.EXT_POINT)
	local nFlag = GetBit(nValue, self.EXT_POINT_BIT)	
	local nLoginCount = GetBitTask(self.TSK_LOGIN_COUNT, 0, 16)
	local handle = OB_Create()
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nOpertion)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nLoginCount)
	ObjBuffer:PushByType(handle, OBJTYPE_NUMBER, nFlag)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_LOGIN_PRIZE", handle)
	OB_Release(handle)
end

function tbLoginPrize:ProcessProtocol(nOpertion, nParam)
	-- 			do 
	-- 	return Talk(1, "", "Chøc n¨ng ch­a më!")
	-- end
	
	if nOpertion == 1 then
		self:OnLogout()
		self:SendData(1)
	else
		tbLoginPrize:OnAward(nParam)
	end
end

EventSys:GetType("OnLogin"):Reg(0, tbLoginPrize.OnLogin, tbLoginPrize)
EventSys:GetType("OnLogout"):Reg(0, tbLoginPrize.OnLogout, tbLoginPrize)