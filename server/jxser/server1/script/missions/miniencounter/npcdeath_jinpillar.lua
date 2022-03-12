Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function CreateNpcTimer(nSubWorldIdx)
	local nMapId = SubWorldIdx2ID(nSubWorldIdx);

	local tbNpcPos  = DungeonGlobalData.tbPillarNpcPos[2];
	local tbNpcInfo = DungeonGlobalData.tbPillarNpcInfo[2];
	local nPillarLv = 0;

	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ¸±±¾µØÍ¼
	if tbMap == nil then
		return 0;
	end

	if tbMap.nGameState == 0 or tbMap.nGameState == 1 then
		return 0;
	end

	nPillarLv	   = tbMap.nJinPillarLv + 1;
	local nTotalLv  = getn(tbNpcInfo);
	if nPillarLv > nTotalLv then
		nPillarLv = nTotalLv;
	end
	tbMap.nJinPillarLv = nPillarLv;

	local nNpcIdx = AddNpcEx(
		tbNpcInfo[nPillarLv].nNpcId,
		tbNpcInfo[nPillarLv].nLevel,
		random(0, 4),
		nSubWorldIdx,
		tbNpcPos[1][1] * 32,
		tbNpcPos[1][2] * 32,
		1,
		tbNpcInfo[nPillarLv].szName,
		tbNpcInfo[nPillarLv].nIsBoss
	);

	if nNpcIdx ~= nil and nNpcIdx > 0 then
		-- ÉèÖÃÕóÓª
		SetTmpCamp(2, nNpcIdx);

		-- ÉèÖÃËÀÍö½Å±¾
		SetNpcDeathScript(nNpcIdx, "\\script\\missions\\miniencounter\\npcdeath_jinpillar.lua");
	end

	-- Ë¢ĞÅÏ¢
	tbMap:Msg2Camp(2, "Thèng so¸i phe ta ®· dùng l¹i cê Nguyªn So¸i, hìi c¸c chiÕn sÜ h·y mau chãng ®Õn b¶o vÖ!");
	tbMap:Msg2Camp(1, "Thèng so¸i phe Kim ®· dùng l¹i cê Nguyªn So¸i, hìi c¸c chiÕn sÜ h·y mau chãng c­íp cê tr¶m t­íng!");
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
	local tbMap  = EncounterMapManager.tbMapList[nMapId];		   -- ¸±±¾µØÍ¼
	if not tbMap then
		print(">> Error : tbMap is invalid!");
		return nil;
	end

	-- Èç¹û±»NPC´òËÀ£¬ÕâÀï´¦Àí
	if not PlayerIndex or PlayerIndex <= 0 then
		tbMap.tbCampScore[1] = tbMap.tbCampScore[1] + 1;
		tbMap.tbCampScore[2] = tbMap.tbCampScore[2] - 1;
		tbMap:NotifyCurrentVSScore();

		local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
		if nJudgeResult <= 0 then									   -- »¹Î´´òµ½ÅĞ¶ÏÊ¤¸ºÌõ¼ş
			AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60Ãë´´½¨ĞÂNPC
			return nil;
		end

		tbMap:ProcessWhenFinish(nJudgeResult);
		return nil;
	end

	-- ¶áÆìÊıÍ³¼Æ
	local szRoleName = GetName();
	local tbKiller   = tbMap:GetPlayer(szRoleName);
	if tbKiller then
		tbKiller.nKillPillarNum = tbKiller.nKillPillarNum + 1;
		tbKiller.nKillEnemyPillarNum = tbKiller.nKillEnemyPillarNum + 1;
		tbKiller.nScoreGetForCamp = tbKiller.nScoreGetForCamp + 1;
	end

	-- ËÎ·½ÕóÓª»ı·Ö+1(²ß»®Ëµ²»µÃ·Ö)
	tbMap.tbCampScore[1] = tbMap.tbCampScore[1] + 1;
	-- ½ğ·½ÕóÓª»ı·Ö-1
	tbMap.tbCampScore[2] = tbMap.tbCampScore[2] - 1;
	if  tbMap.tbCampScore[2] < 0 then
		 tbMap.tbCampScore[2] = 0;
	end

	tbMap:NotifyCurrentVSScore();

	-- ¼ÇÈÎÎñ±äÁ¿
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_SCORE_TOTAL, tbKiller.nScoreGetForCamp); -- Îª¼º·½¶áÈ¡µÄ»ı·Ö
	tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_ENEMY_PILLAR_NUM, tbKiller.nKillEnemyPillarNum); -- ¶áµĞË§ÆìÊı

	-- Ë¢ĞÅÏ¢
	local strMsg = "Phe Tèng lùc l­îng hïng m¹nh, ®· tr¶m %s cê chiÕn cña phe Kim, phe Tèng ®­îc 1 ®iÓm, phe Kim mÊt 1 ®iÓm.";
	--local strMsg = "ËÎ·½ÊÆÈçÆÆÖñ£¬%sÕ¶¶ÏÁË½ğ·½µÄÕ½Æì£¬½ğ·½Ê§È¥1·Ö¡£";
	local strVSMsg = format("TØ sè ®iÓm Tèng Kim hiÖn t¹i cña 2 bªn lµ: %d:%d", tbMap.tbCampScore[1], tbMap.tbCampScore[2]);
	strMsg = format(strMsg, szRoleName);
	Msg2Map(tbMap.nMapId, strMsg);
	Msg2Map(tbMap.nMapId, strVSMsg);

	-- Á¢¼´ÅĞ¶ÏÊ¤¸º
	local nJudgeResult = tbMap:JudgeWinnerWhenKillerPillar();
	if nJudgeResult <= 0 then									   -- »¹Î´´òµ½ÅĞ¶ÏÊ¤¸ºÌõ¼ş
		AddTimer(60 * 18, "CreateNpcTimer", nSubWorldIdx);		  -- 60Ãë´´½¨ĞÂNPC
		return nil;
	end

	tbMap:ProcessWhenFinish(nJudgeResult);
end

