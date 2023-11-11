if MODEL_GAMESERVER ~= 1 then
	return 
end
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\event\\prize\\lang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\prize\\acc_time_prize_def.lua")
Include("\\script\\trip\\define.lua")
IncludeLib("SETTING")


tbAccTimePrize.tbBagCellLimit = 
{
	[5] = 5
}
-- Modify award -  by ThanhLD - 20130619
tbAccTimePrize.tbAward =
{
	[1] = {nExp = 10000000},
	[2] = {nExp = 15000000},
	[3] = {nExp = 25000000},
	[4] = {nExp = 40000000},
	[5] = 	
	{
		{nExp = 50000000},
		{szName="Ch©n Nguyªn §¬n",tbProp = {6,1,4804, 1, 0,0}, nBindState = -2, nCount = 1},				---5ÕæÔªµ¤-´ó(°ó)
		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500,nBindState = -2},	
	}
}

function tbAccTimePrize:UpdateData()
	local nRecordTime = GetTask(self.TSK_RECORD_TIME)
	local nCurTime = GetCurServerTime()
	if self:IsSameDay(nRecordTime, nCurTime) ~= 1 then
		SetTask(self.TSK_HAVE_AWARD, 0)
	end
	SetTask(self.TSK_ACC_TIME, self:GetCurAccTime())
	SetTask(self.TSK_RECORD_TIME, nCurTime)
end

function tbAccTimePrize:OnGetOnlineTimeAward()
	local nTripMode = GetTripMode()
	if nTripMode ~= TRIP_MODE_CLIENT then
		return
	end
	if ST_GetOffliveState() == 1 then
		return
	end
	self:UpdateData()
	--if ST_GetTransLifeCount() < 2 then
	--	return Talk(1, "", %NO_ENOUGH_LEVEL)
	--end 
	--if ST_GetTransLifeCount() == 2 then
	--	if GetLevel() < 150 then
	--		return Talk(1, "", %NO_ENOUGH_LEVEL)
	--	end
	--end
	
	local nAccTime = self:GetCurAccTime()
	local nPrizeLevel = floor(nAccTime / self.ONE_DAY)
	nPrizeLevel = min(nPrizeLevel, 5)
	for i=1, nPrizeLevel do
		local nFlag = GetBitTask(self.TSK_HAVE_AWARD, i - 1, 1)
		if nFlag ~= 1 then
			self:OnAward(i)
		end
	end
	SyncTaskValue(self.TSK_HAVE_AWARD)
end

function tbAccTimePrize:OnAward(nId)
	if self.tbAward[nId] == nil then
		return
	end
	local nAccTime = self:GetCurAccTime()
	--if nAccTime < nId*self.ONE_DAY then
	--	return Talk(1, "", %TIME_NOT_ENOUGH)
	--end
	
	local nNeedFreeCell = self.tbBagCellLimit[nId]						--ÅÐ¶Ï±³°ü¿Õ¼äÊÇ·ñ×ã¹»
	--if nNeedFreeCell and CalcFreeItemCellCount() < nNeedFreeCell then
	--	return Talk(1, "", %MSG_NOT_ENOUGH_BAG_CELL)
	--end
	self:GiveAward(nId)
end

function tbAccTimePrize:GiveAward(nId)
	local pAward = self.tbAward[nId]
	if not pAward then
		return
	end
	tbAwardTemplet:Give(pAward, 1, {"AccTimePrize", format("Get award %d", nId)})
	SetBitTask(self.TSK_HAVE_AWARD, nId - 1, 1, 1)
end

function tbAccTimePrize:OnLogin(bExchangeIn)
	if bExchangeIn == 1 then
		return
	end
	local nRecordTime = GetTask(self.TSK_RECORD_TIME)
	local nCurTime = GetCurServerTime()
	if self:IsSameDay(nRecordTime, nCurTime) ~= 1 then
		SetTask(self.TSK_HAVE_AWARD, 0)
		SetTask(self.TSK_ACC_TIME, 0)	
	end
	SetTask(self.TSK_RECORD_TIME, nCurTime)	
end

function tbAccTimePrize:OnOffline()
	self:UpdateData()
end

function tbAccTimePrize:OnLogout()
	if ST_GetOffliveState() == 1 then
		return
	end
	self:UpdateData()
end

EventSys:GetType("OnLogin"):Reg(0, tbAccTimePrize.OnLogin, tbAccTimePrize)
EventSys:GetType("OnLogout"):Reg(0, tbAccTimePrize.OnLogout, tbAccTimePrize)
EventSys:GetType("OnOffline"):Reg(0, tbAccTimePrize.OnOffline, tbAccTimePrize)