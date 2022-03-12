-- 24.	·¿¼äÀï³öÏÖ3¸ö·Ö±ð´ø·´µ¯¡¢ÎÞÐÎ¹Æ¡¢ÃÎµûµÄÖù×Ó£¬Öù×Ó¹â»·¸øÐ¡¹Ö¹²Ïí£¬Öù×Ó¿ÉÒÔ±»´òËÀ£¬Ñª±ÈÐ¡¹ÖÉÙ£¬
-- Öù×ÓÖÜÎ§ÊÇ20¸öîÚÁú¸ßÊÖ£¬ÖÐ¼äÊÇBOSSîÚÁúÉñÊÞ£¬É±ËÀËùÓÐÐ¡¹ÖºÍBOSS²ÅÄÜ¹ý¹Ø
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(24)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_boss = self:GetPosition().t24_boss
	local pos_monster = self:GetPosition().t24_monster
	local pos_pillar = self:GetPosition().t24_pillar
	self.m_BossIndex = FightNpcManager:AddNpc("Ngäc Long ThÇn T¨ng", 1727, mapid, pos_boss.x, pos_boss.y, self, 0, 1, 1)
	self.m_Pillars = {}
	for i = 1, 3 do
		local nNpcIndex = FightNpcManager:AddNpc("Trô Tö", 1723 + i, mapid, pos_pillar[i].x, pos_pillar[i].y, self, i, 1, 1)
		tinsert(self.m_Pillars, nNpcIndex)
	end
	self.m_Monsters = {}
	for i = 1, 20 do
		local nNpcIndex = FightNpcManager:AddNpc("Ngäc Long Cao Thñ", 1695, mapid, pos_monster[i].x, pos_monster[i].y, self, i + 3, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		FightNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Pillars) then
		for i = 1, getn(self.m_Pillars) do
			if (self.m_Pillars[i] > 0) then
				FightNpcManager:DelNpc(self.m_Pillars[i])
			end
		end
		self.m_Pillars = nil
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

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	if (nIndex == 0) then
		self.m_BossIndex = 0
		if (self:CheckFinish() == 1) then
			self:Proceed()
		end
	elseif (nIndex <= 3) then
		self.m_Pillars[nIndex] = 0
	else
		nIndex = nIndex - 3
		self.m_Monsters[nIndex] = 0
		if (self:CheckFinish() == 1) then
			self:Proceed()
		end
	end
end

function pTask:CheckFinish()
	if (self.m_BossIndex > 0) then
		return 0
	end
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return 0
		end
	end
	return 1
end
