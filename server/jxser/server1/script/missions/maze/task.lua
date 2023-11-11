-- ÖÕ¼«ÈÎÎñ

Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\maze\\tasklist.lua")
Include("\\script\\missions\\maze\\position.lua")

Task = {
	m_Steps = {},
	m_Index = 0,
	m_TaskId = 0,
}

--function Task:InitStep()
--	tb:AddStep(clone(Step1))
--end

function Task:New(id)
	local tb = clone(self)
	tb.m_TaskId = id
	TaskList:RegisterTask(id, tb)
	return tb
end

function Task:Log(msg)
	if (self.m_Maze) then
		self.m_Maze:Log(msg)
	end
end

function Task:LogError(msg)
	if (self.m_Maze) then
		self.m_Maze:LogError(msg)
	end
end

function Task:BroadCast(msg)
	self.m_Maze:NotifyMatesInMaze(msg)
end

function Task:RoomBroadCast(msg)
	self.m_Maze:NotifyRoomMessage(msg, self.m_Room.m_Row, self.m_Room.m_Col)
end

function Task:RandomPlayerName()
	return self.m_Maze:RandomMateName(self.m_Room)
end

function Task:Start(maze, room)
	self.m_Maze = maze
	self.m_Room = room
	self.m_Pos = PositionList:GetPosition(room.m_Row, room.m_Col)
	if (self.InitStep) then
		self:InitStep()
	end
	if (self.OnStart) then
		self:OnStart()
	end
	if (getn(self.m_Steps) > 0) then
		self:Proceed()
	end
end

function Task:Close(maze, room)
	if (self.OnClose) then
		self:OnClose()
	end
end

function Task:Destroy()
	if (self.m_Steps ~= nil) then
		for i = 1, getn(self.m_Steps) do
			self.m_Steps[i]:Destroy()
		end
		self.m_Steps = nil
		self.m_Index = 0
	end
	if (self.OnDestroy) then
		self:OnDestroy()
	end
end

function Task:InitStep()
end

function Task:IterPlayers(obj, func)
	self.m_Room:IterPlayers(obj, func)
end

function Task:AddStep(step)
	tinsert(self.m_Steps, step)
end

function Task:Finish()
	-- DEBUG
	print("Task finished!")
	self.m_Room:FinishTask()
end

function Task:Proceed()
	if (self.m_Index > 0) then
		self.m_Steps[self.m_Index]:Close(self)
	end
	local prev = self.m_Steps[self.m_Index]
	if (prev ~= nil and prev.Close ~= nil) then
		prev:Close(self)
	end
	self.m_Index = self.m_Index + 1
	local step = self.m_Steps[self.m_Index]
	if (step ~= nil) then
		step:Start(self)
	else
		self:Finish()
	end
end

function Task:GetPosition()
	return PositionList:GetPosition(self.m_Room.m_Row, self.m_Room.m_Col)
end

function Task:GetMapId()
	return self.m_Maze.m_MapId
end

function Task:KickCount(count)
	self.m_Maze:KickCount(count, self.m_Room)
end

function Task:KickPlayer(name)
	return self.m_Maze:KickPlayer(name)
end

function Task:GetPlayerList()
	return self.m_Maze:GetPlayerList()
end

function Task:OnPlayerDeath(player)
	if (not self.m_Index) then
		return
	end
	local step = self.m_Steps[self.m_Index]
	if (step ~= nil and step.OnPlayerDeath ~= nil) then
		step:OnPlayerDeath(player)
	end
end

Step = {}

function Step:New()
	local tb = clone(self)
	
	return tb
end

function Step:Start(task)
end
function Step:Close(task)
end
function Step:Destroy()
end