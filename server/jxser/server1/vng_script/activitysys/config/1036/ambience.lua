
tbAmbience= {}
tbAmbience.tbNpcList = {}

tbAmbience.PARAM_LIST_ID = 1
tbAmbience.PARAM_POS_ID = 2
tbAmbience.PARAM_PASSTIME_ID = 3
tbAmbience.TIME = 1 -- 计时器时间

function tbAmbience:CreateNpc(tbAmbienceNpc)
	local nNpcListSize = getn(self.tbNpcList)
	
	for i=1, getn(tbAmbienceNpc) do
		local nNpcListIndex = nNpcListSize + i
		self.tbNpcList[nNpcListIndex] = tbAmbienceNpc[i]
		local tbNpc = self.tbNpcList[nNpcListIndex]
		local tbPos = tbNpc.tbPos
		local nPosId = 1
		local nMapIndex = SubWorldID2Idx(tbNpc.nMapId)
		if nMapIndex >= 0 then
			local nNpcIndex = AddNpcEx(tbNpc.nNpcId, 1, 5, nMapIndex,tbPos[nPosId][1] * 32, tbPos[nPosId][2] * 32, 1, tbNpc.szName or " ", 0)
			if nNpcIndex > 0 then
				SetNpcKind(nNpcIndex, 4)
				SetNpcAI(nNpcIndex, 0)
				local nPosCount = getn(tbPos)
				if nPosCount > 1 then
					SetNpcActiveRegion(nNpcIndex, 1)				
					SetNpcParam(nNpcIndex, self.PARAM_POS_ID, nPosId)	
				end
				if nPosCount > 1 or tbNpc.nSkillId then	
					SetNpcParam(nNpcIndex, self.PARAM_LIST_ID, nNpcListIndex)
					SetNpcParam(nNpcIndex, self.PARAM_PASSTIME_ID, 0)
					SetNpcTimer(nNpcIndex, tbAmbience.TIME * 18)
					SetNpcScript(nNpcIndex, "\\vng_script\\activitysys\\config\\1036\\ambience.lua")
				end
			end
		end
	end
end

MAX_DIS = 10
function tbAmbience:IsArriveAt(nNpcIndex, nX, nY)
	local nX32, nY32 = GetNpcPos(nNpcIndex)

	if abs(nX - nX32/32) < MAX_DIS and abs(nY - nY32/32) < MAX_DIS then
		return 1
	end
end

function tbAmbience:Walk(nNpcIndex)
	local nNextPosId = GetNpcParam(nNpcIndex, self.PARAM_POS_ID)
	local tbNpc = self:GetNpcTable(nNpcIndex)
	local tbPos = tbNpc.tbPos
	
	if not tbNpc or nNextPosId == 0 or getn(tbPos) < 2 then
		return
	end
	
	if self:IsArriveAt(nNpcIndex, tbPos[nNextPosId][1], tbPos[nNextPosId][2]) then
		nNextPosId = mod(nNextPosId, getn(tbPos)) + 1
		SetNpcParam(nNpcIndex, self.PARAM_POS_ID, nNextPosId)
	end
	
	if tbNpc.szChat and random(1,100) <= 20 then
		NpcChat(nNpcIndex, tbNpc.szChat)
	end
	
	NpcWalk(nNpcIndex, tbPos[nNextPosId][1], tbPos[nNextPosId][2]);
end

function tbAmbience:CheckSkillTime(nNpcIndex, nTime)
	local nPassTime = GetNpcParam(nNpcIndex, self.PARAM_PASSTIME_ID) + self.TIME
	local bResult = 0
	
	if nPassTime >= nTime then
		nPassTime = nPassTime - nTime
		bResult = 1
	end
	SetNpcParam(nNpcIndex, self.PARAM_PASSTIME_ID, nPassTime)
	return bResult
end

function tbAmbience:CastSkill(nNpcIndex)
	local tbNpc = self:GetNpcTable(nNpcIndex)
	if not tbNpc then
		return
	end
	
	if self:CheckSkillTime(nNpcIndex, tbNpc.nTime) ~= 1 then
		return 
	end
	
	if tbNpc.nSkillId and random(1,100) <= tbNpc.nRate then
		local nX32, nY32 = GetNpcPos(nNpcIndex)
		NpcCastSkill(nNpcIndex, tbNpc.nSkillId, 1, nX32, nY32)
	end
end

function tbAmbience:GetNpcTable(nNpcIndex)
	local nListId = GetNpcParam(nNpcIndex, self.PARAM_LIST_ID)
	local tbNpc = self.tbNpcList[nListId]
	return tbNpc
end

function OnTimer(nNpcIndex, nTimeOut)
	local tbNpc = %tbAmbience:GetNpcTable(nNpcIndex)	
	
	%tbAmbience:Walk(nNpcIndex)
	
	if tbNpc.nTime and tbNpc.nSkillId then
	%tbAmbience:CastSkill(nNpcIndex)
	end
	
	SetNpcTimer(nNpcIndex, %tbAmbience.TIME*18)
end