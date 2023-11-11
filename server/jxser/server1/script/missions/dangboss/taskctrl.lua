Include("\\script\\missions\\basemission\\class.lua")
if not tbDangBossTaskCtrl then
	tbDangBossTaskCtrl = tbBaseClass:new()
end


function tbDangBossTaskCtrl:_init()
	self.TSK_Version	= 1942
	self.TSK_MAP_ID	= 2323
	self.TSK_MAP_X	= 2324
	self.TSK_MAP_Y	= 2325
	self.TSK_CONTINUE_COUNT = 1943
	self.TSK_MATCH_ID	= 1944
	self.TSK_SKILL_PLAYER_EXP = 1945
	self.TSK_AWARD_COUNT = 1946
	
	self.TSK_JOIN_COUNT = 1947
	
	self.nMaxKillPlayerExp = 5e8
	self.nMaxJoinCount = 36
	self.nDayCountMax = 5
	self.nTotalCountMax = 50
	
	
	self.nStartDate = 090117
	self.nEndDate = 090217
end


function tbDangBossTaskCtrl:AddJoinCount(nCurMatchId)--不同场次才能增加
	self:ResetTask()
	self:CheckNewMatch(nCurMatchId)
end

function tbDangBossTaskCtrl:SetJoinCount(nCount)--
	self:ResetTask()	
	return SetTask(self.TSK_JOIN_COUNT, nCount)

end

function tbDangBossTaskCtrl:GetJoinCount() --和场次无关
	self:ResetTask()	
	return GetTask(self.TSK_JOIN_COUNT)
end

function tbDangBossTaskCtrl:IsActive()	
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	--return self.nStartDate <= nDate and nDate <= self.nEndDate
	return 1
end

function tbDangBossTaskCtrl:ResetTask()
	if self:IsActive() == 1 then
		local nDate = tonumber(GetLocalDate("%y%m%d"))
		if GetTask(self.TSK_Version) ~= nDate then
			SetTask(self.TSK_Version, nDate)
			SetTask(self.TSK_MAP_ID, 0)
			SetTask(self.TSK_MAP_X, 0)
			SetTask(self.TSK_MAP_Y, 0)
			SetTask(self.TSK_CONTINUE_COUNT, 0)
			SetTask(self.TSK_MATCH_ID, 0)
			SetTask(self.TSK_SKILL_PLAYER_EXP, 0)
		end
	end
	
end

function tbDangBossTaskCtrl:GetLastPos()
	self:ResetTask()
	return GetTask(self.TSK_MAP_ID), GetTask(self.TSK_MAP_X), GetTask(self.TSK_MAP_Y)
end

function tbDangBossTaskCtrl:SetLastPos(nMapId, nPosX16, nPosY16)
	self:ResetTask()
	SetTask(self.TSK_MAP_ID, nMapId)
	SetTask(self.TSK_MAP_X, nPosX16)
	SetTask(self.TSK_MAP_Y, nPosY16)
end

function tbDangBossTaskCtrl:AddContinueCount(nCurMatchId) --增加接关次数，续币，和场次有关，不同场次接关次数获得为0
	
	self:ResetTask()
	return self:SetContinueCount( self:GetContinueCount(nCurMatchId) + 1)
end

function tbDangBossTaskCtrl:CheckNewMatch(nCurMatchId)
	self:ResetTask()
	if nCurMatchId ~= GetTask(self.TSK_MATCH_ID) then
		SetTask(self.TSK_MATCH_ID, nCurMatchId)
		self:SetContinueCount(0)
		
	end
end

function tbDangBossTaskCtrl:GetContinueCount(nCurMatchId)--不同场次接关次数清为0
	self:ResetTask()
	
	self:CheckNewMatch(nCurMatchId)
	return GetTask(self.TSK_CONTINUE_COUNT)
end

function tbDangBossTaskCtrl:SetContinueCount(nCount)--
	self:ResetTask()
	return SetTask(self.TSK_CONTINUE_COUNT, nCount)
end


function tbDangBossTaskCtrl:AddAwardCount(nCount)
	nCount = nCount or 1
	self:ResetTask()
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nState = GetTask(self.TSK_AWARD_COUNT)
	if floor(nState/256) ~= nCurDate then
		nState = nCurDate * 256
		SetTask(self.TSK_AWARD_COUNT, nState)
	end
	SetTask(self.TSK_AWARD_COUNT, nState + nCount)
end

function tbDangBossTaskCtrl:PayAwardCount(nCount)
	nCount = nCount or 1
	self:ResetTask()
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nState = GetTask(self.TSK_AWARD_COUNT)
	if floor(nState/256) ~= nCurDate then
		nState = nCurDate * 256
		SetTask(self.TSK_AWARD_COUNT, nState)
	end
	SetTask(self.TSK_AWARD_COUNT, nState - nCount)
end

function tbDangBossTaskCtrl:GetAwardCount()
	self:ResetTask()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	local nState = GetTask(self.TSK_AWARD_COUNT)
	if nDate ~= floor(nState/256) then
		nState = nDate * 256
		SetTask(self.TSK_AWARD_COUNT, nState)
	end
	
	return mod(nState, 256)	
end

function tbDangBossTaskCtrl:ResetAwardCount()
	self:ResetTask()
	return SetTask(self.TSK_AWARD_COUNT, 0)
end

function tbDangBossTaskCtrl:AddKillPlayerExp(nExp)
	self:ResetTask()
	return self:SetKillPlayerExp(self:GetKillPlayerExp() + nExp )
end

function tbDangBossTaskCtrl:GetKillPlayerExp()
	self:ResetTask()
	return GetTask(self.TSK_SKILL_PLAYER_EXP)
end

function tbDangBossTaskCtrl:SetKillPlayerExp(nExp)
	self:ResetTask()
	return SetTask(self.TSK_SKILL_PLAYER_EXP, nExp )
end

tbDangBossTaskCtrl:_init()