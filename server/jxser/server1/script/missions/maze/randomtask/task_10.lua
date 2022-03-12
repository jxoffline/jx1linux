-- ÖÐ¼äÓÐ4¸öÖù×Ó£¬Ã¿¸öÖù×ÓÖÜÎ§ÓÐ4¸öîÚÁúµÜ×ÓÔÚ´òÖù×Ó£¬Èç¹ûÓÐ1¸öÖù×Ó±»´òËÀÔòËÀµô2¸öÈË£¬¼á³Ö5·ÖÖÓ¹ý¹Ø£¬îÚÁúµÜ×Ó±»´òËÀºó»á²»Í£Ë¢³ö¡£
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\head.lua")

pTask = Task:New(10)
pTask.m_MonsterId 		= 1654	-- îÚÁúµÜ×Ó
pTask.m_MonsterCount 	= 16
pTask.m_Timeout 		= 300
pTask.m_MonsterCamp 	= 2

function pTask:OnStart()
	self.m_Pillars = {}
	self.m_Monsters = {}
	local pos_monster = self:GetPosition().t10_monster
	local pos_pillar = self:GetPosition().t10_pillar
	for i = 1, 4 do
		local nIndex = FightNpcManager:AddNpc("Trô Tö", 1703, self:GetMapId(), pos_pillar[i].x, pos_pillar[i].y, self, i, 1, 1)
		local nNpcIndex = FightNpcManager:GetNpcIndex(nIndex)
		SyncNpc(nNpcIndex)
		SetTmpCamp(MAZE_PLAYERTMPCAMP, nNpcIndex)
		tinsert(self.m_Pillars, nIndex)
	end
	for i = 1, self.m_MonsterCount do
		local nIndex = FightNpcManager:AddNpc("Ngäc Long §Ö Tö", self.m_MonsterId, self:GetMapId(), pos_monster[i].x, pos_monster[i].y, self, i + 4, 1, 1)
		local nNpcIndex = FightNpcManager:GetNpcIndex(nIndex)
		SyncNpc(nNpcIndex)
		SetTmpCamp(self.m_MonsterCamp, nNpcIndex)
		tinsert(self.m_Monsters, nIndex)
	end
	self.m_TimerId = TimerList:AddTimer(self, self.m_Timeout * 18)
	self:BroadCast("TÝnh thêi gian b©y giê b¾t ®Çu.")
end

function pTask:OnDestroy()
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
	if (self.m_TimerId > 0) then
		TimerList:DelTimer(self.m_TimerId)
		self.m_TimerId = 0
	end
end

function pTask:OnTime()
	self:BroadCast(format("TÝnh thêi gian %d phót kÕt thóc.", floor(self.m_Timeout / 60)))
	self.m_TimerId = 0;
	for i = 1, getn(self.m_Pillars) do
		if (self.m_Pillars[i] > 0 and self.m_Room:GetPlayerCount() > 0) then
			self:Proceed()
			break
		end
	end
	return 0
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	local pos_monster = self:GetPosition().t10_monster
	if (nIndex > 4) then
		local i = nIndex - 4
		local nIndex = FightNpcManager:AddNpc(
								"Ngäc Long §Ö Tö",
								self.m_MonsterId,
								self:GetMapId(),
								pos_monster[i].x,
								pos_monster[i].y,
								self,
								nIndex,
								1,
								1)
		self.m_Monsters[i] = nIndex
		local nNpcIndex = FightNpcManager:GetNpcIndex(nIndex)
		SyncNpc(nNpcIndex)
		SetTmpCamp(self.m_MonsterCamp, nNpcIndex)
	else
		self.m_Pillars[nIndex] = 0
		self:KickCount(2)
	end
end
