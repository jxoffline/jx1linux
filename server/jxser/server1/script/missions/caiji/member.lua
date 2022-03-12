Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")

local TSKI_RANK = 1

PlayerHandle = {}

function PlayerHandle:Init(pTaskGroup, TSKI_RANK, TSKI_AWARD_FLAG, TSKI_SIGNUP_COUNT)
	self.TaskGroup = pTaskGroup
	self.TSKI_RANK = TSKI_RANK
	self.TSKI_AWARD_FLAG = TSKI_AWARD_FLAG
	self.TSKI_SIGNUP_COUNT = TSKI_SIGNUP_COUNT
end

function PlayerHandle:SetRank(nRank)
	self.TaskGroup:SetTask(self.TSKI_RANK, nRank)
end

function PlayerHandle:GetRank()
	return self.TaskGroup:GetTask(self.TSKI_RANK)
end

function PlayerHandle:GetAwardFlag()
	return self.TaskGroup:GetTask(self.TSKI_AWARD_FLAG)
end

function PlayerHandle:SetAwardFlag(nFlag)
	self.TaskGroup:SetTask(self.TSKI_AWARD_FLAG, nFlag)
end

function PlayerHandle:GetSignUpCount()
	local nTaskValue = self.TaskGroup:GetTask(self.TSKI_SIGNUP_COUNT)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		return 0
	else
		return mod(nTaskValue, 256)
	end
end

function PlayerHandle:AddSignUpCount(nCount)
	local nTaskValue =  self.TaskGroup:GetTask(self.TSKI_SIGNUP_COUNT)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if floor(nTaskValue/256) ~= nCurDate then
		self.TaskGroup:SetTask(self.TSKI_SIGNUP_COUNT, nCurDate * 256 + nCount)
	else
		self.TaskGroup:AddTask(self.TSKI_SIGNUP_COUNT, nCount)		
	end
end

Member = {}


function Member:new()

	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb.szName = GetName()
	tb.nPoint = 0
	local nMapId, nX, nY = GetWorldPos()
	tb.tbPos = {nMapId, nX, nY}
	return tb
end

function Member:MoveTo(nMapId, nX, nY)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		if nMapId then
			CallPlayerFunction(nPlayerIndex, NewWorld, nMapId, nX, nY)
		else
			CallPlayerFunction(nPlayerIndex, SetPos, nX, nY)
		end
	end
end

function Member:MoveToSignUpPlace()
	if self.tbPos then
		self:MoveTo(unpack(self.tbPos))
	else
		self:MoveTo(20,3546,6226)
	end
end

function Member:SaveRank(nRank)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %PlayerHandle.SetRank, %PlayerHandle, nRank)
	end
end

function Member:Consolation()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %tbAwardTemplet.Give, %tbAwardTemplet, {nExp_tl = 1000000}, 1, {"Event_Thang6", "consolation"})
		CallPlayerFunction(nPlayerIndex, Msg2Player, "vßng nµy cña ng­¬i trèng, ch­a thÓ tham gia trËn ®Êu, xin chê vßng sau")
	end
end

function Member:AddSignUpCount(nCount)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, %PlayerHandle.AddSignUpCount, %PlayerHandle, nCount)
	end
end

function Member:SendMessage(tbMessage)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex <= 0 then
		return
	end
	for i = 1, getn(tbMessage) do
		if tbMessage[i] then
			CallPlayerFunction(nPlayerIndex, Msg2Player, tbMessage[i])
		end
	end
end