-- 11.	ÓÐ¸öÃÀÀöµÄÉÙÅ®ÆÆÍë¶ù£¬µØÉÏÓÐºÜ¶à»¨£¬ÉÙÅ®ÒªÇóÍæ¼Ò½»ÄÉ1ÒÚÁ½Òø×Ó£¬·ñÔò²É¼¯×îºìµÄÒ»¶ä»¨£¬
-- ²»ÂÛ²ÉÁËÄÄ¶ä£¬¶¼²»ÄÜÍê³ÉÈÎÎñ£¬Òª²É¼¯ºÍÉÏ½»3´Î£¬È»ºóÆÆÍë¶ù»¹ÊÇ²»ÂúÒâ£¬ÕÙ»½³ö11¸öÐ¡ÆÆÍë¶ù£¬»÷°ÜËùÓÐÐ¡ÆÆÍë¶ùºó»òÕßÉÏ½»1ÒÚÁ½Òø×Ó¹ý¹Ø¡£
Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\missions\\maze\\progressbar.lua")

pTask = Task:New(11)

function pTask:OnStart()
	local pos_boss = self:GetPosition().t11_boss
	local pos_flower = self:GetPosition().t13_lamp
	local mapid = self:GetMapId()
	self.m_BossIndex = DlgNpcManager:AddNpc("Ph¸ O¶n Nhi", 1704, mapid, pos_boss.x, pos_boss.y, self, 0)
	self.m_Step = 1
	self.m_Collections = {}
	self.m_GiveCount = 0
	self.m_Monsters = {}
	self.m_Flowers = {}
	for i = 1, 10 do
		local nNpcIndex = DlgNpcManager:AddNpc("hoa", 1706, mapid, pos_flower[i].x, pos_flower[i].y, self, i)
		local tb = {}
		tb.NpcIndex = nNpcIndex
		tb.Bars = {}
		tinsert(self.m_Flowers, tb)
	end
end

function pTask:OnDestroy()
	if (self.m_BossIndex > 0) then
		DlgNpcManager:DelNpc(self.m_BossIndex)
		self.m_BossIndex = 0
	end
	if (self.m_Flowers) then
		for i = 1, getn(self.m_Flowers) do
			local tb = self.m_Flowers[i]
			if (tb.NpcIndex > 0) then
				DlgNpcManager:DelNpc(tb.NpcIndex)
			end
			for j = 1, getn(tb.Bars) do
				if (tb.Bars[j] > 0) then
					DelTimer(tb.Bars[j])
				end
			end
		end
		self.m_Flowers = nil
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

function pTask:CallMonsters()
	local pos = self:GetPosition().t11_monster
	local mapid = self:GetMapId()
	for i = 1, 11 do
		local nIndex = FightNpcManager:AddNpc("TiÓu Ph¸ O¶n Nhi", 1705, mapid, pos[i].x, pos[i].y, self, i, 1, 1)
		tinsert(self.m_Monsters, nIndex)
	end
end

function pTask:OnDeath(nKilledIndex, player, nIndex)
	self.m_Monsters[nIndex] = 0
	for i = 1, getn(self.m_Monsters) do
		if (self.m_Monsters[i] > 0) then
			return
		end
	end
	self:Proceed()
end

function pTask:Say(player, nIndex)
	if (nIndex == 0) then
		return self:BossSay(player)
	else
		return self:FlowerSay(player, nIndex)
	end
end

function pTask:BossSay(player)
	if (self.m_Step == 1) then
		return "Muèn v­ît ¶i kh«ng? VËy th× ®­a ®©y 500 v¹n l­îng tiÒn m·i lé phÝ ®i.", {"§­a", "Kh«ng ®­a", "§Ó ta suy nghÜ"}
	elseif (self.m_Step < 5) then
		local name = player:GetName()
		local count = self.m_Collections[name]
		if (not count or count == 0) then
			player:Say("§îi ng­¬i h¸i ®­îc lo¹i hoa mµ ta cÇn råi h·y ®Õn t×m ta nhÐ.")
			return
		end
		if (self.m_Step == 2) then
			player:Say("§ãa hoa nµy kh«ng ®­îc ®á cho l¾m, c¸c ng­¬i l¹i h¸i vµi c¸i ®i.")
			self.m_Collections[name] = count - 1
			self.m_Step = 3
		elseif (self.m_Step == 3) then
			player:Say("C¸i nµy mµ còng nãi lµ mµu ®á µ? TiÕp tôc h¸i ®i! b»ng kh«ng ®õng cã m¬ mµ v­ît ¶i .")
			self.m_Collections[name] = count - 1
			self.m_Step = 4
		elseif (self.m_Step == 4) then
			player:Say("¤i ta thËt lµ thÊt väng víi c¸c ng­¬i qu¸, c¸c chÞ em, h·y l«i hä ra mµ ®¸no cho ta mét trËn!")
			self:CallMonsters()
			self.m_Step = 5
		end
	else
		player:Say("C¸c chÞ em, h·y l«i hä ra mµ ®¸no cho ta mét trËn!")
	end
end

function pTask:FlowerSay(player, nIndex)
	if (self.m_Step >= 2) then
		local tb = self.m_Flowers[nIndex]
		local nId = ProgressBarList:Open("H¸i ®­îc råi", player, 3, self, tb)
		tinsert(tb.Bars, nId)
	end
end

function pTask:OnAnswer(player, sel, nIndex)
	if (self.m_Step == 1) then
		if (sel == 1) then
			-- ½»Òø×Ó
			if (player:Pay(5000000) == 0) then
				player:Say("§îi gom ®ñ tiÒn råi ®Õn t×m ta nhÐ.")
			else
				self:Proceed()
			end
		elseif (sel == 2) then
			player:Say("Kh«ng ®­a µ? VËy th× gióp ta h¸i mét ®ãa hoa cã mµu ®á nhÊt ®em vÒ ®©y.")
			self.m_Step = 2
		end
	end
end

function pTask:OnProgressbarTimeout(nId, tb, player)
	for i = 1, getn(tb.Bars) do
		if (tb.Bars[i] == nId) then
			tb.Bars[i] = 0
			break
		end
	end
	if (tb.NpcIndex > 0) then
		local name = player:GetName()
		player:Say("Ng­¬i h¸i ®­îc mét ®ãa hoa mµu ®á")
		self:BroadCast(format("%s h¸i ®­îc mét ®ãa hoa mµu ®á", name))
		DlgNpcManager:DelNpc(tb.NpcIndex)
		tb.NpcIndex = 0
		local count = self.m_Collections[name] or 0
		self.m_Collections[name] = count + 1
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
