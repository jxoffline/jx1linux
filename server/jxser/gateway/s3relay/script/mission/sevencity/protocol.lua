Include("\\script\\mission\\sevencity\\war.lua")
Include("\\script\\lib\\objbuffer_head.lua")

Protocol = {
}

function Protocol:Signup(param, result)
	local buff = ObjBuffer:New(param)
	local tong = buff:Pop()
	buff:Clear()
	buff:Push(tong)
	-- 直接把允许参加城战的帮会名转发给各个gameserver
	RemoteExecute(
		REMOTE_SCRIPT,
		"RelayProtocol:SyncSignup",
		buff.m_Handle)
end

function Protocol:Employ(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local tong = buff:Pop()
	BattleWorld:SetWarriorTong(name, tong)
	BattleWorld:SetTongWarrior(tong, name)
	buff:Clear()
	buff:Push(name)
	buff:Push(tong)
	RemoteExecute(
		REMOTE_SCRIPT,
		"RelayProtocol:SyncEmploy",
		buff.m_Handle)
end

function Protocol:Enter(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local tong = BattleWorld:GetWarriorTong(name)
	if (tong) then
		local count = BattleWorld:AddWarriorCount(tong)
		buff:Clear()
		buff:Push(tong)
		buff:Push(count)
		-- 同步帮会人数
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:SyncTongWarriorCount",
			buff.m_Handle)
		-- 回调通知玩家积分信息
		local standing = BattleWorld:GetStandings(name)
		local res = ObjBuffer:New(result)
		res:Push(name)
		res:Push(standing)
	end
end

function Protocol:Leave(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local tong = BattleWorld:GetWarriorTong(name)
	if (tong) then
		local count = BattleWorld:DelWarriorCount(tong)
		buff:Clear()
		buff:Push(tong)
		buff:Push(count)
		-- 同步帮会人数
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:SyncTongWarriorCount",
			buff.m_Handle)
	end
end

function Protocol:MonsterDown(param, result)
	local buff = ObjBuffer:New(param)
	local mapid = buff:Pop()
	local name = buff:Pop()
	-- 累加玩家击破龙柱数量
	local standings = BattleWorld:GetStandings(name)
	standings.KillMonsterCount = standings.KillMonsterCount + 1
	-- 占领场地
	local tong = BattleWorld:GetWarriorTong(name)
	BattleWorld:Occupy(mapid, tong)
end

function Protocol:WarriorKill(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	-- 累加玩家杀敌数量
	local standings = BattleWorld:GetStandings(name)
	standings.KillWarriorCount = standings.KillWarriorCount + 1
	-- 更新并广播topten
	if (BattleWorld:UpdateTopList(name, standings.KillWarriorCount) == 1) then
		local toplist = BattleWorld:GetTopList()
		buff:Clear()
		buff:Push(toplist)
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:SyncTopList",
			buff.m_Handle)
	end
end

function Protocol:TimeScore(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local score = buff:Pop()
	local standings = BattleWorld:GetStandings(name)
	standings.TimeScore = standings.TimeScore + score
end

function Protocol:Close(param, result)
	BattleWorld:Close()
	RemoteExecute(REMOTE_SCRIPT, "RelayProtocol:Close", 0)
end

function Protocol:QueryAward(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local award = AwardDb:Get(name)
	if (award ~= nil) then
		if (not award.BoxCount) then
			award.BoxCount = 0
		end
		if (not award.GuardAwardCount) then
			award.GuardAwardCount = 0
		end
		if (not award.ExpAward) then
			award.ExpAward = 0
		end
	end
	local res = ObjBuffer:New(result)
	res:Push(name)
	res:Push(award)
end

function Protocol:ClearExpAward(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	BattleWorld:ClearExpAward(name)
end

function Protocol:ReduceDew(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local count = buff:Pop()
	BattleWorld:ReduceDew(name, count)
end

function Protocol:ReduceBox(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local count = buff:Pop()
	BattleWorld:ReduceBox(name, count)
end

function Protocol:ReduceGuardAward(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local count = buff:Pop()
	BattleWorld:ReduceGuardAward(name, count)
end

function Protocol:AddDew(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local count = buff:Pop()
	BattleWorld:AddDew(name, count)
end

function Protocol:AddBox(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local count = buff:Pop()
	BattleWorld:AddBox(name, count)
end

function Protocol:AddGuardAward(param, result)
	local buff = ObjBuffer:New(param)
	local name = buff:Pop()
	local count = buff:Pop()
	BattleWorld:AddGuardAward(name, count)
end

function Protocol:AddScore(param, result)
	local buff = ObjBuffer:New(param)
	local mapid = buff:Pop()
	BattleWorld:AddScore(mapid)
end
