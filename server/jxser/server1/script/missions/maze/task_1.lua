-- ÖÕ¼«ÈÎÎñ
do return end
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")

NPCID_YULONGHUFA 	= 1628	-- îÚÁú»¤·¨
NPCID_YULONGBOY		= 1629	-- îÚÁúÄÐµÜ×Ó
NPCID_YULONGGIRL	= 1630	-- îÚÁúÅ®µÜ×Ó
NPCID_DIALOGBOSS	= 1625	-- Áú¾ÅÌì£¨¶Ô»°£©
NPCID_CUP			= 1627	-- ¾Æ±­	
NPCID_FIGHTBOSS		= 1657	-- Áú¾ÅÌì£¨Õ½¶·£©
NPCID_FENGLINGLONG	= 1626	-- ·ïÁáçç
DEATH_YULONGDIZI	= 1

STR_YULONGHUFA = "Muèn gÆp ®­îc Trang Chñ b¾t buéc ph¶i b­íc qua cöa cña ta tr­íc, xin h·y ra tay ®i!"

Task = {
	m_Steps = {},
	m_Index = 0,
}

function Task:New()
	local tb = clone(Task)
	tb:AddStep(clone(Step1))
	tb:AddStep(clone(Step2))
	tb:AddStep(clone(Step3))
	tb:AddStep(clone(Step4))
	tb:AddStep(clone(Step5))
	tb:AddStep(clone(Step6))
	return tb
end

function Task:Start(maze, room)
	self.m_Maze = maze
	self.m_Room = room
	self.m_Pos = PositionList:GetPosition(room.m_Row, room.m_Col)
	self:Proceed()
end

function Task:Close(maze, room)
end

function Task:Destroy()
	if (self.m_Steps ~= nil) then
		for i = 1, getn(self.m_Steps) do
			self.m_Steps[i]:Destroy()
		end
		self.m_Steps = nil
		self.m_Index = 0
	end
end

function Task:IterPlayers(obj, func)
	self.m_Room:IterPlayers(obj, func)
end

function Task:AddStep(step)
	tinsert(self.m_Steps, step)
end

function Task:Proceed()
	if (self.m_Index > 0) then
		self.m_Steps[self.m_Index]:Close(self)
	end
	self.m_Index = self.m_Index + 1
	local step = self.m_Steps[self.m_Index]
	if (step ~= nil) then
		step:Start(self)
	else
		self.m_Room:FinishTask()
		-- DEBUG
		print("Task finished!")
	end
end

function Task:GetPosition()
	return PositionList:GetPosition(self.m_Room.m_Row, self.m_Room.m_Col)
end

function Task:GetMapId()
	return self.m_Maze.m_MapId
end

function Task:GetPlayerList()
	return self.m_Maze:GetPlayerList()
end

-- µÚÒ»²½
-- ¿ªÊ¼£º³öÏÖîÚÁú»¤·¨ºÍÄÐÅ®îÚÁúµÜ×Ó
-- Íê³É£º»÷°ÜËùÓÐÄÐÅ®îÚÁúµÜ×Ó
Step1 = {
	m_Yulongdizi = {},
	m_DiziCount = 0
}

function Step1:Start(task)
	local pos = task:GetPosition()
	local index = DlgNpcList:AddNpc("Ngäc Long Hé Ph¸p",
		NPCID_YULONGHUFA,
		task:GetMapId(),
		pos.yulonghufa.x,
		pos.yulonghufa.y,
		self)
	if (index > 0) then
		SetNpcKind(index, 3)
		self.m_NpcIndex = index
	end
	self.m_Task = task
	self.m_SayOnce = 0
end

function Step1:Close(task)
	self:ClearNpc()
end

function Step1:Destroy()
	self:ClearNpc()
end

function Step1:ClearNpc()
	if (self.m_NpcIndex > 0) then
		DlgNpcList:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Yulongdizi ~= nil) then
		for index, flag in self.m_Yulongdizi do
			if (flag ~= nil and index > 0) then
				FightNpcList:DelNpc(index)
			end
		end
		self.m_Yulongdizi = nil
		self.m_DiziCount = 0
	end
end

function Step1:AddYulongdizi(pts, name, npcid)
	local mapid = self.m_Task:GetMapId()
	for i = 1, 10 do
		local pt = pts[i]
		local index = FightNpcList:AddNpc(name, npcid, mapid, pt.x, pt.y, self)
		if (index > 0) then
			self.m_Yulongdizi[index] = 1
			self.m_DiziCount = self.m_DiziCount + 1
			-- DEBUG
			print(format("AddNpc: name(%s), index(%d), total_count(%d)", name, index, self.m_DiziCount))
		end
	end
end

function Step1:Say(player)
	player:Say("Muèn gÆp ®­îc Trang Chñ b¾t buéc ph¶i b­íc qua cöa cña ta tr­íc, xin h·y ra tay ®i!")
	if (self.m_SayOnce == 0) then
		local pos = self.m_Task:GetPosition()
		self:AddYulongdizi(pos.yulongboys, "Ngäc Long Nam §Ö Tö", NPCID_YULONGBOY)
		self:AddYulongdizi(pos.yulonggirls, "Ngäc Long N÷ §Ö Tö", NPCID_YULONGGIRL)
		self.m_SayOnce = 1
	end
end

function Step1:OnDeath(killer, npcindex)
	if (self.m_Yulongdizi[npcindex] ~= nil) then
		-- DEBUG
		print(format("DelNpc: name(%s), index(%d), left_count(%d)", GetNpcName(npcindex), npcindex, self.m_DiziCount - 1))
		FightNpcList:DelNpc(npcindex, 1)
		self.m_Yulongdizi[npcindex] = nil
		self.m_DiziCount = self.m_DiziCount - 1
		if (self.m_DiziCount <= 0) then
			self.m_Task:Proceed()
		end
	end
end

-- µÚ¶þ²½
-- ¿ªÊ¼£º³öÏÖÁú¾ÅÌì£¨¶Ô»°NPC£©ºÍ8¸ö¾Æ±­£¨¶Ô»°NPC£©
-- Íê³É£ºËùÓÐÈË¶¼µãÁË¾Æ±­
Step2 = {
	m_Cups = {},
	m_Boss = 0,
}

function Step2:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = DlgNpcList:AddNpc("Long Cöu Thiªn",
					NPCID_DIALOGBOSS,
					mapid,
					pos.boss.x,
					pos.boss.y)
	if (boss > 0) then
		SetNpcKind(boss, 3)
		SyncNpc(boss)
		NpcChat(boss, "<color=yellow>c¸c vÞ qu¶ nhiªn lµ nh÷ng anh hïng kiÖt xuÊt, qu¶ nhiªn cã thÓ v­ît qua ®­îc trïng trïng líp líp nh÷ng kh¶o nghiÖm ®Ó ®Õn tr­íc mÆt cña ta ®©y. §Ønh Ngäc Long cña Ngäc Long S¬n Trang cã nguån tõ trong m©y mµ xuèng, HiÖt Thiªn §Þa Chi Linh KhÝ, §¾c NhËt NguyÖt Chi Thanh Hoa, mÆc dï Quúnh T­¬ng Ngäc Lé kh«ng b»ng mét phÇn, lÊy Nh­ìng Töu nµy tªn lµ ‘Long TuyÒn’. Tr­íc khi b¾t ®Çu thÝ luyÖn cuèi cïng, xin h·y cho ta lÊy r­îu nµy kÝnh c¸c vÞ mét ly, chóc c¸c vÞ v­ît ¶i thuËn lîi. <color>")
		for i = 1, 8 do
			local pt = pos.cups[i]
			local index = DlgNpcList:AddNpc("Long M¹ch Töu",
								NPCID_CUP,
								mapid,
								pt.x,
								pt.y,
								self,
								i)
			if (index > 0) then
				self.m_Cups[i] = index
			end
		end
		self.m_Boss = boss
		self.m_Task = task
		local choices = {}
		local players = self.m_Task:GetPlayerList()
		for i = 1, getn(players) do
			choices[players[i]] = 0
		end
		self.m_Choices = choices
		self.m_ChoiceCount = getn(players)
		-- DEBUG
		print(format("PlayerCount:%d", getn(players)))
	end
end

function Step2:Close(task)
	self:Clear()
	-- TODO
end

function Step2:Destroy()
	self:Clear()
end

function Step2:Clear()
	if (self.m_Cups ~= nil) then
		for i, index in self.m_Cups do
			if (index > 0) then
				DlgNpcList:DelNpc(index)
			end
		end
		self.m_Cups = nil
	end
	if (self.m_Boss > 0) then
		DlgNpcList:DelNpc(self.m_Boss)
		self.m_Boss = 0
	end
end

function Step2:Say(player, i)
	if (not self.m_Choices) then
		return
	end
	local name = player:GetName()
	local flag = self.m_Choices[name]
	if (flag ~= 0) then
		return
	end
	self.m_Choices[name] = 1
	self.m_ChoiceCount = self.m_ChoiceCount - 1
	if (self.m_ChoiceCount <= 0) then
		self.m_Task:Proceed()
	end
	self:DelCup(i)
end

function Step2:DelCup(index)
	if (self.m_Cups ~= nil) then
		local npc = self.m_Cups[index]
		if (npc > 0) then
			DlgNpcList:DelNpc(npc)
			self.m_Cups[index] = 0
		end
	end
end

-- µÚÈý²½
-- ¿ªÊ¼£ºÁú¾ÅÌì±äÎªÕ½¶·NPC£¨ÁúÀÏ»¢¼¼ÄÜ£©
-- Íê³É£º´òµ½µÍÓÚ50%ÉúÃü
Step3 = {}

function Step3:Start(task)
	-- DEBUG
	print("Step3:Start()")
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = FightNpcList:AddNpc("Long Cöu Thiªn", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		-- TODO ÁúÀÏ»¢¼¼ÄÜ
		SyncNpc(boss)
		NpcChat(boss, "<color=yellow>b©y giê c¸c vÞ ®· ®èi diÖn víi thÝ luyÖn cuèi cïng råi, chØ cÇn ®¸nh b¹i ta vµ vî cña ta, cã thÓ nhËn ®­îc trang bÞ cao cÊp nhÊt vµ vinh dù cao quý nhÊt.<color>")
		self.m_Boss = boss
		self.m_Timer = TimerList:AddTimer(self, 9)
		-- TODO: ¶¨Ê±Æ÷
	end
	self.m_Task = task
end

function Step3:Close(task)
	self:Clear()
	self.m_Task = nil
end

function Step3:Destroy()
	self:Clear()
end

function Step3:OnDeath()
	self:Clear(1)
	if (self.m_Task ~= nil) then
		self.m_Task:Proceed()
	end
end

function Step3:OnTime()
	if (self.m_Boss ~= nil and self.m_Task ~= nil) then
		local cur_life = NPCINFO_GetNpcCurrentLife(self.m_Boss)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(self.m_Boss)
		if (cur_life < max_life * 0.5) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step3:Clear(flag)
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcList:DelNpc(self.m_Boss, flag)
		self.m_Boss = nil
	end
end

-- µÚËÄ²½
-- ¿ªÊ¼£º³öÏÖ3¸öÒ»Ä£Ò»ÑùµÄÁú¾ÅÌì£¨ÁúÀÏ»¢¼¼ÄÜ£©£¬ÆäÖÐËæ»úÒ»¸öÊÇÕæµÄ
-- Íê³É£º°ÑÕæµÄ´òµ½40%µÄÑªÊ±²Å»á½øÈëÏÂÒ»²½
Step4 = {}

function Step4:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local tb = {}
	for i = 1, 3 do
		local idx = self:AddBoss(mapid, pos.bosses[i], i)
		tinsert(tb, idx)
	end
	self.m_Bosses = tb
	self.m_BossIndex = random(1, getn(tb))
	self.m_Timer = TimerList:AddTimer(self, 9)
	self.m_Task = task
	-- DEBUG
	print(format("[MAZE]Step4: boss(%d), index(%d), count(%d)", self.m_Bosses[self.m_BossIndex], self.m_BossIndex, getn(tb)))
end

function Step4:Close(task)
	self:Clear()
end

function Step4:Destroy()
	self:Clear()
end

function Step4:Clear()
	if (self.m_Bosses ~= nil) then
		for _, index in self.m_Bosses do
			if (index > 0) then
				FightNpcList:DelNpc(index)
			end
		end
		self.m_Bosses = nil
	end
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	self.m_BossIndex = nil
end

function Step4:OnTime()
	if (self.m_BossIndex ~= nil) then
		local npc = self.m_Bosses[self.m_BossIndex]
		local cur_life = NPCINFO_GetNpcCurrentLife(npc)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(npc)
		if (cur_life < max_life * 0.4) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step4:OnDeath(killer, npc, index)
	-- DEBUG
	print(format("[MAZE]Step4:OnDeath(%d,%d,%d)", killer, npc, index))
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	FightNpcList:DelNpc(self.m_Bosses[index], 1)
	self.m_Bosses[index] = 0
	if (self.m_BossIndex ~= nil and self.m_BossIndex == index) then
		-- DEBUG
		print("[MAZE]real boss is down!")
		self.m_Task:Proceed()
		self.m_BossIndex = nil
	end
end

function Step4:AddBoss(mapid, pt, param)
	local boss = FightNpcList:AddNpc("Long Cöu Thiªn", NPCID_DIALOGBOSS, mapid, pt.x, pt.y, self, param, 1, 1)
	if (boss > 0) then
		-- TODO ÁúÀÏ»¢¼¼ÄÜ
		SyncNpc(boss)
		NpcChat(boss, "<color=yellow>xem ra ta ®· ®¸nh gi¸ thÊp c¸c ng­¬i råi, h·y xem ta ®©y ‘B¸ch BiÕn Ma Th©n’!<color>.")
		return boss
	else
		return 0
	end
end

-- µÚÎå²½
-- ¿ªÊ¼£ºÁú¾ÅÌì£¨¶Ô»°NPC£©Ëµ»°£¬·ïÁáçç³öÏÖ
-- Íê³É£ºÏÔÊ¾Íê¶Ô»°NÃëºó
Step5 = {}
function Step5:Start(task)
	local pos = task:GetPosition()
	local mapid = task:GetMapId()
	local boss = FightNpcList:AddNpc("Long Cöu Thiªn", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self)
	if (boss > 0) then
		SetNpcKind(boss, 3)
		SyncNpc(boss)
		local delay = 4
		local seconds = 0
		NpcChat(boss, "<color=yellow>c¸c vÞ qu¶ lµ nh÷ng cao thñ vâ l©m tr¨m n¨m míi gÆp mét lÇn, qu¶ nhiªn ®¸nh b¹i ®­îc B¸ch BiÕn Ma Th©n cña ta. Nãi thËt víi c¸c vÞ nhÐ, chñ nh©n ®Ých thùc cña Ngäc Long S¬n Trang vÉn lµ V­¬ng Quèc §¹i Kim, Tèng TriÒu bÞ diÖt vong chØ lµ chuyÖn sím hay muén mµ th«i, c¸c vÞ ph¶i hy sinh v« Ých chi b»ng gia nhËp vµo Bæn S¬n Trang v× §¹i Kim mµ hiÕn søc, sau nµy vinh hoa phó quý tha hå mµ tËn h­ëng, kh«ng biÕt ý cña c¸c vÞ thÕ nµo? <color>")
		seconds = seconds + delay
		NpcChat(boss, "<color=yellow>C¸c vÞ ®· ngoan cè nh­ vËy th× ®õng cã tr¸ch ta h¹ thñ kh«ng l­u t×nh, võa råi c¸c vÞ ®· uèng Long TuyÒn Mü Töu ta ®· h¹ Kim Tµm TuyÖt MÖnh §éc vµo trong ®ã, chØ cÇn vî cña ta ®iÒu khiÓn §éc Cæ, th× c¸c vÞ sèng kh«ng ra sèng chÕt kh«ng ra chÕt., ha ha ha ha <color>!", seconds)
		seconds = seconds + delay
		NpcChat(boss, "<color=yellow>Lung Linh, ra tay ®i, ®Ó cho c¸i thø ngoan cè kh«ng chÞu tØnh ngé nµy nÕm mïi ®au khæ!<color>", seconds)
		seconds = seconds + delay
		NpcChat(boss, "<color=yellow>Lung Linh, Lung Linh, sao ng­¬i cßn ch­a ®i ra n÷a h¶? Nhanh hñy ho¹i ®éc tuyÖt mÖnh cña ng­¬i ®i, ta chÞu kh«ng næi n÷a råi!<color>", seconds)
		self.m_Timer = TimerList:AddTimer(self, (seconds + 1) * 18, 1)
		self.m_Boss = boss
		self.m_Task = task
		self.m_MapId = mapid
		self.m_Pos = pos
	end
end

function Step5:Close(task)
	self:Clear()
end

function Step5:Destroy()
	self:Clear()
end

function Step5:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcList:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
	if (self.m_Girl ~= nil) then
		DlgNpcList:DelNpc(self.m_Girl)
		self.m_Girl = nil
	end
end

function Step5:OnTime(id)
	if (id == 1) then
		local girl = DlgNpcList:AddNpc("Ph­îng Lung Linh", NPCID_FENGLINGLONG, self.m_MapId, self.m_Pos.fenglinglong.x, self.m_Pos.fenglinglong.y)
		if (girl > 0) then
			SetNpcKind(girl, 3)
			SyncNpc(girl)
			NpcChat(girl, "<color=yellow>§¹i hiÖp, ng­¬i v× sao cßn ch­a gi¸c ngé, ng­¬i lÊy nh÷ng trang bÞ cao cÊp ®Ó lµm måi nhö, lÊy viÖc thÝ luyÖn KiÕm Gia ®Ó vang danh, ®· s¸t h¹i biÕt bao nhiªu vâ l©m nh©n sü råi, ng­¬I hµ tÊt ph¶i lµm chã dÉn ®­êng cho bon ng­êi Kim kia chø ? H«m nay ta quyÕt kh«ng thÓ ®Ó cho ng­¬i tiÕp tôc lµm nh÷ng chuyÖn sai tr¸i nh­ vËy n÷a<color>.")
			NpcChat(self.m_Boss, "<color=yellow>Lung Linh, ng­¬i, ng­¬i ……<color>")
			self.m_Girl = girl
		end
		self.m_Timer = TimerList:AddTimer(self, 2 * 18, 2)
		return 0
	elseif (id == 2) then
		FightNpcList:DelNpc(self.m_Boss)
		self.m_Boss = FightNpcList:AddNpc("Long Cöu Thiªn", NPCID_FIGHTBOSS, self.m_MapId, self.m_Pos.boss.x, self.m_Pos.boss.y, self)
		-- TODO: »ô¿Ë¼¼ÄÜ
		self.m_Timer = TimerList:AddTimer(self, 18 * 5, 3)
		return 0
	elseif (id == 3) then
		-- ¸øÍæ¼Ò¼ÓÑª
		self.m_Task:IterPlayers(self, self.AddBlood)
		return 1
	else
		return 0
	end
end

function Step5:AddBlood(player)
	-- ´Èº½ÆÕ¶É
	player:CastSkill(93, 20)
end

function Step5:OnDeath()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcList:DelNpc(self.m_Boss, 1)
		self.m_Boss = nil
	end
	self.m_Task:Proceed()
end

-- DEBUG
for i = 1, 49 do
	TaskList:RegisterTask(i, Task)
end
