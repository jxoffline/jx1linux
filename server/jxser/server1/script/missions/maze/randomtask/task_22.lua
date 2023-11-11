-- 22.	Ã¿¸ô10Ãë³öÏÖ·ÖÉ¢µÄ5¸öîÚÁú¸ßÊÖ£¬10ÃëºóÈç¹ûÃ»É±ËÀ¹Ö¾Í»áÏûÊ§ÖØÐÂË¢ÏÂÒ»Åú£¬ÒªÇóÉ±ËÀ50¸ö¹Ö²ÅÄÜ¹ý¹Ø
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\timerlist.lua")

pTask = Task:New(22)

function pTask:OnStart()
	self.m_Monsters = nil
	self.m_TimerId = TimerList:AddTimer(self, 10 * 18, 1)
	self.m_HintId = TimerList:AddTimer(self, 60 * 18, 2)
	self.m_KillCount = 0
end

function pTask:OnDestroy()
	if (self.m_TimerId > 0) then
		TimerList:DelTimer(self.m_TimerId)
		self.m_TimerId = 0
	end
	if (self.m_HintId > 0) then
		TimerList:DelTimer(self.m_HintId)
		self.m_HintId = 0
	end
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:OnTime(nIndex)
	if (nIndex == 1) then
		self:OnGameTime()
	else
		self:OnHintTime()
	end
	return 1
end

function pTask:OnHintTime()
	self:RoomBroadCast(format("§· kÝch s¸t %d Ngäc Long Cao Thñ", self.m_KillCount))
end

function pTask:OnGameTime()
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
	end
	self.m_Monsters = {}
	local mapid = self:GetMapId()
	local pos = self:GetPosition().t22_monster
	for i = 1, 5 do
		local nNpcIndex = FightNpcManager:AddNpc("Ngäc Long Cao Thñ", 1695, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	self.m_Monsters[nIndex] = 0
	self.m_KillCount = self.m_KillCount + 1
	if (self.m_KillCount >= 30) then
		self:Proceed()
	end
end
