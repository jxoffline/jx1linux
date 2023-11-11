Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\lib\\common.lua")

ExpTree = {}
ExpTree.tbTemplate = {}
ExpTree.nStartDate = 201101010000
ExpTree.nEndDate = 201301010000
ExpTree.tbMapList = {}
ExpTree.szType = "ExpTree"
ExpTree.tbNpcList = {}
ExpTree.nLimitTime = 0
ExpTree.nRate = 1
ExpTree.szScriptPath = "\\script\\missions\\exptree\\treenpc.lua"
ExpTree.tbNpcTypeList = {
	["npcname"] = 
	{
		nNpcId = 1924,
		szName = "npcname",
		nLevel = 90,
		nIsboss = 1, 
		szPosPath = "",
		nTime = 15,
	},
}
ExpTree.tbAward = {
	{nExp_tl = 1, }
}
ExpTree.tbAwardTime = {
}

function ExpTree:CheckAwardTime(nPlayerIndex)
	for i = 1, getn(self.tbAwardTime) do
		local nStartHour, nEndHour = unpack(self.tbAwardTime[i])
		local nCurHour = tonumber(GetLocalDate("%H"))
		if nStartHour <= nCurHour and nCurHour < nEndHour then
			return 1
		end
	end
	return
end

function ExpTree:CheckAwardLimit(nPlayerIndex, nTime)
	return 1
end

function ExpTree:GetRate(nPlayerIndex)
	return self.nRate
end

function ExpTree:ExecAction(nNpcIndex, nTime)
	local tbPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 15)
	for i = 1, nCount do
		local nPlayerIndex = tbPlayer[i]
		if self:CheckAwardTime(nPlayerIndex) == 1 and self:CheckAwardLimit(nPlayerIndex, nTime) == 1 then
			local nRate = self:GetRate(nPlayerIndex)
			local tbTmpAward = clone(self.tbAward)
			for j = 1, getn(tbTmpAward) do
				if tbTmpAward[j].nExp_tl then
					tbTmpAward[j].nExp_tl = tbTmpAward[j].nExp_tl * nRate
				elseif tbTmpAward[j].nExp then
					tbTmpAward[j].nExp = tbTmpAward[j].nExp * nRate
				else
					tbTmpAward[j].nCount = tbTmpAward[j].nCount or 1
					tbTmpAward[j].nCount = tbTmpAward[j].nCount * nRate
				end
			end
			CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbTmpAward, "Get ExpTree Award")
		end
	end
end

function ExpTree:GetNpcTimeInterval(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex)
	return self.tbNpcTypeList[szNpcName].nTime
end

function ExpTree:RegNpc(nNpcIndex, szType)
	self.tbNpcList[nNpcIndex] = szType
end

function ExpTree:UnRegNpc(nNpcIndex, szType)
	self.tbNpcList[nNpcIndex] = nil
end

function ExpTree:GetClassByNpcIndex(nNpcIndex)
	local szType = self.tbNpcList[nNpcIndex]
	return self:GetClassByType(szType)
end

function ExpTree:GetClassByType(szType)
	return self.tbTemplate[szType] or self
end

function ExpTree:NewTemplate(szType)
	if self.tbTemplate[szType] then
		return self.tbTemplate[szType]
	end
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	tb.szType = szType
	self.tbTemplate[szType] = tb
	return tb
end

function ExpTree:IsExpired()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if self.nEndDate and self.nEndDate <= nCurDate then
		return 1
	end
	return
end

function ExpTree:GetNextTime()
	local nCurTime = GetCurServerTime()
	local szTime = tostring(self.nStartDate)
	local nYear = tonumber(strsub(szTime, 1, 4))
	local nMonth = tonumber(strsub(szTime, 5, 6))
	local nDay = tonumber(strsub(szTime, 7, 8))
	local nHour = tonumber(strsub(szTime, 9, 10))
	local nMinute = tonumber(strsub(szTime, 11, 12))
	local nTagetTime = Tm2Time(nYear, nMonth, nDay, nHour, nMinute)
	local nTime = nTagetTime - nCurTime
	if nTime > 0 then
		return nTime
	end
	return 
end

function ExpTree:SetRefreshNpcTimer()
	if self:IsExpired() then
		return
	end
	local nTime = (self:GetNextTime()) or 1
	if nTime then
		local szFun = format("%s:OnTime", self.szType)
		AddTimer(nTime*18, szFun, 0)
	end
end

function ExpTree:OnTime()
	if self:IsExpired() then
		return 0
	end
	self:CreateAllNpc()
	return 0
end

function ExpTree:CreateANpc(szName, szPosPath)
	local tbNpc = self.tbNpcTypeList[szName]
	if (not tbNpc) or (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Create ExpTree Npc Faild!!!")
		return
	end
	tbNpc.szScriptPath = self.szScriptPath
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		local nMapId = tonumber(TabFile_GetCell(szPosPath, nRow, 1))
		local nX = tonumber(TabFile_GetCell(szPosPath, nRow, 2))
		local nY = tonumber(TabFile_GetCell(szPosPath, nRow, 3))
		self.tbMapList[nMapId] = 1
		local nNpcIndex = basemission_CallNpc(tbNpc, nMapId, nX, nY)
		if nNpcIndex and nNpcIndex > 0 then
			ExpTree:RegNpc(nNpcIndex, self.szType)
		end
	end
end

function ExpTree:CreateAllNpc()
	for key, value in self.tbNpcTypeList do
		if value.szPosPath then
			self:CreateANpc(key, value.szPosPath)
		end
	end
end

