Include("\\script\\lib\\unittest.lua")
Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\testcase\\lib\\mockplayer.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\logout_head.lua")

function Test()
	local suite = TestSuite:new("MazeTestSuite")
	suite:add(MazeListTest:New())
	suite:add(MazeTest:New())
	suite:add(TaskTest:New())
	suite:add(PermissionTest:New())
	suite:run()
end

MockMapAlloc = {}

function MockMapAlloc:ApplyMap(id)
	return id
end

function MockMapAlloc:FreeMap(id)
	return id
end

MazeListTest = {}

function MazeListTest:New()
	return TestCase:new("MazeListTest", MazeListTest)
end

function MazeListTest:testCreateAndDestroyMaze()
	local maze = Maze:New(MockMapAlloc)
	self:assertTrue(maze.m_Id > 0)
	self:assertTrue(MazeList:Get(maze.m_Id) ~= nil)
	local player = MockPlayer:New(1)
	maze:Join(player)
	self:assertTrue(maze:IsEqual(MazeList:Find(player)) == 1)
	maze:Destroy()
	self:assertTrue(MazeList:Get(maze.m_Id) == nil)
	self:assertTrue(MazeList:Find(player) == nil)
	self:assertTrue(maze.m_Id == 0)
end

MazeTest = {}

function MazeTest:New()
	return TestCase:new("MazeTest", MazeTest)
end

function MazeTest:setUp()
	self.m_Maze = Maze:New(MockMapAlloc)
end

function MazeTest:tearDown()
	self.m_Maze:Destroy()
end

function MazeTest:testOrgRoom()
	local tb = {}
	tb[3] = {}
	tb[4] = {}
	tb[5] = {}
	tb[3][4] = 1
	tb[4][3] = 1
	tb[4][4] = 1
	tb[4][5] = 1
	tb[5][4] = 1
	self:assertTrue(getn(PositionList.m_OrgRooms) == 5)
	for i = 1, 1000 do
		local pos = PositionList:RandomOrgPosition()
		self:assertTrue(tb[pos.row][pos.col] == 1, format("wrong org[%d,%d]", pos.row, pos.col))
	end
	local maze = self.m_Maze
	local pos = maze:GetOrgRoom()
	self:assertTrue(tb[pos.m_Row][pos.m_Col] == 1)
	for i = 1, getn(PositionList.m_OrgRooms) do
		local pos = PositionList.m_OrgRooms[i]
		local row = pos.row
		local col = pos.col
		self:assertTrue(tb[row] ~= nil)
		self:assertTrue(tb[row][col] == 1)
		tb[row][col] = 0
	end
end

function MazeTest:testEndRoom()
	local tb = {}
	for i = 1, 7 do
		tb[i] = {}
		for j = 1, 7 do
			if i == 1 or i == 7 or j == 1 or j == 7 then
				tb[i][j] = 1
			end
		end
	end
	self:assertTrue(getn(PositionList.m_EndRooms) == 24)
	for i = 1, 1000 do
		local pos = PositionList:RandomEndPosition()
		self:assertTrue(tb[pos.row][pos.col] == 1)
	end
	local maze = self.m_Maze
	local pos = maze:GetEndRoom()
	self:assertTrue(tb[pos.m_Row][pos.m_Col] == 1)
end

function MazeTest:testRoomConnection()
	local maze = self.m_Maze
	for i = 1, 7 do
		for j = 1, 7 do
			room = maze:GetRoom(i, j)
			self:assertTrue(room ~= nil)
			east = maze:East(room)
			west = maze:West(room)
			south = maze:South(room)
			north = maze:North(room)
			if j == 1 then
				self:assertTrue(west == nil)
				self:assertTrue(east ~= nil)
				self:assertTrue(room:IsEqual(maze:West(east)) == 1)
			elseif j == 7 then
				self:assertTrue(east == nil)
				self:assertTrue(west ~= nil)
				self:assertTrue(room:IsEqual(maze:East(west)) == 1)
			else
				self:assertTrue(east ~= nil)
				self:assertTrue(west ~= nil)
				self:assertTrue(room:IsEqual(maze:West(east)) == 1)
				self:assertTrue(room:IsEqual(maze:East(west)) == 1)
			end
			if i == 1 then
				self:assertTrue(north == nil)
				self:assertTrue(south ~= nil)
				self:assertTrue(room:IsEqual(maze:North(south)) == 1)
			elseif i == 7 then
				self:assertTrue(south == nil)
				self:assertTrue(north ~= nil)
				self:assertTrue(room:IsEqual(maze:South(north)) == 1)
			else
				self:assertTrue(south ~= nil)
				self:assertTrue(north ~= nil)
				self:assertTrue(room:IsEqual(maze:North(south)) == 1)
				self:assertTrue(room:IsEqual(maze:South(north)) == 1)
			end
		end
	end
end

function MazeTest:testEnterMaze()
	local maze = self.m_Maze
	local player = MockPlayer:New(1)
	maze:Join(player)
	maze:Enter(player)
	self:assertTrue(player:GetFightState() == 1)
	local room = maze:GetOrgRoom()
	self:assertTrue(maze:InRoom(player, room.m_Row, room.m_Col) == 1)
	local found = maze:FindRoomWithPlayer(player)
	self:assertTrue(found ~= nil and maze:InRoom(player, found.m_Row, found.m_Col) == 1)
	maze:Leave(player)
	self:assertFalse(maze:InRoom(player, room.m_Row, room.m_Col) == 1)
	local found = maze:FindRoomWithPlayer(player)
	self:assertFalse(found ~= nil)
end

function MazeTest:testEnterRoom()
	local maze = self.m_Maze
	local player = MockPlayer:New(1)
	maze:Join(player)
	for i = 1, 7 do
		for j = 1, 7 do
			local room = maze:Enter(player, i, j)
			self:assertTrue(maze:InRoom(player, i, j) == 1)
			for m = 1, 7 do
				for n = 1, 7 do
					if (m ~= i and n ~= j) then
						self:assertTrue(maze:InRoom(player, m, n) == 0)
					end
				end
			end
			maze:Leave(player)
			self:assertTrue(maze:InRoom(player, i, j) == 0)
		end
	end
end

function MazeTest:IsAround(i, j, m, n)
	if (i == m) then
		if (j == n - 1 or (j == MAZE_COLCOUNT and n == 1)) then
			return DIRECT_RIGHT
		elseif (j == n + 1 or (j == 1 and n == MAZE_COLCOUNT)) then
			return DIRECT_LEFT
		end
	end
	if (j == n) then
		if (i == m - 1 or (i == MAZE_ROWCOUNT and m == 1)) then
			return DIRECT_BOTTOM
		elseif (i == m + 1 or (i == 1 and m == MAZE_ROWCOUNT)) then
			return DIRECT_TOP
		end
	end
	return 0
end

function MazeTest:testTrapMoveOk()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			for m = 1, MAZE_ROWCOUNT do
				for n = 1, MAZE_COLCOUNT do
					local room = self.m_Maze:Enter(player, i, j)
					local dest = self.m_Maze:GetRoom(m, n)
					local gate = self.m_Maze:GetGate(room, dest)
					local direct = self:IsAround(i, j, m, n)
					if ((i ~= m or j ~= n) and direct ~= 0) then
						self:assertTrue(gate ~= nil and direct ~= 0, format("room[%d,%d]=>[%d,%d]", i, j, m, n))
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 1)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 0)
						room:Open()
						dest:Open()
						GateList:Trap(gate.m_Id, player)
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 0)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 1)
						dest:Close()
						room:Close()
					else
						self:assertTrue(gate == nil)
					end				
					self.m_Maze:Leave(player)
				end
			end
		end
	end
end

function MazeTest:MoveToTrap(player, row, col, direct, gate)
	local pos = PositionList:GetPosition(row, col)
	local pt = nil
	if (direct ~= 0) then
		pt = pos.traps[direct][1]
		self:assertTrue(pt ~= nil, format("room[%d,%d], direct(%d)", row, col, direct))
	else
		self:assertTrue(nil, format("room[%d,%d]", row, col))
	end
	player:NewWorld(self.m_Maze.m_MapId, pt.x, pt.y)
	local _, id = QueryMapTrap(self.m_Maze.m_MapId, pt.x, pt.y)
	self:assertTrue(id == gate.m_Id)
end

function MazeTest:testTrapLateMoveOk()
	local player = MockPlayer:New(1)
	local mate = MockPlayer:New(2)
	player:SetName("player")
	mate:SetName("mate")
	self.m_Maze:Join(player)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			for m = 1, MAZE_ROWCOUNT do
				for n = 1, MAZE_COLCOUNT do
					local room = self.m_Maze:Enter(player, i, j)
					self:assertTrue(room:Inside(player) == 1)
					self.m_Maze:Join(mate)
					self.m_Maze:Enter(mate, i, j)
					self:assertTrue(room:Inside(mate) == 1)
					self:assertTrue(self.m_Maze:Kill(mate) == 1)
					self:assertTrue(room:Inside(mate) == 0)
					local dest = self.m_Maze:GetRoom(m, n)
					local gate = self.m_Maze:GetGate(room, dest)
					local direct = self:IsAround(i, j, m, n)
					if (direct ~= 0) then
						room:Open()
						GateList:Trap(gate.m_Id, player)
						local timer1 = self.m_Maze.m_TrapTimerId
						self:assertTrue(timer1 > 0)
						self:MoveToTrap(player, i, j, direct, gate)
						local x1, y1, _ = player:GetPos()
						self:assertTrue(x1 ~= nil and x1 ~= 0 and y1 ~= nil and y1 ~= 0)
						GateList:Trap(gate.m_Id, player)
						local timer2 = self.m_Maze.m_TrapTimerId
						self:assertTrue(timer1 == timer2)
						-- self:assertTrue(TimerList:OnTime(timer1) == 0)
						transfer_timeout(timer1)
						self:assertTrue(self.m_Maze.m_TrapTimerId == 0)
						self:assertTrue(room:Inside(player) == 0)
						self:assertTrue(dest:Inside(player) == 1)
						local x2, y2, _ = player:GetPos()
						self:assertTrue(x1 ~= x2 or y1 ~= y2)
						self:assertTrue(room:Inside(mate) == 0)
						self:assertTrue(dest:Inside(mate) == 0)
						room:Close()
					else
						self:assertTrue(gate == nil)
					end
					self.m_Maze:Leave(player)
					self.m_Maze:Quit(mate)
				end
			end
		end
	end
end

-- 没有踩trap点
function MazeTest:testTrapLateMoveFail1()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			for m = 1, MAZE_ROWCOUNT do
				for n = 1, MAZE_COLCOUNT do
					local room = self.m_Maze:Enter(player, i, j)
					local dest = self.m_Maze:GetRoom(m, n)
					local gate = self.m_Maze:GetGate(room, dest)
					local direct = self:IsAround(i, j, m, n)
					if (direct ~= 0) then
						room:Open()
						GateList:Trap(gate.m_Id, player)
						local timer1 = self.m_Maze.m_TrapTimerId
						self:assertTrue(timer1 > 0)
						-- self:MoveToTrap(player, i, j, direct, gate)
						GateList:Trap(gate.m_Id, player)
						local timer2 = self.m_Maze.m_TrapTimerId
						self:assertTrue(timer1 == timer2)
						-- self:assertTrue(TimerList:OnTime(timer1) == 0)
						transfer_timeout(timer1)
						self:assertTrue(self.m_Maze.m_TrapTimerId == 0)
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 1)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 0)
						room:Close()
					else
						self:assertTrue(gate == nil)
					end
					self.m_Maze:Leave(player)
				end
			end
		end
	end
end

-- 踩trap点的人数不到队伍人数一半（一些人在房间里但是没踩到trap点）
function MazeTest:testTrapLateMoveFail2()
	local player = MockPlayer:New(1)
	local mate1 = MockPlayer:New(2)
	local mate2 = MockPlayer:New(3)
	player:SetName("player1")
	mate1:SetName("mate1")
	mate2:SetName("mate2")
	self.m_Maze:Join(player)
	self.m_Maze:Join(mate1)
	self.m_Maze:Join(mate2)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			for m = 1, MAZE_ROWCOUNT do
				for n = 1, MAZE_COLCOUNT do
					self.m_Maze:Enter(mate1)
					self.m_Maze:Enter(mate2)
					local room = self.m_Maze:Enter(player, i, j)
					local dest = self.m_Maze:GetRoom(m, n)
					local gate = self.m_Maze:GetGate(room, dest)
					local direct = self:IsAround(i, j, m, n)
					if (direct ~= 0) then
						room:Open()
						GateList:Trap(gate.m_Id, player)
						local timer1 = self.m_Maze.m_TrapTimerId
						self:assertTrue(timer1 > 0)
						self:MoveToTrap(player, i, j, direct, gate)
						GateList:Trap(gate.m_Id, player)
						local timer2 = self.m_Maze.m_TrapTimerId
						self:assertTrue(timer1 == timer2)
						-- self:assertTrue(TimerList:OnTime(timer1) == 0)
						transfer_timeout(timer1)
						self:assertTrue(self.m_Maze.m_TrapTimerId == 0)
						self:assertTrue(room:Inside(player) == 1)
						self:assertTrue(dest:Inside(player) == 0)
						room:Close()
					else
						self:assertTrue(gate == nil)
					end
					self.m_Maze:Leave(player)
					self.m_Maze:Leave(mate1)
					self.m_Maze:Leave(mate2)
				end
			end
		end
	end
end

-- 踩trap点的人数不到队伍人数一半（一些人在万花谷）
function MazeTest:testTrapLateMoveFail3()
	local player1 = MockPlayer:New(1)
	local player2 = MockPlayer:New(2)
	local player3 = MockPlayer:New(3)
	player1:SetName("player1")
	player2:SetName("player2")
	player3:SetName("player3")
	self.m_Maze:Join(player1)
	self.m_Maze:Join(player2)
	self.m_Maze:Join(player3)
	local room1 = self.m_Maze:Enter(player1)
	local room2 = self.m_Maze:Enter(player2)
	local room3 = self.m_Maze:Enter(player3)
	self:assertTrue(room1:IsEqual(room2) == 1)
	self:assertTrue(room1:IsEqual(room3) == 1)
	self.m_Maze:Kill(player2)
	self.m_Maze:Kill(player3)
	
	local dest = self.m_Maze:GetRoom(room1.m_Row, room1.m_Col + 1)
	local direct = self:IsAround(room1.m_Row, room1.m_Col, dest.m_Row, dest.m_Col)
	local gate = self.m_Maze:GetGate(room1, dest)
	room1:Open()
	GateList:Trap(gate.m_Id, player1)
	self:assertTrue(self.m_Maze.m_TrapTimerId > 0)
	self:MoveToTrap(player1, room1.m_Row, room1.m_Col, direct, gate)
	-- TimerList:OnTime(self.m_Maze.m_TrapTimerId)
	transfer_timeout(self.m_Maze.m_TrapTimerId)
	self:assertTrue(self.m_Maze.m_TrapTimerId == 0)
	self:assertTrue(dest:Inside(player1) == 0)
	self:assertTrue(dest:Inside(player2) == 0)
	self:assertTrue(dest:Inside(player3) == 0)
end

-- 目标房间没有开放
function MazeTest:testTrapMoveFail1()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			for m = 1, MAZE_ROWCOUNT do
				for n = 1, MAZE_COLCOUNT do
					local room = self.m_Maze:Enter(player, i, j)
					room:Open()
					local dest = self.m_Maze:GetRoom(m, n)
					local gate = self.m_Maze:GetGate(room, dest)
					if (self:IsAround(i, j, m, n) ~= 0) then
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 1)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 0)
						GateList:Trap(gate.m_Id, player)
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 1)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 0)
					else
						self:assertTrue(gate == nil)
					end
					self.m_Maze:Leave(player)
					room:Close()
				end
			end
		end
	end
end

-- 源房间没有开放
function MazeTest:testTrapMoveFail2()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			for m = 1, MAZE_ROWCOUNT do
				for n = 1, MAZE_COLCOUNT do
					local room = self.m_Maze:Enter(player, i, j)
					local dest = self.m_Maze:GetRoom(m, n)
					dest:Open()
					local gate = self.m_Maze:GetGate(room, dest)
					if (self:IsAround(i, j, m, n) ~= 0) then
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 1)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 0)
						GateList:Trap(gate.m_Id, player)
						self:assertTrue(self.m_Maze:InRoom(player, i, j) == 1)
						self:assertTrue(self.m_Maze:InRoom(player, m, n) == 0)
					else
						self:assertTrue(gate == nil)
					end
					self.m_Maze:Leave(player)
					dest:Close()
				end
			end
		end
	end
end

function MazeTest:GetTrapParam(pt)
	local _, param = QueryMapTrap(self.m_Maze.m_MapId, pt.x, pt.y)
	local gate = GateList:Get(param)
	return gate.m_Param
end

function MazeTest:AssertTrapPosition(pts, row1, col1, row2, col2)
	for i = 1, getn(pts) do
		local tb = self:GetTrapParam(pts[i])
		local room1 = tb[1]
		local room2 = tb[2]
		self:assertTrue(room1.m_Row == row1 and room1.m_Col == col1)
		self:assertTrue(room2.m_Row == row2 and room2.m_Col == col2)
	end
end

function MazeTest:testTrapPoint()
	local maze = self.m_Maze
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			local pos = PositionList:GetPosition(i, j)
			local room = maze:GetRoom(i, j)
			local pts_top = pos.traps[DIRECT_TOP]
			local pts_bottom = pos.traps[DIRECT_BOTTOM]
			local pts_left = pos.traps[DIRECT_LEFT]
			local pts_right = pos.traps[DIRECT_RIGHT]
			if (i > 1) then
				self:AssertTrapPosition(pts_top, i, j, i - 1, j)
			else
				self:AssertTrapPosition(pts_top, i, j, MAZE_ROWCOUNT, j)
			end
			if (i < MAZE_ROWCOUNT) then
				self:AssertTrapPosition(pts_bottom, i, j, i + 1, j)
			else
				self:AssertTrapPosition(pts_bottom, i, j, 1, j)
			end
			if (j > 1) then
				self:AssertTrapPosition(pts_left, i, j, i, j - 1)
			else
				self:AssertTrapPosition(pts_left, i, j, i, MAZE_COLCOUNT)
			end
			if (j < MAZE_COLCOUNT) then
				self:AssertTrapPosition(pts_right, i, j, i, j + 1)
			else
				self:AssertTrapPosition(pts_right, i, j, i, 1)
			end
		end
	end
end

function MazeTest:testRoomOpen()
	local maze = self.m_Maze
	for i = 1, 7 do
		for j = 1, 7 do
		local room = maze:GetRoom(i, j)
		self:assertTrue(room:IsOpen() == 0)
		room:Open()
		self:assertTrue(room:IsOpen() == 1)
		room:Close()
		self:assertTrue(room:IsOpen() == 0)
		end
	end
end

function MazeTest:testMazeTimeout()
	local player = MockPlayer:New(1)
	player:SetLogoutRV(0)
	self:assertTrue(player:GetLogoutRV() == 0)
	self.m_Maze:Join(player)
	self:assertTrue(player:GetLogoutRV() == 1)
	self.m_Maze:Enter(player)
	self:assertTrue(self.m_Maze.m_GameTimerId > 0)
	self:assertTrue(player:GetFightState() == 1)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 1)
	TimerList:OnTime(self.m_Maze.m_GameTimerId)
	self:assertTrue(self.m_Maze.m_Players == nil)
	local x, y, _ = player:GetPos()
	local mapid, _, _ = player:GetWorldPos()
	self:assertTrue(x == OUT_POSX and y == OUT_POSY)
	self:assertTrue(mapid == OUT_MAPID)
	self:assertTrue(player:GetFightState() == 0)
end

function MazeTest:AssertPosition(player, map, posx, posy)
	local x, y, _ = player:GetPos()
	local mapid, _, _ = player:GetWorldPos()
	self:assertTrue(x == posx and y == posy)
	self:assertTrue(mapid == map)
end

function MazeTest:testMazeFinish()
	local player1 = MockPlayer:New(1)
	local player2 = MockPlayer:New(2)
	player1:SetName("player1")
	player2:SetName("player2")
	self:assertTrue(self.m_Maze:IsAlive() == 1)
	self:assertTrue(self.m_Maze:Join(player1) == 1)
	self:assertTrue(self.m_Maze:Join(player2) == 1)
	self:assertTrue(self.m_Maze:Enter(player1) ~= nil)
	self:assertTrue(self.m_Maze:Enter(player2) ~= nil)
	local src = self.m_Maze:FindRoomWithPlayer(player1)
	local dst = self.m_Maze:GetEndRoom()
	local step = 1
	if (src.m_Row > dst.m_Row) then
		step = -1
	end
	for i = src.m_Row + step, dst.m_Row, step do
		self.m_Maze:Move(player1, i, src.m_Col)
		self.m_Maze:Move(player2, i, src.m_Col)
		local tmp = self.m_Maze:GetRoom(i, src.m_Col)
		self:assertTrue(tmp:IsOpen() == 0)
		tmp:StartTask()
		tmp:FinishTask()
		self:assertTrue(tmp:IsOpen() == 1)
	end
	if (src.m_Col > dst.m_Col) then
		step = -1
	else
		step = 1
	end
	for j = src.m_Col + step, dst.m_Col, step do
		self.m_Maze:Move(player1, dst.m_Row, j)
		self.m_Maze:Move(player2, dst.m_Row, j)
		local tmp = self.m_Maze:GetRoom(dst.m_Row, j)
		self:assertTrue(tmp:IsOpen() == 0)
		tmp:StartTask()
		tmp:FinishTask()
		self:assertTrue(tmp:IsOpen() == 1)
	end
	self:assertTrue(self.m_Maze:IsAlive() == 0)
	self:assertTrue(player1:GetFightState() == 0)
	self:assertTrue(player2:GetFightState() == 0)
	self:AssertPosition(player1, OUT_MAPID, OUT_POSX, OUT_POSY)
	self:AssertPosition(player2, OUT_MAPID, OUT_POSX, OUT_POSY)
end

function MazeTest:testFindMazeOfPlayer()
	local player = MockPlayer:New(1)
	player:SetName("player")
	self:assertTrue(MazeList:Find(player) == nil)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 0)
	self.m_Maze:Join(player)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 0)
	self:assertTrue(self.m_Maze:IsEqual(MazeList:Find(player)) == 1)
	self.m_Maze:Enter(player)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 1)
	self:assertTrue(self.m_Maze:IsEqual(MazeList:Find(player)) == 1)
	self.m_Maze:Leave(player)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 0)
	self:assertTrue(self.m_Maze:IsEqual(MazeList:Find(player)) == 1)
	self.m_Maze:Quit(player)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 0)
	self:assertTrue(MazeList:Find(player) == nil)
end

function MazeTest:testDeath()
	local player = MockPlayer:New(1)
	player:SetName("player")
	self.m_Maze:Join(player)
	self.m_Maze:Enter(player)
	self:assertTrue(player:GetDeathScript() == LUA_PLAYERDEATH)
	for i = 1, MAX_DEATHCOUNT do
		self:assertTrue(self.m_Maze:GetPlayerCount() == 1)
		self:assertTrue(self.m_Maze:Kill(player) == 1)
		self:AssertPosition(player, self.m_Maze.m_MapId, REVIVE_POSX, REVIVE_POSY)	
		self:assertTrue(player:GetFightState() == 0)
		self:assertTrue(self.m_Maze:IsAlive() == 1)
		self:assertTrue(self.m_Maze:GetPlayerCount() == 0)
		self:assertTrue(self.m_Maze:Enter(player) ~= nil)
	end
	self:assertTrue(self.m_Maze:GetPlayerCount() == 1)
	self:assertTrue(self.m_Maze:Kill(player) == 1)
	self:AssertPosition(player, OUT_MAPID, OUT_POSX, OUT_POSY)	
	self:assertTrue(player:GetFightState() == 0)
	self:assertTrue(self.m_Maze:IsAlive() == 1)
	self:assertTrue(self.m_Maze:GetPlayerCount() == 0)
	self:assertTrue(self.m_Maze:Enter(player) == nil)
	self:assertTrue(MazeList:Find(player) == nil)
end


function MazeTest:testRevive()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	local room = self.m_Maze:Enter(player)
	local hot = self.m_Maze:GetHotPosition()
	self:assertTrue(hot.row == room.m_Row and hot.col == room.m_Col)
	room:FinishTask()
	self.m_Maze:Move(player, room.m_Row, room.m_Col + 1)
	hot = self.m_Maze:GetHotPosition()
	self:assertTrue(hot.row == room.m_Row, hot.col == room.m_Col + 1)
	self:assertTrue(self.m_Maze:Kill(player) == 1)
	self.m_Maze:Revive(player)
	local pos = self.m_Maze:FindPlayerPosition(player)
	self:assertTrue(pos.row == hot.row and pos.col == hot.col,
		format("org(%d,%d), hot(%d,%d), but pos(%d,%d)",
			room.m_Row, room.m_Col, hot.row, hot.col, pos.row, pos.col))
end

-- 使用复生符
function MazeTest:testUseReviveFigure()
	local player = MockPlayer:New(1)
	self:assertTrue(ReviveFigure:Use(player) == 0)
	self.m_Maze:Join(player)
	self:assertTrue(ReviveFigure:Use(player) == 0)
	self.m_Maze:Enter(player)
	self.m_Maze:Kill(player)
	local err = {Msg = ""}
	self:assertTrue(ReviveFigure:Use(player, err) == 1, err.Msg)
	local hot = self.m_Maze:GetHotPosition()
	local pos = self.m_Maze:FindPlayerPosition(player)
	local org = self.m_Maze:GetOrgRoom()
	self:assertTrue(pos.row == hot.row and pos.col == hot.col,
		format("org(%d,%d), hot(%d,%d), but pos(%d,%d)",
			org.m_Row, org.m_Col, hot.row, hot.col, pos.row, pos.col))
end

function MazeTest:testKickAll()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	self.m_Maze:Enter(player)
	self.m_Maze:Kill(player)
	self.m_Maze:KickAll()
	self:AssertPosition(player, OUT_MAPID, OUT_POSX, OUT_POSY)
end

-- 掉线超出次数限制
function MazeTest:testLogoutExceed()
	local script = "\\script\\missions\\maze\\loginout.lua"
	local player = MockPlayer:New(1000)
	PlayerList:AddPlayer(player.m_PlayerIndex, player)
	self.m_Maze:Join(player)
	self.m_Maze:Enter(player)
	for i = 1, MAX_DEATHCOUNT do
		DynamicExecute(script, "logout", player.m_PlayerIndex)
		DynamicExecute(script, "login", player.m_PlayerIndex)
		local x, y, _ = player:GetPos()
		local mapid, _, _ = player:GetWorldPos()
		self:assertTrue(mapid == self.m_Maze.m_MapId and (x ~= OUT_POSX or y ~= OUT_POSY))
		local count_killed = self.m_Maze:GetPlayerKilledCount(player)
		local count_logout = self.m_Maze:GetPlayerLogoutCount(player)
		self:assertTrue(count_killed == 0, format("count_killed:%d", count_killed))
		self:assertTrue(count_logout == i, format("count_logout should be %d, but %d", i, count_logout))
	end
	DynamicExecute(script, "logout", player.m_PlayerIndex)
	DynamicExecute(script, "login", player.m_PlayerIndex)
	self:assertTrue(MazeList:Find(player) == nil)
	self:assertTrue(self.m_Maze:FindPlayerPosition(player) == nil)
	local count_killed = self.m_Maze:GetPlayerKilledCount(player)
	local count_logout = self.m_Maze:GetPlayerLogoutCount(player)
	self:assertTrue(count_killed == 0, format("count_killed:%d", count_killed))
	self:assertTrue(count_logout == 0, format("count_logout:%d", count_logout))
	local x, y, _ = player:GetPos()
	local mapid, _, _ = player:GetWorldPos()
	self:assertTrue(mapid == OUT_MAPID and x == OUT_POSX and y == OUT_POSY,
		format("pos should be (%d,%d,%d), but (%d,%d,%d)", OUT_MAPID, OUT_POSX, OUT_POSY, mapid, x, y))
	PlayerList:DelPlayer(player.m_PlayerIndex)
end

function MazeTest:testLogin()
	local script = "\\script\\missions\\maze\\loginout.lua"
	self:assertTrue(IsLoginFileFunction(script, "login") == 1)
	local index = 1000
	local player = MockPlayer:New(index)
	PlayerList:AddPlayer(index, player)
	self.m_Maze:Join(player)
	self.m_Maze:Enter(player)
	-- 模拟掉线
	self.m_Maze:Leave(player)
	PlayerList:DelPlayer(player.m_PlayerIndex)
	-- 模拟重新登录
	player = MockPlayer:New(index)
	PlayerList:AddPlayer(index, player)
	DynamicExecute(script, "login", index)
	player = PlayerList:GetPlayer(index)
	local pos = self.m_Maze:FindPlayerPosition(player)
	self:assertTrue(pos ~= nil)
	self:assertTrue(pos.row == 0 and pos.col == 0)
	self:AssertPosition(player, self.m_Maze.m_MapId, REVIVE_POSX, REVIVE_POSY)
	self.m_Maze:Quit(player)
	PlayerList:DelPlayer(player.m_PlayerIndex)
end

function MazeTest:testLogout()
	local script = "\\script\\missions\\maze\\loginout.lua"
	self:assertTrue(IsLogoutFileFunction(script, "logout") == 1)
	local index = 1000
	local player = MockPlayer:New(index)
	PlayerList:AddPlayer(index, player)
	self.m_Maze:Join(player)
	self.m_Maze:Enter(player)
	DynamicExecute(script, "logout", index)
	local pos = self.m_Maze:FindPlayerPosition(player)
	self:assertTrue(pos ~= nil and pos.row == 0 and pos.col == 0)
	PlayerList:DelPlayer(index)
end

-- 测试是否能打开奇珍阁
function MazeTest:testUiMarket()
	self:assertTrue(OtherMap:Check(OUT_MAPID) == 1)
	local mapid = self.m_Maze.m_MapId
	self:assertTrue(OtherMap:Check(mapid) == 1)
	self.m_Maze:Destroy()
	self:assertTrue(OtherMap:Check(mapid) == 0)
end

-- 测试房间的石碑
function MazeTest:testRoomStele()
	local player = MockPlayer:New(1)
	self.m_Maze:Join(player)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			local room = self.m_Maze:GetRoom(i, j)
			self:assertTrue(room:HasStele() == 0)
			self.m_Maze:Enter(player, i, j)
			self:assertTrue(room:HasStele() == 1)
			self:assertTrue(room:GetSteleScript() == "\\script\\global\\dlgnpc_list.lua")
			self:assertTrue(room:CheckStatus(TASKSTAT_INIT) == 1)
			self.m_Maze:StartTask(player)
			self:assertTrue(room:CheckStatus(TASKSTAT_DOING) == 1, format("wrong status:%d", room.m_Status))
			self.m_Maze:Leave(player)	
			self:assertTrue(room:HasStele() == 1)
			self:assertTrue(room:CheckStatus(TASKSTAT_DOING) == 1)
		end
	end
	self.m_Maze:Quit(player)
end

PermissionTest = {}

function PermissionTest:New()
	return TestCase:new("PermissionTest", PermissionTest)
end

function PermissionTest:setUp()
	self.m_Maze = Maze:New(MockMapAlloc)
end

function PermissionTest:tearDown()
	self.m_Maze:Destroy()
end

function PermissionTest:testCheckPermission()
	local player = MockPlayer:New(1)
	local day = MazePermission:DateToDayCount(20101201)
	self:assertTrue(MazePermission:CheckPermission(player) == 0)
	self:assertTrue(MazePermission:QueryLeftCount(player, day) == 0)
	MazePermission:Permit(player, day)
	self:assertTrue(MazePermission:CheckPermission(player) == 1)
	self:assertTrue(MazePermission:QueryLeftCount(player, day) == COUNT_JOINEVERYDAY)
	MazePermission:ReduceLeftCount(player)
	self:assertTrue(MazePermission:QueryLeftCount(player, day) == COUNT_JOINEVERYDAY - 1)
end

function PermissionTest:testJoinCount()
	local player = MockPlayer:New(1)
	local day = 20101201
	MazePermission:Permit(player, MazePermission:DateToDayCount(day))
	for i = 0, floor(COUNT_JOINTOTAL / COUNT_JOINEVERYDAY) + 1 do
		local want = COUNT_JOINEVERYDAY * (i + 1)
		if (want > COUNT_JOINTOTAL) then
			want = COUNT_JOINTOTAL
		end
		local day_count = MazePermission:DateToDayCount(day + i)
		local count = MazePermission:QueryLeftCount(player, day_count)
		self:assertTrue(count == want, format("day:%d want %d, but %d", day + i, want, count))
	end
end

TaskTest = {}

function TaskTest:New()
	return TestCase:new("TaskTest", TaskTest)
end

function TaskTest:setUp()
end

function TaskTest:tearDown()
end

function TaskTest:testTaskIsNotDuplicate()
	local tb = {}
	local maze = Maze:New(MockMapAlloc)
	local dest = maze:GetEndRoom()
	local count = MAZE_ROWCOUNT * MAZE_COLCOUNT
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			local room = maze:GetRoom(i, j)
			self:assertTrue(room.m_TaskId > 0 and room.m_TaskId <= count, format("room[%d,%d] taskid(%d) is invalid", i, j, room.m_TaskId))
			self:assertTrue(tb[room.m_TaskId] == nil, format("room[%d,%d] taskid(%d) is duplicate", i, j, room.m_TaskId))
			tb[room.m_TaskId] = 1
		end
	end
	-- 终极任务
	local dest = maze:GetEndRoom()
	self:assertTrue(dest.m_TaskId == 1)
	maze:Destroy()
end

function TaskTest:testTaskIsRandom()
	local maze1 = Maze:New(MockMapAlloc)
	local maze2 = Maze:New(MockMapAlloc)
	local diff_count = 0
	for i = 2, MAZE_ROWCOUNT - 1 do
		for j = 2, MAZE_COLCOUNT - 1 do
			local r1 = maze1:GetRoom(i, j)
			local r2 = maze2:GetRoom(i, j)
			if (r1.m_TaskId ~= r2.m_TaskId) then
				diff_count = diff_count + 1
			end
		end
	end
	maze1:Destroy()
	maze2:Destroy()
	self:assertTrue(diff_count > 0)
end
