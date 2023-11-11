Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\common.lua")

tbSJ_WeeklyRank = {}
tbSJ_WeeklyRank.SAVE_KEY = "FUNC_SJ_WEEKLY_RANK"

tbSJ_WeeklyRank.tbRank = {}
tbSJ_WeeklyRank.nRankDate = 0
tbSJ_WeeklyRank.tbScores = {}
tbSJ_WeeklyRank.nPlayerCount = 0


function tbSJ_WeeklyRank:SaveValue(nKey1, nKey2, ...)
	local nArgs = getn(arg)
	if nArgs <= 0 then
		return
	end

	local handle = OB_Create()
	for i=1,nArgs do
		ObjBuffer:PushObject(handle, arg[i])
	end
	OB_SaveShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	OB_Release(handle)
end

function tbSJ_WeeklyRank:LoadValue(nKey1, nKey2)
	local handle = OB_Create()
	local tbReturn = {}
	OB_LoadShareData(handle, self.SAVE_KEY, nKey1, nKey2)
	
	while OB_IsEmpty(handle) ~= 1 do
		tinsert(tbReturn, ObjBuffer:PopObject(handle))
	end
	
	OB_Release(handle)
	return unpack(tbReturn)
end

function tbSJ_WeeklyRank:ClearScore()
	self.tbScores = {}
	self.nPlayerCount = 0
	self:SaveValue(0, 0, 0)
end

function tbSJ_WeeklyRank:GetRankWeek()
	return tonumber(date("%W"))
end

local _pCompare = function(tbA, tbB)
	return tbA.nScore > tbB.nScore
end

function tbSJ_WeeklyRank:UpdateRank()

	local tbNewRank = {}
	local tbTemp
	for szName, tbData in self.tbScores do
		if type(szName) == "string" then
			tbTemp = {}
			tbTemp.szName = szName
			tbTemp.nScore = tbData.nScore
			tinsert(tbNewRank, tbTemp)
		end
	end
	
	sort(tbNewRank, %_pCompare)
	
	self.tbRank = {}
	for i=1,10 do
		if tbNewRank[i] ~= nil then
			tinsert(self.tbRank, {szName=tbNewRank[i].szName, nScore=tbNewRank[i].nScore, nFlag=0})
			self:SaveValue(1, i, tbNewRank[i].szName, tbNewRank[i].nScore, 0)
		end
	end

	self.nRankDate = self:GetRankWeek()

	self:SaveValue(1, 0, getn(self.tbRank))
	self:SaveValue(2, 0, self.nRankDate)
end

function tbSJ_WeeklyRank:LoadRank()
	local nCount = self:LoadValue(1, 0) or 0
	local tbTemp
	self.tbRank = self.tbRank or {}
	
	for i=1,nCount do
		tbTemp = {}
		tbTemp.szName, tbTemp.nScore, tbTemp.nFlag = self:LoadValue(1, i)
		tinsert(self.tbRank, tbTemp)
	end
	
	self.nRankDate = self:LoadValue(2, 0) or 0;
	
end

function tbSJ_WeeklyRank:LoadScore()
	local nCount = self:LoadValue(0, 0) or 0
	local szName, nScore, nPos
	local tbTemp
	self.tbScores = self.tbScores or {}
	
	for i=1, nCount do
		szName, nScore = self:LoadValue(0, i)
		tbTemp = {}
		tbTemp.nScore = nScore
		tbTemp.nPos = i
		self.tbScores[szName] = tbTemp
	end
	
	self.nPlayerCount = nCount
end


function tbSJ_WeeklyRank:s_AddScore(hParam, hResult)
	local szName, nScore
	if OB_IsEmpty(hParam) == 1 then
		return
	end
	
	self:CheckUpdateRank()
	
	szName = ObjBuffer:PopObject(hParam)
	nScore = ObjBuffer:PopObject(hParam)
	
	if not self.tbScores[szName] then
		self.nPlayerCount = self.nPlayerCount + 1
		self.tbScores[szName] = {nScore=0, nPos = self.nPlayerCount}
		self:SaveValue(0, 0, self.nPlayerCount)
	end
	
	self.tbScores[szName].nScore = self.tbScores[szName].nScore + nScore
	self:SaveValue(0, self.tbScores[szName].nPos, szName, self.tbScores[szName].nScore)
end

function tbSJ_WeeklyRank:s_GetRank(hParam, hResult)
	if OB_IsEmpty(hParam) == 1 then
		return
	end
	
	self:CheckUpdateRank()	
	
	local szName = ObjBuffer:PopObject(hParam)
	ObjBuffer:PushObject(hResult, szName)
	
	local nCount = getn(self.tbRank)
	ObjBuffer:PushObject(hResult, nCount)
	
	for i=1, nCount do
		ObjBuffer:PushObject(hResult, self.tbRank[i].szName)
		ObjBuffer:PushObject(hResult, self.tbRank[i].nScore)
	end
end

function tbSJ_WeeklyRank:s_GetRankAward(hParam, hResult)
	if OB_IsEmpty(hParam) == 1 then
		return
	end
	
	self:CheckUpdateRank()	
	
	local szName = ObjBuffer:PopObject(hParam)
	local nFound = nil
	
	for i=1,getn(self.tbRank) do
		if (self.tbRank[i].szName == szName) then
			if self.tbRank[i].nFlag == 0 then
				nFound = i
				self.tbRank[i].nFlag = 1
				self:SaveValue(1, i, self.tbRank[i].szName, self.tbRank[i].nScore, self.tbRank[i].nFlag)
			else
				nFound = 0
			end
			break
		end
	end
	
	ObjBuffer:PushObject(hResult, szName)
	ObjBuffer:PushObject(hResult, nFound)
end

function tbSJ_WeeklyRank:CheckUpdateRank()
	local nWeek = tonumber(date("%W"))
	
	if nWeek == self.nRankDate or nWeek == 0 then
		return
	end
	
	self:UpdateRank()
	self:ClearScore()
	
end

function tbSJ_WeeklyRank:Init()
	self:LoadRank()
	self:LoadScore()
end

function tbSJ_WeeklyRank:DebugMsg(...)
	local szMsg
	
	OutputMsg("---------------------------------------------------------------------------------------")
	
	OutputMsg(format("Rank: %d", self.nRankDate))
	for i=1,getn(self.tbRank) do
		szMsg = format("%2d:  %s  %d", i, self.tbRank[i].szName, self.tbRank[i].nScore)
		OutputMsg(szMsg)
	end
	
	OutputMsg(format("Score: %d", self.nPlayerCount))
	for szName, tbData in self.tbScores do
		if type(szName) == "string" then
			szMsg = format("%s  %s  %d", szName, tbData.nScore, tbData.nPos)
			OutputMsg(szMsg)
		end
	end
	OutputMsg("---------------------------------------------------------------------------------------")
end


tbSJ_WeeklyRank:Init()