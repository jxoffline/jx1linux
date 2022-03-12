Include("\\script\\missions\\miniencounter\\mapmanager.lua");

function OnDeath(nNpcIndex)
	local nMapId = GetWorldPos();									   -- µØÍ¼ID
	local tbMap  = EncounterMapManager.tbMapList[nMapId];			   -- ¸±±¾µØÍ¼

	-- ±»NPCºÍÍæ¼ÒÉ±ËÀ¶¼´¦ÀíµÄÂß¼­
	local szPlayerName = GetName();									 -- ±»º¦ÕßÃû×Ö
	local nPlayerCamp  = tbMap:GetCampByName(szPlayerName);			 -- ±»º¦ÕßÕóÓª
	local tbPlayer	 = tbMap:GetPlayerByCamp(nPlayerCamp, szPlayerName);
	local nX, nY	   = tbMap:GetNewWorldPos(nPlayerCamp);
	SetTempRevPos(nMapId, nX * 32, nY * 32);							-- ÉèÖÃÁÙÊ±ÖØÉúµã

	-- ËÀÍöÊ±¼ä¼ÆËã
	local nCurrentTime = GetCurrentTime();
	if nCurrentTime > tbPlayer.nLastDeadTime then
		tbPlayer.nLastDeadTime = nCurrentTime;
	end

	-- ±»Íæ¼ÒÉ±ËÀ´¦ÀíµÄÂß¼­
	local nKillerIndex = NpcIdx2PIdx(nNpcIndex);						-- Ğ×ÊÖË÷Òı
	if nKillerIndex <= 0 then
		return nil;
	end

	local szKillerName = CallPlayerFunction(nKillerIndex, GetName);	 -- Ğ×ÊÖÃû×Ö
	local nKillerCamp  = tbMap:GetCampByName(szKillerName);			 -- Ğ×ÊÖÕóÓª
	local tbKiller	 = tbMap:GetPlayerByCamp(nKillerCamp, szKillerName);

	-- ·¢Õ½³¡ĞÅÏ¢
	local strMsg = format(
		"[%s]%s kİch s¸t [%s]%s råi!",
		tbKiller:GetTitleString(),
		szKillerName,
		tbPlayer:GetTitleString(),
		szPlayerName
	);
	Msg2Map(tbMap.nMapId, strMsg);

	-- ¼ÆËã·ÖÊı
	if nKillerCamp ~= nPlayerCamp then
		-- É±ÈËÊı¼ÆËã
		tbKiller.nKillPlayerNum = tbKiller.nKillPlayerNum + 1;

		-- Á¬»÷Êı¼ÆËã
		local nValidCombo = DungeonGlobalData:GetValidCombo(tbKiller.nTitleLv, tbPlayer.nTitleLv);

		tbPlayer.nComboTimes = 0;
		tbPlayer.nCurMaxKillComboNum = 0;
		tbKiller.nComboTimes = tbKiller.nComboTimes + nValidCombo;
		tbKiller.nCurMaxKillComboNum = tbKiller.nCurMaxKillComboNum + nValidCombo;

		if tbPlayer.nMaxKillComboNum < tbPlayer.nCurMaxKillComboNum then
			tbPlayer.nMaxKillComboNum = tbPlayer.nCurMaxKillComboNum;
		end

		if tbKiller.nMaxKillComboNum < tbKiller.nCurMaxKillComboNum then
			tbKiller.nMaxKillComboNum = tbKiller.nCurMaxKillComboNum;
		end

		-- ¼Ó·Ö¿Û·Ö¼ÆËã
		local nIncreasePoint = DungeonGlobalData:GetIncreaseScorePoint(tbKiller.nTitleLv, tbPlayer.nTitleLv);
		local nDecreasePoint = DungeonGlobalData:GetDecreaseScorePoint(tbKiller.nTitleLv, tbPlayer.nTitleLv);

		-- »ù±¾»ı·Ö
		tbPlayer.nEncounterScore = tbPlayer.nEncounterScore - nDecreasePoint;
		if tbPlayer.nEncounterScore < 0 then
			tbPlayer.nEncounterScore = 0;
		end
		
		tbKiller.nEncounterScore = tbKiller.nEncounterScore + nIncreasePoint;

		-- ¼Ç»ı·ÖÈÎÎñ±äÁ¿
		tbKiller.nKillEnemyNum  = tbKiller.nKillEnemyNum + 1;
		tbPlayer.nDeathTotalNum = tbPlayer.nDeathTotalNum + 1;

		tbKiller:SetTaskValue(DungeonGlobalData.TASK_KILL_ENEMY_NUM, tbKiller.nKillEnemyNum);
		tbKiller:SetTaskValue(DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM, tbKiller.nCurMaxKillComboNum);
		tbKiller:SetTaskValue(DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM, tbKiller.nMaxKillComboNum);
		tbKiller:SetTaskValue(DungeonGlobalData.TASK_CUR_TITLE_INDEX, tbKiller.nTitleLv);

		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_DEATH_TOTAL_NUM, tbPlayer.nDeathTotalNum);
		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_CUR_KILL_COMBO_NUM, tbPlayer.nCurMaxKillComboNum);
		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_MAX_KILL_COMBO_NUM, tbPlayer.nMaxKillComboNum);
		tbPlayer:SetTaskValue(DungeonGlobalData.TASK_CUR_TITLE_INDEX, tbPlayer.nTitleLv);

		-- Á¬Õ¶»ı·Ö
		if tbKiller.nComboTimes >= 3 then
			tbKiller.nComboTimes = 0;
			tbKiller.nEncounterScore = tbKiller.nEncounterScore + 2;
			-- ·¢ĞÅÏ¢
			local strMsg = format("[%s]%sthÕ lùc kh«ng thÓ ®ì, hoµn thµnh 3 lÇn tr¶m liªn tiÕp!", tbKiller:GetTitleString(), szKillerName);
			Msg2Map(tbMap.nMapId, strMsg);
		end

		if tbMap then
			tbMap:SendFuLiTopTenData2Client();
		end
	end

	tbPlayer:RefreshTitle();
	CallPlayerFunction(nKillerIndex, tbKiller.RefreshTitle, tbKiller)

	tbPlayer:PrintInfo();
	tbKiller:PrintInfo();
end
