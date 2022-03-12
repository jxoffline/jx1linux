-- BOSS¹Å¾øÉ±£¬Ã¿¸ô1·ÖÖÓ¾Í»á¶¨Éí15ÃëÒ»¸öÍæ¼ÒÊ¹Ö®²»ÄÜ·¢ÕÐ²»ÄÜ³ÔÒ©£¬¶øÇÒ»á³ÖÐøÃ¿Ãë500ÉËº¦£¬É±ËÀBOSSºó¹ý¹Ø

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(41)

function pTask:OnStart()
	local pos = self.m_Pos.gujuesha
	self.m_NpcIndex = FightNpcManager:AddNpc("Cæ TuyÖt S¸t", 1671, self.m_Maze.m_MapId, pos.x, pos.y, self, nil, 1, 1)
end

function pTask:OnClose()
	if (self.m_NpcIndex > 0) then
		FightNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
end

function pTask:OnDeath()
	if (self.m_NpcIndex > 0) then
		self.m_NpcIndex = 0
	end
	self:Proceed()
end
