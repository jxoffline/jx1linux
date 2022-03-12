--一个BOSS冷冰
--BOSS会放范围技能，被打中后冰冻，冰冻掉血
--杀死BOSS后过关

Include("\\script\\missions\\maze\\task.lua")

Include("\\script\\global\\fightnpc_list.lua")
Include("\\script\\lib\\timerlist.lua")
IL("NPCINFO")


Step1 = Step:New()

function Step1:Start(task)
	local nMapId = task:GetMapId()
	local tbPos = task:GetPosition()
	local nNpcIndex = FightNpcManager:AddNpc("L穘h B╪g", 1642, nMapId, tbPos.boss.x, tbPos.boss.y, self, nil, 1, 1)
	self.pTask = task
	self.nNpcIndex = nNpcIndex
end

function Step1:OnDeath()
	if self.pTask then
		self.nNpcIndex = 0
		self.pTask:Proceed()
	end
end

function Step1:Destroy()
	if (self.nNpcIndex > 0) then
		FightNpcManager:DelNpc(self.nNpcIndex)
		self.nNpcIndex = 0
	end
end

pTask = Task:New(8)
pTask:AddStep(clone(Step1))
