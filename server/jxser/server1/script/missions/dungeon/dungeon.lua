Include("\\script\\missions\\dungeon\\dungeoninfo.lua")
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\global\\offlinelive.lua")
Include("\\script\\missions\\basemission\\lib.lua")
--Include("\\script\\lib\\baseclass.lua")

if not tbDungeonClass then
	tbDungeonClass = tbBaseClass:new()
end

function tbDungeonClass:_init(tbDungeonData)
	if not tbDungeonData then
		return 
	end
	for i,j in tbDungeonData do
		self[i] = j
	end
end

--副本易变数据,每个副本都不一样
tbDungeonClass.tbData = {};

if not tbTimerList then
	tbTimerList = {};
end

if not tbTimerClass then
	tbTimerClass = {};
	tbTimerClass.nDungeonId = 0;
	tbTimerClass.nInterval = 0;	--帧
	tbTimerClass.nTimerId = 0;
	tbTimerClass.pFunction = nil;
	tbTimerClass.tbParam = {}
end

function OnDungeonTimer(nTimerId)
	local timer = tbTimerList[nTimerId];
	local nRetInterval = 0;
	if (timer ~= nil and timer.nDungeonId ~= nil and
		 timer.pFunction ~= nil and type(timer.pFunction) == "function" and
		 timer.nInterval ~= nil and timer.nInterval >= 1) then
		
		local tbD = tbDungeonInfo:GetDungeon(timer.nDungeonId);
		if (tbD ~= nil) then
			local tbParam = {tbD, timer.nInterval}
			if (timer.tbParam ~= nil and type(timer.tbParam) == "table") then
				for varKey, varValue in timer.tbParam do
					tinsert(tbParam, varValue);
				end
			end
			nRetInterval = call(timer.pFunction, tbParam);
			timer.nInterval = nRetInterval;
			--nRetInterval = timer.pFunction(tbD, timer.nInterval);
		end
	end
	
	if (nRetInterval == nil or nRetInterval < 1) then
		tbTimerList[nTimerId] = nil;
		nRetInterval = 0;
	end
	return nRetInterval, timer.nTimerId;
end

function tbTimerList:AddTimer(nDungeonId, tbTimer)
	if (tbTimer ~= nil and tbTimer.nInterval ~= nil and tbTimer.nInterval >= 1) then
		tbTimer.nTimerId = getn(tbTimerList) + 1;
		tbTimerList[tbTimer.nTimerId] = clone(tbTimer);
		AddTimer(tbTimer.nInterval, "OnDungeonTimer", tbTimer.nTimerId);
		return tbTimer.nTimerId;
	end
	return 0;
end

function tbTimerList:DelTimer(nTimerId)
	local timer = tbTimerList[nTimerId];
	if (timer ~= nil) then
		timer.nInterval = 0;
	end
end

-- 检查服务器是否能开一个新的副本,可重载
function tbDungeonClass:CheckOpenDungeonServerLimit()
	return 1;
end

function tbDungeonClass:OpenDungeon(tbDungeonData)
	--self:StartGame();
			
	--清除npc和道具
	ClearMapObj(self.nDungeonId);
	ClearMapNpc(self.nDungeonId);
	
	if (self.OnDungeonOpen) then
		return self:OnDungeonOpen(tbDungeonData);
	end
	return 1;
end

--要将所有玩家传出副本
function tbDungeonClass:CloseDungeon()
	for i = 1, getn(self.tbMember) do
		if (self.tbMember[i].bInDungeon == 1) then
			doFunByPlayer(self.tbMember[i].nIndex, self.OnLeaveMap, self)	
		end
	end
	
	if (self.OnDungeonClose) then
		self:OnDungeonClose();
	end
	
	--清除npc和道具
	ClearMapObj(self.nDungeonId);
	ClearMapNpc(self.nDungeonId);

	--self:CloseGame();
	return 1;
end

--function  tbDungeonClass:Timer()
--	self.nTimerCount = self.nTimerCount + self.nTimerInterval;
	
--	for i = 1, getn(self.tbMember) do
--		if (self.tbMember[i].bInDungeon == 1) then
--			self.tbMember[i].nTime = self.tbMember[i].nTime + self.nTimerInterval;
--		end
--	end
	
--	if (self.OnTimer) then
--		self:OnTimer();
--	end
	
--	return 1;
--end

-- 按需要重载
function tbDungeonClass:OnDungeonOpen()
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnDungeonClose()
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnTimer()
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnAddMember(strMemberName)
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnApplyJoin()
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnDelMember()
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnEnterMap()
	return 1;
end

-- 按需要重载
function tbDungeonClass:OnLeaveMap()
	return 1;
end

--副本模板信息
tbDungeonClass.strDungeon = "BaseDungeon"
tbDungeonClass.nTimerInterval = 1
tbDungeonClass.nTimerCount = 0
tbDungeonClass.bHiden = 0	--他人是否可见

--根据不同的Mission进行重载，必须要设置Mission_state的值
function tbDungeonClass:OnInit()
	--SetMissionV(self.tbMissionV.MISSION_STATE, 1);
end

function tbDungeonClass:OnClose()
	return self:OnDungeonClose();
end

function tbDungeonClass:CheckPlayerCanJoin()
	local strName = GetName();
	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then
					return 1;
			end
		end
	end
	return 0;
end

--玩家加入mission时需要做的处理，根据需要重载
function tbDungeonClass:OnPlayerJoin()
	local strName = GetName();

	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then
				if (self.tbMember[i].bInDungeon == 1) then
					return 1;
				end
				
				self.tbMember[i].bInDungeon = 1;
				if (self:OnEnterMap() == 1) then
					self.tbMember[i].bInDungeon = 1;
					return 1;
				else
					self.tbMember[i].bInDungeon = 0;
				end
			end
		end
	end
	WriteLog(format("[%s] [%s] enter [%s]'s %s dungeon(id:%0.f) failed.", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, 
					self.strOwner, self.strDungeon, self.nDungeonId));
	return 0;
end

--玩家离开时设置玩家状态默认参数
function tbDungeonClass:OnLeaveSetState()

	SetFightState(0);
	SetTaskTemp(200, 0);	--设置与帮会有关的变量，不允许在竞技场战改变某个帮会阵营的操作
	ForbidChangePK(0);
	DisabledUseTownP(0);	--禁止使用回程；
	SetPKFlag(0);
	SetCurCamp(GetCamp());
	DisabledStall(0);
	ForbidEnmity(0);
end

--玩家离开时设置玩家状态默认传送
function tbDungeonClass:OnLeaveTrans()

	NewWorld(11, 3143, 5065);
end

--玩家离开Mission的处理，根据需要重载
function tbDungeonClass:OnLeave()
	local strName = GetName();

	if (self.tbMember ~= nil) then
		for i = 1, getn(self.tbMember) do
			if (self.tbMember[i].strName == strName) then
				self.tbMember[i].bInDungeon = 0;
				if (self:OnLeaveMap() == 1) then
					self.tbMember[i].bInDungeon = 0;
					return 1;
				else
					self.tbMember[i].bInDungeon = 1;
					WriteLog(format("[%s] [%s] leave [%s]'s %s dungeon(id:%0.f) failed", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, 
							self.strOwner, self.strDungeon, self.nDungeonId));
					return 0;
				end
			end
			
		end
	end
	
	WriteLog(format("[%s] [%s] stuck in dungeon", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName));
	
	self:OnLeaveSetState();
	self:OnLeaveTrans();

	--WriteLog(format("[%s] [%s] leave %s dungeon failed", GetLocalDate("%Y-%m-%d %H:%M:%S"), strName, self.strDungeon));
	return 0;
end