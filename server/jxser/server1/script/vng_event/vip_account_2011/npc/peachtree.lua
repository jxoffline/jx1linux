Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbVNG_VipAcc_Peach then
	tbVNG_VipAcc_Peach = {}
end
tbVNG_VipAcc_Peach.nTotalTrees = 0
tbVNG_VipAcc_Peach.nInterval = 5*18
tbVNG_VipAcc_Peach.nEndTime = (3600-183*5)*18
tbVNG_VipAcc_Peach.nSearchRange = 16
tbVNG_VipAcc_Peach.tbAward = {nExp = 2011000}
tbVNG_VipAcc_Peach.tbTaskInfo =
	{
		nTaskID = 2754,
		nStartBit = 1,
		nBitCount = 10,
		nMaxValue = 183
	}
tbVNG_VipAcc_Peach.tbTreeList = {}
function tbVNG_VipAcc_Peach:addNpc()
	local nWorld, nX, nY =GetWorldPos()
	local nNpcIdx =	AddNpc(1333, 1, SubWorldID2Idx(nWorld), nX*32, nY*32, 1, format("C©y §µo[%s]", GetName()))
	self.nTotalTrees = self.nTotalTrees + 1
	self.tbTreeList[nNpcIdx] = {}
	self.tbTreeList[nNpcIdx].strOwner = GetName()
	self.tbTreeList[nNpcIdx].nStartTime = GetCurServerTime()
	self.tbTreeList[nNpcIdx].nTreeStep = 1
	AddTimer(self.nInterval, "tbVNG_VipAcc_Peach:OnTime", nNpcIdx)
end
function tbVNG_VipAcc_Peach:OnTime(nNpcIdx)
	local peachTree = self.tbTreeList[nNpcIdx]
	if not peachTree then
		return 0, 0
	end
	if peachTree.nTreeStep == 2 then
--		if nElapsedTime >= self.nEndTime then	
			DelNpc(nNpcIdx)
			self.tbTreeList[nNpcIdx] = nil			
--		end	
		return 0,0
	end
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbTaskInfo) == 1 then
		peachTree.nTreeStep = 2
		return self.nEndTime, nNpcIdx
	end
	local nOwnerIdx = SearchPlayer(peachTree.strOwner)
	if strOwnerName ~= 0 then
		local nOldPlayer = PlayerIndex;
		local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(nNpcIdx, self.nSearchRange);
		for i = 1, nPlayerCount do
			if tbAllPlayer[i] == nOwnerIdx then
				PlayerIndex = nOwnerIdx
				tbVNG_BitTask_Lib:addTask(self.tbTaskInfo, 1)
				tbAwardTemplet:GiveAwardByList(self.tbAward, "[VNG][VipAcc2011][Trång c©y ®µo]")
				PlayerIndex = nOldPlayer
				return self.nInterval, nNpcIdx
			end
		end
	end
	return self.nInterval, nNpcIdx
end