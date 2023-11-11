Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\misc\\eventsys\\type\\harvestplant.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\lang.lua")
Include("\\script\\task\\metempsychosis\\translife_5.lua")

TASK_V_NONE = 0
TASK_V_FINISH = -1
TASK_V_ACCEPT = 1
TASK_V_COUNT_BASE = TASK_V_ACCEPT

ITEM_FUSHENGWAN = {6,1,3558,1}
ITEM_TRANSLIFE_JADE = {6,1,3557,1}

TASK_ID_TREE = 1
TASK_ID_SONGJIN = 2
TASK_ID_YANDI = 3
TASK_ID_COT = 4
TASK_ID_FLD = 5
TASK_ID_BOX = 6

TRANSLIFE5_SKILL_ENHANCE = 1344

TransLife6 = {}
TransLife6.tbTaskLimit = {5, 150}
TransLife6.tbTL6Limit = {5, 200}

TransLife6.tbTaskList = {
	[TASK_ID_TREE]		= {nTaskId=4036, szName=TL6_MSG.TASK_NAME_TREE, nCount=800, nItemCount=30, nParam=1},
	[TASK_ID_BOX]			= {nTaskId=4037, szName=TL6_MSG.TASK_NAME_BOX, nCount=2000, nItemCount=1500, nParam=1},
	[TASK_ID_YANDI]		= {nTaskId=4038, szName=TL6_MSG.TASK_NAME_YANDI, nCount=60, nItemCount=200, nParam=6},
	[TASK_ID_SONGJIN]	= {nTaskId=4039, szName=TL6_MSG.TASK_NAME_SONGJIN, nCount=40, nItemCount=200, nParam=4000},
	[TASK_ID_COT]			= {nTaskId=4040, szName=TL6_MSG.TASK_NAME_COT, nCount=60, nItemCount=200, nParam=20},
	[TASK_ID_FLD]			= {nTaskId=4041, szName=TL6_MSG.TASK_NAME_FLD, nCount=60, nItemCount=200, nParam=1},
}

tbTL6MainDlg = {}
tbAcceptTaskDlg = {}
tbFinishTaskDlg = {}
tbFinishTaskItemDlg = {}
tbShowInfoDlg = {}

--============================================================================================================
function TransLife6:CheckTaskLimit()
	if ST_GetTransLifeCount() == self.tbTaskLimit[1] and GetLevel() >= self.tbTaskLimit[2] then
		return 1
	end
	Talk(1, "", format(TL6_MSG.TASK_LEVEL_LIMIT, self.tbTaskLimit[1], self.tbTaskLimit[2]))
	return 0
end

function TransLife6:CheckTL6Limit()
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount >= 6 then
		Talk(1,"", TL6_MSG.TL_ALREADY_DONE)
		return 0
	end
	if nTransLifeCount ~= self.tbTL6Limit[1] or GetLevel() < self.tbTL6Limit[2] then
		Talk(1,"", format(TL6_MSG.TL_LEVEL_LIMIT, self.tbTL6Limit[1], self.tbTL6Limit[2]))
		return 0
	end
	
	local nNotFinishCount = 0
	for i = 1, getn(self.tbTaskList) do
		local TaskInfo = self.tbTaskList[i]
		if GetTask(TaskInfo.nTaskId) ~= %TASK_V_FINISH then
			nNotFinishCount = nNotFinishCount + 1
		end
	end
	--05022021 Admin: bá kiem tra nhiem vu trung sinh 6
	if nNotFinishCount > 0 then
		Talk(1, "", format(TL6_MSG.TL_TASK_NOT_FINISH, nNotFinishCount))
		return 0
	end
	
	if check_zhuansheng_level() ~= 1 then
		return 0
	end
	
	if zhuansheng_check_common() ~= 1 then
		return 0
	end
	
	return 1
end

function TransLife6:DoTransLife()
	if self:CheckTL6Limit() ~= 1 then
		return
	end
	
	if CalcEquiproomItemCount(%ITEM_TRANSLIFE_JADE[1], %ITEM_TRANSLIFE_JADE[2], %ITEM_TRANSLIFE_JADE[3], -1) < 1 then
		Talk(1, "", TL6_MSG.TL_NEED_ITEM)
		return
	end
	
	ConsumeEquiproomItem(1, %ITEM_TRANSLIFE_JADE[1], %ITEM_TRANSLIFE_JADE[2], %ITEM_TRANSLIFE_JADE[3], -1)
	
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, -2)
	LeaveTeam()
	ST_DoTransLife()
end

function TransLife6:AcceptTask(nTaskIndex)
	local TaskInfo = self.tbTaskList[nTaskIndex]
	if not TaskInfo then
		return
	end
	
	local nTaskValue = GetTask(TaskInfo.nTaskId)
	if nTaskValue == %TASK_V_FINISH then
		Talk(1, "", TL6_MSG.TASK_ACCEPT_ALREADY_FINISH)
		return
	end
	
	if self:CheckTaskLimit() == 0 then
		return
	end
	
	if nTaskValue == %TASK_V_ACCEPT or nTaskValue >= %TASK_V_COUNT_BASE then
		Talk(1, "", TL6_MSG.TASK_ALREADY_ACCEPT)
		return
	end
	
	SetTask(TaskInfo.nTaskId, %TASK_V_ACCEPT)
	Msg2Player(format(TL6_MSG.TASK_ACCEPT, TaskInfo.szName))
end

function TransLife6:FinishTask(nTaskIndex, bUseItem)
	local TaskInfo = self.tbTaskList[nTaskIndex]
	if not TaskInfo then
		return
	end
	
	local nTaskValue = GetTask(TaskInfo.nTaskId)
	local nFinishCount = nTaskValue - %TASK_V_COUNT_BASE
	if nTaskValue == %TASK_V_FINISH then
		Talk(1, "", TL6_MSG.TASK_ALREADY_FINISH)
		return
	end
	
	if nTaskValue == %TASK_V_NONE then
		return Talk(1, "", TL6_MSG.TASK_NOT_ACCEPT)
	end
	
	if nFinishCount < TaskInfo.nCount and bUseItem == 0 then
		return Talk(1, "", TL6_MSG.TASK_CANT_FINISH)
	elseif nFinishCount >= TaskInfo.nCount and bUseItem == 1 then
		return Talk(1, "", TL6_MSG.TASK_DONT_NEED_ITEM)
	end
	
	if bUseItem == 1 then
		local nItemCount = CalcEquiproomItemCount(%ITEM_FUSHENGWAN[1], %ITEM_FUSHENGWAN[2], %ITEM_FUSHENGWAN[3], %ITEM_FUSHENGWAN[4])
		if nItemCount < TaskInfo.nItemCount then
			return Talk(1, "", format(TL6_MSG.ITEM_NOT_ENOUGH, TaskInfo.nItemCount))
		end
		if ConsumeEquiproomItem(TaskInfo.nItemCount, %ITEM_FUSHENGWAN[1], %ITEM_FUSHENGWAN[2], %ITEM_FUSHENGWAN[3], %ITEM_FUSHENGWAN[4]) < 0 then
			return
		end
	end
	
	SetTask(TaskInfo.nTaskId, %TASK_V_FINISH)
	Msg2Player(format(TL6_MSG.TASK_FINISH, TaskInfo.szName))
end

function TransLife6:OnFinishEvent(nTaskIndex)
	local TaskInfo = self.tbTaskList[nTaskIndex]
	local nValue = GetTask(TaskInfo.nTaskId)
	if nValue == %TASK_V_NONE or nValue == %TASK_V_FINISH then
		return
	end
	if nValue - %TASK_V_COUNT_BASE >= TaskInfo.nCount then
		return
	end
	SetTask(TaskInfo.nTaskId, nValue + 1)
end

function TransLife6:OnSongJinFinish(nBattleLevel, tbPlayerAll)
	for i=1, getn(tbPlayerAll) do
		--Fix bug accessing a nil value - modified by DinhHQ - 20130604
		local nPoint = CallPlayerFunction(tbPlayerAll[i].nIndex ,GetTask, 751)
		if nPoint >= self.tbTaskList[%TASK_ID_SONGJIN].nParam then
			CallPlayerFunction(tbPlayerAll[i].nIndex, TransLife6.OnFinishEvent, TransLife6, %TASK_ID_SONGJIN)
		end
	end
end

function TransLife6:OnChuangGuan(nChuanguanCount, tbAllPlayer)
	if nChuanguanCount == self.tbTaskList[%TASK_ID_COT].nParam then
		for i = 1, getn(tbAllPlayer) do 
			CallPlayerFunction(tbAllPlayer[i], TransLife6.OnFinishEvent, TransLife6, %TASK_ID_COT)
		end
	end
end

function TransLife6:OnYanDi(nGuoGuanCount)
	if nGuoGuanCount == self.tbTaskList[%TASK_ID_YANDI].nParam then
		TransLife6:OnFinishEvent(%TASK_ID_YANDI)
	end
end

function TransLife6:OnFengLingDu(tbPlayerAll, bShuizeiTask)
	if bShuizeiTask == self.tbTaskList[%TASK_ID_FLD].nParam then
		for i = 1, getn(tbPlayerAll) do
			CallPlayerFunction(tbPlayerAll[i], TransLife6.OnFinishEvent, TransLife6, %TASK_ID_FLD)
		end
	end
end

function TransLife6:RegisterEvent()
	EventSys:GetType("SongJin"):Reg("OnFinish", TransLife6.OnSongJinFinish, TransLife6)
	EventSys:GetType("ChuanGuan"):Reg("OnPass", TransLife6.OnChuangGuan, TransLife6)
	EventSys:GetType("YanDiBaoZang"):Reg("OnPass", TransLife6.OnYanDi, TransLife6)
	EventSys:GetType("FengLingDu"):Reg("OnLanding", TransLife6.OnFengLingDu, TransLife6)
	EventSys:GetType("HarvestPlants"):Reg("tianlu_tree", TransLife6.OnFinishEvent, TransLife6, TASK_ID_TREE)
end

--========DLG====================================================================================================
function TransLife6:ShowMainDlg()
	CreateNewSayEx(TL6_MSG.DLG_MAIN_TEXT, %tbTL6MainDlg)
end

function TransLife6:ShowAcceptTaskDlg()
	CreateNewSayEx(TL6_MSG.DLG_SELECT_TASK_ACCEPT, %tbAcceptTaskDlg)
end

function TransLife6:ShowFinishTaskDlg()
	CreateNewSayEx(TL6_MSG.DLG_SELECT_TASK_FINISH, %tbFinishTaskDlg)
end

function TransLife6:ShowFinishTaskItemDlg()
	CreateNewSayEx(TL6_MSG.DLG_SELECT_TASK_WITH_ITEM, %tbFinishTaskItemDlg)
end

function TransLife6:GetTaskInfo()
	local szText = ""
	for i = 1, getn(self.tbTaskList) do
		local TaskInfo = self.tbTaskList[i]
		local nTaskValue = GetTask(TaskInfo.nTaskId)
		local szDetail = ""
		if nTaskValue == %TASK_V_NONE then
			szDetail = TL6_MSG.STR_NOT_ACCEPT
		elseif nTaskValue == %TASK_V_FINISH then
			szDetail = TL6_MSG.STR_FINISH
		elseif nTaskValue == TaskInfo.nCount + %TASK_V_COUNT_BASE then
			szDetail = format("<color=green>%d/%d<color>", TaskInfo.nCount, TaskInfo.nCount)
		else
			szDetail = format("<color=yellow>%d/%d<color>", nTaskValue - %TASK_V_COUNT_BASE, TaskInfo.nCount)
		end
		szText = format("%s%s:%s<enter>", szText, TaskInfo.szName, szDetail)
	end
	return szText
end

function TransLife6:ShowTaskDlg()
	local szText = %TL6_MSG.DLG_TEXT_TASK_INFO
	local szDetail = self:GetTaskInfo()
	
	local tbOpt = {
		{DLG_GO_BACK, self.ShowMainDlg, {self}},
		{DLG_CLOSE},
	}
	%CreateNewSayEx(szText..szDetail, tbOpt)
end

function TransLife6:InitDlg()
	for i = 1, getn(self.tbTaskList) do
		local TaskInfo = self.tbTaskList[i]
		tinsert(tbAcceptTaskDlg, {TaskInfo.szName, self.AcceptTask, {self, i}})
		tinsert(tbFinishTaskDlg, {TaskInfo.szName, self.FinishTask, {self, i, 0}})
		tinsert(tbFinishTaskItemDlg, {TaskInfo.szName, self.FinishTask, {self, i, 1}})
	end
	
	local tbOptBack = {DLG_GO_BACK, self.ShowMainDlg, {self}}
	local tbOptClose = {DLG_CLOSE}
	
	tinsert(tbAcceptTaskDlg, tbOptBack)
	tinsert(tbAcceptTaskDlg, tbOptClose)
	
	tinsert(tbFinishTaskDlg, tbOptBack)
	tinsert(tbFinishTaskDlg, tbOptClose)
	
	tinsert(tbFinishTaskItemDlg, tbOptBack)
	tinsert(tbFinishTaskItemDlg, tbOptClose)
	
	tinsert(tbTL6MainDlg, {TL6_MSG.DLG_ACCEPT_TASK, self.ShowAcceptTaskDlg, {self}})
	tinsert(tbTL6MainDlg, {TL6_MSG.DLG_FINISH_TASK, self.ShowFinishTaskDlg, {self}})
	tinsert(tbTL6MainDlg, {TL6_MSG.DLG_FINISH_TASK_ITEM, self.ShowFinishTaskItemDlg, {self}})
	tinsert(tbTL6MainDlg, {TL6_MSG.DLG_SHOW_TASK_INFO, self.ShowTaskDlg, {self}})
	tinsert(tbTL6MainDlg, {TL6_MSG.DLG_DO_TL, self.DoTransLife, {self}})
	tinsert(tbTL6MainDlg, tbOptClose)
	
	tinsert(tbShowInfoDlg, tbOptBack)
	tinsert(tbShowInfoDlg, tbOptClose)
end

function TransLife6:EnhanceTL5Skill()
	if HaveMagic(%TRANSLIFE5_SKILL) > 0 then
		DelMagic(%TRANSLIFE5_SKILL)
		AddMagic(%TRANSLIFE5_SKILL_ENHANCE, 1)
	end
end

function TransLife6:Init()
	self:RegisterEvent()
	self:InitDlg()
end

TransLife6:Init()