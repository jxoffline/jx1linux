-- ÖÕ¼«ÈÎÎñ
Include("\\script\\missions\\maze\\task.lua")
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

pTask = Task:New(49)

function pTask:InitStep()
end


-- µÚÒ»²½
-- ¿ªÊ¼£º³öÏÖîÚÁú»¤·¨ºÍÄÐÅ®îÚÁúµÜ×Ó
-- Íê³É£º»÷°ÜËùÓÐÄÐÅ®îÚÁúµÜ×Ó
Step1 = Step:New()
Step1.m_Yulongdizi = {}
Step1.m_DiziCount = 0
function Step1:Start(task)
	local pos = task:GetPosition()
	local index = DlgNpcManager:AddNpc("Ngäc Long Hé Ph¸p",
		NPCID_YULONGHUFA,
		task:GetMapId(),
		pos.yulonghufa.x,
		pos.yulonghufa.y,
		self)
	if (index > 0) then
		local nNpcIndex = DlgNpcManager:GetNpcIndex(index)
		SetNpcKind(nNpcIndex, 3)
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
		DlgNpcManager:DelNpc(self.m_NpcIndex)
		self.m_NpcIndex = 0
	end
	if (self.m_Yulongdizi ~= nil) then
		for i = 1, getn(self.m_Yulongdizi) do
			local nIndex = self.m_Yulongdizi[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
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
		local nParam = getn(self.m_Yulongdizi) + 1
		local nIndex = FightNpcManager:AddNpc(name, npcid, mapid, pt.x, pt.y, self, nParam, 1, 1)
		tinsert(self.m_Yulongdizi, nIndex)
		if (nIndex > 0) then
			self.m_DiziCount = self.m_DiziCount + 1
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

function Step1:OnDeath(nKilled, pPlayer, nParam)
	self.m_Yulongdizi[nParam] = 0
	self.m_DiziCount = self.m_DiziCount - 1
	if (self.m_DiziCount <= 0) then
		self.m_Task:Proceed()
	end
end

-- µÚ¶þ²½
-- ¿ªÊ¼£ºÁú¾ÅÌì±äÎªÕ½¶·NPC£¨ÁúÀÏ»¢¼¼ÄÜ£©
-- Íê³É£º´òµ½µÍÓÚ50%ÉúÃü

Step2 = Step:New()
function Step2:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local boss = FightNpcManager:AddNpc("Long Cöu Thiªn", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "<color=yellow>C¸c vÞ qu¶ lµ nh©n trung long ph­îng, qu¶ nhiªn cã thÓ v­ît qua ®­îc trïng trïng nguy hiÓm ®Ó ®Õn ®©y gÆp ta. HiÖn t¹i c¸c vÞ ®ang ph¶I ®èi mÆt víi thÝ luyÖn cuèi cïng, chØ cÇn ®¸nh b¹i ta vµ Thª Tö cña ta, th× cã thÓ nhËn ®­îc trang bÞ cùc phÈm nhÊt vµ cã uy danh cao quý nhÊt. <color>")
		self.m_Boss = boss
		self.m_Timer = TimerList:AddTimer(self, 9)
	end
	self.m_Task = task
	self.m_MapId = mapid
end

function Step2:Close(task)
	self:Clear()
	self.m_Task = nil
end

function Step2:Destroy()
	self:Clear()
end

function Step2:OnDeath()
	self.m_Boss = nil
	self:Clear()
	if (self.m_Task ~= nil) then
		self.m_Task:Proceed()
	end
end

function Step2:OnTime()
	if (self.m_Boss ~= nil and self.m_Task ~= nil) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(self.m_Boss)
		local cur_life = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex)
		if (cur_life < max_life * 0.5) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step2:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
end

-- µÚÈý²½
-- ¿ªÊ¼£º³öÏÖ3¸öÒ»Ä£Ò»ÑùµÄÁú¾ÅÌì£¨ÁúÀÏ»¢¼¼ÄÜ£©£¬ÆäÖÐËæ»úÒ»¸öÊÇÕæµÄ
-- Íê³É£º°ÑÕæµÄ´òµ½40%µÄÑªÊ±²Å»á½øÈëÏÂÒ»²½
Step3 = Step:New()

function Step3:Start(task)
	local mapid = task:GetMapId()
	local pos = task:GetPosition()
	local tb = {}
	self.m_BossIndex = random(1, 3)
	for i = 1, 3 do
		local idx = self:AddBoss("Long Cöu Thiªn", mapid, pos.bosses[i], i)
		tinsert(tb, idx)
	end
	self.m_Bosses = tb
	self.m_Timer = TimerList:AddTimer(self, 9)
	self.m_Task = task
	self.m_MapId = mapid
end

function Step3:Close(task)
	self:Clear()
end

function Step3:Destroy()
	self:Clear()
end

function Step3:Clear()
	if (self.m_Bosses ~= nil) then
		for i = 1, getn(self.m_Bosses) do
			local nIndex = self.m_Bosses[i]
			if (nIndex > 0) then
				FightNpcManager:DelNpc(nIndex)
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

function Step3:OnTime()
	if (self.m_BossIndex ~= nil) then
		local npc = self.m_Bosses[self.m_BossIndex]
		local nNpcIndex = FightNpcManager:GetNpcIndex(npc)
		local cur_life = NPCINFO_GetNpcCurrentLife(nNpcIndex)
		local max_life = NPCINFO_GetNpcCurrentMaxLife(nNpcIndex)
		if (cur_life < max_life * 0.4) then
			self.m_Timer = nil
			self.m_Task:Proceed()
			return 0
		end
	end
	return 1
end

function Step3:OnDeath(killed, player, index)
	self.m_Bosses[index] = 0
	if (index == self.m_BossIndex) then
		if (self.m_Timer ~= nil) then
			TimerList:DelTimer(self.m_Timer)
			self.m_Timer = nil
		end
		self.m_BossIndex = nil
		self.m_Task:Proceed()
	end
end

function Step3:AddBoss(name, mapid, pt, param)
	local boss = FightNpcManager:AddNpc(name, NPCID_DIALOGBOSS, mapid, pt.x, pt.y, self, param, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SyncNpc(nNpcIndex)
		NpcChat(nNpcIndex, "<color=yellow>Xem ra ta b¹i d­íi tay cña c¸c ng­¬i råi, h·y xem ' B¸ch BiÕn Ma Th©n' cña ta ®©y ! <color>")
		return boss
	else
		return 0
	end
end

-- µÚËÄ²½
-- ¿ªÊ¼£ºÁú¾ÅÌì£¨¶Ô»°NPC£©Ëµ»°£¬·ïÁáçç³öÏÖ
-- Íê³É£ºÏÔÊ¾Íê¶Ô»°NÃëºó
Step4 = Step:New()
function Step4:Start(task)
	local pos = task:GetPosition()
	local mapid = task:GetMapId()
	local boss = FightNpcManager:AddNpc("Long Cöu Thiªn", NPCID_DIALOGBOSS, mapid, pos.boss.x, pos.boss.y, self, nil, 1, 1)
	if (boss > 0) then
		local nNpcIndex = FightNpcManager:GetNpcIndex(boss)
		SetNpcKind(nNpcIndex, 3)
		SyncNpc(nNpcIndex)
		local delay = 4
		local seconds = 0
		NpcChat(nNpcIndex, "<color=yellow>C¸c vÞ qu¶ lµ nh÷ng cao thñ mµ tr¨m n¨m ta míi ®­îc gÆp mét lÇn, qu¶ nhiªn ®· ®¸nh b¹i ®­îc B¸ch BiÕn Ma Th©n cña ta. Kh«ng giÊu g× c¸c vÞ, Chñ nh©n ®Ých thùc cña Ngäc Long S¬n Trang chÝnh lµ Quèc V­¬ng cña §¹i Kim, TriÒu Tèngsím muén còng bÞ diÖt vong chØ lµ chuyÖn cña thêi gian mµ th«i, c¸c vÞ hµ tÊt ph¶i hy sinh mét c¸ch v« Ých nh­ vËy chi b»ng gia nhËp vµo Bæn S¬n Trang mµ gióp søc phß trî §¹i Kim, sau nµy thµnh ®¹i nghiÖp th× tiÒn tµi phó quý sÏ thuéc vÒ c¸c vÞ! Kh«ng biÕt ý cña c¸c vÞ thÕ nµo? <color>")
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>NÕu nh­ c¸c vÞ vÉn cøng ®Çu cè chÊp nh­ vËy, th× ®õng cã tr¸ch ta h¹ thñ kh«ng l­u t×nh, c¸c ng­¬i ®· bÞ ta h¹ mét ®éc cæ gäi lµ Kim Tµm TuyÖt MÖnh Cæ, chØ cÇn Thª Tö cña ta vÉy tay mét c¸i th× Cæ §éc sÏ ph¸t ra, ®Õn lóc ®ã c¸c ng­¬i sèng kh«ng b»ng sèng chÕt kh«ng b»ng chÕt, ha ha ha! <color>", seconds)
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>Linh Lung, ra tay ®i, h·y cho c¸i bän ng­êi ngoan cè nµy nÕm mïi lîi h¹i cña ta! <color>", seconds)
		seconds = seconds + delay
		NpcChat(nNpcIndex, "<color=yellow>Lung Linh, Lung Linh, ng­¬i ®©u råi cßn kh«ng ra tay ®i? nhanh ph¸t ®éng Cæ §éc cña ng­¬i ®i, ta chÞu kh«ng nçi bän ng­êi nµy n÷a råi! <color>", seconds)
		self.m_Timer = TimerList:AddTimer(self, (seconds + 1) * 18, 1)
		self.m_Boss = boss
		self.m_Task = task
		self.m_MapId = mapid
		self.m_Pos = pos
	end
end

function Step4:Close(task)
	self:Clear()
end

function Step4:Destroy()
	self:Clear()
end

function Step4:Clear()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	if (self.m_Boss ~= nil) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = nil
	end
	if (self.m_Girl ~= nil) then
		DlgNpcManager:DelNpc(self.m_Girl)
		self.m_Girl = nil
	end
end

function Step4:OnTime(id)
	if (id == 1) then
		local girl = DlgNpcManager:AddNpc("Ph­îng Lung Linh", NPCID_FENGLINGLONG, self.m_MapId, self.m_Pos.fenglinglong.x, self.m_Pos.fenglinglong.y)
		if (girl > 0) then
			self.m_Girl = girl
			local nGirlIndex = DlgNpcManager:GetNpcIndex(girl)
			SetNpcKind(nGirlIndex, 3)
			SyncNpc(nGirlIndex)
			NpcChat(nGirlIndex, "<color=yellow>Thiªn Ca, t¹i sao huynh cßn ch­a tØnh ngé l¹i, bao n¨m nay huynh lu«n lÊy nh÷ng trang bÞ tèt ®Ó dô dç c¸c h·o h¸n giang hå, lÊy KiÕm Gia ®Ó lµm vang danh thiªn h¹, giÕt h¹i kh«ng biÕt bao nhiªu vâ l©m cao thñ, v× sao huynh vÉn cø suèt ®êi lµm chã dÉn ®­êng cho bän ng­êi Kim nh­ vËy? H«m nay muéi kh«ng thÓ tiÕp tôc ®Ó cho huynh ph¶i téi l¹i chång lªn téi ®­îc n÷a<color>")
			local nBoyIndex = FightNpcManager:GetNpcIndex(self.m_Boss)
			NpcChat(nBoyIndex, "<color=yellow>Linh Lung, ng­¬i, ng­¬i ! ……<color>")
		end
		self.m_Timer = TimerList:AddTimer(self, 2 * 18, 2)
		return 0
	elseif (id == 2) then
		FightNpcManager:DelNpc(self.m_Boss)
		self.m_Boss = FightNpcManager:AddNpc("Long Cöu Thiªn", NPCID_FIGHTBOSS, self.m_MapId, self.m_Pos.boss.x, self.m_Pos.boss.y, self, nil, 1, 1)
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

function Step4:AddBlood(player)
	-- ´Èº½ÆÕ¶É
	player:CastSkill(93, 20)
end

function Step4:OnDeath()
	if (self.m_Timer ~= nil) then
		TimerList:DelTimer(self.m_Timer)
		self.m_Timer = nil
	end
	self.m_Boss = nil
	self.m_Task:Proceed()
end

pTask:AddStep(clone(Step1))
pTask:AddStep(clone(Step2))
pTask:AddStep(clone(Step3))
pTask:AddStep(clone(Step4))
