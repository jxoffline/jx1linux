IL("FILESYS")

MAZE_ROWCOUNT 	= 7
MAZE_COLCOUNT 	= 7
TXT_ROOMPOS 	= "\\settings\\maps\\missions\\maze\\room_pos.txt"

PositionList = {
	m_Matrix = {},
	m_OrgRooms = {},	-- 起始房间
	m_EndRooms = {}		-- 结束房间
}

DIRECT_TOP		= 1	-- 上
DIRECT_BOTTOM	= 2	-- 下
DIRECT_LEFT		= 3	-- 左
DIRECT_RIGHT	= 4	-- 右

ReverseDirect = {
	[DIRECT_TOP		] = DIRECT_BOTTOM,
	[DIRECT_BOTTOM	] = DIRECT_TOP,
	[DIRECT_LEFT	] = DIRECT_RIGHT,
	[DIRECT_RIGHT	] = DIRECT_LEFT,
}

function PositionList:Initialize()
	self:Load(TXT_ROOMPOS)
	for i = 1, MAZE_ROWCOUNT do
		for j = 1, MAZE_COLCOUNT do
			if (i == 1 or i == MAZE_ROWCOUNT or
				j == 1 or j == MAZE_COLCOUNT) then
				self:AddPosition(self.m_EndRooms, i, j)
			end
		end
	end
	self:AddPosition(self.m_OrgRooms, 3, 4)
	self:AddPosition(self.m_OrgRooms, 4, 3)
	self:AddPosition(self.m_OrgRooms, 4, 4)
	self:AddPosition(self.m_OrgRooms, 4, 5)
	self:AddPosition(self.m_OrgRooms, 5, 4)
end

function PositionList:MakePosition(row, col, direct)
	local r = row
	local c = col
	if (direct == DIRECT_TOP) then
		r = row - 1
	elseif (direct == DIRECT_BOTTOM) then
		r = row + 1
	elseif (direct == DIRECT_LEFT) then
		c = col - 1
	elseif (direct == DIRECT_RIGHT) then
		c = col + 1
	else
		return nil, nil
	end
	if (r == 0) then
		r = MAZE_ROWCOUNT
	elseif (r == MAZE_ROWCOUNT + 1) then
		r = 1
	end
	if (c == 0) then
		c = MAZE_COLCOUNT
	elseif (c == MAZE_COLCOUNT + 1) then
		c = 1
	end
	return r, c
end

function PositionList:RandomOrgPosition()
	local index = random(getn(self.m_OrgRooms))
	return self.m_OrgRooms[index]
end

function PositionList:RandomEndPosition()
	local index = random(getn(self.m_EndRooms))
	return self.m_EndRooms[index]
end

function PositionList:AddPosition(tb, row, col)
	local pos = {}
	pos.row = row
	pos.col = col
	tinsert(tb, pos)
end

function PositionList:Load(path)
	local ret = TabFile_Load(path, path)
	if (ret == 0) then
		print(format("[MAZE ERROR]Failed to load %s", path))
		return
	end
	local count = TabFile_GetRowCount(path)
	for i = 2, count do
		local row = tonumber(TabFile_GetCell(path, i, 1))
		local col = tonumber(TabFile_GetCell(path, i, 2))
		local idx = (row - 1) * MAZE_COLCOUNT + col
		local pos = self.m_Matrix[idx]
		if (not pos) then
			pos = {}
			local traps = {}
			traps[DIRECT_TOP] = {}
			traps[DIRECT_BOTTOM] = {}
			traps[DIRECT_LEFT] = {}
			traps[DIRECT_RIGHT] = {}
			pos.traps = traps
			pos.entrs = {}
			pos.yulongboys = {}
			pos.yulonggirls = {}
			pos.cups = {}
			pos.bosses = {}
			pos.pillars = {}
			pos.jueshas = {}
			self.m_Matrix[idx] = pos
		end
		local kind = TabFile_GetCell(path, i, 3)
		local pt = {}
		pt.x = tonumber(TabFile_GetCell(path, i, 4))
		pt.y = tonumber(TabFile_GetCell(path, i, 5))
		self:InitPosition(row, col, kind, pt, pos)
	end
end

function PositionList:InitPosition(row, col, kind, pt, pos)
	if (kind == "pillar") then
		tinsert(pos.pillars, pt)
	elseif (kind == "juesha1") then
		pos.jueshas[1] = pt
	elseif (kind == "juesha2") then
		pos.jueshas[2] = pt
	elseif (kind == "juesha3") then
		pos.jueshas[3] = pt
	elseif (kind == "juesha4") then
		pos.jueshas[4] = pt
	elseif (kind == "juesha5") then
		pos.jueshas[5] = pt
	elseif (kind == "juesha6") then
		pos.jueshas[6] = pt
	elseif (kind == "juesha7") then
		pos.jueshas[7] = pt
	elseif (kind == "juesha8") then
		pos.jueshas[8] = pt
	elseif (kind == "yulonghufa") then
		pos.yulonghufa = pt
	elseif (kind == "gujuesha") then
		pos.gujuesha = pt
	elseif (kind == "bosses") then
		tinsert(pos.bosses, pt)
	elseif (kind == "cup") then
		tinsert(pos.cups, pt)
	elseif (kind == "fenglinglong") then
		pos.fenglinglong = pt
	elseif (kind == "boss") then
		pos.boss = pt
	elseif (kind == "yulongboy") then
		tinsert(pos.yulongboys, pt)
	elseif (kind == "yulonggirl") then
		tinsert(pos.yulonggirls, pt)
	elseif (kind == "stele") then
		pos.stele = pt
	elseif (kind == "entrance_top") then
		pos.entrs[DIRECT_TOP] = pt
	elseif (kind == "entrance_bottom") then
		pos.entrs[DIRECT_BOTTOM] = pt
	elseif (kind == "entrance_left") then
		pos.entrs[DIRECT_LEFT] = pt
	elseif (kind == "entrance_right") then
		pos.entrs[DIRECT_RIGHT] = pt
	elseif (kind == "left") then
		tinsert(pos.traps[DIRECT_LEFT], pt)
	elseif (kind == "right") then
		tinsert(pos.traps[DIRECT_RIGHT], pt)
	elseif (kind == "top") then
		tinsert(pos.traps[DIRECT_TOP], pt)
	elseif (kind == "bottom") then
		tinsert(pos.traps[DIRECT_BOTTOM], pt)
	else
		local tb = pos[kind]
		if (not tb) then
			pos[kind] = pt
		elseif (not tb.x or not tb.y) then
			tinsert(tb, pt)
		else
			pos[kind] = {tb, pt}
		end
	end
end

function PositionList:GetPosition(row, col)
	return self.m_Matrix[(row - 1) * MAZE_COLCOUNT + col]
end

PositionList:Initialize()
