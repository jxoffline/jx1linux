-- 32.	ÔÚ·¿¼äÁ½¶Ë³öÏÖÁ½¸öBOSS£ºÀè¼ûºâºÍÎÄâù£¬±ØÐëÒª2¸öBOSS 5ÃëÄÚÍ¬Ê±´òËÀ²ÅÐÐ£¬²»Í¬Ê±´òËÀ»á²»¶ÏÖØÉú
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(32)
pTask.m_GirlId 	= 1733
pTask.m_BoyId 	= 1734
pTask.m_Timeout = 5

function pTask:OnStart()
	self:CallBoy()
	self:CallGirl()
	self.m_BoyTime = 0
	self.m_GirlTime = 0
end

function pTask:OnDestroy()
	if (self.m_BoyIndex > 0) then
		FightNpcManager:DelNpc(self.m_BoyIndex)
		self.m_BoyIndex = 0
	end
	if (self.m_GirlIndex > 0) then
		FightNpcManager:DelNpc(self.m_GirlIndex)
		self.m_GirlIndex = 0
	end
end

function pTask:CallBoy()
	local pos = self:GetPosition().t32_boy
	self.m_BoyIndex = FightNpcManager:AddNpc("Lª KiÕn Hoµnh", self.m_BoyId, self:GetMapId(), pos.x, pos.y, self, 1, 1, 1)
end

function pTask:CallGirl()
	local pos = self:GetPosition().t32_girl
	self.m_GirlIndex = FightNpcManager:AddNpc("V¨n Di", self.m_GirlId, self:GetMapId(), pos.x, pos.y, self, 2, 1, 1)
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex == 1) then
		self.m_BoyIndex = 0
		self.m_BoyTime = GetCurServerTime()
	elseif (nIndex == 2) then
		self.m_GirlIndex = 0
		self.m_GirlTime = GetCurServerTime()
	end
	if (self.m_BoyTime ~= 0 and self.m_GirlTime ~= 0) then
		local inter = abs(self.m_BoyTime - self.m_GirlTime)
		if (inter <= self.m_Timeout) then
			self:Proceed()
			return
		end
		if (self.m_BoyIndex == 0) then
			self:CallBoy()
		end
		if (self.m_GirlIndex == 0) then
			self:CallGirl()
		end
		self.m_BoyTime = 0
		self.m_GirlTime = 0
	end
end
