--Ä¬ÈÏÈ«¾ÖPlayerIndexÎªÎïÆ·ËùÓÐÕß
--nNpcIndex ËÀÍöµÄnpcµÄµÄNpcIndex
--nAttackerIndex ×îºóÒ»»÷Õß µÄNpcIndex£¬ÈçÊÇÈËÐèÒª×ª»»Index
IncludeLib("NPCINFO")

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")



NpcFunLib = {}

function NpcFunLib:Hide(nTime, nNpcIndex)
	
	if nNpcIndex < 0 or nTime < 0 then
		return
	end
	
	HideNpc(nNpcIndex, nTime);
end

function NpcFunLib:CheckInMap(szMapList, nNpcIndex)
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	
	
	if type(szMapList) == "number" and szMapList == nMapId then
		return 1
	end
	if lib:CheckInList(szMapList, nMapId) then
		return 1
	end
	

end

function NpcFunLib:CheckNpcSeries(szSeries, nNpcIndex)
	local nCurSeries = NPCINFO_GetSeries(nNpcIndex)
	
	if lib:CheckInList(szSeries, nCurSeries) then
		return 1
	end

end


function NpcFunLib:CheckInMapCopy(szMapList, nNpcIndex)
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2MapCopy(nMapIndex)
								 
	if type(szMapList) == "number" and szMapList == nMapId then
		return 1
	end
	if lib:CheckInList(szMapList, nMapId) then
		return 1
	end
	
end
function NpcFunLib:CheckId(szIdList, nNpcIndex)
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)	
	if lib:CheckInList(szIdList, nSettingIdx) then
		return 1
	end
end


function NpcFunLib:CheckDroprateFile(szDroprateFile, nNpcIndex)
	local szNpcDroprateFile = GetNpcDropRateFile(nNpcIndex)
	
	return szNpcDroprateFile == szDroprateFile
end

function NpcFunLib:CheckMapDroprateFile(szDroprateFile, nNpcIndex)
	local _, _, nMapIndex = GetNpcPos(nNpcIndex)
	local szNpcDroprateFile = GetMapDropRateFile(nMapIndex)
	
	return szNpcDroprateFile == szDroprateFile
end


function NpcFunLib:CheckNormalMonster(szLevelList, nNpcIndex)
	
	if GetNpcPowerType(nNpcIndex) ~= 1 then
		return nil
	end
	
	local tbLevel = lib:GetListTable(szLevelList)
	
	for i=1, getn(tbLevel) do
		local szDroprateFile = format("\\settings\\droprate\\npcdroprate%d.ini", tbLevel[i])
		if self:CheckMapDroprateFile(szDroprateFile, nNpcIndex) then
			return 1
		end
	end
end

function NpcFunLib:CheckNpcPower(nPowerType, nNpcIndex)
	local nNpcPower = GetNpcPowerType(nNpcIndex)
	if nNpcPower < 1 then
		return nil
	end
	
	if (nNpcPower == nPowerType) then
		return 1
	end
	
end


function NpcFunLib:CheckWorldBoss(nNpcIndex)
	
	
	local szScript = GetNpcScript(nNpcIndex)
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
	
	if szScript and (szScript == "\\script\\missions\\boss\\bossdeath.lua" or szScript == "\\script\\missions\\boss\\bigboss_npc.lua" or szScript == "\\script\\global\\npc\\huoke.lua")then
		
		if self:CheckId("1194,1195,1198,1199,1201,1202,1200,1197,1196,1193,566,740,1366,582,568,744,583,563,562,747,739,1365,741,742,743,567,745,565,1367,1368,1505,1506,1507,1508,1509,1584", nNpcIndex) then
			return 1
		end
	end
	if nSettingIdx == 748 then
		return 1
	end
	if nSettingIdx == 1382 or nSettingIdx == 1383 then
		
		return 1
	end
end



function NpcFunLib:CheckKillerdBoss(nTaskLevel, nNpcIndex)

	local szScript = GetNpcScript(nNpcIndex)
	
	
	if szScript and szScript == "\\script\\task\\tollgate\\killer\\kill_level.lua" then
		local Uworld1082 = GetTask(1082)
		local nNpcSign = GetNpcParam( nNpcIndex, 1 );
		if Uworld1082 >= 1 and Uworld1082 <= 160 and Uworld1082 == nNpcSign then
			if (nTaskLevel - 20) * 2 + 1 <= Uworld1082 and Uworld1082 <= (nTaskLevel - 20) * 2 + 20 then
				return 1
			end
		end
		
	end
end


function NpcFunLib:CheckBoatBoss(nNpcIndex)
	local szScript = GetNpcScript(nNpcIndex)
	
	if szScript and (szScript == "\\script\\global\\bossscript.lua" or szScript == "\\script\\misc\\boss\\callbossdeath.lua") then
		return nil
	end
	local szIdList = "725"
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)	
	if lib:CheckInList(szIdList, nSettingIdx) then
		return 1
	end
end

function NpcFunLib:CheckName(szName, nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	if lib:CheckInList(szName, szNpcName) then
		return 1
	end

end

function NpcFunLib:IsContainName(szName, nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex)
	
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	if strfind(szNpcName,szName) then
		return 1
	end
end

function NpcFunLib:IsInXinshoucun(nNpcIndex)
	local szMapList = "174,121,153,101,99,100,20,53,175"
	return self:CheckInMap(szMapList, nNpcIndex)
end

function NpcFunLib:IsInCity(nNpcIndex)
	local szMapList = "11,1,37,,176,162,78,80"
	return self:CheckInMap(szMapList, nNpcIndex)
end

function NpcFunLib:IsInXinshouCity(nNpcIndex)
	local szMapList = "11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53,175"
	return self:CheckInMap(szMapList, nNpcIndex)
end

function NpcFunLib:CheckNpcLevel(szLevel, nNpcIndex)
	
	local nNpcLevel = NPCINFO_GetLevel(nNpcIndex)
	
	if lib:CheckInList(szLevel, nNpcLevel) then
		return 1
	end
end

function NpcFunLib:DropSingleItem(szBuff, nCount, szRate, nNpcIndex)
	
	local szLogTitle = "Ho¹t ®éng chØ r¬i 1 vËt phÈm"
	local nTotalRate = 1000000
	local nRate = tonumber(szRate) * nTotalRate / 100
	if random(1, nTotalRate) <= nRate then
		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, lib:ParseAward(szBuff), szLogTitle, nCount)
	end
end

function NpcFunLib:DropAward(nAwardTableId, nCount, nNpcIndex)
	local szLogTitle = "R¬i phÇn th­ëng ho¹t ®éng"
	
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, lib:ParseAwardTable(nAwardTableId), szLogTitle, nCount)
end

function NpcFunLib:AddObjNpc(szNpcName, nNpcId, tbNpcPos, szLuaFile)
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		
		local nMapIndex = SubWorldID2Idx(pPos[1])
		if nMapIndex >= 0 then
			local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, pPos[2] * 32, pPos[3] * 32, 0, szNpcName);
			SetNpcScript(nNpcIndex, szLuaFile);	
		end		
	end
end

function NpcFunLib:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)	
	self:AddObjNpc(szNpcName, nNpcId, tbNpcPos, "\\script\\activitysys\\npcdailog.lua")
end

function NpcFunLib:AddFightNpc(tbNpcInfo, tbNpcPos)	
	local szLua = "\\script\\missions\\basemission\\lib.lua"
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		DynamicExecute(szLua, "basemission_CallNpc", tbNpcInfo, pPos[1], pPos[2] * 32, pPos[3] * 32)
	end
end

--function NpcFunLib:Call(nNpcId, szName, nLevel, nSeries, bIsBoss, bIsReBorn, szPos,szScript,nTime,tbNpcParam)
--
--	local nMapId, nPosX, nPosY = lib:Split(szPos,",")
--	
--	nMapId	= tonumber(nMapId)
--	nPosX	= tonumber(nPosX)
--	nPosY	= tonumber(nPosY)
--	local nMapIndex = SubWorldID2Idx(nMapId)	
--	
--end