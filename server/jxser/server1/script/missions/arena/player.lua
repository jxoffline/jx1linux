
IncludeLib("SETTING")
Include("\\script\\missions\\arena\\common.lua")
Include("\\script\\lib\\log.lua")

local MAX_CREDITS = 3000
local tbRankFormula = {}


tbRankFormula.tbK =
{
	{nMin = 1200, nMax = 1600, nValue = 40},
	{nMin = 1601, nMax = 1999, nValue = 25},
	{nMin = 2000, nMax = 2400, nValue = 15},
	{nMin = 2401, nMax = -1, nValue = 10},
}
tbRankFormula.tbW =
{
	LOSE = 0,
	DRAW = 0.5,
	VICTORY = 1,
}
function tbRankFormula:Calc(Ro, Rt, szResult)
	if Ro < 1200 then
		if szResult == "VICTORY" then
			return Ro + 60
		else
			return Ro
		end
	else
		local K = 0
		local W = self.tbW[szResult]
		for i=1, getn(self.tbK) do
			local pK = self.tbK[i]
			if (pK.nMin == -1 or pK.nMin <= Ro) and (pK.nMax == -1 or Ro <= pK.nMax) then
				K = pK.nValue
				break
			end	
		end
		local We = 1/(1+10^(-(Ro-Rt)/400))
		return floor(Ro + K * (W - We))
	end
end


local tbCreditsFormula = {}

tbCreditsFormula.tbBaseCredits = 
{
	LOSE = 0,
	DRAW = 3,
	VICTORY = 5,
}
tbCreditsFormula.tbExtraCredits = 
{
	{nMin = 1201,nMax = 1599, a=0.8,b=1,c=50,R=1200},
	{nMin = 1600,nMax = 1999, a=0.4,b=1,c=370,R=1600},
	{nMin = 2000,nMax = 2399, a=0.2,b=1,c=530,R=2000},
	{nMin = 2400,nMax = -1, a=0.2,b=1,c=610,R=2400},
}

function tbCreditsFormula:Calc(szResult, Rn)
	if Rn <= 1200 then
		return 0
	end
	local nCredits = self.tbBaseCredits[szResult]
	return floor(nCredits)
end

function tbCreditsFormula:CalcExtraCredits(Rn)
	local nExtraCredits = 0
	for i=1, getn(self.tbExtraCredits) do
		local p = self.tbExtraCredits[i]
		if (p.nMin == -1 or p.nMin <= Rn) and (p.nMax == -1 or Rn <= p.nMax) then
			nExtraCredits = p.b*(p.a*(Rn-p.R)+p.c)
		end	
	end
	return nExtraCredits
end

tbPlayer.TSK_GET_TITLE_FLAG = 3178
tbPlayer.PER_WEEK_COUNT = 20

function tbPlayer:GetTitleFlag()
	self:UpdatePerWeek()
	return GetTask(self.TSK_GET_TITLE_FLAG)
end

function tbPlayer:CheckState()
	local _, nValue = GetRoleEquipValue()
	
	if ST_GetOffliveState() == 1 then
		return 
	end
	if GetOnlineCommissionStatus() == 1 then
		return
	end
	if (GetStallState() == 1) then 
		return
	end
	
	return 1
end


function tbPlayer:SetRank(nRank)
	return SetTask(self.TSK_RANK, nRank)
end

function tbPlayer:AddCredits(nCredits)
	local nCurCredits = GetArenaCredits()
	local nCredits = nCurCredits + nCredits
	if nCredits > %MAX_CREDITS then
		nCredits = %MAX_CREDITS
	end
	SetArenaCredits(nCredits)
	local nDiffCredits = nCredits - nCurCredits
	tbLog:PlayerAwardLog("[arena]", "add credits", "arena credits", "", nDiffCredits)
	return nDiffCredits
end

function tbPlayer:CalcResult(nOpponentsRank, szResult)
	local nCurRank = self:GetRank()
	local nRank = %tbRankFormula:Calc(nCurRank, nOpponentsRank, szResult)
	self:SetRank(nRank)
	local nDiffRank = nRank - nCurRank
	if nDiffRank > 0 then
		Msg2Player(format("§¼ng cÊp C¶nh Kü Tr­êng cña ng­¬i t¨ng lªn %d", nDiffRank))
	elseif nDiffRank < 0 then
		Msg2Player(format("§¼ng cÊp C¶nh Kü Tr­êng cña ng­¬i gi¶m xuèng %d", -nDiffRank))
	end
	
	tbLog:PlayerAwardLog("[arena]", "add rank", "arena rank", "", nRank - nCurRank)
	if self:GetCurCount() < self.PER_WEEK_COUNT then 
		local nCredits = %tbCreditsFormula:Calc(szResult, nRank)
		local nDiffCredits = self:AddCredits(nCredits)
		Msg2Player(format("Ng­¬i nhËn ®­îc phÇn th­ëng C¶nh Kü Tr­êng lµ %d Huy Ch­¬ng", nDiffCredits))
	end
	self:AddCount(1, szResult)
end


function tbPlayer:AddVictoryCount(nCount)
	return SetTask(self.TSK_VICTORY_COUNT, GetTask(self.TSK_VICTORY_COUNT) + nCount)
end

function tbPlayer:AddDrawCount(nCount)
	return SetTask(self.TSK_DRAW_COUNT, GetTask(self.TSK_DRAW_COUNT) + nCount)
end

function tbPlayer:AddLoseCount(nCount)
	return SetTask(self.TSK_LOSE_COUNT, GetTask(self.TSK_LOSE_COUNT) + nCount)
end

-- Them phan thuong kinh nghiem, edit by ThanhLD - 20130516
function tbPlayer:AddCount(nCount, szResult)
	if szResult == "VICTORY" then
		self:AddVictoryCount(nCount)
		local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 10000000}
		tbAwardTemplet:Give(tbExpAward, 1, {"HiepKhachCanhKyTruong", "ExpThang"})
	elseif szResult == "DRAW" then
		self:AddDrawCount(nCount)
		local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 7000000}
		tbAwardTemplet:Give(tbExpAward, 1, {"HiepKhachCanhKyTruong", "ExpHoa"})
	elseif szResult == "LOSE" then
		self:AddLoseCount(nCount)
		local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 5000000}
		tbAwardTemplet:Give(tbExpAward, 1, {"HiepKhachCanhKyTruong", "ExpThua"})
	end
	self:AddCurCount(nCount)
end
function tbPlayer:UpdatePerWeek()
	local nCurCount = GetTask(self.TSK_CUR_COUNT)
	local nYW = tonumber(GetLocalDate("%Y%W"))
	if GetTask(self.TSK_CUR_WEEK) ~= nYW then
		if nCurCount >= self.PER_WEEK_COUNT then
			local nRank = self:GetRank()
			local nCredits = %tbCreditsFormula:CalcExtraCredits(nRank)
			local nDiffCredits = tbPlayer:AddCredits(nCredits)
			Msg2Player(format("Ng­¬i nhËn ®­îc phÇn th­ëng kh¸c mçi tuÇn cña C¶nh Kü Tr­êng lµ %d Huy Ch­¬ng", nDiffCredits))
		end
		SetTask(self.TSK_GET_TITLE_FLAG, 0)
		SetTask(self.TSK_CUR_COUNT, 0)
		SetTask(self.TSK_CUR_WEEK, nYW)
	end
end

function tbPlayer:AddCurCount(nCount)
	self:UpdatePerWeek()
	local nCurCount = GetTask(self.TSK_CUR_COUNT)
	SetTask(self.TSK_CUR_COUNT, nCurCount + nCount)
end

function tbPlayer:SetTitleFlag()
	self:UpdatePerWeek()
	SetTask(self.TSK_GET_TITLE_FLAG, 1)
end


tbMember = {}
function tbMember:new(nCamp)
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb.szName = GetName()
	tb.nRank = tbPlayer:GetRank()
	tb.nCamp = nCamp
	tb.nLastFightState = 0
	tb.nReceiveDamage = 0
	return tb
end

function tbMember:SyncLastState(tbLastState)
	if tbLastState then
		self.tbLastPos = tbLastState.tbPos
		self.nLastFightState = tbLastState.nFightState
	end
	self.bReady = 1
end

function tbMember:SetResult(nOppentRank, szResult)
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, tbPlayer.CalcResult, tbPlayer, nOppentRank, szResult)
	end
end

function tbMember:GoToLastPos()
	local nPlayerIndex = SearchPlayer(self.szName)
	if nPlayerIndex > 0 then
		if self.tbLastPos and getn(self.tbLastPos) == 3 then
			CallPlayerFunction(nPlayerIndex, NewWorld, unpack(self.tbLastPos))
		else
			CallPlayerFunction(nPlayerIndex, NewWorld, 20,3546,6226)
		end
	end
end