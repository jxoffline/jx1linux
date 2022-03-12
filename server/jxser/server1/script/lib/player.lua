Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\task\\task_addplayerexp.lua")
IncludeLib("LEAGUE")
IncludeLib("SETTING")

function TRUE(value)
	return value ~=0 and value ~=nil 
end

function FALSE(value)
	return value == 0 or value==nil
end

function getPlayerInfo(playerIndex,baseInfo,task,tasktmp)
	if(not playerIndex or FALSE(playerIndex)) then
		return nil
	end
	local oldPid = PlayerIndex
	PlayerIndex = playerIndex
	local tab = {}
	if(type(baseInfo)=="table") then
		for i=1,getn(baseInfo) do
			if(baseInfo[i]=="pid") then
				tab.pid = PlayerIndex
			elseif(baseInfo[i]=="name") then
				tab.name = GetName()
			elseif(baseInfo[i]=="sex") then
				tab.sex = GetSex()
			elseif(baseInfo[i]=="level") then
				tab.level = GetLevel()
			elseif(baseInfo[i]=="faction") then
				tab.faction = GetLastFactionNumber()
			end
		end
	end
	if(type(task)=="table") then
		tab.task = {}
		for i=1,getn(task) do
			tab.task[task[i]] = GetTask(task[i])
		end
	end
	if(type(tasktmp)=="table") then
		tab.tasktmp = {}
		for i=1,getn(tasktmp) do
			tab.tasktmp[tasktmp[i]] = GetTaskTemp(tasktmp[i])
		end
	end
	PlayerIndex = oldPid
	return tab
end

function getTeamInfo(playerIndex,baseInfo,task,tasktmp)
	local size = callPlayerFunction(playerIndex,GetTeamSize)
	if size== 0 then return nil end --Íæ¼Ò²»ÔÚ¶ÓÎéÖÐ
	local me,others,all = getPlayerInfo(playerIndex,baseInfo,task,tasktmp),{},{}
	local j=1
	for i=1,size do
		local plyIdx = callPlayerFunction(playerIndex,GetTeamMember,i)
		all[i] = getPlayerInfo(plyIdx,baseInfo,task,tasktmp)
		if(plyIdx ~= playerIndex) then
			others[j] = all[i]
			j = j+1
		end
	end
	return me,others,all
end

function traversalTeam(playerIndex, func, param, baseInfo, task, tasktmp)
	local size = callPlayerFunction(playerIndex, GetTeamSize)
	if size == 0 then
		-- Íæ¼Ò²»ÔÚ¶ÓÎéÖÐ
		return
	end
	for i = 1, size do
		local plyIdx = callPlayerFunction(playerIndex, GetTeamMember, i)
		if(plyIdx ~= playerIndex) then
			local info = getPlayerInfo(plyIdx, baseInfo, task, tasktmp)
			func(param, info)
		end
	end
end

function sex2Word(sex)
	if(sex == 0) then
		return "Nam"
	else
		return "N÷ "
	end
end

function sendMessage(playerIndex,msg)
	if(not playerIndex or FALSE(playerIndex)) then
		return
	end
	local oldPid = PlayerIndex
	PlayerIndex = playerIndex
	Msg2Player(msg)
	PlayerIndex = oldPid
end

function setPlayerTask(pid,tab)
	if(type(tab) ~="table") then
		return
	end
	local oldPid = PlayerIndex
	PlayerIndex = pid
	for k,v in tab do
		SetTask(k,v)
	end
	PlayerIndex = oldPid
	return
end

function setPlayerTaskTemp(pid,tab)
	if(type(tab) ~="table") then
		return
	end
	local oldPid = PlayerIndex
	PlayerIndex = pid
	for k,v in tab do
		SetTaskTemp(k,v)
	end
	PlayerIndex = oldPid
	return
end

function callPlayerFunction(pid,fun,...)
	local oldPid = PlayerIndex
	PlayerIndex = pid
	local ret = call(fun,arg)
	PlayerIndex = oldPid
	return ret
end

function callPlayerFunctionParamList(pid, fun, paramlist)
	local oldPid = PlayerIndex
	PlayerIndex = pid
	local ret = call(fun, paramlist)
	PlayerIndex = oldPid
	return ret
end

TASK_OFFLINEADVTIME 	= 2791		-- ÀÛ¼ÆÀëÏßÊ±¼ä£¨·ÖÖÓ£©
TASK_OFFLINELOWTIME		= 2792		-- ÀÛ¼ÆÀëÏßÁì½±Ê±¼ä£¨·ÖÖÓ£©

local t = newtag()
local  Tgettable = function(t, k)
	if k == "_tbBase" then
		return
	end

	if rawget(t,k) == nil then
		rawset(t,k, rawget(t,"_tbBase")[k])
	end
	return rawget(t,k)
	
end

local  Tsettable = function(t, k, v)
	if k == "_tbBase" then
		return
	end
	rawset(t, k, v)
end

local t = newtag()

settagmethod(t,"gettable",Tgettable)
settagmethod(t,"settable",Tsettable)

Player = {}

function Player:_NewObj()
	local tb = 
	{
		_tbBase = self
	}
	settag(tb,%t)
	return tb
end

function Player:New(index)

	local tb = self:_NewObj()
	tb.m_PlayerIndex = index
	return tb
end

function Player:NewByName(szName)
	local nPlayerIndex = SearchPlayer(szName)
	return self:New(nPlayerIndex)	
end

function Player:Init(nPlayerIndex)
	self.m_PlayerIndex = nPlayerIndex
end

function Player:InitByName(szName)
	if type(szName) == "string" then
		return self:Init(SearchPlayer(szName))
	end
end

function Player:SendData(id, handle)
	return self:Call(SendScriptData, id, handle)
end

function Player:GetAccount()
	return callPlayerFunction(self.m_PlayerIndex, GetAccount)
end

function Player:GetName()
	return callPlayerFunction(self.m_PlayerIndex, GetName)
end

function Player:GetLevel()
	return callPlayerFunction(self.m_PlayerIndex, GetLevel)
end

function Player:GetSex()
	return callPlayerFunction(self.m_PlayerIndex, GetSex)
end

function Player:IsCharged()
	return callPlayerFunction(self.m_PlayerIndex, IsCharged)
end

function Player:GetTask(id)
	return callPlayerFunction(self.m_PlayerIndex, GetTask, id)
end

function Player:SetTask(id, value)
	return callPlayerFunction(self.m_PlayerIndex, SetTask, id, value)
end

function Player:AddTask(id, value)
	if (value > 0) then
		local v = self:GetTask(id)
		self:SetTask(id, v + value)
	end
end

function Player:ReduceTask(id, value)
	if (value > 0) then
		local v = self:GetTask(id)
		if (v < value) then
			v = 0
		else
			v = v - value
		end
		self:SetTask(id, v)
	end
end

function Player:Say(...)
	return callPlayerFunctionParamList(self.m_PlayerIndex, Say, arg)
end

function Player:Describe(...)
	return callPlayerFunctionParamList(self.m_PlayerIndex, Describe, arg)
end

function Player:Talk(...)
	return callPlayerFunctionParamList(self.m_PlayerIndex, Talk, arg)
end

function Player:AddItem(...)
	return callPlayerFunctionParamList(self.m_PlayerIndex, AddItem, arg)
end

function Player:AddItemIntoEquipmentBox(...)
	return callPlayerFunctionParamList(self.m_PlayerIndex, AddItemIntoEquipmentBox, arg)
end

function Player:ConsumeEquiproomItem(...)
	return callPlayerFunctionParamList(self.m_PlayerIndex, ConsumeEquiproomItem, arg)
end

function Player:Msg2Player(msg)
	return callPlayerFunction(self.m_PlayerIndex, Msg2Player, msg)
end

function Player:GetEnergy()
	return callPlayerFunction(self.m_PlayerIndex, GetEnergy)
end

function Player:SetEnergy(value)
	return callPlayerFunction(self.m_PlayerIndex, SetEnergy, value)
end

function Player:AddEnergy(value)
	return callPlayerFunction(self.m_PlayerIndex, AddEnergy, value)
end

function Player:GetSeries()
	return callPlayerFunction(self.m_PlayerIndex, GetSeries)
end

function Player:SetSeries(series)
	return callPlayerFunction(self.m_PlayerIndex, SetSeries, series)
end

function Player:GetTong()
	local name, _ = CallPlayerFunction(self.m_PlayerIndex, GetTong)
	return name
end

function Player:GetTongMaster()
	return CallPlayerFunction(self.m_PlayerIndex, GetTongMaster)
end

function Player:SyncItem(nItemIndex)
	return CallPlayerFunction(self.m_PlayerIndex, SyncItem, nItemIndex)
end

function Player:GetTmpCamp()
	return CallPlayerFunction(self.m_PlayerIndex, GetTmpCamp)
end

function Player:SetTmpCamp(camp)
	return CallPlayerFunction(self.m_PlayerIndex, SetTmpCamp, camp)
end

function Player:GetWorldPos()
	return CallPlayerFunction(self.m_PlayerIndex, GetWorldPos)
end

function Player:NewWorld(mapid, x, y)
	return CallPlayerFunction(self.m_PlayerIndex, NewWorld, mapid, x, y)
end

function Player:GetLogoutRV()
	return CallPlayerFunction(self.m_PlayerIndex, GetLogoutRV)
end

function Player:SetLogoutRV(flag)
	return CallPlayerFunction(self.m_PlayerIndex, SetLogoutRV, flag)
end

function Player:SetFightState(state)
	return CallPlayerFunction(self.m_PlayerIndex, SetFightState, state)
end

function Player:GetFightState()
	return CallPlayerFunction(self.m_PlayerIndex, GetFightState)
end

function Player:SetPunish(flag)
	return CallPlayerFunction(self.m_PlayerIndex, SetPunish, flag)
end

function Player:GetPos()
	return CallPlayerFunction(self.m_PlayerIndex, GetPos)
end

function Player:GetPunish()
	return CallPlayerFunction(self.m_PlayerIndex, GetPunish)
end

function Player:SetDeathScript(script)
	return CallPlayerFunction(self.m_PlayerIndex, SetDeathScript, script)
end

function Player:ForbidEnmity(flag)
	return CallPlayerFunction(self.m_PlayerIndex, ForbidEnmity, flag)
end

function Player:GetForbidEnmity()
	return CallPlayerFunction(self.m_PlayerIndex, GetForbidEnmity)
end

function Player:AddStackExp(exp)
	return CallPlayerFunction(self.m_PlayerIndex, tl_addPlayerExp, exp)
end

function Player:GetJoinTongTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetJoinTongTime)
end

function Player:DisabledUseTownP(flag)
	return CallPlayerFunction(self.m_PlayerIndex, DisabledUseTownP, flag)
end

function Player:DisabledUseHeart(flag)
	return CallPlayerFunction(self.m_PlayerIndex, DisabledUseHeart, flag)
end

function Player:GetCash()
	return CallPlayerFunction(self.m_PlayerIndex, GetCash)
end

function Player:Pay(money)
	return CallPlayerFunction(self.m_PlayerIndex, Pay, money)
end

function Player:GetTiaozhanlingCount()
	local tong = self:GetTong()
	if (not tong or tong == "") then
		return 0
	else
		return LG_GetMemberTask(538, "tiaozhanling", tong, 1)
	end
end

function Player:ApplyReduceTiaozhanlingCount(count)
	local tong = self:GetTong()
	if (not tong or tong == "" or count < 0) then
		return 0
	elseif (self:GetTiaozhanlingCount() < count) then
		return 0
	else
		return LG_ApplyAppendMemberTask(538, "tiaozhanling", tong, 1, -count)
	end
end

function Player:SendScriptData(id, handle)
	return CallPlayerFunction(self.m_PlayerIndex, SendScriptData, id, handle)
end

function Player:GetLastLogoutTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetLastLogoutTime)
end

function Player:SetLastLogoutTime(time)
	return CallPlayerFunction(self.m_PlayerIndex, SetLastLogoutTime, time)
end

function Player:GetLastOfflineTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetLastOfflineTime)
end

function Player:SetLastOfflineTime(time)
	return CallPlayerFunction(self.m_PlayerIndex, SetLastOfflineTime, time)
end

function Player:GetLastExchangeTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetLastExchangeTime)
end

function Player:GetLoginTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetLoginTime)
end

-- »ñÈ¡ÀÛ¼ÆÀëÏßÁì½±Ê±¼ä£¨·ÖÖÓ£©
function Player:GetOfflineLowTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetTask, TASK_OFFLINELOWTIME)
end

-- ÉèÖÃÀÛ¼ÆÀëÏßÁì½±Ê±¼ä£¨·ÖÖÓ£©
function Player:SetOfflineLowTime(time)
	return CallPlayerFunction(self.m_PlayerIndex, SetTask, TASK_OFFLINELOWTIME, time)
end

-- Ôö¼ÓÀÛ¼ÆÀëÏßÁì½±Ê±¼ä£¨·ÖÖÓ£©
function Player:AddOfflineLowTime(time)
	local value = self:GetOfflineLowTime() + time
	self:SetOfflineLowTime(value)
end

-- Çå³ýÀÛ¼ÆÀëÏßÁì½±Ê±¼ä
function Player:ClearOfflineLowTime()
	self:SetOfflineLowTime(0)
end

-- »ñÈ¡ÀÛ¼ÆÀëÏßÊ±¼ä
function Player:GetOfflineAdvTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetTask, TASK_OFFLINEADVTIME)
end

-- ÉèÖÃÀÛ¼ÆÀëÏßÊ±¼ä
function Player:SetOfflineAdvTime(time)
	return CallPlayerFunction(self.m_PlayerIndex, SetTask, TASK_OFFLINEADVTIME, time)
end

-- Ôö¼ÓÀÛ¼ÆÀëÏßÊ±¼ä£¨·ÖÖÓ£©
function Player:AddOfflineAdvTime(time)
	local value = self:GetOfflineAdvTime() + time
	self:SetOfflineAdvTime(value)
end

function Player:ReduceOfflineAdvTime(time)
	local value = self:GetOfflineAdvTime()
	if (value <= time) then
		value = 0
	else
		value = value - time
	end
	self:SetOfflineAdvTime(value)
end

-- ÊÇ·ñ×ªÉú
function Player:IsTransLife()
	return CallPlayerFunction(self.m_PlayerIndex, ST_IsTransLife)
end

function Player:GetTransLifeCount()
	return CallPlayerFunction(self.m_PlayerIndex, ST_GetTransLifeCount)
end

-- ¸øµþ¼Ó¾­Ñé
function Player:StackExp(exp)
	return CallPlayerFunction(self.m_PlayerIndex, StackExp, exp)
end

-- »ñÈ¡µ±Ç°¾­Ñé
function Player:GetExp()
	return CallPlayerFunction(self.m_PlayerIndex, GetExp)
end

function Player:GetNpcIdx()
	return PIdx2NpcIdx(self.m_PlayerIndex)
end

function Player:GetRelation(pPlayer)
	return GetNpcRelation(self:GetNpcIdx(), pPlayer:GetNpcIdx())
end

function Player:GetPlayerRev()
	if not self.m_PlayerIndex or self.m_PlayerIndex <= 0 then
		return
	end
	local nOldPlayer = PlayerIndex;
	PlayerIndex = self.m_PlayerIndex
	local nworld,nrid = GetPlayerRev();
	PlayerIndex = nOldPlayer;
	return nworld,nrid;
end

function Player:RevID2WXY(nworld,nrid)
	if not self.m_PlayerIndex or self.m_PlayerIndex <= 0 then
		return
	end
	local nOldPlayer = PlayerIndex;
	PlayerIndex = self.m_PlayerIndex
	local nw,nx,ny = RevID2WXY(nworld,nrid);
	PlayerIndex = nOldPlayer;
	return nw,nx,ny;
end


function Player:Pack(...)
	return arg
end

function Player:Call(pFun, ...)
	if not self.m_PlayerIndex or self.m_PlayerIndex <= 0 then
		return
	end
	local nOldPlayer = PlayerIndex;
	PlayerIndex = self.m_PlayerIndex
	local re = self:Pack(call(pFun, arg));
	PlayerIndex = nOldPlayer;
	return unpack(re)

end

function Player:CallWithParam(pFun, tbParam)
	if not self.m_PlayerIndex or self.m_PlayerIndex <= 0 then
		return
	end
	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = self.m_PlayerIndex
	local re = self:Pack(call(pFun, tbParam));
	PlayerIndex = nOldPlayer;
	return unpack(re)

end

-- ¼ÆËãÍæ¼ÒÎïÆ·À¸Ö¸¶¨ÀàÐÍÎïÆ·µÄÊýÁ¿£¨¼ÆËã¿Éµþ·ÅÎïÆ·µÄµþ¼ÓÊýÁ¿£©
function Player:CalcEquiproomItemCount(genre, detail, particular, level)
	return CallPlayerFunction(self.m_PlayerIndex, CalcEquiproomItemCount, genre, detail, particular, level)
end

function Player:CalcFreeItemCellCount()
	return CallPlayerFunction(self.m_PlayerIndex, CalcFreeItemCellCount)
end

function Player:SetProtectTime(time)
	return CallPlayerFunction(self.m_PlayerIndex, SetProtectTime, time)
end

function Player:GetProtectTime()
	return CallPlayerFunction(self.m_PlayerIndex, GetProtectTime)
end

function Player:AddSkillState(id, level, type, time)
	return CallPlayerFunction(self.m_PlayerIndex, AddSkillState, id, level, type, time)
end

function Player:GetLastFactionNumber()
	return CallPlayerFunction(self.m_PlayerIndex, GetLastFactionNumber)
end

function Player:GetFaction()
	return CallPlayerFunction(self.m_PlayerIndex, GetFaction)
end

function Player:GetPos()
	return CallPlayerFunction(self.m_PlayerIndex, GetPos)
end

function Player:SetPos(x, y)
	return CallPlayerFunction(self.m_PlayerIndex, SetPos, x, y)
end

function Player:AskClientForNumber(func, min, max, title)
	return CallPlayerFunction(self.m_PlayerIndex, AskClientForNumber, func, min, max, title)
end

function Player:Sale(nId, nCurrencyType, nScale)
	if (nCurrencyType == nil and nScale == nil) then
		CallPlayerFunction(self.m_PlayerIndex, Sale, nId)
	elseif (nCurrencyType ~= nil and nScale ~= nil) then
		 CallPlayerFunction(self.m_PlayerIndex, Sale, nId, nCurrencyType, nScale)
	elseif (nCurrencyType ~= nil) then
		 CallPlayerFunction(self.m_PlayerIndex, Sale, nId, nCurrencyType)
	end
end

function Player:CastSkill(...)
	return self:CallWithParam(CastSkill, arg)
end

function Player:OpenProgressBar(...)
	return self:CallWithParam(OpenProgressBar, arg)
end

function Player:IsCaptain()
	return CallPlayerFunction(self.m_PlayerIndex, IsCaptain)
end

function Player:GetTeamSize()
	return CallPlayerFunction(self.m_PlayerIndex, GetTeamSize)
end

function Player:GetTeamMember(index)
	return CallPlayerFunction(self.m_PlayerIndex, GetTeamMember, index)
end

function Player:LeaveTeam()
	return CallPlayerFunction(self.m_PlayerIndex, LeaveTeam)
end

function Player:DisabledStall(flag)
	return CallPlayerFunction(self.m_PlayerIndex, DisabledStall, flag)
end

function Player:IsDisabledStall()
	return CallPlayerFunction(self.m_PlayerIndex, IsDisabledStall)
end

function Player:SetTempRevPos(...)
	return self:CallWithParam(SetTempRevPos, arg)
end

function Player:SetRevPos(...)
	return self:CallWithParam(SetRevPos, arg)
end

function Player:GetPlayerRev()
	return CallPlayerFunction(self.m_PlayerIndex, GetPlayerRev)
end

function Player:RevID2WXY(nMapId, nRevId)
	return CallPlayerFunction(self.m_PlayerIndex, RevID2WXY, nMapId, nRevId)
end
