Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\arena\\player.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\file.lua")

Include("\\script\\item\\forbiditem.lua")

IncludeLib("SETTING")
local tbRule = Dungeon:new_type("arena")

tbRule.TEMPLATE_MAP_ID = 975

local CAMP_A = 1
local CAMP_B = 2

local FIGHT_TIME = 5*60
local READY_TIME = 60
local READY_COUNT_DOWN = 5
local FIGHT_COUNT_DOWN = 5

local tbNpcList = 
{
	{szName = "R­¬ng chøa ®å", nPosX = 50112, nPosY = 102848, nNpcId = 625, szScriptPath = "\\script\\battles\\openbox.lua"},
	{szName = "Chñ d­îc ®iÕm", nPosX = 50496, nPosY = 102528, nNpcId = 203, szScriptPath = "\\script\\missions\\arena\\npc\\yaodian.lua"}

}
tbRule.tbForbitItemType = 
{
	"CALLNPC",
	"TRANSFER",
}

function tbRule:SetForbitItem()
	local szMapType = self.szDungeonType
	set_MapType(self.TEMPLATE_MAP_ID, szMapType)
		
	for i=1, getn(self.tbForbitItemType) do		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end


function tbRule:_init(pBattle)
	self.tbMemberMap = {}
	self.tbFreeCamp = {}
	self.tbCamp = {}
	tinsert(self.tbFreeCamp, %CAMP_A)
	tinsert(self.tbFreeCamp, %CAMP_B)
	
	for i=1, getn(%tbNpcList) do
		ClearMapNpcWithName(self.nMapId, %tbNpcList[i].szName)
		basemission_CallNpc(%tbNpcList[i], self.nMapId)
	end
	
	self.nState = "free"
	return 1
end



--Õý³£Ö´ÐÐ²»»áµ½ÕâÀï
function tbRule:KickOut()
	NewWorld(20,3546,6226)
end

function tbRule:GetFreeCamp()
	local nCamp = self.tbFreeCamp[1]
	if nCamp then
		tremove(self.tbFreeCamp, 1)
		return nCamp
	end
end

function tbRule:AddFreeCamp(nCamp)
	if nCamp then
		tinsert(self.tbFreeCamp, nCamp)
	end
end

function tbRule:GetFreeCampCount()
	return getn(self.tbFreeCamp)
end

function tbRule:OnEnterMap()
	if self.nState ~= "free" then
		self:KickOut()
		return
	end
	local nCamp = self:GetFreeCamp()
	
	if not nCamp then
		self:KickOut()
		return
	end
	local szName = GetName()
	
	DynamicExecute("\\script\\missions\\arena\\protocol.lua", "on_player_enter_map", szName, self.nMapId)
	local pMember = tbMember:new(nCamp)
	self.tbMemberMap[szName] = pMember
	self.tbCamp[nCamp] = pMember
	SetLogoutRV(1)
	SetFightState(0)
	SetTmpCamp(nCamp)
	SetPunish(0)
	ForbidEnmity(1)
	SetDeathType(-1)
	SetPKFlag(1)
	DisabledStall(1)
	LeaveTeam()
	SetCreateTeam(0)
	ForbidChangePK(1)
	ForbidEnmity(1)
	--Remove PK skill state on enter map - modified By DinhHQ - 20130709
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\arena\\vnforbidstate.lua", "VnRemoveForbidState")
end

function tbRule:OnLeaveMap()
	ForbidEnmity(0)
	SetTmpCamp(0)
	SetPunish(1)
	SetDeathType(0)
	ForbitStamina(0)
	SetPKFlag(0)
	DisabledStall(0)
	SetCreateTeam(1)
	ForbidChangePK(0)
	ForbidEnmity(0)
	local szName = GetName()
	DynamicExecute("\\script\\missions\\arena\\protocol.lua", "on_player_leave_map", szName, self.nMapId)
	local pMember = self.tbMemberMap[szName]
	if pMember then
		SetFightState(pMember.nLastFightState)
		self:AddFreeCamp(pMember.nCamp)
		if self.nState ~= "free" and self.nState ~= "result" then
			pMember.bDeath = 1
			self:ProcResult()
		end
		self.tbMemberMap[szName] = nil
		self.tbCamp[pMember.nCamp]=nil
	end
	
end

function tbRule:SetLastState(szName, tbLastState)
	local pMember = self.tbMemberMap[szName]
	if pMember then
		pMember:SyncLastState(tbLastState)
	end
	
	if self:GetFreeCampCount() == 0 then
		for szName, pMember in self.tbMemberMap do 
			if pMember and pMember.bReady ~= 1 then
				 return 
			end
		end
		self:StartBattle()
	end
end

function tbRule:ProcResult()
	self.nState = "result"
	for szName, pMember in self.tbMemberMap do
		if pMember then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				CallPlayerFunction(nPlayerIndex, SetFightState, 0)
				pMember.nReceiveDamage = CallPlayerFunction(nPlayerIndex, ST_GetDamageCounter)
				CallPlayerFunction(nPlayerIndex, ST_StopDamageCounter)
			end
		end
	end
	local pMemberA = self.tbCamp[%CAMP_A]
	local pMemberB = self.tbCamp[%CAMP_B]
	if not pMemberA or not pMemberB then
		return
	end
	
	if pMemberA.bDeath == 1 or pMemberB.bDeath == 1 then
		if pMemberA.bDeath == pMemberB.bDeath then
			self:SetResult(pMemberA, pMemberB, "DRAW")
			Msg2Map(self.nMapId, "Hai bªn ®Òu tö trËn.")			
		elseif pMemberA.bDeath == 1 then
			self:SetResult(pMemberA, pMemberB, "LOSE")
			Msg2Map(self.nMapId, format("%s ®¸nh b¹i %s", pMemberB.szName, pMemberA.szName))			
		else
			self:SetResult(pMemberA, pMemberB, "VICTORY")
			Msg2Map(self.nMapId, format("%s ®¸nh b¹i %s", pMemberA.szName, pMemberB.szName))
		end
	else
		Msg2Map(self.nMapId, format("%s lùc s¸t th­¬ng lµ %d", pMemberA.szName, pMemberB.nReceiveDamage))
		Msg2Map(self.nMapId, format("%s lùc s¸t th­¬ng lµ %d", pMemberB.szName, pMemberA.nReceiveDamage))
		
		if pMemberA.nReceiveDamage == pMemberB.nReceiveDamage then
			self:SetResult(pMemberA, pMemberB, "DRAW")
			Msg2Map(self.nMapId, "ThÕ lùc hai bªn bÊt ph©n th¾ng b¹i")
		elseif pMemberA.nReceiveDamage > pMemberB.nReceiveDamage then
			self:SetResult(pMemberA, pMemberB, "LOSE")
			Msg2Map(self.nMapId, format("%s th¾ng lîi", pMemberB.szName))
		else
			self:SetResult(pMemberA, pMemberB, "VICTORY")
			Msg2Map(self.nMapId, format("%s th¾ng lîi", pMemberA.szName))
		end
	end
	self:close()
	
end

function tbRule:SetResult(pMemberA, pMemberB, szResult)
	if szResult == "DRAW" then
		pMemberA:SetResult(pMemberB.nRank, "DRAW")
		pMemberB:SetResult(pMemberA.nRank, "DRAW")
		WriteLog(format("[%s]\t%s\t%s\tDRAW", self.szDungeonType, pMemberA.szName, pMemberB.szName ))
	elseif szResult == "VICTORY" then
		pMemberA:SetResult(pMemberB.nRank, "VICTORY")
		pMemberB:SetResult(pMemberA.nRank, "LOSE")
		WriteLog(format("[%s]\t%s\t%s\tVICTORY", self.szDungeonType, pMemberA.szName, pMemberB.szName ))
	elseif szResult == "LOSE" then
		pMemberA:SetResult(pMemberB.nRank, "LOSE")
		pMemberB:SetResult(pMemberA.nRank, "VICTORY")
		WriteLog(format("[%s]\t%s\t%s\tVICTORY", self.szDungeonType, pMemberB.szName, pMemberA.szName ))
	end
end

function tbRule:OnClose()
	for szName, pMember in self.tbMemberMap do
		if pMember then
			pMember:GoToLastPos()
		end
	end
end


function tbRule:GetReadyPos()
	local nX32, nY32 = GetRandomAData("\\settings\\missions\\arena\\readypos.txt")
	
	return nX32 / 32, nY32 / 32
end

function tbRule:GetBattlePos()
	local nX32, nY32 = GetRandomAData("\\settings\\missions\\arena\\battlepos.txt")
	return nX32 / 32, nY32 / 32
end

function tbRule:StartBattle()
	self.nState = "ready"
	
	DynamicExecute("\\script\\missions\\arena\\protocol.lua", "on_begin_battle", self.nMapId, self.tbMemberMap)
	Msg2Map(self.nMapId, format("Sau %d gi©y chÝnh thøc b¾t ®Çu", %READY_TIME))
	self:AddTimer((%READY_TIME - %READY_COUNT_DOWN)* 18, self.OnTime, {self})
end

function tbRule:ReadyFight()
	for szName, pMember in self.tbMemberMap do
		if pMember then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				local nX, nY = self:GetBattlePos()
				CallPlayerFunction(nPlayerIndex, SetPos, nX, nY)
			end
		end
	end
end



function tbRule:StartFight()
	Msg2Map(self.nMapId, "Ph©n tranh ")
	for szName, pMember in self.tbMemberMap do
		if pMember then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				local nX, nY = self:GetBattlePos()
				CallPlayerFunction(nPlayerIndex, SetFightState, 1)
				CallPlayerFunction(nPlayerIndex, ForbitStamina, 1)
				CallPlayerFunction(nPlayerIndex, ST_StartDamageCounter)
			end
		end
	end
end

function tbRule:OnTime()
	if self.nState == "ready" then
		self.nState = "ready_count_down"
		self.nCountDown = %READY_COUNT_DOWN
		Msg2Map(self.nMapId, format("Thêi gian chuÈn bÞ cßn l¹i %d gi©y", self.nCountDown))
		return 18
	elseif self.nState == "ready_count_down" then
		if self.nCountDown > 0 then
			self.nCountDown = self.nCountDown - 1
			Msg2Map(self.nMapId, format("Thêi gian chuÈn bÞ cßn l¹i %d gi©y", self.nCountDown))
		else
			self.nState = "fight_count_down"
			self.nCountDown = %FIGHT_COUNT_DOWN
			self:ReadyFight()
		end
		return 18
	elseif self.nState == "fight_count_down" then
		if self.nCountDown > 0 then
			self.nCountDown = self.nCountDown - 1
			Msg2Map(self.nMapId, format("%d", self.nCountDown))
			return 18
		else
			self.nState = "fight"
			self:StartFight()
			return %FIGHT_TIME * 18
		end
	elseif self.nState == "fight" then
		self:ProcResult()
		return 0
	end
end

local init_rule = function ()
	PreApplyDungeonMap(%tbRule.TEMPLATE_MAP_ID, 0, 0)
end
AutoFunctions:Add(init_rule)
tbRule:SetForbitItem()
DynamicExecute("\\script\\item\\heart_head.lua", "add_forbit_templatemap", tbRule.TEMPLATE_MAP_ID)