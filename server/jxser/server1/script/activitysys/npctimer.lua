
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\missions\\basemission\\lib.lua")

NpcTimer = tbBaseClass:new()
function NpcTimer:_init()

	self.NPC_PARAM_TYPE = 1
	self.NPC_PARAM_TIMER = 2
	self.NPC_PARAM_TEAMID = 3
	self.NPC_PARAM_PLAYER_NAME_HASH = 4
	self.NPC_PARAM_PLAYER_BORN_Timer = 5	
	self.tbNormalFun = {}
	self.tbTimeFun = {}
end

function NpcTimer:doFunByTeam(nTeamId, pFun, ...)
	local nTeamSize = GetTeamSize(nTeamId)
	for i=1, nTeamSize do
		local nPlayerIndex = GetMemberByTeamId(nTeamId, i)
		if nPlayerIndex > 0 then	
			doFunByPlayer(nPlayerIndex, pFun, unpack(arg))
		end
	end
end


function NpcTimer:OnTimer(nNpcIndex, nTimeOut)
	
--	if nTimeOut >= 10 * 60 * 18 then
--		DelNpc(nNpcIndex)
--		return 0
--	end
	
	local nTeamId = GetNpcParam(nNpcIndex, self.NPC_PARAM_TEAMID);
	local nTimer = GetNpcParam(nNpcIndex, self.NPC_PARAM_TIMER);
	local nCurTimer = nTimer + 15 + floor(nTimeOut / 18)
	
	for i=1, getn(self.tbNormalFun) do
		if type(self.tbNormalFun[i]) == "table" then
			self.tbNormalFun[i][1](self.tbNormalFun[i][2], nCurTimer, nNpcIndex)
		end
	end
	
	while (nTimer + 15 <= nCurTimer) do -- 做之前没有做的
		nTimer = nTimer + 15
		
		for i=1, getn(self.tbTimeFun) do
			if type(self.tbTimeFun[i]) == "table" then
				self.tbTimeFun[i][1](self.tbTimeFun[i][2], nTimer, nNpcIndex)
			end
		end
	end
	
	SetNpcParam(nNpcIndex, self.NPC_PARAM_TIMER, nTimer);
	SetNpcTimer(nNpcIndex, (nTimer + 15 - nCurTimer) * 18 )
	
end

function NpcTimer:RegisteNormalFun(pFun, pClass)
	
	tinsert(self.tbNormalFun, {pFun, pClass})
end

function NpcTimer:RegisteFun(pFun)
	
	tinsert(self.tbTimeFun, {pFun, pClass})
end


function NpcTimer:Create(tbNpc, nType, nMapId, nPosX, nPosY, nTime, nTimerCount)
	
	tbNpc.nTime = nTime
	tbNpc.nCurCamp = GetCurCamp()
	tbNpc.tbNpcParam = {}
	tbNpc.tbNpcParam[1] = nType
	tbNpc.tbNpcParam[2] = nTimerCount
	tbNpc.tbNpcParam[3] = GetTeam()
	tbNpc.tbNpcParam[4] = FileName2Id(GetName())
	tbNpc.tbNpcParam[5] = GetRoleCreateTimeData()
	basemission_CallNpc(tbNpc, nMapId, nPosX, nPosY )	
end