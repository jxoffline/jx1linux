-- 地上放着长着19个分散的雪灵珠，要求收集10个雪灵珠，点击其中一个变成雪灵珠魂，点击雪灵珠魂道具才能召唤出BOSS冷冰，打死BOSS过关。
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\global\\playerlist.lua")
IL("ITEM")

pTask = Task:New(3)
pTask.m_NpcId 		= 1697	-- 雪灵珠
pTask.m_BarEvent 	= GetProgressBarMaskEvent()
pTask.m_ItemTimeout = 30

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_bead = self:GetPosition().t3_bead
	self.m_BossIndex = 0
	self.m_Timers = {}
	self.m_Pearls = {}
	for i = 1, 19 do
		local tb = {}
		tb.NpcIndex = DlgNpcManager:AddNpc("Tuy誸 Linh Ch﹗", self.m_NpcId, mapid, pos_bead[i].x, pos_bead[i].y, self, tb)
		tb.Bars = {}
		tb.Index = i
		tinsert(self.m_Pearls, tb)
	end
end

function pTask:OnDestroy()
	if (self.m_Pearls) then
		for i = 1, getn(self.m_Pearls) do
			local tb = self.m_Pearls[i]
			if (tb.NpcIndex > 0) then
				DlgNpcManager:DelNpc(tb.NpcIndex)
			end
			for j = 1, getn(tb.Bars) do
				if (tb.Bars[j] > 0) then
					ProgressBarList:Close(tb.Bars[j])
				end
			end
		end
		self.m_Pearls = nil
	end
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Timers) then
		for nId, _ in self.m_Timers do
			TimerList:DelTimer(nId)
		end
		self.m_Timers = nil
	end
end

-- 此函数被物品使用脚本调用
function pTask:CallBoss(player)
	if (self.m_BossIndex > 0) then
		player:Say("Х tri謚 h錳 ra L穘h B╪g.")
		return 0
	end
	local pos = self:GetPosition().t3_boss
	self.m_BossIndex = FightNpcManager:AddNpc("L穘h B╪g", 1642, self:GetMapId(), pos.x, pos.y, self, 0, 1, 1)
	if (self.m_BossIndex > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_BossIndex)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "Ai d竚 nh c緋 b秓 b鑙 c馻 ta?")
		return 1
	else
		return 0
	end
end

function pTask:OnDeath()
	self.m_BossIndex = 0
	self:Proceed()
end

function pTask:Say(pPlayer, tb)
	if (tb.NpcIndex <= 0) then
		return
	end
	local nBarId = ProgressBarList:Open("H竔 頲 r錳", pPlayer, 3, self, tb)
	tinsert(tb.Bars, nBarId)
end

function pTask:OnTime(tb, nId)
	local pos = self:GetPosition().t3_bead[tb.Index]
	tb.NpcIndex = DlgNpcManager:AddNpc("Tuy誸 Linh Ch﹗", self.m_NpcId, self:GetMapId(), pos.x, pos.y, self, tb)
	self.m_Timers[nId] = nil
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.NpcIndex > 0) then
		local nId = TimerList:AddTimer(self, 180, tb)
		self.m_Timers[nId] = 1
		DlgNpcManager:DelNpc(tb.NpcIndex)
		tb.NpcIndex = 0
		-- 生成雪灵珠道具并设置超时时间
		local nItemIndex = player:AddItem(6, 1, 2634, 1, 0, 0)
		if (nItemIndex > 0) then
			ITEM_SetExpiredTime(nItemIndex, self.m_ItemTimeout)
			player:SyncItem(nItemIndex)
			player:Say("Ngi thu th藀 頲 1 Tuy誸 Linh Ch﹗.")
			self:BroadCast(format("%s thu th藀 頲 1 Tuy誸 Linh Ch﹗", player:GetName()))
		else
			self:LogError("TASK3: failed to add pearl item")
		end
	end
end

function pTask:OnProgressbarBreak(nId, tb)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
end
