Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);
	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[3];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[3];

	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ¸±±¾µØÍ¼
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[1].nNpcId,
		tbNpcInfo[1].nLevel,
		random(0, 4),
		nSubWorldIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[1].szName,
		tbNpcInfo[1].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ÉèÖÃËÀÍö½Å±¾
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_middlepillar.lua");
	end

	-- Ë¢ĞÅÏ¢
	Msg2Map(tbMap.nMapId, "Cê Rång xuÊt hiÖn! H·y mau chãng tranh ®o¹t!");

	return 0;
end

-- nNpcIndexÎªËÀÍönpcµÄË÷Òı£¬Íæ¼ÒË÷ÒıÖ±½ÓÊ¹ÓÃPlayerIndex
function OnDeath(nNpcIndex)
	local nX, nY, nSubWorldIdx = GetNpcPos(nNpcIndex);
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);

	local nNpcCamp = GetTmpCamp(nNpcIndex);
	local nOppNpcCamp = 0;
	if nNpcCamp == 1 then
		nOppNpcCamp = 2;
	else
		nOppNpcCamp = 1;
	end

	-- ÇåËã»ı·Ö
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ¸±±¾µØÍ¼
	if not tbMap then
		print(">> Error : tbMap is invalid!");
		return nil;
	end

	-- Èç¹û±»NPC´òËÀ£¬ÕâÀï´¦Àí
	if not PlayerIndex or PlayerIndex <= 0 then
		tbMap.tbCampScore[nNpcCamp] = tbMap.tbCampScore[nNpcCamp] + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
		tbMap:NotifyCurrentVSScore();

		local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
		if nJudgeResult <= 0 then									   -- »¹Î´´òµ½ÅĞ¶ÏÊ¤¸ºÌõ¼ş
			AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60Ãë´´½¨ĞÂNPC
			return nil;
		end

		tbMap:ProcessWhenFinish(nJudgeResult);
		return nil;
	end

	local szKillerName = GetName();									 -- Ğ×ÊÖÃû×Ö
	if not szKillerName then
		print(">> Error : szKillerName is invalid!");
		return nil;
	end

	local nKillerIndex = SearchPlayer(szKillerName);
	if not nKillerIndex then
		print(">> Error : nKillerIndex is invalid!");
		return nil;
	end

	-- ¶áÆìÊıÍ³¼Æ 
	local tbKiller = tbMap:GetPlayer(szKillerName);
	if tbKiller then
		tbKiller.nKillPillarNum = tbKiller.nKillPillarNum + 1;					  -- ×Ü¶áÆìÊı
		tbKiller.nKillMiddlePillarNum = tbKiller.nKillMiddlePillarNum + 1;		  -- ¶áÈ¡ÁúÆìÊı
		tbKiller.nScoreGetForCamp = tbKiller.nScoreGetForCamp + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
	end

	local nKillerCamp  = tbMap:GetCampByName(szKillerName);			 -- Ğ×ÊÖÕóÓª

	local nOpponentCamp = -1;
	if nKillerCamp == 1 then
		nOpponentCamp = 2;
	else
		nOpponentCamp = 1;
	end

	-- ²ß»®Ëµ£ºÉ±ÊÖµÄÕóÓªµÃ·Ö£¬¶ÔÃæµÄÕóÓª²»¿Û·Ö
	tbMap.tbCampScore[nKillerCamp]   = tbMap.tbCampScore[nKillerCamp] + DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;

--	tbMap.tbCampScore[nOpponentCamp] = tbMap.tbCampScore[nOpponentCamp] - DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR;
--	if  tbMap.tbCampScore[nOpponentCamp] < 0 then
--		 tbMap.tbCampScore[nOpponentCamp] = 0;
--	end

	tbMap:NotifyCurrentVSScore();

	-- ¼ÇÈÎÎñ±äÁ¿
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_SCORE_TOTAL, tbKiller.nScoreGetForCamp); -- Îª¼º·½¶áÈ¡µÄ»ı·Ö
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_MIDDLE_PILLAR_NUM, tbKiller.nKillMiddlePillarNum); -- ¶áÈ¡Ë§ÆìÊıÁ¿
	-- Ë¢ĞÅÏ¢
	local strMsg = "Phe %s, %s ®· c­íp ®­îc cê Rång. Phe %s ®­îc %d ®iÓm, tæng ®iÓm %d ®iÓm";
	local strVSMsg = format("TØ sè ®iÓm Tèng Kim hiÖn t¹i cña 2 bªn lµ: %d:%d", tbMap.tbCampScore[1], tbMap.tbCampScore[2]);
	strMsg = format(
		strMsg,
		DungeonGlobalData.tbCampName[nKillerCamp],
		szKillerName,
		DungeonGlobalData.tbCampName[nKillerCamp],
		DungeonGlobalData.SCORE_KILL_MIDDLE_PILLAR,
		tbMap.tbCampScore[nKillerCamp]
	);
	Msg2Map(tbMap.nMapId, strMsg);
	Msg2Map(tbMap.nMapId, strVSMsg);

	-- Á¢¼´ÅĞ¶ÏÊ¤¸º
	local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
	if nJudgeResult <= 0 then										   -- »¹Î´´òµ½ÅĞ¶ÏÊ¤¸ºÌõ¼ş
		AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);			  -- 60Ãë´´½¨ĞÂNPC
		return nil;
	end

	tbMap:ProcessWhenFinish(nJudgeResult);
end



