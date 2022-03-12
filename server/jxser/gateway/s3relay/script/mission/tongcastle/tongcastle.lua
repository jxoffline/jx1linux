Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\lib\\common.lua")

tbS3TongCastle = {}

tbS3TongCastle.tbTreeLifeTime = {
	[1] = {
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {18,00},
		tbEndTime = {25,00},
	},
	[2] = {
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {20,00},
		tbEndTime = {25,00},
	},
	
	[3] = {
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {23,40},
		tbEndTime = {25,00},
	},
}

tbS3TongCastle.tbMapList = {
	[978] = {1, 1, 1,},
	[979] = {2, 1, 11,},
	[980] = {3, 1, 162,},
	[981] = {4, 2, 37,},
	[982] = {5, 1, 78,},
	[983] = {6, 1, 80,},
	[984] = {7, 2, 176,},
}
tbS3TongCastle.tbTreePrice = {
	[1] = {
		nSum = 10000,
		[1] = 300,
		[2] = 700,
		[3] = 3600,
	},
	[2] = {
		nSum = 15000,
		[1] = 450,
		[2] = 1050,
		[3] = 5400,
	},
}

tbS3TongCastle.SAVE_KEY = "MISSION_tongcastle"
-- 1 = "treepoint"
-- 2 = "npc:tree"
-- 3 = "npcreload"
-- 4 = "tongname"

function tbS3TongCastle:GetTreeLifeTime(nTreeType)
	local tbOpenDay = self.tbTreeLifeTime[nTreeType].tbOpenDay
	if not tbOpenDay then
		return
	end
	
	local nWeekDay = tonumber(date("%w"))
	local nLastWeekDay = nWeekDay - 1
	if nLastWeekDay == -1 then
		nLastWeekDay = 6
	end
	
	if (not tbOpenDay[nWeekDay]) and (not tbOpenDay[nLastWeekDay]) then
		return
	end
	
	local nCurTime = tonumber(date("%H"))*60 + tonumber(date("%M"))
	local tbStartTime = self.tbTreeLifeTime[nTreeType].tbStartTime
	local tbEndTime = self.tbTreeLifeTime[nTreeType].tbEndTime
	local nStartTime = tbStartTime[1]*60 + tbStartTime[2]
	local nEndTime = tbEndTime[1]*60 + tbEndTime[2]
	
	if tbOpenDay[nLastWeekDay] and (nCurTime <= nEndTime - 1440) then
		return nStartTime-1440, nEndTime-1440
	end
	
	if tbOpenDay[nWeekDay] then
		return nStartTime, nEndTime
	end
end

function tbS3TongCastle:IsTreeInLifeTime(nTreeType)
	local nCurTime = tonumber(date("%H"))*60 + tonumber(date("%M"))
	local nStartTime,nEndTime = self:GetTreeLifeTime(nTreeType)
	if nStartTime and nEndTime then
		return (nStartTime <= nCurTime) and (nCurTime < nEndTime), nStartTime, nEndTime
	end
end

function tbS3TongCastle:Msg2Tong(ParamHandle)
	local nMsgCount = ObjBuffer:PopObject(ParamHandle)
	local szTongName = ObjBuffer:PopObject(ParamHandle)
	for i = 1, nMsgCount do
		local szMsg = ObjBuffer:PopObject(ParamHandle)
		Msg2Tong(szTongName, szMsg)
	end
end

function tbS3TongCastle:AddTreePoint(nMapId, szTongName, nNpcParam)
	local nFullFlag = 0
	local nType = self.tbMapList[nMapId][2]
	local nPrice = self.tbTreePrice[nType][nNpcParam]
	local nTongId = GetTongIDByName(szTongName)
	if nTongId == nil then
		return
	end
	local nDate = tonumber(date("%Y%m%d"))
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, 1, nTongId)
	if OB_IsEmpty(handle) == 1 then
		ObjBuffer:PushObject(handle, 1)
		ObjBuffer:PushObject(handle, nPrice)
		ObjBuffer:PushObject(handle, szTongName)
		ObjBuffer:PushObject(handle, nDate)
		ObjBuffer:PushObject(handle, nPrice)
	else
		local nFlag = ObjBuffer:PopObject(handle)
		local nSumCount = ObjBuffer:PopObject(handle)
		local szLastTongName = ObjBuffer:PopObject(handle)
		local nLastDate = ObjBuffer:PopObject(handle)
		local nAttackPoint = ObjBuffer:PopObject(handle)
		if nLastDate ~= nDate then
			nAttackPoint = 0
		end
		if nAttackPoint + nPrice > 25000 then
			nFullFlag = 1
			nPrice = nPrice - (nAttackPoint + nPrice - 25000)
		end
		
		if szLastTongName ~= szTongName then
			nSumCount = nPrice
			nAttackPoint = nPrice
		else
			nSumCount = nSumCount + nPrice
			nAttackPoint = nAttackPoint + nPrice
		end
		ObjBuffer:PushObject(handle, 1)
		ObjBuffer:PushObject(handle, nSumCount)
		ObjBuffer:PushObject(handle, szTongName)
		ObjBuffer:PushObject(handle, nDate)
		ObjBuffer:PushObject(handle, nAttackPoint)
	end
	OB_SaveShareData(handle, self.SAVE_KEY, 1, nTongId)
	OB_Release(handle)
	if nPrice > 0 then
		Msg2Tong(szTongName, format("®iÓm thÇn méc bang héi ng­¬i nhËn ®­îc %d ", nPrice))
	end
	if nFullFlag == 1 then
		Msg2Tong(szTongName, "®iÓm thÇn méc bang héi ng­¬i nhËn ®­îc h«m nay ®· v­ît qu¸ giíi h¹n")
	end
end

function tbS3TongCastle:LoadTreePoint(szTongName)
	local nSumTreePoint = 0
	local nAttackPoint = 0
	local nDate = tonumber(date("%Y%m%d"))
	local nTongId = GetTongIDByName(szTongName)
	if nTongId == nil then
		return 0, 0, nDate
	end
	
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, 1, nTongId)
	if OB_IsEmpty(handle) ~= 1 then
		local nFlag = ObjBuffer:PopObject(handle)
		nSumTreePoint = ObjBuffer:PopObject(handle)
		local szTmpTongName = ObjBuffer:PopObject(handle)
		nDate = ObjBuffer:PopObject(handle)
		nAttackPoint = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return nSumTreePoint, nAttackPoint, nDate
end

function tbS3TongCastle:TestGetTreePoint(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local szTongName = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint, nAttackPoint, nDate = self:LoadTreePoint(szTongName)
	local szMsg = format("tæng ®iÓm:%d,%d ®iÓm c«ng kÝch nhËn ®­îc trong ngµy %d", nSumTreePoint, nDate, nAttackPoint)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, szMsg)
	RemoteExecute("\\script\\missions\\tongcastle\\guideperson.lua", "ResHaha", handle)
	OB_Release(handle)
end

function tbS3TongCastle:SaveTreePoint(szTongName, nSumTreePoint, nAttackPoint, nDate)
	local nTongId = GetTongIDByName(szTongName)
	if nTongId == nil then
		return
	end
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, 1)
	ObjBuffer:PushObject(handle, nSumTreePoint)
	ObjBuffer:PushObject(handle, szCityName)
	ObjBuffer:PushObject(handle, nDate)
	ObjBuffer:PushObject(handle, nAttackPoint)
	OB_SaveShareData(handle, self.SAVE_KEY, 1, nTongId)
	OB_Release(handle)
	return
end


function tbS3TongCastle:DelTreePoint(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nPrice = ObjBuffer:PopObject(ParamHandle)
	local nCount = ObjBuffer:PopObject(ParamHandle)
	local nType = ObjBuffer:PopObject(ParamHandle)
	local szTongName = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint, nAttackPoint, nDate = self:LoadTreePoint(szTongName)
	local nResCount = 0
	if nSumTreePoint >= nPrice*nCount then
		nResCount = nCount
		self:SaveTreePoint(szTongName, nSumTreePoint-nPrice*nCount, nAttackPoint, nDate)
	end 
	
	local ResHandle = OB_Create()
	ObjBuffer:PushObject(ResHandle, szPlayerName)
	ObjBuffer:PushObject(ResHandle, nMapId)
	ObjBuffer:PushObject(ResHandle, nResCount)
	ObjBuffer:PushObject(ResHandle, nType)
	RemoteExecute("\\script\\missions\\tongcastle\\guideperson.lua", "GiveTreeToken", ResHandle)
	OB_Release(ResHandle)
end

function tbS3TongCastle:GetCurTreePoint(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local szTongName = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint = self:LoadTreePoint(szTongName)

	local ResHandle = OB_Create()
	ObjBuffer:PushObject(ResHandle, szPlayerName)
	ObjBuffer:PushObject(ResHandle, nMapId)
	ObjBuffer:PushObject(ResHandle, nSumTreePoint)
	RemoteExecute("\\script\\missions\\tongcastle\\guideperson.lua", "ExchangeDialog", ResHandle)
	OB_Release(ResHandle)
end

function tbS3TongCastle:TestGetCurTreePoint(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local szTongName = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint = self:LoadTreePoint(szTongName)
	local ResHandle = OB_Create()
	ObjBuffer:PushObject(ResHandle, szPlayerName)
	ObjBuffer:PushObject(ResHandle, nSumTreePoint)
	RemoteExecute("\\script\\missions\\tongcastle\\guideperson.lua", "TestShowTreePoint", ResHandle)
	OB_Release(ResHandle)
end

function tbS3TongCastle:GetLastDayTreePoint(nMapId, nTreeType)
	local handle = OB_Create()
	local nScore = 0
	OB_LoadShareData(handle, self.SAVE_KEY, 2, nMapId)
	if OB_IsEmpty(handle) ~= 1 then
		local nCount = ObjBuffer:PopObject(handle)
		local nType = self.tbMapList[nMapId][2]
		for i = 1, nCount do
			local nNpcParam = ObjBuffer:PopObject(handle)
			local nX = ObjBuffer:PopObject(handle)
			local nY = ObjBuffer:PopObject(handle)
			local nDir = ObjBuffer:PopObject(handle)
			if nNpcParam >= 1 and nNpcParam <= 3 and nTreeType == nNpcParam then
				nScore = nScore + self.tbTreePrice[nType][nNpcParam]
			end
		end
	end
	OB_Release(handle)
	return nScore
end

function tbS3TongCastle:CalOneCityTreePoint(nMapId, nTreeType)
	local nWeek = tonumber(date("%w"))
	local nDate = tonumber(date("%Y%m%d"))
	local nCityType = self.tbMapList[nMapId][2]
	local nCityId = self.tbMapList[nMapId][1]
	local szCityName = GetCityOwner(nCityId)
	local nTongId = GetTongIDByName(szCityName)
	if nTongId == nil then
		return
	end
	
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, 1, nTongId)
	if OB_IsEmpty(handle) == 1 then
		ObjBuffer:PushObject(handle, 0) -- µÚÒ»´Î²»¼ÆËã
		ObjBuffer:PushObject(handle, self.tbTreePrice[nCityType].nSum)
		ObjBuffer:PushObject(handle, szCityName) 
		ObjBuffer:PushObject(handle, nDate) 
		ObjBuffer:PushObject(handle, 0) 
		OB_SaveShareData(handle, self.SAVE_KEY, 1, nTongId)
	else
		local nFlag = ObjBuffer:PopObject(handle)
		local nSumTreePoint = ObjBuffer:PopObject(handle)
		local szTmpTongName = ObjBuffer:PopObject(handle)
		local nLastDate = ObjBuffer:PopObject(handle)
		local nLastAttack = ObjBuffer:PopObject(handle)
		local nAddTreePoint = 0
		if nWeek ~= 5 then
			nAddTreePoint = self:GetLastDayTreePoint(nMapId, nTreeType)
		end
		ObjBuffer:PushObject(handle, 1)
		ObjBuffer:PushObject(handle, nSumTreePoint+nAddTreePoint)
		ObjBuffer:PushObject(handle, szCityName) 
		ObjBuffer:PushObject(handle, nLastDate) 
		ObjBuffer:PushObject(handle, nLastAttack) 
		OB_SaveShareData(handle, self.SAVE_KEY, 1, nTongId)
	end
	OB_Release(handle)
end

function tbS3TongCastle:CalAllTreePoint(nTreeType)
	for nMapId, tb in self.tbMapList do
		self:CalOneCityTreePoint(nMapId, nTreeType)
	end
end

function tbS3TongCastle:DelAllTreeData(nTreeType)
	for nMapId, tb in self.tbMapList do
		if type(nMapId) == "number" then
			local nRet,tbData = self:LoadTreeData(nMapId)
			for i=1,getn(tbData) do
				if (not nTreeType) or tbData[i].nNpcParam == nTreeType then
					self:DelTreeData(nMapId, tbData[i])
				end
			end
		end
	end
end

function tbS3TongCastle:LoadTreeData(nMapId)
	local tbRes = {}
	local nRet = 0
	local handle = OB_Create()
	OB_LoadShareData(handle, self.SAVE_KEY, 2, nMapId)
	if OB_IsEmpty(handle) ~= 1 then
		nRet = 1
		local nCount = ObjBuffer:PopObject(handle)
		for i = 1, nCount do
			local nNpcParam = ObjBuffer:PopObject(handle)
			local nX = ObjBuffer:PopObject(handle)
			local nY = ObjBuffer:PopObject(handle)
			local nDir = ObjBuffer:PopObject(handle)
			tinsert(tbRes, {nNpcParam = nNpcParam, nX = nX, nY = nY, nDir = nDir,})
		end
	end
	OB_Release(handle)
	return nRet, tbRes
end

function tbS3TongCastle:SaveNpcData(ParamHandle)
	local nCount = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nRet, tbRes = self:LoadTreeData(nMapId)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nCount + getn(tbRes))
	for i = 1, nCount do
		local nNpcParam = ObjBuffer:PopObject(ParamHandle)
		local nX = ObjBuffer:PopObject(ParamHandle)
		local nY = ObjBuffer:PopObject(ParamHandle)
		local nDir = ObjBuffer:PopObject(ParamHandle)
		self:PushANpcData(handle, {nNpcParam = nNpcParam, nX = nX, nY = nY, nDir = nDir,})
	end
	for i = 1, getn(tbRes) do
		self:PushANpcData(handle, tbRes[i])
	end
	OB_SaveShareData(handle, self.SAVE_KEY, 2, nMapId)
	OB_Release(handle)
end

function tbS3TongCastle:Date2Time(nDate)
	local nYear = floor(nDate/10000)
	local nMD = mod(nDate, 10000)
	local nMonth = floor(nMD/100)
	local nDay = mod(nMD, 100)
	return Tm2Time(nYear, nMonth, nDay)
end

function tbS3TongCastle:SaveReloadNpcFlag(nExCallNpcFlag, nMapId)
	local SaveHandle = OB_Create()
	local nDate = tonumber(date("%Y%m%d"))
	ObjBuffer:PushObject(SaveHandle, nDate)
	ObjBuffer:PushObject(SaveHandle, nExCallNpcFlag)
	ObjBuffer:PushObject(SaveHandle, "test")
	OB_SaveShareData(SaveHandle, self.SAVE_KEY, 3, nMapId)
	OB_Release(SaveHandle)
end

function tbS3TongCastle:PushANpcData(handle, tbRes)
	ObjBuffer:PushObject(handle, tbRes.nNpcParam)	
	ObjBuffer:PushObject(handle, tbRes.nX)	
	ObjBuffer:PushObject(handle, tbRes.nY)
	ObjBuffer:PushObject(handle, tbRes.nDir)	
end

function tbS3TongCastle:CheckIsChangeTong(nMapId)
	local LoadHandle = OB_Create()
	local szTongName = ""
	OB_LoadShareData(LoadHandle, self.SAVE_KEY, 4, nMapId)
	if OB_IsEmpty(LoadHandle) ~= 1 then
		szTongName = ObjBuffer:PopObject(LoadHandle)	
	end

	local szCityOwner, _ = GetCityOwner(self.tbMapList[nMapId][1])
	ObjBuffer:PushObject(LoadHandle, szCityOwner)
	OB_SaveShareData(LoadHandle, self.SAVE_KEY, 4, nMapId)
	OB_Release(LoadHandle)
	if (szTongName == szCityOwner) then
		return
	end
	return 1
end

function tbS3TongCastle:SendTreeToGS(hParam, hResult)
	local nMapId = ObjBuffer:PopObject(hParam)
	local nRet,tbData = self:LoadTreeData(nMapId)
	local tbLive = {}
	for i=1,getn(tbData) do
		if self:IsTreeInLifeTime(tbData[i].nNpcParam) then
			tinsert(tbLive, {nNpcParam = tbData[i].nNpcParam, nX = tbData[i].nX, nY = tbData[i].nY, nDir = tbData[i].nDir})
		else
			self:DelTreeData(nMapId, tbData[i])
		end
	end
	
	local nCount = getn(tbLive)
	ObjBuffer:PushObject(hResult, nCount)
	for i=1,nCount do
		self:PushANpcData(hResult, tbLive[i])
	end
end

function tbS3TongCastle:DelTreeData(nMapId, tbTreeData)
	local nRet, tbRes = self:LoadTreeData(nMapId)
	local tbLive = {}
	if nRet == 1 then
		for i = 1, getn(tbRes) do
			if (tbRes[i].nNpcParam ~= tbTreeData.nNpcParam
					or tbRes[i].nX ~= tbTreeData.nX
					or tbRes[i].nY ~= tbTreeData.nY
					or tbRes[i].nDir ~= tbTreeData.nDir) then
				tinsert(tbLive, tbRes[i])
			end
		end
		
		local nCount = getn(tbLive)
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, nCount)
		for i=1, nCount do
			self:PushANpcData(handle, tbLive[i])
		end
		OB_SaveShareData(handle, self.SAVE_KEY, 2, nMapId)
		OB_Release(handle)
	end
end

function tbS3TongCastle:DelOneTreeData(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local tbTreeData = {}
	tbTreeData.nNpcParam = ObjBuffer:PopObject(ParamHandle)
	tbTreeData.nX = ObjBuffer:PopObject(ParamHandle)
	tbTreeData.nY = ObjBuffer:PopObject(ParamHandle)
	tbTreeData.nDir = ObjBuffer:PopObject(ParamHandle)
	local szTongName = ObjBuffer:PopObject(ParamHandle)
	
	self:DelTreeData(nMapId, tbTreeData)
	
	if szTongName and szTongName ~= "" and 1 <= tbTreeData.nNpcParam and tbTreeData.nNpcParam <= 3 then
		self:AddTreePoint(nMapId, szTongName, tbTreeData.nNpcParam)
	end
end

function tbS3TongCastle:CheckAndReviveTree()
	local nCurTime = tonumber(date("%H"))*60 + tonumber(date("%M"))
	local nWeekday = tonumber(date("%w"))
	
	for i=1,getn(self.tbTreeLifeTime) do
		local tbWeekAndTime = self.tbTreeLifeTime[i]
		local nStartTime = tbWeekAndTime.tbStartTime[1]*60 + tbWeekAndTime.tbStartTime[2]
		if tbWeekAndTime.tbOpenDay[nWeekday] and nStartTime == nCurTime then
			OutputMsg(format("TreeNpcRevive, type[%d].",i))
			local handle = OB_Create()
			local nTreeType = i
			ObjBuffer:PushObject(handle, nTreeType)
			RemoteExecute("\\script\\missions\\tongcastle\\tongcastle.lua", "TongCastle:TreeNpcRevive", handle)
			OB_Release(handle)
		end
	end
end

function tbS3TongCastle:CheckAndDeleteTree()
	local nCurTime = tonumber(date("%H"))*60 + tonumber(date("%M"))
	local nWeekday = tonumber(date("%w"))
	for i=1,getn(self.tbTreeLifeTime) do
		local nStartTime, nEndTime = self:GetTreeLifeTime(i)
		if nEndTime and nCurTime == nEndTime then
			self:CalAllTreePoint(i)
			self:DelAllTreeData(i)
			local handle = OB_Create()
			ObjBuffer:PushObject(handle, i)
			RemoteExecute("\\script\\missions\\tongcastle\\tongcastle.lua", "TongCastle:TreeLifeTimeOver", handle)
			OB_Release(handle)
		end
	end
end

function tbS3TongCastle:CheckAndDeleteGuard()
	for nMapId,_ in self.tbMapList do
		if type(nMapId) == "number" then
			if self:CheckIsChangeTong(nMapId) then
				local handle = OB_Create()
				ObjBuffer:PushObject(handle, nMapId)
				RemoteExecute("\\script\\missions\\tongcastle\\tongcastle.lua", "TongCastle:ClearGuardNpc", handle)
				OB_Release(handle)
			end
		end
	end
	
	
	
end

function tbS3TongCastle:TestShowTreeLive()
	for nMapId,_ in self.tbMapList do
		if type(nMapId) == "number" then
			local nRet,tbTreeData = self:LoadTreeData(nMapId)
			OutputMsg(format("Map[%d] has %d tree", nMapId, getn(tbTreeData)))
		end
	end
end

function TestShowTreeLive()
	tbS3TongCastle:TestShowTreeLive()
end
