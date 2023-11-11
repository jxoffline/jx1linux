MockPlayer = {}

function MockPlayer:New(playerindex)
	local player = clone(MockPlayer)
	player.m_PlayerIndex = playerindex
	player.m_FightState = 0
	player.m_LogoutRV = 0
	player.m_Punish = 0
	player.m_DeathScript = ""
	player.m_Name = format("player%d", playerindex)
	player.m_Tong = ""
	player.m_Camp = 0
	player.m_Level = 1
	player.m_StackExp = 0	-- 叠加经验
	player.m_TongAge = 0
	player.m_Msg = nil
	player.m_DisabledUseTownP = 1
	player.m_DisabledUseHeart = 1
	player.m_Tasks = {}
	extend(player, MockPlayer)
	return player
end

function MockPlayer:GetName()
	return self.m_Name
end

function MockPlayer:SetName(name)
	self.m_Name = name
end

function MockPlayer:GetCash()
	if (not self.m_Money) then
		return 0
	else
		return self.m_Money
	end
end

function MockPlayer:OwnCash(money)
	self.m_Money = money
end

function MockPlayer:Pay(money)
	if (not self.m_Money or self.m_Money < money) then
		return 0
	end
	self.m_Money = self.m_Money - money
	return 1
end

function MockPlayer:OwnTiaozhanlingCount(count)
	self.m_TiaozhanlingCount = count
end

function MockPlayer:GetTiaozhanlingCount()
	if (not self.m_TiaozhanlingCount) then
		return 0
	else
		return self.m_TiaozhanlingCount
	end
end

function MockPlayer:ApplyReduceTiaozhanlingCount(count)
	if (not self.m_TiaozhanlingCount or self.m_TiaozhanlingCount < count) then
		return 0
	else
		self.m_TiaozhanlingCount = self.m_TiaozhanlingCount - count
		return 1
	end
end

function MockPlayer:AddStackExp(exp)
	self.m_StackExp = self.m_StackExp + exp
end

function MockPlayer:GetStackExp()
	return self.m_StackExp
end

function MockPlayer:NewWorld(mapid, x, y)
	self.m_MapId = mapid
	self.m_PosX = x
	self.m_PosY = y
	return 1
end

function MockPlayer:GetWorldPos()
	return self.m_MapId, floor(self.m_PosX / 32), floor(self.m_PosY / 32)
end

function MockPlayer:GetPos()
	return self.m_PosX, self.m_PosY, 1
end

function MockPlayer:SetFightState(state)
	self.m_FightState = state
end

function MockPlayer:GetFightState()
	return self.m_FightState
end

function MockPlayer:SetLogoutRV(flag)
	self.m_LogoutRV = flag
end

function MockPlayer:GetLogoutRV()
	return self.m_LogoutRV
end

function MockPlayer:SetPunish(flag)
	self.m_Punish = flag
end

function MockPlayer:GetPunish()
	return self.m_Punish
end

function MockPlayer:SetDeathScript(script)
	self.m_DeathScript = script
end

function MockPlayer:GetDeathScript()
	return self.m_DeathScript
end

function MockPlayer:SetTong(tong)
	self.m_Tong = tong
end

function MockPlayer:GetTong()
	return self.m_Tong
end

function MockPlayer:SetTmpCamp(camp)
	self.m_Camp = camp
end

function MockPlayer:GetTmpCamp()
	return self.m_Camp
end

function MockPlayer:Say(msg)
	self.m_Msg = msg
end

function MockPlayer:ForbidEnmity(flag)
	self.m_ForbidEnmity = flag
end

function MockPlayer:GetForbidEnmity()
	return self.m_ForbidEnmity
end

function MockPlayer:SetLevel(level)
	self.m_Level = level
end

function MockPlayer:AddLevel(count)
	self.m_Level = self:GetLevel() + count
end

function MockPlayer:GetLevel()
	if (not self.m_Level) then
		return 1
	else
		return self.m_Level
	end
end

function MockPlayer:GetJoinTongTime()
	return self.m_TongAge
end

function MockPlayer:SetJoinTongTime(age)
	self.m_TongAge = age
end

function MockPlayer:DisabledUseTownP(flag)
	self.m_DisabledUseTownP = flag
end

function MockPlayer:DisabledUseHeart(flag)
	self.m_DisabledUseHeart = flag
end

function MockPlayer:GetDisabledUseTownP()
	return self.m_DisabledUseTownP
end

function MockPlayer:GetDisabledUseHeart()
	return self.m_DisabledUseHeart
end

function MockPlayer:GetTongMaster()
	return self.m_TongMaster
end

function MockPlayer:SetTongMaster(name)
	self.m_TongMaster = name
end

function MockPlayer:GetLoginTime()
	if (not self.m_LoginTime) then
		return 0
	else
		return self.m_LoginTime
	end
end

function MockPlayer:SetLoginTime(time)
	self.m_LoginTime = time
end

function MockPlayer:GetLastLogoutTime()
	if (not self.m_LastLogoutTime) then
		return 0
	else
		return self.m_LastLogoutTime
	end
end

function MockPlayer:SetLastLogoutTime(time)
	self.m_LastLogoutTime = time
end

function MockPlayer:GetLastOfflineTime()
	if (not self.m_LastOfflineTime) then
		return 0
	else
		return self.m_LastOfflineTime
	end
end

function MockPlayer:SetLastOfflineTime(time)
	self.m_LastOfflineTime = time
end

-- 获取累计离线领奖时间（分钟）
function MockPlayer:GetOfflineLowTime()
	if (not self.m_OfflineLowTime) then
		return 0
	else
		return self.m_OfflineLowTime
	end
end

-- 设置累计离线领奖时间（分钟）
function MockPlayer:SetOfflineLowTime(time)
	self.m_OfflineLowTime = time
end

-- 增加累计离线领奖时间（分钟）
function MockPlayer:AddOfflineLowTime(time)
	self.m_OfflineLowTime = self:GetOfflineLowTime() + time
end

-- 获取累计离线时间
function MockPlayer:GetOfflineAdvTime()
	if (not self.m_OfflineAdvTime) then
		return 0
	else
		return self.m_OfflineAdvTime
	end
end

-- 设置累计离线时间
function MockPlayer:SetOfflineAdvTime(time)
	self.m_OfflineAdvTime = time
end

-- 增加累计离线时间
function MockPlayer:AddOfflineAdvTime(time)
	self.m_OfflineAdvTime = self:GetOfflineAdvTime() + time
end

-- 是否转生
function MockPlayer:IsTransLife()
	if (not self.m_TransLifeCount) then
		return 0
	elseif (self.m_TransLifeCount > 0) then
		return 1
	else
		return 0
	end
end

function MockPlayer:GetTransLifeCount()
	if (not self.m_TransLifeCount) then
		return 0
	else
		return self.m_TransLifeCount
	end
end

function MockPlayer:SetTransLifeCount(count)
	self.m_TransLifeCount = count
end

function MockPlayer:SetExp(exp)
	self.m_Exp = exp
end

function MockPlayer:GetExp()
	if (not self.m_Exp) then
		return 0
	else
		return self.m_Exp
	end
end

function MockPlayer:AddExp(exp)
	self.m_Exp = self:GetExp() + exp
end

function MockPlayer:StackExp(exp)
	self.m_StackExp = exp
	while (self:GetLevel() < 200 and exp > 0) do
		local curr_exp = self:GetExp()
		local need_exp = GetLevelExp(self:GetLevel(), self:GetTransLifeCount())
		if (need_exp >= curr_exp) then
			return 0
		end
		need_exp = need_exp - curr_exp
		if (need_exp >= exp) then
			self:AddExp(exp)
			return 1
		end
		exp = exp - need_exp
		self:SetExp(0)
		self:AddLevel(1)
	end
end

function MockPlayer:AddItemIntoEquiproom(genre, detail, particular, level, count)
	local items = self.m_EquipItems
	if (not items) then
		items = {}
		self.m_EquipItems = items
	end
	for i = 1, getn(items) do
		local item = items[i]
		if (item.genre == genre and
			item.detail == detail and
			item.particular == particular and
			item.level == level) then
			item.count = item.count + count
			return
		end
	end
	local item = {}
	item.genre = genre
	item.detail = detail
	item.particular = particular
	item.level = level
	item.count = count
	tinsert(items, item)
end

function MockPlayer:CalcEquiproomItemCount(genre, detail, particular, level)
	local items = self.m_EquipItems
	if (not items) then
		return 0
	end
	for i = 1, getn(items) do
		local item = items[i]
		if (item.genre == genre and
			item.detail == detail and
			item.particular == particular and
			item.level == level) then
			return item.count
		end
	end
	return 0
end

function MockPlayer:ConsumeEquiproomItem(count, genre, detail, particular, level)
	local items = self.m_EquipItems
	if (not items) then
		return 0
	end
	for i = 1, getn(items) do
		local item = items[i]
		if (item.genre == genre and
			item.detail == detail and
			item.particular == particular and
			item.level == level) then
			if (item.count >= count) then
				item.count = item.count - count
				return 1
			else
				return 0
			end
		end
	end
	return 0
end

function MockPlayer:SetProtectTime(time)
	self.m_ProtectTime = time
end

function MockPlayer:GetProtectTime()
	if (not self.m_ProtectTime) then
		return 0
	else
		return self.m_ProtectTime
	end
end

function MockPlayer:AddSkillState(id, level, type, time)
	local tb = {}
	tb.Id = id
	tb.Level = level
	tb.Type = type
	tb.Time = time
	self.m_SkillState = tb
end

function MockPlayer:GetTask(id)
	local val = self.m_Tasks[id]
	if (not val) then
		return 0
	else
		return val
	end
end

function MockPlayer:SetTask(id, val)
	self.m_Tasks[id] = val
end

function MockPlayer:Sale(nId, nCurrencyType, nScale)
	self.m_SaleId = nId
	self.m_SaleCurrency = nCurrencyType
	self.m_SaleScale = nScale
end

function MockPlayer:GetSaleParam()
	return self.m_SaleId, self.m_SaleCurrency, self.m_SaleScale
end

function MockPlayer:OpenProgressBar(title, frame, event, desc, ontime, onbreak)
	if (not self.m_ProgressId) then
		self.m_ProgressId = 0
	end
	self.m_ProgressId = self.m_ProgressId + 1
	return self.m_ProgressId
end

function MockPlayer:Msg2Player(msg)
	self.m_Msg = msg
end

function MockPlayer:IsCaptain()
	return 0
end

function MockPlayer:GetTeamSize()
	return 0
end

function MockPlayer:GetTeamMember(index)
	return nil
end

function MockPlayer:SetTempRevPos(...)
end

function MockPlayer:SetRevPos(...)
end
