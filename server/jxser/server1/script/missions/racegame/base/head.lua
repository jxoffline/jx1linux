Include("\\script\\missions\\racegame\\lib.lua")

if not tbMission then

tbMission = 
{
	nMissionId	= 0,
	tbTimer		= {},
	tbMissionV	= {MISSION_STATE	= 1,},
	tbMissionS	= {},
	nMapId		= 0,
}

end
function tbMission:Init()
	if GetMissionV(self.tbMissionV.MISSION_STATE) ~= 0 then
		self:Close()
	end
	
	for i = 1, getn(self.tbTimer) do
		StartMissionTimer(self.nMissionId, self.tbTimer[i][1], self.tbTimer[i][2]); --
	end
	
	if self.OnInit then
		self:OnInit()
	end
end

function tbMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
end

function tbMission:OnClose()
	print("tbMission:OnClose()")
end

function tbMission:Close()
	if self.OnClose then
		self:OnClose()
	end
	
	for _, nMissionVId in self.tbMissionV do		
		SetMissionV(nMissionVId, 0);
	end
	
	for _, nMissionSId in self.tbMissionS do		
		SetMissionS(nMissionSId, "")
	end
	
	for i = 1, getn(self.tbTimer) do
		StopMissionTimer(self.nMissionId, self.tbTimer[i][1], self.tbTimer[i][2]); --
	end
end

--
function tbMission:PlayerJoin(nPlayerIndex, nGroupId)
	if doFunByPlayer(nPlayerIndex, self.OnPlayerJoin, self ) == 1 then
		doFunByPlayer(nPlayerIndex, AddMSPlayer, self.nMissionId, nGroupId)
		return 1;
	end
	return 0;
end

function tbMission:OnPlayerJoin()
	print("tbMission:OnPlayerJoin()")
end


function tbMission:OnLeave()
	print("tbMission:OnLeave()")
end

function tbMission:OnTimer()
	print("tbMission:OnTimer()")
end

function tbMission:OnRun()
	print("tbMission:OnRun()")
end

function tbMission:output(szMsg)
	print(szMsg)
end

function tbMission:Debug(szMsg)
	print(szMsg)
end
------------外部调用，需要保护当前的SubWorld

--开启
function tbMission:StartGame()
	
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		if self:GetMissionV(self.tbMissionV.MISSION_STATE) ~= 0 then
			self:Debug("L莕 trc v蒼 ch璦 t総")
			self:CloseGame()
		end
		doFunInWorld(nMapIndex, OpenMission, self.nMissionId)
		return 1
	else
		self:output(format("[mission start fail]:map %d is not load", self.nMapId))
		return 0
	end	
end

--关闭
function tbMission:CloseGame()
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		doFunInWorld(nMapIndex, CloseMission, self.nMissionId )
	end
end

--让某个玩家加入
function tbMission:JoinGame(nPlayerIndex, nGroupId)
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, self.PlayerJoin, self, nPlayerIndex, nGroupId)	
	end
	return -1;
end

--离开游戏
function tbMission:LeaveGame()
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, self.OnLeave, self)	
	end
	return -1
end


function tbMission:Run()
	
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		doFunInWorld(nMapIndex, self.OnRun, self)
	end
end


function tbMission:GetMissionV(nVId)
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMissionV, nVId)
	end
	return 0
end

function tbMission:GetMissionS(nSId)
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMissionS, nSId)
	end
	return ""
end

function tbMission:SetMissionV(nVId, nValue)
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, SetMissionV, nVId, nValue)
	end
	return 0
end

function tbMission:SetMissionS(nSId, szValue)
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, SetMissionS, nSId, szValue)
	end
	return ""
end

function tbMission:GetMissionState()
	return self:GetMissionV(self.tbMissionV.MISSION_STATE)
end

function tbMission:GetMSPlayerCount(nGroupId)
	
	local nMapIndex = SubWorldID2Idx(self.nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMSPlayerCount, self.nMissionId, nGroupId)	
	end
	return -1;	
end