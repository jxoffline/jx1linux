Include("\\script\\event\\other\\shensuanzi\\class.lua")
Include("\\script\\misc\\taskmanager.lua")


tbShenSuanZi.TaskGroup = TaskManager:Create(2, 2)
tbShenSuanZi.TSK_Date = 1
tbShenSuanZi.TSK_Round = 2
tbShenSuanZi.TSK_Answer = 3
tbShenSuanZi.TSK_UseTime = 4


function tbShenSuanZi:ResetPerDay()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if nCurDate ~= self.TaskGroup:GetTask(self.TSK_Date) then
		self.TaskGroup:SetTask(self.TSK_Date, nCurDate)
		self.TaskGroup:SetTask(self.TSK_Answer, 0)
		self.TaskGroup:SetTask(self.TSK_Round, 0)
		self.TaskGroup:SetTask(self.TSK_UseTime, 0)
	end
end

function tbShenSuanZi:GetPlayerUseTime()
	self:ResetPerDay()
	return self.TaskGroup:GetTask(self.TSK_UseTime)
end

function tbShenSuanZi:AddPlayerUseTime(nTime)
	self:ResetPerDay()
	self.TaskGroup:AddTask(self.TSK_UseTime, nTime)
end

function tbShenSuanZi:GetPlayerAnswerCount()
	
	self:ResetPerDay()
	return self.TaskGroup:GetTask(self.TSK_Answer)
end

function tbShenSuanZi:AddPlayerAnswerCount()
	
	self:ResetPerDay()
	return self.TaskGroup:AddTask(self.TSK_Answer, 1)
end


function tbShenSuanZi:GetPlayerFinishRound()
	
	self:ResetPerDay()
	return self.TaskGroup:GetTask(self.TSK_Round)
end

function tbShenSuanZi:AddPlayerFinishRound()
	
	self:ResetPerDay()
	return self.TaskGroup:AddTask(self.TSK_Round, 1)
end





