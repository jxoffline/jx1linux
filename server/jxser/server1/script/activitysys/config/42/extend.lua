Include("\\script\\activitysys\\config\\42\\head.lua")
Include("\\script\\activitysys\\config\\42\\variables.lua")
Include("\\script\\missions\\exptree\\exptree.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()
pActivity.szEventName = "Event_Thang5"

function pActivity:WriteLog(szMsg)
	%tbLog:PlayerActionLog(self.szEventName, szMsg)
end

function pActivity:AddTrebleExpTime(TSK_TREBLEEXP_TIME, TSK_HANDIN_LIULINGDAN)
	local nLastTime = self:GetTask(TSK_TREBLEEXP_TIME)
	local nCurTime = GetCurServerTime()
	local nNewTime = max(nCurTime, nLastTime)+20*60
	self:SetTask(TSK_TREBLEEXP_TIME, nNewTime)
	Msg2Player("Giao nép L­u Linh §¬n thµnh c«ng, th«ng qua C©y Ph­îng ng­¬i nhËn ®­îc nh©n 3 kinh nghiÖm.")
	self:WriteLog("SuDungLuuLinhDon")
	if self:CheckTaskDaily(TSK_HANDIN_LIULINGDAN,3,"","==") == 1 then
		self:WriteLog("SuDungLuuLinhDon3Lan")
	end
end

MayTree = ExpTree:NewTemplate("MayTree")
MayTree.nStartDate = pActivity.nStartDate
MayTree.nEndDate = pActivity.nEndDate
MayTree.pActivity = pActivity
MayTree.TSK_TREBLEEXP_TIME = TSK_TREBLEEXP_TIME
MayTree.TSK_EXPLIMIT_DAILY = TSK_EXPLIMIT_DAILY
MayTree.TSK_MSG_INTERVAL = TSK_MSG_INTERVAL
MayTree.TSK_DATE = TSK_DATE
MayTree.nExpLimitTime = 3600
MayTree.nNormalRate = 1
MayTree.nExRate = 3
MayTree.nLevelLimit = 150
MayTree.nMsgIntervalTime = 60
MayTree.szMsgIntervalWarning = "Th«ng qua C©y Ph­îng h«m nay ng­¬i nhËn kinh nghiÖm ®· ®¹t ®Õn giíi h¹n"
MayTree.tbNpcTypeList = {
	["C©y Ph­îng"] = {
		nNpcId = 1924,
		szName = "C©y Ph­îng",
		nLevel = 90,
		nTime = 15,
		szPosPath = "\\settings\\activitysys\\42\\npcpos.txt",
	},
}

MayTree.tbAward = {
	{nExp_tl = 200000, }
}

MayTree.tbAwardTime = {
	{9, 10},
	{18, 19},
	{20, 21},
}


function MayTree:CheckAwardLimit(nPlayerIndex, nTime)
	local nIsTransLife = CallPlayerFunction(nPlayerIndex, ST_IsTransLife)
	local nLevel = CallPlayerFunction(nPlayerIndex, GetLevel)
	if nIsTransLife ~= 1 and nLevel < self.nLevelLimit then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	local nLastDate = CallPlayerFunction(nPlayerIndex, self.pActivity.GetTask, self.pActivity, self.TSK_DATE)
	if nDate ~= nLastDate then
		CallPlayerFunction(nPlayerIndex, self.pActivity.SetTask, self.pActivity, self.TSK_DATE, nDate)
		CallPlayerFunction(nPlayerIndex, self.pActivity.SetTask, self.pActivity, self.TSK_EXPLIMIT_DAILY, 0)
		CallPlayerFunction(nPlayerIndex, self.pActivity.SetTask, self.pActivity, self.TSK_MSG_INTERVAL, 0)
	end
	local nAddUpExpTime = CallPlayerFunction(nPlayerIndex, self.pActivity.GetTask, self.pActivity, self.TSK_EXPLIMIT_DAILY)
	if nAddUpExpTime < self.nExpLimitTime then
		CallPlayerFunction(nPlayerIndex, self.pActivity.SetTask, self.pActivity, self.TSK_EXPLIMIT_DAILY, nAddUpExpTime+nTime)
		return 1
	elseif nAddUpExpTime == self.nExpLimitTime then
		CallPlayerFunction(nPlayerIndex, self.pActivity.WriteLog, self.pActivity, "SoNguoiNhanMaxExpTuNpcCayPhuong")
		CallPlayerFunction(nPlayerIndex, self.pActivity.SetTask, self.pActivity, self.TSK_EXPLIMIT_DAILY, nAddUpExpTime+nTime)
	end
	local nAddUpMsgInterval = CallPlayerFunction(nPlayerIndex, self.pActivity.GetTask, self.pActivity, self.TSK_MSG_INTERVAL)
	if nAddUpMsgInterval+nTime >= self.nMsgIntervalTime then
		nAddUpMsgInterval = 0
	end
	if nAddUpMsgInterval == 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, self.szMsgIntervalWarning)
	end
	CallPlayerFunction(nPlayerIndex, self.pActivity.SetTask, self.pActivity, self.TSK_MSG_INTERVAL, nAddUpMsgInterval+nTime)
	return
end

function MayTree:GetRate(nPlayerIndex)
	local nLastTime = CallPlayerFunction(nPlayerIndex, self.pActivity.GetTask, self.pActivity, self.TSK_TREBLEEXP_TIME)
	local nCurTime = GetCurServerTime()
	local nRate = self.nNormalRate
	if nCurTime <= nLastTime then
		nRate = self.nExRate
	end
	return nRate
end

AutoFunctions:Add(MayTree.SetRefreshNpcTimer, MayTree)