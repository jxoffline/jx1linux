Include("\\script\\lib\\baseclass.lua")
Include("\\script\\missions\\basemission\\lib.lua")
IncludeLib("SETTING")
if not tbBaseMission then
	tbBaseMission = tbBaseClass:new()
end


--类初始化，根据tbMissionData里的key和value，设置相应的key和value
function tbBaseMission:_init(tbMissionData)
	if not tbMissionData then
		return 
	end
	for i,j in tbMissionData do
		self[i] = j
	end
	
	self.TSK_MAP_ID	= 2323
	self.TSK_MAP_X	= 2324
	self.TSK_MAP_Y	= 2325
end




--Mission的初始化，只能也只在InitMission中使用
function tbBaseMission:Init()
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

--根据不同的Mission进行重载，必须要设置Mission_state的值
function tbBaseMission:OnInit()
	SetMissionV(self.tbMissionV.MISSION_STATE, 1)
end

--Mission的执行，由程序通过RunMission调用，脚本不调用
function tbBaseMission:Run()
	
--	local nMapIndex = SubWorldID2Idx(self.nMapId)
--改为以当前subworld来执行
	if SubWorld >= 0 then
		doFunInWorld(SubWorld, self.OnRun, self)
	end
end

--离开游戏，由程序通过Mission中的OnLeave调用，
function tbBaseMission:LeaveGame()
	
--	local nMapIndex = SubWorldID2Idx(self.nMapId)
--改为以当前subworld来执行
	if SubWorld >= 0 then
		return doFunInWorld(SubWorld, self.OnLeave, self)	
	end
	return -1
end

--Mission关闭时的处理，根据需要重载
function tbBaseMission:OnClose()
	print("tbBaseMission:OnClose()")
end

--无需重载
function tbBaseMission:Close()
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

--玩家加入
function tbBaseMission:PlayerJoin(nPlayerIndex, nGroupId)
	if doFunByPlayer(nPlayerIndex, self.OnPlayerJoin, self ) == 1 then
		doFunByPlayer(nPlayerIndex, AddMSPlayer, self.nMissionId, nGroupId)
		return 1;
	end
	return 0;
end

--玩家加入mission时需要做的处理，根据需要重载
function tbBaseMission:OnPlayerJoin()
	print("tbBaseMission:OnPlayerJoin()")
end


--得到玩家所在的GroupId,需根据需要重载
function tbBaseMission:GetGroupId()
	return 0	
end
--玩家离开Mission的处理，根据需要重载
function tbBaseMission:OnLeave()
	print("tbBaseMission:OnLeave()")
end

--计时器，根据需要重载
function tbBaseMission:OnTimer()
	print("tbBaseMission:OnTimer()")
end

--执行时，根据需要可以重载
function tbBaseMission:OnRun()
	print("tbBaseMission:OnRun()")
end

function tbBaseMission:output(szMsg)
	print(szMsg)
end

function tbBaseMission:Debug(...)
	call(print,arg)
end
------------外部调用，需要保护当前的SubWorld

--开启所有的地图的Mission
function tbBaseMission:StartGame()
	
	if self.tbMapId then
		for i=1, getn(self.tbMapId) do
			self:StartGameInMap(self.tbMapId[i])
		end
	elseif self.nMapId and not self.tbMapId then
		self:StartGameInMap(self.nMapId)
	end
	return 1
end
--开启某个地图的Mission
function tbBaseMission:StartGameInMap(nMapId)
	
	
	local nMapIndex = SubWorldID2Idx(nMapId)

	if nMapIndex >= 0 then
		
		
		
		if self:GetMissionV(self.tbMissionV.MISSION_STATE, nMapId) ~= 0 then
			self:Debug("B秐 "..nMapId.."的Mission上次没有关闭")
			self:CloseGameInMap(nMapId)
		end
		doFunInWorld(nMapIndex, OpenMission, self.nMissionId)
		return 1
	else
		return 0
	end
end


--关闭所有地图上的Mission
function tbBaseMission:CloseGame()
	if self.tbMapId then
		for i=1, getn(self.tbMapId) do
			self:CloseGameInMap(self.tbMapId[i])
		end
	elseif self.nMapId and not self.tbMapId then
		self:CloseGameInMap(self.nMapId)
	end
end

--关闭某个地图上的Mission
function tbBaseMission:CloseGameInMap(nMapId)
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		doFunInWorld(nMapIndex, CloseMission, self.nMissionId )
	end
end

--让某个玩家加入某个地图的Mission，
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:JoinGame(nPlayerIndex, nGroupId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, self.PlayerJoin, self, nPlayerIndex, nGroupId)	
	end
	return -1;
end

--获得某个地图的Mission Value，
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:GetMissionV(nVId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMissionV, nVId)
	end
	return 0
end
--获得某个地图的Mission String，
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:GetMissionS(nSId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMissionS, nSId)
	end
	return ""
end
--设置某个地图的Mission Value，
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:SetMissionV(nVId, nValue, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, SetMissionV, nVId, nValue)
	end
	return 0
end
--设置某个地图的Mission String，
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:SetMissionS(nSId, szValue, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, SetMissionS, nSId, szValue)
	end
	return ""
end
--得到某个地图上Mission的状态
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:GetMissionState(nMapId)
	return self:GetMissionV(self.tbMissionV.MISSION_STATE, nMapId)
end
--得到某个地图的某个组的人数
--如果nMapId是空的，那么默认为self.nMapId,
--如果是多个地图有这个mission那么一定要有 nMapId这个参数
function tbBaseMission:GetMSPlayerCount(nGroupId, nMapId)
	nMapId = nMapId or self.nMapId
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		return doFunInWorld(nMapIndex, GetMSPlayerCount, self.nMissionId, nGroupId)	
	end
	return -1;	
end

function tbBaseMission:GetLastPos()
	return GetTask(self.TSK_MAP_ID), GetTask(self.TSK_MAP_X), GetTask(self.TSK_MAP_Y)
end

function tbBaseMission:SetLastPos(nMapId, nX, nY)
	
	SetTask(self.TSK_MAP_ID, nMapId)
	SetTask(self.TSK_MAP_X, nX)
	SetTask(self.TSK_MAP_Y, nY)
end
