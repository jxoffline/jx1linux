Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\common.lua")

SnowmanBattle = {}
SnowmanBattle.nStartDate = 121217
SnowmanBattle.nEndDate = 130101
SnowmanBattle.szStartTime = "20121217000000"

SnowmanBattle.szKey = "EVENT_2012ChristmasDay"
SnowmanBattle.tbCampPoint = {[1]=0, [2]=0, ["nRound"]=0, ["nWinCamp"]=-1,}
SnowmanBattle.nMaxSpecialPlayer = 2
SnowmanBattle.tbSpecialPlayerCount = {[1]=0, [2]=0}
SnowmanBattle.nGameStarted = 0
SnowmanBattle.tbPlayerFull = {[1]=0, [2]=0}
SnowmanBattle.nMapId = -1
SnowmanBattle.KEY_CAMP_POINT = 1
SnowmanBattle.KEY_SPECIAL_PLAYER = 2

SnowmanBattle.tbStartTime = {
	[1015] = 1,
	[1215] = 2,
	[2035] = 3,
	[2215] = 4,
}

function SnowmanBattle:SaveResult(hParam)
	self.tbCampPoint.nWinCamp = ObjBuffer:PopObject(hParam)
	self.tbCampPoint[1] =  ObjBuffer:PopObject(hParam)
	self.tbCampPoint[2] =  ObjBuffer:PopObject(hParam)
	self:SaveResultData()
end

function SnowmanBattle:GetResult(hParam, hResult)
	if hParam and OB_IsEmpty(hParam) ~= 1 then
		local szName = ObjBuffer:PopObject(hParam)
		ObjBuffer:PushObject(hResult, szName)
	end
	ObjBuffer:PushObject(hResult, self.nGameStarted)
	ObjBuffer:PushObject(hResult, self.tbCampPoint.nRound)
	ObjBuffer:PushObject(hResult, self.tbCampPoint.nWinCamp)
	ObjBuffer:PushObject(hResult, self.tbCampPoint[1])
	ObjBuffer:PushObject(hResult, self.tbCampPoint[2])
end

function SnowmanBattle:GetMapId(hParam, hResult)
	ObjBuffer:PushObject(hResult, self.nGameStarted)
	ObjBuffer:PushObject(hResult, self.nMapId)
end

function SnowmanBattle:SetMapId(nParam, hResult)
	if OB_IsEmpty(hResult) == 1 then
		return
	end
	
	local nMapId = ObjBuffer:PopObject(hResult)
	if nMapId > 0 then
		self.nMapId = nMapId
	end
end

function SnowmanBattle:SetPlayerLimit(hParam)
	local nCamp = ObjBuffer:PopObject(hParam)
	self.tbPlayerFull[nCamp] = ObjBuffer:PopObject(hParam)
end

function SnowmanBattle:AskForEnterMap(hParam, hResult)
	local szName = ObjBuffer:PopObject(hParam)
	local nCamp = ObjBuffer:PopObject(hParam)
	ObjBuffer:PushObject(hResult, szName)
	ObjBuffer:PushObject(hResult, self.nGameStarted)
	ObjBuffer:PushObject(hResult, self.tbCampPoint.nRound)
	ObjBuffer:PushObject(hResult, self.nMapId)
	ObjBuffer:PushObject(hResult, self.tbPlayerFull[nCamp])
end

function SnowmanBattle:AskForSpecialPlayer(hParam, hResult)
	local szTargetName = ObjBuffer:PopObject(hParam)
	local szName = ObjBuffer:PopObject(hParam)
	local nCamp = ObjBuffer:PopObject(hParam)
	if self.tbSpecialPlayerCount[nCamp] then
		ObjBuffer:PushObject(hResult, szTargetName)
		ObjBuffer:PushObject(hResult, szName)
		ObjBuffer:PushObject(hResult, nCamp)
		local nResult = 0
		if self.tbSpecialPlayerCount[nCamp] < self.nMaxSpecialPlayer then
			self.tbSpecialPlayerCount[nCamp] = self.tbSpecialPlayerCount[nCamp] + 1
			self:SaveSpecialPlayer()
			nResult = 1
		end
		ObjBuffer:PushObject(hResult, nResult)
	end
end

function SnowmanBattle:GameStart(nRound)
	self:ClearResult()
	
	self.nGameStarted = 1
	self.tbCampPoint.nRound = nRound
	self.tbCampPoint.nWinCamp = -1
	
	local hParam = OB_Create()
	ObjBuffer:PushObject(hParam, nRound)
	RemoteExecute("\\script\\activitysys\\config\\2\\snowman_battle.lua", "StartNewBattle", hParam, 
									"SnowmanBattle:SetMapId", 0)
	OB_Release(hParam)
end

function SnowmanBattle:GameEnd(hParam)
	self.nGameStarted = 0
	self.nMapId = -1
end

function SnowmanBattle:ClearResult()
	self.tbCampPoint[1] = 0
	self.tbCampPoint[2] = 0
	self.tbCampPoint.nRound = 0
	self.tbCampPoint.nWinCamp = -1
	self:SaveResultData()
end

function SnowmanBattle:ClearSpecialPlayer()
	self.tbSpecialPlayerCount[1] = 0
	self.tbSpecialPlayerCount[2] = 0
	self:SaveSpecialPlayer()
end

function SnowmanBattle:LoadResultData()
	local handle = OB_Create()
	OB_LoadShareData(handle, self.szKey, self.KEY_CAMP_POINT, 1)
	if OB_IsEmpty(handle) ~= 1 then
		local nToday = tonumber(date("%y%m%d"))
		local nDate = ObjBuffer:PopObject(handle)
		if nToday == nDate then
			self.tbCampPoint.nRound = ObjBuffer:PopObject(handle)
			self.tbCampPoint.nWinCamp = ObjBuffer:PopObject(handle)
			self.tbCampPoint[1] = ObjBuffer:PopObject(handle)
			self.tbCampPoint[2] = ObjBuffer:PopObject(handle)
		else
			self:ClearResult()
		end
	end
	OB_Release(handle)
end

function SnowmanBattle:SaveResultData()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, tonumber(date("%y%m%d")))
	ObjBuffer:PushObject(handle, self.tbCampPoint.nRound)
	ObjBuffer:PushObject(handle, self.tbCampPoint.nWinCamp)
	ObjBuffer:PushObject(handle, self.tbCampPoint[1])
	ObjBuffer:PushObject(handle, self.tbCampPoint[2])
	OB_SaveShareData(handle, self.szKey, self.KEY_CAMP_POINT, 1)
	OB_Release(handle)
end

function SnowmanBattle:SaveSpecialPlayer()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, tonumber(date("%y%m%d")))
	ObjBuffer:PushObject(handle, self.tbSpecialPlayerCount[1])
	ObjBuffer:PushObject(handle, self.tbSpecialPlayerCount[2])
	OB_SaveShareData(handle, self.szKey, self.KEY_SPECIAL_PLAYER, 1)
	OB_Release(handle)
end

function SnowmanBattle:LoadSpecialPlayer()
	local handle = OB_Create()
	OB_LoadShareData(handle, self.szKey, self.KEY_SPECIAL_PLAYER, 1)
	if OB_IsEmpty(handle) ~= 1 then
		local nToday = tonumber(date("%y%m%d"))
		local nDate = ObjBuffer:PopObject(handle)
		if nToday == nDate then
			self.tbSpecialPlayerCount[1] = ObjBuffer:PopObject(handle)
			self.tbSpecialPlayerCount[2] = ObjBuffer:PopObject(handle)
		else
			self.tbSpecialPlayerCount[1] = 0
			self.tbSpecialPlayerCount[2] = 0
		end
	end
	OB_Release(handle)
end

function SnowmanBattle:OnTime()
	local nDate = tonumber(date("%y%m%d"))
	if nDate >= self.nEndDate then
		return 
	end
	
	local nCurTime = tonumber(date("%H%M"))
	if self.tbStartTime[nCurTime] then
		self:GameStart(self.tbStartTime[nCurTime])
	end
	
	if nCurTime == 0 then
		self:ClearResult()
		self:ClearSpecialPlayer()
	end
	
	return 60, 0
end

function SnowmanBattle:ShowInfo()
	OutputMsg("===========雪人大战数据情况=============")
	OutputMsg("日期: "..date("%Y%m%d"))
	OutputMsg(format("圣诞老人玩家数: [%d], [%d]", self.tbSpecialPlayerCount[1], self.tbSpecialPlayerCount[2]))
	OutputMsg(format("当前场次: [%d]", self.tbCampPoint.nRound))
	OutputMsg(format("战斗状态: [%d]", self.nGameStarted))
	OutputMsg(format("比赛结果: [%d]", self.tbCampPoint.nWinCamp))
	OutputMsg(format("阵营积分: [%d], [%d]", self.tbCampPoint[1], self.tbCampPoint[2]))
end

function AddTimerInRealDate(szDate, szCallBack, Param)
	local nLen = strlen(szDate)
	if nLen ~= 14 then
		return 0
	end
	
	if tonumber(date("%Y%m%d%H%M%S")) > tonumber(szDate) then
		return 0
	end
	
	local nNow = Tm2Time(tonumber(date("%Y")),tonumber(date("%m")),tonumber(date("%d")),
											 tonumber(date("%H")),tonumber(date("%M")),tonumber(date("%S")))
	local nTargetTime = Tm2Time(strsub(szDate,  1, 4),
															strsub(szDate,  5, 6),
															strsub(szDate,  7, 8),
														  strsub(szDate,  9,10),
														  strsub(szDate, 11,12),
														  strsub(szDate, 13,14))
	return AddTimer(nTargetTime - nNow, szCallBack, Param)
end

function SnowmanBattle:OnRelayStart()
	local nDate = tonumber(date("%y%m%d"))
	if nDate < self.nStartDate then
		AddTimerInRealDate(SnowmanBattle.szStartTime, "SnowmanBattle:OnTime", 0)
	elseif nDate < self.nEndDate then
		local nSecend = tonumber(date("%S"))
		AddTimer(60-nSecend, "SnowmanBattle:OnTime", 0)
	end
end
--function OnRelayStart()
--	SnowmanBattle:OnRelayStart()
--end
SnowmanBattle:LoadResultData()
SnowmanBattle:LoadSpecialPlayer()
SnowmanBattle:OnRelayStart()


function TestStartBattle(hParam)
	local nRound = ObjBuffer:PopObject(hParam)
	SnowmanBattle:GameStart(nRound)
end