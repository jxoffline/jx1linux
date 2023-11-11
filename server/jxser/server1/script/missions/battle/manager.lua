Include("\\script\\missions\\battle\\battle.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\battle\\lib.lua")
Include("\\script\\trip\\define.lua")

MAX_BATTLE_COUNT = 10
BattleManagerDef = 
{
	--{"S¬ cÊp Tèng Kim liªn server", 972, 5000, 11000},
	{"Trung cÊp Tèng Kim liªn server", 973, 23000, 45000},--DC gi¸ trÞ tµi phó binh gi¸p yªu cÇu ®Ó tham gia TKLSV - modified By DinhHQ - 20130314
	{"Cao cÊp Tèng Kim liªn server", 974, 45100},--DC gi¸ trÞ tµi phó binh gi¸p yªu cÇu ®Ó tham gia TKLSV - modified By DinhHQ - 20130314
}

NPC_LIST = 
{
	{235, "Xa phu", {1535,3154},"\\script\\missions\\battle\\npc\\chefu.lua"},
	{55, "Qu©n Nhu quan", {1546,3159}, "\\script\\missions\\battle\\npc\\doctor.lua"},
	{62,"Mé Binh Quan", {1549,3179}, "\\script\\activitysys\\npcdailog.lua"},
}

START_TIME = 0000
END_TIME = 2400

BattleManagerList = {}
BattleManager = {}
BattleManager.tbPrevId = {}
BattleManager.tbBattle = {}
BattleManager.tbSignUpPos = {20,3546,6226}

function BattleManager:new(szName, nMapId, nMinEqValue, nMaxEqValue)
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb:_init(szName, nMapId, nMinEqValue, nMaxEqValue)
	BattleManagerList[nMapId] = tb
	return tb
end

function BattleManager:_init(szName, nMapId, nMinEqValue, nMaxEqValue)
	self.nMapId = nMapId
	self.szName = szName
	self.nMinEqValue = nMinEqValue
	self.nMaxEqValue = nMaxEqValue
	self.tbSignUpPos = {self.nMapId,1541, 3178}
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		self.tbBattle = %Array.new()
		AutoFunctions:Add(self.OnSeverStart, self)
	end
end


function BattleManager:OnSeverStart()
	if SubWorldID2Idx(self.nMapId) < 0 then
		return
	end
	ClearMapNpc(self.nMapId)
	for i=1, getn(NPC_LIST) do
		local tbNpc = NPC_LIST[i]
		self:AddNpc(unpack(tbNpc))
	end
	local nHM = tonumber(GetLocalDate("%H%M"))
	if START_TIME <= nHM and nHM <= END_TIME then
		self:Run()
	end
	self:OpenTimer()
end

function BattleManager:AddNpc(nNpcId, szName, tbPos, szLuaFile)
	NpcFunLib:AddObjNpc(szName, nNpcId, {{self.nMapId, tbPos[1] ,tbPos[2]}}, szLuaFile )
end


function BattleManager:GetPrevId(szName)
	return self.tbPrevId[szName]
end

function BattleManager:SetPrevId(szName, nId)
	self.tbPrevId[szName] = nId
end

function BattleManager:SignUp(nId, nCamp, bConfirm)
	local nHM = tonumber(GetLocalDate("%H%M"))

	local pBattle = self:GetBattle(nId)
	if not pBattle then
		return 
	end
	
	local szName = GetName()
	local nPrevId = self:GetPrevId(szName)
	local pPrevBattle = nil
	if nPrevId then
		pPrevBattle = self:GetBattle(nPrevId)
	end
	
	if nPrevId == nId and pPrevBattle then
		if pBattle then
			local nOldCamp = pBattle.Data:GetPLData(szName, "BATTLECAMP")
			if nOldCamp ~= 0 and nOldCamp ~= nCamp then
				return Talk(1, "", "Ng­¬i kh«ng thÓ ®æi qu©n doanh trong cïng mét trËn Tèng Kim")
			end
		end
	else
		if (1000 > nHM or nHM >  1030) and (1400 > nHM or nHM >  1430) and (2200 > nHM or nHM >  2230) then
			Talk(1, "", "Thêi gian më Tèng Kim liªn server lµ 10:00~10:30,14:00~14:30,22:00~22:30.")
			return
		end
		if bConfirm == 0 then
			local szTitle = format("Ng­¬i b¸o danh trËn Tèng Kim nµy cÇn cã %d c¸i %s.", TICKET.nCount, TICKET.szName)
			local tbOpt = 
			{
				{"§­îc!", self.SignUp, {self, nId, nCamp, 1}},
				{"Hñy bá "},
			}
			CreateNewSayEx(szTitle, tbOpt)
			return
		end
		if bConfirm == 1 and nPrevId ~= nId and pPrevBattle then
			local tbOpt = 
			{
				{"§­îc!", self.SignUp, {self, nId, nCamp, 2}},
				{"Hñy bá "},
			}
			CreateNewSayEx("Tham gia trËn Tèng Kim míi sÏ xãa hÕt ®iÓm tÝch lòy cña trËn nµy. B¹n ch¾c muèn tham gia kh«ng?", tbOpt)
			return
		end
		
	end
	
	if pBattle:JoinWaiting(szName, nCamp) then
		if pPrevBattle and nPrevId ~= nId then
			pPrevBattle:ClearPlayerData(szName)
		end
		self:SetPrevId(szName, pBattle.nId)
		Msg2Player(format("Ng­¬i ®· thµnh c«ng gia nhËp vµo %s danh s¸ch b¸o danh ", %CAMP_NAME[nCamp]))
	end
	
end

function BattleManager:Run()
	local nCount = %Array.size(self.tbBattle)
	if nCount > 0 then
		local pBattle = %Array.last(self.tbBattle)
		if pBattle.nState == SIGNUP_STATE then
			pBattle:Run()
		end
	else
		self:CreateBattle()
	end
end

function BattleManager:CreateBattle()
	local nHM = tonumber(GetLocalDate("%H%M"))
	if START_TIME <= nHM and nHM <= END_TIME then
		if %Array.size(self.tbBattle) < %MAX_BATTLE_COUNT then
			local nId = %Array.new_id(self.tbBattle)
			%Array.add(self.tbBattle, BattleClass:new(nId, self))
		end
	end
end

function BattleManager:GetBattle(nId)
	return %Array.get(self.tbBattle, nId)
end

function BattleManager:GetList()
	local tb = {}
	for k, v in %Array.pairs(self.tbBattle) do
		if v then
			tinsert(tb, v:GetInfo())
		end
	end
	return tb
end

function BattleManager:CancelSignUp(szName)

	local nPrevId = self:GetPrevId(szName)
	if not nPrevId then
		return
	end
	local pPrevBattle = self:GetBattle(nPrevId)
	if pPrevBattle then
		pPrevBattle:CancelWaiting(szName)
	end
end

function BattleManager:OnLogout()

	for nMapId, pManager in %BattleManagerList do
		if pManager then
			pManager:CancelSignUp(GetName())
		end
	end
end

function BattleManager:DeleteBattle(nId)
	%Array.del(self.tbBattle, nId)
end

function BattleManager:OpenTimer()
	TimerList:AddTimer(self, 60 * 18)
end

function BattleManager:OnTime()
	
	local nHM = tonumber(GetLocalDate("%H%M"))
	if START_TIME <= nHM and nHM <= END_TIME then
		if %Array.size(self.tbBattle) <= 0 then
			self:CreateBattle()
		end	
	end
	return 1
end
	
for i=1, getn(BattleManagerDef) do
	BattleManager:new(unpack(BattleManagerDef[i]))
end



Include("\\script\\misc\\eventsys\\type\\player.lua")
local nTripMode = GetTripMode()
if nTripMode == TRIP_MODE_SERVER then
	EventSys:GetType("OnLogout"):Reg(0, BattleManager.OnLogout, BattleManager)
end