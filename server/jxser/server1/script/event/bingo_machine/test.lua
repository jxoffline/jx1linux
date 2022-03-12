
Include("\\script\\event\\bingo_machine\\bingo_machine_gs.lua")




function BingoMachine:Dialog()
	local handle = OB_Create()
	
	ObjBuffer:PushObject(handle, GetName())
	RemoteExecute("\\script\\event\\bingo_machine\\prize_pool.lua", 
		"PrizePool:GetCoin", handle, "BingoMachine:OnDialog")
	OB_Release(handle)
end

function BingoMachine:OnDialog(nParam, nResultHandle)
	print(self, nParam, nResultHandle)
	local szName = ObjBuffer:PopObject(nResultHandle)
	local nCoin = ObjBuffer:PopObject(nResultHandle)
	if type(szName) ~= "string" or type(nCoin) ~= "number" then
		return 
	end	
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		
		Say(format("Have %d coin in the prize pool", nCoin), 
			3, 
			"try it/#BingoMachine:OnRotate(1)",
			"get award/#BingoMachine:OnGetAward(1)",
			"bye/no")
	end
end

--nOdds, ÅâÂÊ
--n ´ÎÊý

function _Stat(nOdds,n)
	Gambler:SetBigAward(0)
	Gambler:SetState(STATE_NORMAL)
	Gambler:SetFinalAward(0, 0)
	local tbCount = {}
	for i=1, n do
		BingoMachine:OnRotate(nOdds)
		local nFinalType, nFinalLevel = Gambler:GetFinalAward()
		if nFinalType > 0 and nFinalLevel > 0 then
			tbCount[nFinalType] = tbCount[nFinalType] or {}
			tbCount[nFinalType][nFinalLevel] = tbCount[nFinalType][nFinalLevel] or 0
			tbCount[nFinalType][nFinalLevel] = tbCount[nFinalType][nFinalLevel] + nOdds
			Gambler:SetBigAward(0)
			Gambler:SetState(STATE_NORMAL)
			Gambler:SetFinalAward(0, 0)
		end
	end
	Gambler:SetBigAward(0)
	Gambler:SetState(STATE_NORMAL)
	Gambler:SetFinalAward(0, 0)
	print("lo¹i h×nh ", "®¼ng cÊp", "Sè lÇn")
	Msg2Player("Lo¹i h×nh\t §¼ng cÊp\t Sè lÇn")
	for k, v in tbCount do
		for k1, v1 in v do
			print(k, k1, v1)
			Msg2Player(format("%s\t%s\t%s", k, k1,v1))
		end
	end
	
end
--nOdds, ÅâÂÊ
--n ´ÎÊý
function _StatOverFlow(nOdds,n)
	Gambler:SetBigAward(0)
	Gambler:SetState(STATE_NORMAL)
	Gambler:SetFinalAward(0, 0)
	local nCount = 0
	for i=1, n do
		BingoMachine:OnRotate(nOdds)
		local nFinalType, nFinalLevel = Gambler:GetFinalAward()
		print(nFinalType, nFinalLevel)
		if nFinalLevel >= OVERFLOW_LEVEL or nFinalType == KING_TYPE then
			Gambler:SetBigAward(0)
			Gambler:SetState(STATE_NORMAL)
			Gambler:SetFinalAward(0, 0)			
		end
		if nFinalLevel > OVERFLOW_LEVEL then
			nCount = nCount + 1
		end
	end
	Gambler:SetBigAward(0)
	Gambler:SetState(STATE_NORMAL)
	Gambler:SetFinalAward(0, 0)
	print("Th­ëng lín", nCount)
	Msg2Player(format("Th­ëng lín\t %s", nCount))
end

function BingoTestRate(nType, nLevel, nCount)
	-- ±£´æ²âÊÔ½á¹û
	print("\nBingoTestRate type = " .. nType .. ", Level = " .. nLevel .. ", Count = " .. nCount)
	local tbItem = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0, 0}, {0, 0}, }
	
	if nType < 0 or nType > 5 or nLevel < 0 or nLevel > 5 then
		return
	end
	
	for i = 1, nCount do
		local nNewType, nNewLevel = BingoMachine:CalcResult(nType, nLevel)
		tbItem[nNewType][nNewLevel] = tbItem[nNewType][nNewLevel] + 1
	end
	
	print("BingoTestRate result:")
	
	for i = 1, getn(tbItem) do
		local tbSubItem = tbItem[i]
		local strOut = "\n"
		for j = 1, getn(tbSubItem) do
			strOut = strOut .. "\t" .. AWARD_TYPE[i] .. j .. " = " .. tbSubItem[j]
		end
		strOut = strOut .. "\n"
		print(strOut)
	end	
end

function BingoTestAddCoinCount(nCount)
	BingoMachine:Add2PrizePool(nCount)
end
function BingoTestDecCoinCount(nCount)
	BingoMachine:ApplyBigAward(GetName())
end

function BingoTestBigAward(nType, nLevel, nCount)
	-- ±£´æ²âÊÔ½á¹û
	print("\BingoTestBigAward type = " .. nType .. ", Level = " .. nLevel .. ", Count = " .. nCount)
	local tbBigAwardCount = 0
	if nType < 0 or nType > 5 or nLevel < 0 or nLevel > 5 then
		return
	end
	local nType = 0
	local nLevel = 0
	for i = 1, nCount do
		local nNewType, nNewLevel = BingoMachine:CalcResult(nType, nLevel)
		if nType == 0 then
			nType = nNewType
			nLevel = nNewLevel
		elseif nNewType == 5 or nType ~= nNewType then
			nType = 0
			nLevel = 0
		elseif nType == nNewType then
			nLevel = nLevel + nNewLevel
			if nLevel == 6 then
				nType = 0
				nLevel = 0
			elseif nLevel > 6 then
				tbBigAwardCount = tbBigAwardCount + 1
				nType = 0
				nLevel = 0
			end		
		end
	end
		
	print("BingoTestBigAward AwardCount :" .. tbBigAwardCount)
end
	