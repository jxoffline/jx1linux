-- 33.	20¸öÐ¡¹ÖîÚÁú¸ßÊÖÎ§×ÅÒ»¸ö½£Ú£ÃØ±¦£¬É±ÍêÐ¡¹Ö²ÅÄÜ¿ª½£Ú£ÃØ±¦£¬¿ªÏä×ÓÓÐ30%¼¸ÂÊ¹ý¹Ø£¬30%¼¸ÂÊ¼ÌÐøË¢Ð¡¹Ö,40%¼¸ÂÊ¼ÌÐøË¢½£Ú£ÃØ±¦
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\missions\\maze\\progressbar.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

pTask = Task:New(33)

function pTask:OnStart()
	local mapid = self:GetMapId()
	local pos_box = self:GetPosition().t33_box
	local pos_monster = self:GetPosition().t33_monster
	self.m_BoxIndex = DlgNpcManager:AddNpc("KiÕm Gia BÝ B¶o", 1698, mapid, pos_box.x, pos_box.y, self)
	self.m_BarId = 0
	self:AddMonsters()
end

function pTask:DelMonsters()
	if (self.m_Monsters) then
		for i = 1, getn(self.m_Monsters) do
			if (self.m_Monsters[i] > 0) then
				FightNpcManager:DelNpc(self.m_Monsters[i])
			end
		end
		self.m_Monsters = nil
	end
end

function pTask:AddMonsters()
	local mapid = self:GetMapId()
	local pos_monster = self:GetPosition().t33_monster
	self.m_Monsters = {}
	for i = 1, 20 do
		local nNpcIndex = FightNpcManager:AddNpc("Ngäc Long Cao Thñ", 1695, mapid, pos_monster[i].x, pos_monster[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nNpcIndex)
	end
end

function pTask:OnDestroy()
	if (self.m_BoxIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BoxIndex)
		self.m_BoxIndex = 0
	end
	self:DelMonsters()
	if (self.m_BarId > 0) then
		ProgressBarList:Close(self.m_BarId)
		self.m_BarId = 0
	end
end

function pTask:OnDeath(nKilledIndex, pPlayer, nIndex)
	self.m_Monsters[nIndex] = 0
end

function pTask:Say(pPlayer)
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	if (self.m_BarId > 0) then
		return
	end
	self.m_BarId = ProgressBarList:Open("§ang më", pPlayer, 3, self)
end

function pTask:OnProgressbarTimeout(nId, param, player)
	self:BroadCast("Më thµnh c«ng.")
	self.m_BarId = 0
	local nNum = random(1, 100)
	if (nNum <= 30) then
		player:Say("C¸c ng­¬i ®· më r­¬ng, thµnh c«ng lµm kinh ®éng ®Õn c¬ quan, chóc mõng ch­ vÞ ®· qua ¶i")
		self:Proceed()
	elseif (nNum <= 60) then
		self:DelMonsters()
		self:AddMonsters()
		player:Say("C¸c ng­¬i ®· më r­¬ng, nh­ng mµ ®· lµm cho mét ®¸m qu¸i xuÊt hiÖn")
	else
		player:Say("C¸c ng­¬i ®· më r­¬ng, ph¸t hiÖn bªn trong cßn cã mét c¸i r­¬ng n÷a")
	end
end

function pTask:OnProgressbarBreak(nId)
	self:BroadCast("Më thÊt b¹i.")
	self.m_BarId = 0
end
