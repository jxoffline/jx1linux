-- ÀïÃæ1¸öÉßÍõºÍ30¸öÉßÂÑ£¬Ã¿¸ô30ÃëÓÐ3¸öÉßÂÑ»á±ä³ÉÉß£¬ÉßµÄÑª±ÈÉßÂÑ¶à£¬ÉßÓÐ¹¥»÷£¬ÉßÂÑÃ»¹¥»÷¡£°ÑÉßÍõÉ±µôÈ«²¿ºó¹ý¹Ø¡£
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")

pTask = Task:New(7)

function pTask:OnStart()
	self.m_Snakes = {}
	local pos_snake = self:GetPosition().t7_snake
	local mapid = self:GetMapId()
	for i = 1, 30 do
		local nNpcIndex = FightNpcManager:AddNpc("Xµ No·n", 1700, mapid, pos_snake[i].x, pos_snake[i].y, self, i, 1, 1)
		if (nNpcIndex <= 0) then
			self:LogError("TASK7: failed to create egg npc")
		end
		local tb = {}
		tb.IsEgg = 1
		tb.Index = i
		tb.NpcIndex = nNpcIndex
		self.m_Snakes[i] = tb
	end
	local pos_boss = self:GetPosition().t7_boss
	local nBossIndex = FightNpcManager:AddNpc("Xµ V­¬ng", 1699, mapid, pos_boss.x, pos_boss.y, self, 0, 1, 1)
	if (nBossIndex <= 0) then
		self:LogError("TASK5: failed to create boss npc")
	end
	self.m_BossIndex = nBossIndex
	self.m_TimerId = TimerList:AddTimer(self, 18 * 10)
end

function pTask:OnDestroy()
	if (self.m_TimerId > 0) then
		TimerList:DelTimer(self.m_TimerId)
		self.m_TimerId = 0
	end
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Snakes) then
		for i = 1, getn(self.m_Snakes) do
			local tb = self.m_Snakes[i]
			FightNpcManager:DelNpc(tb.NpcIndex)
		end
		self.m_Snakes = nil
	end
end

function pTask:OnTime()
	local count = 0
	local mapid = self:GetMapId()
	local pos = self:GetPosition().t7_snake
	for i = 1, getn(self.m_Snakes) do
		local tb = self.m_Snakes[i]
		if (tb.IsEgg == 1 and tb.NpcIndex > 0) then
			FightNpcManager:DelNpc(tb.NpcIndex)
			local nNpcIndex = FightNpcManager:AddNpc("TiÓu Xµ", 1748, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
			if (nNpcIndex <= 0) then
				self:LogError("TASK7: failed to create snake npc")
			end
			tb.NpcIndex = nNpcIndex
			tb.IsEgg = 0
			count = count + 1
			if (count == 3) then
				return 1
			end
		end
	end
	if (count == 0) then
		self.m_TimerId = 0
		return 0
	else
		return 1
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex == 0) then
		self.m_BossIndex = 0
		self:Proceed()
	else
		local tb = self.m_Snakes[nIndex]
		tb.NpcIndex = 0
	end
end
