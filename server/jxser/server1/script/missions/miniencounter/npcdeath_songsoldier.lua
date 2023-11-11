Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- 副本地图
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	local tbNpcInfo = DungeonGlobalData.tbFightNpcInfo[1];				  -- Npc信息表
	local tbNpcPos  = DungeonGlobalData.tbFightNpcPos[1];				   -- Npc位置表
	local nPosRandom = random(1, getn(tbNpcPos));						   -- 获得一个随机位置
	local nX = tbNpcPos[nPosRandom][1];									 -- X坐标
	local nY = tbNpcPos[nPosRandom][2];									 -- Y坐标

	local rtotal = 10000000;
	local rcur   = random(1, rtotal);
	local rstep  = 0;

	for i = 1, getn(tbNpcInfo) do
		rstep = rstep + floor(tbNpcInfo[i].nRate * rtotal / 100);
		if(rcur <= rstep) then
			local nNpcIdx = AddNpcEx(
				tbNpcInfo[i].nNpcId,
				tbNpcInfo[i].nLevel,
				random(0, 4),
				nSubWorldIdx,
				nX * 32,
				nY * 32,
				1,
				tbNpcInfo[i].szName,
				tbNpcInfo[i].nIsBoss
			);
				
			if nNpcIdx ~= nil and nNpcIdx > 0 then
				-- 设置阵营
				SetTmpCamp(1, nNpcIdx);

				-- 设置死亡脚本
				SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_songsoldier.lua");
			end

			break;
		end
	end

	return 0;
end

function OnDeath(nNpcIndex)
	local nX, nY, nSubWorldIdx = GetNpcPos(nNpcIndex);
	local szNpcName = GetNpcName(nNpcIndex);

	AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60秒创建新NPC

	if not PlayerIndex or PlayerIndex <= 0 then
		return nil;
	end

	-- 杀NPC统计
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- 副本地图
	if tbMap ~= nil then
		local szRoleName = GetName();
		local tbKiller   = tbMap:GetPlayer(szRoleName);
		if tbKiller then
			tbKiller.nKillSoldierNum = tbKiller.nKillSoldierNum + 1;
		end
	end

	-- TODO : 掉落BUFF
	local tbDropBuffInfo = DungeonGlobalData.tbSoldierDropBuff[szNpcName];
	if tbDropBuffInfo == nil then
		print(">> Error : tbDropBuffInfo is invalid.");
		return nil;
	end

	for i = 1, tbDropBuffInfo.nTimes do
		local nRandom = random(1, 100);
		if nRandom <= tbDropBuffInfo.nRate and nRandom >= 0 then
			local nBuffNum = getn(DungeonGlobalData.tbBuff);
			local nKindRandom = random(1, nBuffNum);

			DropItem(
				nSubWorldIdx,
				nX,
				nY,
				PlayerIndex,
				DungeonGlobalData.tbBuff[nKindRandom].tbProp[1],
				DungeonGlobalData.tbBuff[nKindRandom].tbProp[2],
				DungeonGlobalData.tbBuff[nKindRandom].tbProp[3],
				1,
				0,
				0,
				0,
				0,
				0,
				0,
				0,
				0
			);
		end
	end
end
