Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")

GateList = {
	m_Id = 1,
	m_Gates = {}
}

function GateList:NewGate(mapid, x, y)
	local id = self.m_Id
	self.m_Id = self.m_Id + 1
	local gate = Gate:New(id, mapid, x, y)
	self.m_Gates[id] = gate
	return gate
end

function GateList:Get(id)
	return self.m_Gates[id]
end

function GateList:Del(id)
	self.m_Gates[id] = nil
end

function GateList:Trap(id, player)
	local gate = self:Get(id)
	if (gate ~= nil) then
		gate:OnTrap(player)
	else
		WriteLog(format("[MAZE ERROR]player(%s) failed to trap gate[%d]", player:GetName(), id))
	end
end

Gate = {}

function Gate:New(id, mapid, x, y)
	local obj = clone(Gate)
	local pos = {}
	pos.mapid = mapid
	pos.x = x
	pos.y = y
	obj.m_Destination = pos
	obj.m_Id = id
	obj.m_Handler = nil
	obj.m_Param = nil
	obj.m_Pack = curpack()
	return obj
end

function Gate:RegHandler(handler, param)
	self.m_Handler = handler
	self.m_Param = param
	self.m_Pack = curpack()
end

function Gate:AddTrap(mapid, x, y, script)
	AddMapTrap(mapid, x, y, script, self.m_Id)	
end

function Gate:Move(player)
	local pos = self.m_Destination
	self:BefTrap(player)
	local x = floor(pos.x / 32)
	local y = floor(pos.y / 32)
	if (player:NewWorld(pos.mapid, x, y) == 1) then
		self:AftTrap(player)
	else
		self:TrapFail(player)
	end
end

function Gate:OnTrigger(player)
	if (self.m_Handler ~= nil and self.m_Handler.OnTrigger ~= nil) then
		return self.m_Handler:OnTrigger(self, player, self.m_Param)
	else
		return 0
	end
end

function Gate:BefTrap(player)
	if (self.m_Handler ~= nil and self.m_Handler.BefTrap ~= nil) then
		self.m_Handler:BefTrap(self, player, self.m_Param)
	end
end

function Gate:AftTrap(player)
	if (self.m_Handler ~= nil and self.m_Handler.AftTrap ~= nil) then
		self.m_Handler:AftTrap(self, player, self.m_Param)
	end
end

function Gate:TrapFail(player)
	if (self.m_Handler ~= nil and self.m_Handler.TrapFail ~= nil) then
		self.m_Handler:TrapFail(self, player, self.m_Param)
	end
end

function Gate:OnTrap(player)
	local pack = usepack(self.m_Pack)
	if (self:OnTrigger(player) == 1) then
		self:Move(player)
	end
	usepack(pack)
end
