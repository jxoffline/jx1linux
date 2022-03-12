-- 5.	24¸ö±¦Ïä£¬½Ð×ö½£Ú£ÃØ±¦£¬Ã¿´ò¿ª1¸ö¾Í»á³öÏÖ3¸ö»áÑ£ÔÎµÄ¹ÖÎïîÚÁúµÜ×Ó£¬°Ñ½£Ú£ÃØ±¦¿ªÍê°ÑîÚÁúµÜ×ÓÉ±Íêºó¹ý¹Ø¡£
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(5)
pTask.m_BoxCount = 24
pTask.m_MonsterCount = 8

function pTask:OnStart()
	self.m_Boxs = {}
	self.m_Monsters = {}
	local pos = self:GetPosition().t5_box
	for i = 1, self.m_BoxCount do
		local nNpcIndex = DlgNpcManager:AddNpc("KiÕm Gia BÝ B¶o", 1698, self:GetMapId(), pos[i].x, pos[i].y, self, i)
		if (nNpcIndex <= 0) then
			self:LogError("TASK5: failed to create box npc")
		end
		local tb = {}
		tb.Index = i
		tb.NpcIndex = nNpcIndex
		tb.Timers = {}
		tinsert(self.m_Boxs, tb)
	end
end

function pTask:OnDestroy()
	for i = 1, getn(self.m_Boxs) do
		local tb = self.m_Boxs[i]
		if (tb.NpcIndex > 0) then
			DlgNpcManager:DelNpc(tb.NpcIndex)
		end
		for j = 1, getn(tb.Timers) do
			if (tb.Timers[j] > 0) then
				ProgressBarList:Close(tb.Timers[j])
			end
		end
	end
	self.m_Boxs = nil
	for i = 1, getn(self.m_Monsters) do
		local nNpcIndex = self.m_Monsters[i]
		if (nNpcIndex > 0) then
			FightNpcManager:DelNpc(nNpcIndex)
		end
	end
	self.m_Monsters = nil
end

function pTask:Say(pPlayer, nIndex)
	local tb = self.m_Boxs[nIndex]
	if (not tb) then
		self:LogError(format("TASK5: box[%d] not found", nIndex))
		return
	end
	if (tb.NpcIndex == 0) then
		return
	end
	local nId = ProgressBarList:Open("§ang më", pPlayer, 3, self, tb)
	if (nId <= 0) then
		self:LogError("TASK5: failed to open progressbar")
	end
	tinsert(tb.Timers, nId)
end

function pTask:CleanTimer(nId, tb)
	for i = 1, getn(tb.Timers) do
		if (tb.Timers[i] == nId) then
			tb.Timers[i] = 0
			return
		end
	end
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	self:CleanTimer(nId, tb)
	if (tb.NpcIndex == 0) then
		return
	end
	self:BroadCast("Më thµnh c«ng.")
	local task5_npc_tb = {1654,1796}
	local pos = self:GetPosition().t5_box
	for i = 1, 3 do
		local nIndex = getn(self.m_Monsters) + 1
		local nNpcId = task5_npc_tb[random(1, getn(task5_npc_tb))]
		local nNpcIndex = FightNpcManager:AddNpc("Ngäc Long §Ö Tö", nNpcId, self:GetMapId(), pos[tb.Index].x, pos[tb.Index].y, self, nIndex, 1, 1)
		if (nNpcIndex <= 0) then
			self:LogError("TASK5: failed to create monster npc")
		end
		tinsert(self.m_Monsters, nNpcIndex)
		-- TODO: ¸øÎïÆ·
--		player:AddItem(6, 0, 1, 1, 0, 0)
--		player:Msg2Player("Äã»ñµÃÁËÒ»¸öxxxÎïÆ·¡£")
--		Event5OpenBoxAward(player.m_PlayerIndex)
	end
	-- É¾³ýÏä×ÓNPC
	DlgNpcManager:DelNpc(tb.NpcIndex)
	tb.NpcIndex = 0
end

function pTask:OnProgressbarBreak(nId, tb)
	self:BroadCast("Më thÊt b¹i.")
	self:CleanTimer(nId, tb)
end

function pTask:CheckFinish()
	for i = 1, getn(self.m_Boxs) do
		local tb = self.m_Boxs[i]
		if (tb.NpcIndex > 0) then
			-- Ïä×ÓÃ»¿ªÍê
			return 0
		end
	end
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			-- ¹ÖÃ»´òÍê
			return 0
		end
	end
	return 1
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	local nNpcIndex = self.m_Monsters[nIndex]
	if (nNpcIndex > 0) then
		self.m_Monsters[nIndex] = 0
	end
	if (self:CheckFinish() == 1) then
		self:Proceed()
	end
end
