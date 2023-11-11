-- 40.	Ò»¸öÖù×Ó£¬Ã¿¸ôÒ»·ÖÖÓ»á¶Ô×ÅÒ»¸öÈË·¢±ØÉ±¼¼ÃëÉ±µôËû£¬ÒªÇó¾¡¿ì°ÑÖù×Ó´òÏÂÀ´
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")

pTask = Task:New(40)

function pTask:OnStart()
	local pos = self:GetPosition().t40_boss
	self.m_BossIndex = FightNpcManager:AddNpc("Trô Tö", 1743, self:GetMapId(), pos.x, pos.y, self, 0, 1, 1)
	self.m_TimerId = TimerList:AddTimer(self, 60 * 18)
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_TimerId > 0) then
		TimerList:DelTimer(self.m_TimerId)
		self.m_TimerId = 0
	end
end

function pTask:OnTime()
	local name = self:RandomPlayerName()
	if (name) then
		self:BroadCast(format("%s bÞ tiªu diÖt råi, h·y nhanh chãng ®¸nh tan Trô.", name))
		self:KickPlayer(name)
	end
	return 1
end

function pTask:OnDeath()
	self.m_BossIndex = 0
	self:Proceed()
end
