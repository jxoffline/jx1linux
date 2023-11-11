--»®·ÖÎª9¸öÇøÓò£¬ÖÐ¼äÓÐ¸öBOSS¹Å¾øÉ±
--Ã¿¸ô1·ÖÖÓ¾Í»áË¢Ò»¸ö¾øÉ±XºÅÐ¡¹Ö
--Ð¡¹Ö²»ÄÜÉ±
--°ÑBOSSÉ±µô¹ý¹Ø¡£

Include("\\script\\missions\\maze\\task.lua")
Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")

Step1 = Step:New()
NUMBER_STRING = {"NhÊt", "NhÞ ", "Tam", "Tø", "5", "lôc ", "7", "8"}

function Step1:Start(task)
	local tbPos = task:GetPosition()
	local nNpcIndex = FightNpcManager:AddNpc("Cæ TuyÖt S¸t", 1633, task:GetMapId(), tbPos.boss.x, tbPos.boss.y, self, 1, 1, 1)
	self.tbNpcIndex = {}
	tinsert(self.tbNpcIndex, nNpcIndex)
	self.nTimer = TimerList:AddTimer(self, 10 * 18)
	self.tbPos = tbPos
	self.pTask = task
end

function Step1:OnTime()
	local nIndex = getn(self.tbNpcIndex)
	local nId = 1634 + nIndex - 1
	local nNpcIndex = FightNpcManager:AddNpc(
		format("TuyÖt s¸t %s sè", NUMBER_STRING[nIndex]),
		nId,
		self.pTask:GetMapId(),
		self.tbPos.jueshas[nIndex].x,
		self.tbPos.jueshas[nIndex].y,
		self,
		nIndex + 1,
		1,
		1)
	tinsert(self.tbNpcIndex, nNpcIndex)
	if (getn(self.tbNpcIndex) >= 9) then
		self.nTimer = 0
		return 0
	else
		return 1
	end
end

function Step1:OnDeath(nKilledIndex, pKillerPlayer, nIndex)
	self.tbNpcIndex[nIndex] = 0
	if (nIndex == 1) then
		self.pTask:Proceed()
	end
end

function Step1:Destroy()
	if (self.tbNpcIndex) then
		for i = 1, getn(self.tbNpcIndex) do
			local nNpcIndex = self.tbNpcIndex[i]
			if (nNpcIndex > 0) then
				FightNpcManager:DelNpc(nNpcIndex)
			end
		end
		self.tbNpcIndex = nil
	end
	if (self.nTimer > 0) then
		TimerList:DelTimer(self.nTimer)
		self.nTimer = 0
	end
end

pTask = Task:New(6)
pTask:AddStep(clone(Step1))
