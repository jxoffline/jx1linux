Include("\\script\\task\\150skilltask\\yuegedao\\register.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")

function pTask:CheckMissionCondition()
	local TSK_LV150_SKILL = 2885
	local YUEGE_150SKILL_TASKSTATE = 14
	local tbFactStepList = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10]=1,
		[11]=1,
	}
	local nFact = GetLastFactionNumber()
	local nFactStep = mod(GetTask(TSK_LV150_SKILL), 100)
	if nFact == nil or nFact < 0 or nFact > 11 then
		return
	end
	if nFactStep >= tbFactStepList[nFact] then
		return 1
	end
	local nYueGeStep = mod(floor(GetTask(TSK_LV150_SKILL) / 100), 100)
	if nYueGeStep >= YUEGE_150SKILL_TASKSTATE then
		return
	end
	return
end

function pTask:CheckNpcPos(nX, nY)
	local nNpcIndex = GetLastDiagNpc()
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIndex)
	if nX == nX32 and nY == nY32 then
		return 1
	end
	return
end

function pTask:CheckNpcPosFail(nX, nY)
	local nNpcIndex = GetLastDiagNpc()
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIndex)
	if nX ~= nX32 or nY ~= nY32 then
		return 1
	end
	return
end

function pTask:GotoYueGeDao()
	NewWorld(968, 1436, 3179)
	Talk(1, "", "ThuyÒn Phu: ThiÕu hiÖp cã NguyÖt Ca LÖnh ®Æc biÖt nµy, ®i t×m Vâ VÖ ®èi tho¹i tù anh ta sÏ nãi cho ng­¬i biÕt dông ®å ch©n chÝnh cña lÖnh bµi nµy.")
end

local _OnBreak = function(nNpcIndex)
	Msg2Player("Thu thËp ®øt ®o¹n")
end

local _GetAward = function(nNpcIndex, dwNpcID, nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	if nNpcIndex == nil then
		Msg2Player("Ng­¬i thu thËp thÊt b¹i.")
		return 0
	end
	
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
		Msg2Player("Ng­¬i thu thËp thÊt b¹i.")
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang kh«ng ®ñ") ~= 1 then
		return 0
	end
	
	Msg2Player("Thu thËp kÕt thóc!")
	
	local tbAward = {}
	tbAward = {
		{szName = "Thô b× v« ng«n dung khÝ", tbProp = {6, 1, 2920, 1, 0, 0}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "NhiÖm vô kü n¨ng cÊp 150 NguyÖt Ca §¶o §¶o B¸t Thô B× nhËn ®­îc ®¹o cô")
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
end 

function pTask:GetShuPi(nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcIndex = GetNpcId(nNpcIndex)
	
	Msg2Player("B¾t ®Çu thu ho¹ch")
	tbProgressBar:OpenByConfig(2, %_GetAward, {nNpcIndex, dwNpcIndex, nAddStepNum, nTaskId, szTaskName, nGotoDetailId}, %_OnBreak, {nNpcIndex})
end

local tbPool = {
	[968] = {{nX = 1448, nY = 3010, nR = 200}, 
			{nX = 1447, nY = 3012, nR = 200},
			{nX = 1447, nY = 3015, nR = 200},},
}

function pTask:IsInDistance(nX, nY, tbPosList)
	for _, tbPos in tbPosList do
		local nDis = (nX - tbPos.nX)^2 + (nY - tbPos.nY)^2
		if tbPos.nR > nDis then
			return 1
		end
	end
	return
end

function pTask:CheckPos()
	local nMapId, nX, nY = GetWorldPos()
	if nMapId ~= 968 then
		Msg2Player("H·y sö dung ®¹o cô tren NguyÖt Ca §¶o")
		return
	end
	if self:IsInDistance(nX, nY, %tbPool[968]) ~= 1 then
		Msg2Player("H·y sö dông ®¹o cô bªn c¹nh TÈy KiÕm Tr×")
		return
	end
	return 1
end

function pTask:OnTime(tbPos)
	local nX32, nY32, nMapId, nOldNpcIndex = unpack(tbPos)
	DelNpc(nOldNpcIndex)
	local tbNpc = {
		szName = "Bia §¸ KiÕm Gia", nLevel = 95, nNpcId = 1860,
		szScriptPath = "\\script\\missions\\yuegedao\\yuegedao\\shibeiex.lua",
	}
	self:CallNpcEx(tbNpc, nMapId, nX32, nY32)
end

function pTask:CallNpcEx(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = AddNpcEx(
			tbNpc.nNpcId,  --npc Id
			tbNpc.nLevel or 1,		-- µÈ¼¶
			tbNpc.nSeries or random(0,4),		-- ÎåÐÐ
			nMapIndex,	-- µØÍ¼
			nPosX,	-- X×ø±ê
			nPosY,	-- Y×ø±ê
			tbNpc.bNoRevive or 1,			-- ²»ÖØÉú
			tbNpc.szName,		-- Ãû×Ö
			tbNpc.nIsboss or 0
		)	-- ÊÇ·ñBOSS
		if nNpcIndex <= 0 then
			return nil
		end
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript)
		end
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
		if tbNpc.nTime then
			SetNpcTimer(nNpcIndex, 18*tbNpc.nTime);
		end
		if tbNpc.nCurCamp then
			SetNpcCurCamp(nNpcIndex, tbNpc.nCurCamp)
		end
		if tbNpc.tbNpcParam then
			for i =1, getn(tbNpc.tbNpcParam) do 
				if tbNpc.tbNpcParam[i] then
					SetNpcParam(nNpcIndex, i, tbNpc.tbNpcParam[i])
				end
			end
		end
		if tbNpc.pCallBack then
			tbNpc:pCallBack(nNpcIndex)
		end
		return nNpcIndex
	else
		return nil
	end
end

function pTask:ChangeNpc()
	local nNpcIndex = GetLastDiagNpc()
	local nX32, nY32, nMapIndex = GetNpcPos(nNpcIndex) 
	DelNpc(nNpcIndex)
	local tbNpc = {
		szName = "KiÕm gia", nLevel = 95, nNpcId = random(1857, 1859),
	}
	local nNewNpcIndex = self:CallNpcEx(tbNpc, SubWorldIdx2ID(nMapIndex), nX32, nY32)
	TimerList:AddTimer(self, 60 * 18, {nX32, nY32, SubWorldIdx2ID(nMapIndex), nNewNpcIndex})
	Msg2Player("ChÕ t¹o kiÕm gia")
end

function pTask:NewWorld()
	local tbWorld = DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua", "getglobal", "YueGeMiGuWorld")
	if tbWorld.nRoomCount >= tbWorld.nRoomLimit then
		Msg2Player("B¶n ®å ®· ®Çy ng­êi")
		return
	end
	tbWorld.nRoomCount = tbWorld.nRoomCount + 1
	local nRoomId = -1
	for i = 1, tbWorld.nRoomLimit do
		if tbWorld.tbRoomSet[i] == nil then
			nRoomId = i
			break
		end
	end
	if nRoomId <= 0 then
		tbWorld.nRoomCount = tbWorld.nRoomCount - 1
		Msg2Player("B¶n ®å ®· ®Çy ng­êi")
		NewWorld(959, 1566, 2836)
		return
	end
	local szPlayerName = GetName()
	tbWorld.tbPlayer2RoomId[szPlayerName] = nRoomId
	local tbNpcPos = tbWorld.tbRoomCenterPos[nRoomId]
	local tbRoomClass = DynamicExecute("\\script\\missions\\yuegedao\\yuegemigu\\yuegeroom.lua", "getglobal", "YueGeRoom")	
	NewWorld(969, tbNpcPos[1]/32, tbNpcPos[2]/32)	
	tbWorld.tbRoomSet[nRoomId] = tbRoomClass:New(szPlayerName, nRoomId, tbNpcPos)
end