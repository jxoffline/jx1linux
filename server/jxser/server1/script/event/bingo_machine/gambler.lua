KING_TYPE = 5

STATE_NORMAL = 0
STATE_AWARD = 1
STATE_WAIT = 2


OVERFLOW_LEVEL = 6

Gambler ={}
Gambler.TSK_STATE = 3161
Gambler.TSK_RESULT_AWARD = 3162
Gambler.TSK_FINAL_AWARD = 3163
Gambler.TSK_ODDS = 3164
Gambler.TSK_BIG_AWARD = 3165
Gambler.TSK_TIME = 3166
function Gambler:IsFirstTime()
	local nFinalType = self:GetFinalAward()
	return nFinalType == 0
end

function Gambler:SetState(nState)
	SetTask(self.TSK_STATE, nState)
end
function Gambler:GetState()
	return GetTask(self.TSK_STATE)
end
function Gambler:SetOdds(nOdds)
	SetTask(self.TSK_ODDS, nOdds)
end

function Gambler:GetOdds()
	return GetTask(self.TSK_ODDS)
end

function Gambler:GetCurAword()
	return GetTask(self.TSK_RESULT_AWARD)
end

function Gambler:GetAword()
	return GetTask(self.TSK_FINAL_AWARD)
end

function Gambler:GetBigAward()
	return GetTask(self.TSK_BIG_AWARD)
end

function Gambler:GetTime()
	return GetTask(self.TSK_TIME)
end

function Gambler:GetFinalAward()
	local nValue = GetTask(self.TSK_FINAL_AWARD)
	return GetByte(nValue,1), GetByte(nValue,2)
end

function Gambler:SetFinalAward(nType, nLevel)
	local nValue = GetTask(self.TSK_FINAL_AWARD)
	nValue = SetByte(nValue, 1, nType)
	nValue = SetByte(nValue, 2, nLevel)
	return SetTask(self.TSK_FINAL_AWARD, nValue)
end

function Gambler:GetResult()
	local nValue = GetTask(self.TSK_RESULT_AWARD)
	return GetByte(nValue,1), GetByte(nValue,2)
end

function Gambler:SetResult(nNewType, nNewLevel)
	local nValue = GetTask(self.TSK_RESULT_AWARD)
	nValue = SetByte(nValue, 1, nNewType)
	nValue = SetByte(nValue, 2, nNewLevel)
	return SetTask(self.TSK_RESULT_AWARD, nValue)
end

function Gambler:PayCoin(nCoin)			
	Msg2Player("Chi tr¶" .. nCoin .. "Hçn Nguyªn Linh Lé")
	local nRet = ConsumeEquiproomItem(nCoin,6,1,2312,1)
	return nRet
end

function Gambler:UpdateAward(nNewType, nNewLevel)
	local nFinalType, nFinalLevel = self:GetFinalAward()
	self:SetResult(nNewType, nNewLevel)
	
	if nFinalType == 0 then
		nFinalType = nNewType
		nFinalLevel = nNewLevel
	elseif nFinalType == nNewType then
		nFinalLevel = nFinalLevel + nNewLevel
	else
		nFinalType = 0
		nFinalLevel = 0
	end
	self:SetFinalAward(nFinalType, nFinalLevel)
	
	return nFinalType, nFinalLevel
end

function Gambler:SetBigAward(nCoin)
	SetTask(self.TSK_BIG_AWARD, nCoin)
end
function Gambler:SetTime(nTime)
	return SetTask(self.TSK_TIME, nTime)
end