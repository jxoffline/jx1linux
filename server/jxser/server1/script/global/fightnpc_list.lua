Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

FightNpcManager = {
	m_Npcs = {},
	m_Idxs = {},	-- NPC数组索引=>队列索引
	m_Index = 0,
}

function FightNpcManager:AddNpc(name, npcid, mapid, x, y, npc, param, no_revive, is_boss, series)
	no_revive = no_revive or 1	-- 不重生
	is_boss = is_boss or 0		-- 是否boss
	series = series or random(0, 4)
	local index = AddNpcEx(npcid, 95, series, SubWorldID2Idx(mapid), x, y, no_revive, name, is_boss)
	if (index <= 0) then
		WriteLog(format("[ERROR]Failed to create fight npc(%s,%d,%d,%d,%d)", name, npcid, mapid, x, y))
		return 0
	end
	local tb = {}
	tb.Npc = npc
	tb.Index = index
	tb.PackNo = curpack()
	tb.Param = param
	SetNpcScript(index, "\\script\\global\\fightnpc_list.lua")
	self.m_Index = self.m_Index + 1
	self.m_Npcs[self.m_Index] = tb
	self.m_Idxs[index] = self.m_Index
	-- DEBUG
	WriteLog(format("Add FightNpc[%d=>%d]:%s", self.m_Index, index, name))
	return self.m_Index
end

function FightNpcManager:DelNpc(index)
	local tb = self.m_Npcs[index]
	if (tb ~= nil) then
		if (tb.Index > 0) then
			DelNpc(tb.Index)
		end
		-- DEBUG
		WriteLog(format("Del FightNpc[%d=>%d]", index, tb.Index))
		self.m_Npcs[index] = nil
		self.m_Idxs[tb.Index] = nil
	end
end

function FightNpcManager:GetNpcIndex(index)
	local tb = self.m_Npcs[index]
	if (not tb) then
		return 0
	end
	return tb.Index
end

function FightNpcManager:GetNpcWithIndex(nNpcIndex)
	local nIndex = self.m_Idxs[nNpcIndex]
	if (nIndex ~= nil) then
		return self.m_Npcs[nIndex], nIndex
	end
	return nil
end

function OnDeath(killed)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tb, nIndex = FightNpcManager:GetNpcWithIndex(killed)
	if (tb ~= nil) then
		if (tb.Npc ~= nil and tb.Npc.OnDeath ~= nil) then
			local pack = usepack(tb.PackNo)
			tb.Npc:OnDeath(killed, player, tb.Param)
			usepack(pack)
		end
		tb.Index = 0
		FightNpcManager:DelNpc(nIndex)
	end
end
