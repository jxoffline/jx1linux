Include("\\script\\lib\\coordinate.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\caiji\\head.lua")
Include("\\script\\missions\\caiji\\member.lua")

local tbRule = Dungeon:new_type("collection rice plant")

tbRule.tbForbitItemType = 
{
	"CALLNPC",
	--"TRANSFER",
	"MATE",
	"PK"
}

function tbRule:_init()
	self.szState = "ready"
	self.tbMember = {}
	self.nAreaUseState = 0
	self.nBeginFrame = GetLoop()
	self:AddTimer(PREPARE_TIME * 18, self.OnStateTime, {self})
	self.nTotalMemberCount = 0
	ClearMapNpcWithName(self.nMapId, PLANT_LIST["green"].szName)
	ClearMapNpcWithName(self.nMapId, PLANT_LIST["yellow"].szName)	
	return 1
end

function tbRule:NewMember()	
	local tb = Member:new()
	self.tbMember[tb.szName] = tb
	return tb
end

function tbRule:OnStateTime()
	if self.szState == "ready" then
		self.szState = "run"
		self:OnRun()
		return GAME_TIME * 18
	elseif self.szState == "run" then
		self.szState = "close"
		self:close()
		return 0
	end
end

function tbRule:OnRun()
	self:Grouping()
	self:AddTimer(0, self.RefeshPlant, {self, GetLoop()})
end

function tbRule:RefeshPlant(nStartFrame)
	local nFrame = GetLoop() - nStartFrame
	local nGreenCount = 15
	
	if nFrame >= GAME_TIME * 18 then
		return 0
	end
	
	if nFrame == 300 * 18 then
		nGreenCount = 10
	elseif nFrame == 600 * 18 then
		nGreenCount = 10
	elseif nFrame == 900 * 18 then
		nGreenCount = 10
	end
	
	ClearMapNpcWithName(self.nMapId, PLANT_LIST["green"].szName)
	ClearMapNpcWithName(self.nMapId, PLANT_LIST["yellow"].szName)
	for nAreaId = 1, MAX_GROUP do
		if GetBit(self.nAreaUseState, nAreaId) == 1 then
			local szFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", nAreaId);
			local tbPosList = getndata(szFile, 15);
			for i=1, getn(tbPosList) do
				local pPos = tbPosList[i]
				local pNpc = PLANT_LIST["green"]
				if i > nGreenCount then
					pNpc = PLANT_LIST["yellow"]
				end
				pNpc.tbNpcParam = {}
				pNpc.tbNpcParam[NPC_PARAM_MAPID] = self.nMapId
				basemission_CallNpc(pNpc, self.nMapId, tbPosList[i][1], tbPosList[i][2])
			end
		end
	end
	if nFrame == 900 * 18 then
		return 0
	else
		return REFRESH_TIME * 18
	end
	
end

function tbRule:OnEnterMap()
	local szName = GetName()
	local pMember = self.tbMember[szName]
	if not pMember then
		return
	end
	self.nTotalMemberCount = self.nTotalMemberCount + 1
	SetFightState(0)
	SetMoveSpeed(10)
	PlayerHandle:SetRank(0)
	PlayerHandle:SetAwardFlag(0)
	local nFrame = PREPARE_TIME * 18 + self.nBeginFrame - GetLoop()
	Msg2Player(format("sau %s gi©y ch›nh th¯c bæt Æ«u", floor(nFrame/18)))
end

function tbRule:OnLeaveMap()
	local szName = GetName()
	local pMember = self.tbMember[szName]
	if pMember then
		self.tbMember[szName] = nil
	end
	self.nTotalMemberCount = self.nTotalMemberCount - 1
	SetFightState(0)
	SetMoveSpeed(-1)
end

function tbRule:Grouping()	
	local tbMemberList = {}
	for szName, pMember in self.tbMember do
		tinsert(tbMemberList, pMember)	
	end
	local nMemberCount = getn(tbMemberList)
	local nMaxUseGroupCount = floor(nMemberCount / MAX_GROUP_MEMBER)
	
	if nMaxUseGroupCount > MAX_GROUP then
		nMaxUseGroupCount = MAX_GROUP
	end
	for i = 1, nMemberCount do
		local nGroupId = ceil(i / MAX_GROUP_MEMBER)
		local pMember = tbMemberList[i]
		if nGroupId <= nMaxUseGroupCount then
			local nX, nY = self:GetMarchScenePos(nGroupId)
			pMember:MoveTo(nil, nX, nY)
			self.nAreaUseState = SetBit(self.nAreaUseState, nGroupId, 1)	
			pMember:AddSignUpCount(1)
		else
			pMember:Consolation()
			pMember:MoveToSignUpPlace()
		end
	end
end

function tbRule:GetReadyScenePos()
	local nPosX, nPosY = getadatatow("\\settings\\maps\\chrismas\\player.txt", 2, 15);
	return self.nMapId, floor(nPosX/32), floor(nPosY/32)
	
end

function tbRule:GetMarchScenePos(nGroupId)
	local szFile = "\\settings\\maps\\chrismas\\player.txt"
	local nPosX, nPosY = getadatatow(szFile, 8 + 8 * nGroupId, 15 + 8 * nGroupId)
	return floor(nPosX / 32), floor(nPosY / 32)
end

function tbRule:GetTotalMemberCount()	
	return self.nTotalMemberCount
end


function tbRule:OnClose()
	local tbPlayer = self:Ranking()
	local tbReport = self:MakeReport(tbPlayer)
	for i=1, getn(tbPlayer) do
		local pMember = tbPlayer[i]		
		pMember:SaveRank(i)
		pMember:SendMessage(tbReport)
		pMember:MoveToSignUpPlace()		
	end
end

function tbRule:Ranking()
	local tbPlayer = {}
	for szName, pMember in self.tbMember do
		tinsert(tbPlayer, pMember)
	end
	local pCmpFun = function (pMemberA, pMemberB)
		if pMemberA.nGroupId ~= pMemberB.nGroupId then
			return pMemberA.nGroupId < pMemberB.nGroupId
		end
		return pMemberA.nPoint >  pMemberB.nPoint
	end
	sort(tbPlayer, pCmpFun)
	return tbPlayer
end

function tbRule:AddPoint(szName, szPlantType)
	if szPlantType == "green" then
		local pMember = self.tbMember[szName]
		if pMember then
			pMember.nPoint = pMember.nPoint + 1
		end
	end
end

function tbRule:MakeReport(tbPlayer)
	local tb = {}
	tinsert(tb, "B∂ng x’p hπng")
	for i = 1, 10 do
		if not tbPlayer[i] then
			break
		end
		tinsert(tb, format("Hπng %d: <color=yellow>%s<color> - <color=yellow>%d<color> Æi”m", i,tbPlayer[i].szName, tbPlayer[i].nPoint))
	end
	return tb
end

tbRule:SetForbitItem(TEMPLATE_MAP_ID)