Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\global\\autoexec_head.lua");
Include("\\script\\missions\\basemission\\lib.lua");
Include("\\script\\missions\\basemission\\dungeon.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")


EncounterMap = Dungeon:new_type("miniencounter");		   -- Éú³É·ûÀë³åÍ»Õ½¸±±¾ÀàĞÍ
--EncounterMap.nTemplateMapID = 975;						  -- µ¥ÈËPVPµØÍ¼Ä£°åID£¬²âÊÔÓÃ
EncounterMap.nTemplateMapID = 988;						  -- ·ûÀë³åÍ»Õ½µØÍ¼Ä£°åID

-- EncounterMap:_init
-- ÖØÔØDungeon:_initº¯Êı
function EncounterMap:_init(...)

	self.tbCamp = {};					 -- ÕóÓª
	self.tbCamp[1] = {};				  -- ÕóÓª£ºËÎ
	self.tbCamp[2] = {};				  -- ÕóÓª£º½ğ

	self.tbCampScore = {};				-- ÕóÓª»ı·Ö
	self.tbCampScore[1] = 0;			  -- ËÎ·½ÕóÓª»ı·Ö
	self.tbCampScore[2] = 0;			  -- ½ğ·½ÕóÓª»ı·Ö


	self.nGameStartTime = 0;			  -- ±ÈÈü¿ªÊ¼Ê±¼ä
	-- 0 - ³õÊ¼»¯×´Ì¬£¬1 - ×¼±¸³¡µÈ´ı¿ªÊ¼×´Ì¬£¬2 - ±ÈÈüÖĞ×´Ì¬£¬3 - ±ÈÈü½áÊø×´Ì¬
	self.nGameState = 0;

	self.nSongPillarLv = 1;			   -- ËÎ·½Öù×ÓµÈ¼¶£¬Ã¿É±ËÀÒ»´Î£¬ÉÏÉıÒ»¸öµÈ¼¶£¬µ½×î¶¥¼¶²»ÔÙÉÏÉı
	self.nJinPillarLv  = 1;			   -- ½ğ·½Öù×ÓµÈ¼¶£¬Ã¿É±ËÀÒ»´Î£¬ÉÏÉıÒ»¸öµÈ¼¶£¬µ½×î¶¥¼¶²»ÔÙÉÏÉı
	self.nResult	   = 0;			   -- 0 - Æ½¾Ö£¬1 - ËÎ·½Ê¤Àû£¬2 - ½ğ·½Ê¤Àû

	self.tbCurPlayerNum = {};
	self.tbCurPlayerNum[1] = 0;		   -- µ±Ç°ËÎ·½ÔÚ³¡ÈËÊı
	self.tbCurPlayerNum[2] = 0;		   -- µ±Ç°½ğ·½ÔÚ³¡ÈËÊı

	-- ¸¨ÖúÊı¾İ
	self.nCountSecond  = DungeonGlobalData.MAP_WAIT_COUNT_SECOND;		-- ÓÃÓÚ¿ªÆôÕ½¶·Ç°µ¹Êı
	self.nNoticeCount  = 3;											  -- ÌáÊ¾Èı´Î£¬ÕæÌØÃ´µ°ÌÛ
	self.nCeaseCountSecond = DungeonGlobalData.MAP_WAIT_COUNT_SECOND;	-- ÓÃÓÚ½áÊøÕ½¶·Ç°µ¹Êı

	-- ´´½¨NPC
	local tbNpcList = DungeonGlobalData.tbNonFightNpcPos;
	for i = 1, getn(tbNpcList) do
		basemission_CallNpc(tbNpcList[i], self.nMapId)
	end

	DungeonGlobalData:CreatePillarNpc(self.nMapId);
	return 1;
end

-- ¾²Ì¬º¯Êı
function EncounterMap:GetNewWorldPos(nCamp)
	--return 1583, 3231;				-- µ¥ÈËPVPÍ¼²âÊÔ×ø±ê
	if nCamp == 1 then				  -- ËÎ·½
		return 1633, 3418;
	elseif nCamp == 2 then
		return 1857, 3115;
	end

	return 1633, 3418;				  -- ·¢ËÍ´íÎó£¬¾ÍÎŞ¼äµÀ°É
end

function EncounterMap:AddMapTrap_S(nMapId, nPosX, nPosY, szScriptFile)
	if SubWorldID2Idx(nMapId) ~= -1 then
		AddMapTrap(nMapId, nPosX, nPosY, szScriptFile);
	end
end

function EncounterMap:Msg2Camp(nCamp, strMsg)
	if nCamp == nil then
		return nil;
	end

	if nCamp > 2 or nCamp < 1 then
		return nil;
	end

	if strMsg == nil then
		return nil;
	end

	local tbCampMembers = self.tbCamp[nCamp];
	local nCampNum	  = getn(tbCampMembers);

	for i = 1, nCampNum do
		local nPlayerIndex = SearchPlayer(tbCampMembers[i].szRoleName);
		if nPlayerIndex ~= nil and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, Msg2Player, strMsg);
		end
	end

	return 1;
end

-- ¶¯Ì¬º¯Êı
function EncounterMap:CreateBattleNpc()
	DungeonGlobalData:CreateFightNpc(self.nMapId);
	return 1;
end

function EncounterMap:GetCampByName(szRoleName)
	if szRoleName == nil then
		return -1;
	end

	local nCamp1Num = getn(self.tbCamp[1]);
	local nCamp2Num = getn(self.tbCamp[2]);

	for i = 1, nCamp1Num do
		local tbPlayer = self.tbCamp[1][i];
		if tbPlayer.szRoleName == szRoleName then
			return 1;
		end
	end

	for i = 1, nCamp2Num do
		local tbPlayer = self.tbCamp[2][i];
		if tbPlayer.szRoleName == szRoleName then
			return 2;
		end
	end

	return -1;
end

function EncounterMap:GetPlayer(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tbSongCamp = self.tbCamp[1];
	local nSongNum   = getn(tbSongCamp);
	for i = 1, nSongNum do
		if tbSongCamp[i].szRoleName == szRoleName then
			return tbSongCamp[i];
		end
	end

	local tbJinCamp = self.tbCamp[2];
	local nJinNum   = getn(tbJinCamp);
	for i = 1, nJinNum do
		if tbJinCamp[i].szRoleName == szRoleName then
			return tbJinCamp[i];
		end
	end

	return nil;
end

function EncounterMap:GetPlayerByCamp(nCamp, szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local tbCamp = self.tbCamp[nCamp];
	local nCampNum = getn(tbCamp);

	for i = 1, nCampNum do
		if tbCamp[i].szRoleName == szRoleName then
			return tbCamp[i];
		end
	end
	return nil;
end

function EncounterMap:StartWait()
	-- ¿ªÊ¼µÈ´ı´¥·¢Æ÷
	local nNextTriggerTime = DungeonGlobalData.MAP_WAIT_TIME - DungeonGlobalData.MAP_WAIT_COUNT_SECOND;
	--local nNextTriggerTime = 1;

	if not self then
		print(">> Error : self is nil");
		return
	end

	self:AddTimer(nNextTriggerTime * 18, self.WaitTimer, {self});		   -- µÈ´ı´¥·¢Æ÷
	self:AddTimer(1 * 18, self.NoticeTimer, {self});						-- ÏûÏ¢´¥·¢Æ÷
	self:AddTimer(60 * 18, self.StopWhenNobodyTimer, {self});			   -- Ã»ÈË½áÊø±ÈÈü´¥·¢Æ÷
	self:AddTimer(50 * 18, self.SyncBattleTimer, {self});				   -- ¶¨ÆÚÏò¿Í»§¶ËÍ¬²½
	return 1;
end

function EncounterMap:StartFight()
	local nNextTriggerTime = 120;										   -- 2·ÖÖÓºó´¥·¢

	if not self then
		print(">> Error : self is nil");
		return
	end

	self:AddTimer(nNextTriggerTime * 18, self.CeaseTimer, {self});

	return 1;
end

function EncounterMap:SyncBattleTimer()
	self:NotifyCurrentVSScore();
	return 45 * 18;
end

function EncounterMap:CeaseTimer()
	if not self then
		print(">> Error : self is nil")
		return
	end

	-- Ã¿Á½·ÖÖÓË«·½ÕóÓª¸÷×ÔÔö¼Ó1·Ö(ÈÏÎªÍ¬Ò»Ê±¿Ì°Ñ¶Ô·½Æì×ÓÉ±ËÀ)
	self.tbCampScore[1] = self.tbCampScore[1] + 1;
	self.tbCampScore[2] = self.tbCampScore[2] + 1;

	self:NotifyCurrentVSScore();

	local strVSMsg = format("TØ sè ®iÓm Tèng Kim hiÖn t¹i cña 2 bªn lµ: %d:%d", self.tbCampScore[1], self.tbCampScore[2]);
	Msg2Map(self.nMapId, "Phe Kim t­íng sÜ khİ thÕ hµo hïng, phe Kim nhËn ®­îc 1 ®iÓm.");
	Msg2Map(self.nMapId, "Phe Tèng t­íng sÜ khİ thÕ hµo hïng, phe Tèng nhËn ®­îc 1 ®iÓm.");
	Msg2Map(self.nMapId, strVSMsg);

	local nJudgeResult = self:JudgeWinnerWhenKillerPillar();
	if nJudgeResult > 0 then											-- ±ÈÈü½áÊø
		self:ProcessWhenFinish(nJudgeResult);
		return 0;
	end

	-- Èç¹û³¬¹ıÕ½¶·Ê±¼ä£¬×ÔÈ»½áÊø
	local nEndTime = self.nGameStartTime + DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME;
	if GetCurrentTime() >= nEndTime then
		self:AddTimer(1 * 18, self.CeaseCountTimer, {self});
		return 0;
	end

	return 120 * 18;													-- Ã¿2·ÖÖÓ´¥·¢Ò»´Î
end

function EncounterMap:CeaseCountTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end
	
	-- µ¹Êı
	if DungeonGlobalData.MAP_WAIT_COUNT_SECOND == self.nCeaseCountSecond then
		local strMsg = "Phï Li Xung §ét ChiÕn s¾p kÕt thóc, c¸c chiÕn sÜ chuÈn bŞ ngõng chiÕn!";
		Msg2Map(self.nMapId, strMsg);
		strMsg = format("Thêi gian cßn %d gi©y kÕt thóc", self.nCeaseCountSecond);
		Msg2Map(self.nMapId, strMsg);
	elseif self.nCeaseCountSecond > 0 then
		local strMsg = format("Thêi gian cßn %d gi©y kÕt thóc", self.nCeaseCountSecond);
		Msg2Map(self.nMapId, strMsg);
	else
		local strMsg = "Trêi ®· dÇn tèi ®i, 2 bªn ®ang thu binh, sau nµy ®Êu tiÕp!";
		Msg2Map(self.nMapId, strMsg);
	end

	self.nCeaseCountSecond = self.nCeaseCountSecond - 1;
	if self.nCeaseCountSecond < 0 then
		local nJudgeResult = self:JudgeWinnerWhenTimeOut();
		self:ProcessWhenFinish(nJudgeResult);
		return 0;
	end

	return 1 * 18;
end

function EncounterMap:NoticeTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end

	local strMsg = format("Cßn %d phót Phï Li Xung §ét ChiÕn sÏ khëi ®éng, mäi ng­êi h·y chuÈn bŞ!", self.nNoticeCount);
	Msg2Map(self.nMapId, strMsg);

	self.nNoticeCount = self.nNoticeCount - 1;	
	if self.nNoticeCount <= 0 then
		return 0;
	end

	return 60 * 18;
end

function EncounterMap:WaitTimer()
	if not self then
		print(">> Error : self is nil");
		return
	end

	-- µ¹Êı
	if DungeonGlobalData.MAP_WAIT_COUNT_SECOND == self.nCountSecond then
		local strMsg = "Phï Li Xung §ét ChiÕn s¾p b¾t ®Çu, mäi ng­êi h·y chuÈn bŞ!";
		Msg2Map(self.nMapId, strMsg);
		strMsg = format("Thêi gian chuÈn bŞ cßn l¹i %d gi©y", self.nCountSecond);
		Msg2Map(self.nMapId, strMsg);
	elseif self.nCountSecond > 0 then
		local strMsg = format("Thêi gian chuÈn bŞ cßn l¹i %d gi©y", self.nCountSecond);
		Msg2Map(self.nMapId, strMsg);
	else
		local strMsg = "TiÕng trèng ®· vang lªn, hìi c¸c dòng sÜ x«ng lªn!";
		self.nGameState = 2;
		self:AddTraps();
		self:CreateBattleNpc();
		Msg2Map(self.nMapId, strMsg);
	end

	self.nCountSecond = self.nCountSecond - 1;	
	if self.nCountSecond < 0 then
		self:StartFight();
		return 0;
	end

	return 1 * 18;
end

function EncounterMap:GetPlayerNumInGameByCamp(nCamp)
	if nCamp == nil or nCamp < 1 or nCamp > 2 then
		return nil;
	end

	local nPlayerInGameNum = 0;
	for i = 1, getn(self.tbCamp[nCamp]) do
		local tbPlayer = self.tbCamp[nCamp][i];
		if tbPlayer.nPlayerInMap == 1 then
			nPlayerInGameNum = nPlayerInGameNum + 1;
		end
	end

	return nPlayerInGameNum;
end

function EncounterMap:KickOutAllPlayer()
	local tbSongCamp = self.tbCamp[1];
	local tbJinCamp  = self.tbCamp[2];

	for i = 1, getn(tbSongCamp) do
		local tbPlayer = tbSongCamp[i];
		if tbPlayer ~= nil then
			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				-- Çå¿ÕËùÓĞÈÎÎñ±äÁ¿
				CallPlayerFunction(nPlayerIndex, tbPlayer.ClearAllTaskValue, tbPlayer);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then
					CallPlayerFunction(nPlayerIndex, NewWorld, 325, 1540, 3177);
				end
			end
		end
	end

	for i = 1, getn(tbJinCamp) do
		local tbPlayer = tbJinCamp[i];
		if tbPlayer ~= nil then
			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);
			if nPlayerIndex ~= nil and nPlayerIndex > 0 then
				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				-- Çå¿ÕËùÓĞÈÎÎñ±äÁ¿
				CallPlayerFunction(nPlayerIndex, tbPlayer.ClearAllTaskValue, tbPlayer);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then	
					CallPlayerFunction(nPlayerIndex, NewWorld, 325, 1570, 3085);
				end
			end
		end
	end
end

function EncounterMap:GiveAwardWhenBattleFinish(nCamp, nExploitBase)
	if nCamp == nil or nCamp < 1 or nCamp > 2 then
		return nil;
	end

	if nExploitBase == nil or nExploitBase < 0 then
		print(">> Error : nExploitBase is invalid!");
		return nil;
	end

	local tbCamp = self.tbCamp[nCamp];
	if tbCamp == nil then
		print(">> Error : tbCamp is invalid!");
		return nil;
	end

	for i = 1, getn(tbCamp) do
		local tbPlayer = tbCamp[i];
		if tbPlayer ~= nil then

			local szRoleName   = tbPlayer.szRoleName;
			local nPlayerIndex = SearchPlayer(szRoleName);

			if nPlayerIndex ~= nil and nPlayerIndex > 0 then

				local nPlayerMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos);
				if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then

					if tbPlayer.nKillPlayerNum > 3 or tbPlayer.nKillSoldierNum > 15 or tbPlayer.nKillPillarNum > 1 then

						-- ¹¦Ñ«Öµ
						local nFn = DungeonGlobalData:GetFnByTitle(tbPlayer.nTitleLv);
						local nGn = tbPlayer:IsDoubleScore();
						local nExploitValue = nExploitBase * (1 + nFn + nGn);

						local nCurrentExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE
						);
						local nCurrentTotalExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE
						);
						local nCurrentWeekExploit = CallPlayerFunction(
							nPlayerIndex,
							GetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE
						);

						if nCurrentWeekExploit + nExploitValue > DungeonGlobalData.MAX_EXPLOIT_VALUE then
							local nAdd = DungeonGlobalData.MAX_EXPLOIT_VALUE - nCurrentWeekExploit;
							if nAdd < 0 then
								nAdd = 0;
							end
							nCurrentTotalExploit = nCurrentTotalExploit + nAdd;	 -- ÀúÊ·×Ü¹¦Ñ«
							nCurrentExploit	  = nCurrentExploit	  + nAdd;	 -- Íæ¼Ò¹¦Ñ«
							nCurrentWeekExploit  = nCurrentWeekExploit  + nAdd;	 -- Ã¿ÖÜ»ñµÃµÄ¹¦Ñ«
						else
							nCurrentTotalExploit = nCurrentTotalExploit + nExploitValue;
							nCurrentExploit	  = nCurrentExploit	  + nExploitValue;
							nCurrentWeekExploit  = nCurrentWeekExploit  + nExploitValue;
						end
						
						
						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("TrËn Phï Li Xung §ét ChiÕn nµy ng­¬i nhËn ®­îc %d ®iÓm c«ng hu©n Tèng Kim ", nExploitValue)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("Phï Li Xung §ét ChiÕn tuÇn nµy ng­¬i nhËn ®­îc %d ®iÓm tİch lòy c«ng hu©n Tèng Kim ", nCurrentWeekExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("C«ng hu©n Tèng Kim hiÖn t¹i cã thÓ dïng lµ %d ®iÓm", nCurrentExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("LŞch sö ®iÓm tİch lòy c«ng hu©n Tèng Kim nhËn ®­îc trong Phï Li Xung §ét ChiÕn lµ %d ®iÓm", nCurrentTotalExploit)
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_TASK_VALUE,
							nCurrentExploit
						);
						
						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_HISTORY_EXPLOIT_TASK_VALUE,
							nCurrentTotalExploit
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_EXPLOIT_PER_WEEK_TASK_VALUE,
							nCurrentWeekExploit
						);

						CallPlayerFunction(
							nPlayerIndex,
							SetTask,
							DungeonGlobalData.PLAYER_WEEK_EXPLOIT_TIME_TASK,
							tonumber(GetLocalDate("%W"))
						);

						-- »ı·ÖÖµ
						local nCurrentPoint = CallPlayerFunction(
								nPlayerIndex,
								GetTask,
								DungeonGlobalData.PLAYER_POINTS_TASK_VALUE
						);
						if (self.nResult == 2 and tbPlayer.nCamp == 1) or	   -- ËÎ·½»ñÊ¤
						   (self.nResult == 3 and tbPlayer.nCamp == 2) then	 -- ½ğ·½»ñÊ¤

							local nPointValue = tbPlayer.nEncounterScore;
							nCurrentPoint = nCurrentPoint + nPointValue;
							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("TrËn Phï Li Xung §ét ChiÕn nµy ng­¬i nhËn ®­îc ®iÓm tİch lòy Tèng Kim lµ %d ®iÓm.", nPointValue)
							);

							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("TuÇn nµy Phï Li Xung §ét ChiÕn ®iÓm tİch lòy Tèng Kim nhËn ®­îc lµ %d ®iÓm.", nCurrentPoint)
							);

							CallPlayerFunction(
								nPlayerIndex,
								SetTask,
								DungeonGlobalData.PLAYER_POINTS_TASK_VALUE,
								nCurrentPoint
							);
							tbPlayer.nCurrentPoint = nCurrentPoint;
						else
							CallPlayerFunction(
								nPlayerIndex,
								Msg2Player,
								format("TrËn Phï Li Xung §ét ChiÕn nµy ng­¬i thÓ hiÖn kh«ng tèt, kh«ng nhËn ®­îc ®iÓm tİch lòy Tèng Kim.", nCurrentPoint)
							);
							tbPlayer.nCurrentPoint = nCurrentPoint;
						end -- if self.nResult == 2 then
					else
						CallPlayerFunction(
							nPlayerIndex,
							Msg2Player,
							format("TrËn Phï Li Xung §ét ChiÕn nµy ng­¬i thÓ hiÖn kh«ng tèt, kh«ng nhËn ®­îc ®iÓm tİch lòy Tèng Kim.", nCurrentPoint)
						);
					end -- if tbPlayer.nKillPlayerNum > 3 or tbPlayer.nKillSoldierNum > 15 or tbPlayer.nKillPillarNum > 1 then
				end -- if nPlayerMapId ~= nil and nPlayerMapId == self.nMapId then
			end -- if nPlayerIndex ~= nil and nPlayerIndex > 0 then
		end -- if tbPlayer ~= nil then
	end -- for i = 1, getn(tbCamp) do
end

function EncounterMap:StopWhenNobodyTimer()
	local nSongPlayerInGameNum = self:GetPlayerNumInGameByCamp(1);
	local nJinPlayerInGameNum  = self:GetPlayerNumInGameByCamp(2);

	-- µÈ´ıÊ±ºòÃ»ÈË£¬µ¯³öÍæ¼Ò£¬½áÊøÕ½¶·
	if (GetCurrentTime() - self.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME or self.nGameState == 1) and 
	   (nSongPlayerInGameNum <= 0 or nJinPlayerInGameNum <= 0)then

		-- ÏÈË¢ĞÅÏ¢£¬ÔÙµ¯³öÍæ¼Ò
		Msg2Map(self.nMapId, "§èi ph­¬ng ®×nh chiÕn, mau chãng ®Õn chiÕn tr­êng míi.");
		self:KickOutAllPlayer();
		self:free();						-- ÊÍ·Å×ÊÔ´
		self:NotifyRelayGameFinish();
		return 0;
	end

	if GetCurrentTime() - self.nGameStartTime <= DungeonGlobalData.MAP_WAIT_TIME then
		return 60 * 18;
	end

	-- Ã»ÈË£¬×ßÕı³£Á÷³Ì½áÊø±ÈÈü
	if nSongPlayerInGameNum <= 0 and nJinPlayerInGameNum <= 0 then
		local strMsg = "2 bªn ®×nh chiÕn, trËn nµy huÒ!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(1);
		return 0;
	elseif nSongPlayerInGameNum <= 0 and nJinPlayerInGameNum > 0 then
		local strMsg = "Phe Tèng ®×nh chiÕn, phe Kim th¾ng!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(3);
		return 0;
	elseif nSongPlayerInGameNum > 0 and nJinPlayerInGameNum <= 0 then
		local strMsg = "Phe Kim ®×nh chiÕn, phe Tèng th¾ng!";
		Msg2Map(self.nMapId, strMsg);
		self:ProcessWhenFinish(2);
		return 0;
	end

	return 60 * 18;
end

function EncounterMap:AddTraps()
	self:AddTrap_Song();
	self:AddTrap_Jin();
end

function EncounterMap:AddTrap_Song()
	-- ºóÓªµ½Ç°Óª
	local szTrapFile   = "\\settings\\missions\\miniencounter\\trap_song_back2front.txt";
	local szTrapScript = "\\script\\missions\\miniencounter\\trap_song_back2front.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	local nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		--print (">> Debug : nX = "..nX);
		--print (">> Debug : nY = "..nY);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
	
	-- Ç°Óªµ½ºóÓª
	szTrapFile = "\\settings\\missions\\miniencounter\\trap_song_front2back.txt";
	szTrapScript = "\\script\\missions\\miniencounter\\trap_song_front2back.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
end

function EncounterMap:AddTrap_Jin()
	-- ºóÓªµ½Ç°Óª
	local szTrapFile   = "\\settings\\missions\\miniencounter\\trap_jin_back2front.txt";
	local szTrapScript = "\\script\\missions\\miniencounter\\trap_jin_back2front.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	local nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		--print (">> Debug : nX = "..nX);
		--print (">> Debug : nY = "..nY);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
	
	-- Ç°Óªµ½ºóÓª
	szTrapFile = "\\settings\\missions\\miniencounter\\trap_jin_front2back.txt";
	szTrapScript = "\\script\\missions\\miniencounter\\trap_jin_front2back.lua";
	TabFile_Load(szTrapFile, szTrapFile);
	nHeight = TabFile_GetRowCount(szTrapFile);

	for i = 2, nHeight do
		local nX = TabFile_GetCell(szTrapFile, i, 1);
		local nY = TabFile_GetCell(szTrapFile, i, 2);
		self:AddMapTrap_S(self.nMapId, nX, nY, szTrapScript);
	end
	TabFile_UnLoad(szTrapFile);
end

function EncounterMap:IsInMap(szRoleName)
	for i = 1, getn(self.tbCamp[1]) do
		if self.tbCamp[1][i].szRoleName == szRoleName then
			return 1;
		end
	end

	for i = 1, getn(self.tbCamp[2]) do
		if self.tbCamp[2][i].szRoleName == szRoleName then
			return 1;
		end
	end

	return nil;
end

function EncounterMap:AddToCamp(nCamp, tbPlayer)
	local tbCamp = self.tbCamp[nCamp];
	local nPlayerNum = getn(tbCamp);
	tbCamp[nPlayerNum + 1] = tbPlayer;
	tbPlayer.nCamp = nCamp;
	return 1;
end

function EncounterMap:OnEnterMap()
	print("[Function Stack] - EncounterMap:OnEnterMap - map.lua");

	SetPunish(0);			   -- ³Í·£¹Ø±Õ£¬0±íÊ¾²»ÊÜÈÎºÎ³Í·£
	SetPKFlag(1);			   -- ´ò¿ªPK¿ª¹Ø
	--SetLogoutRV(1);			 -- ÉèÖÃÖØÉúµã
	SetCreateTeam(0);		   -- ¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetFightState(0);		   -- ÉèÖÃÕ½¶·×´Ì¬
	SetDeathType(-1);		   -- ËÀÍöÁ¢¿ÌÖØÉú 

	ForbitTrade(0);				-- ÔÊĞí½»Ò×
	ForbidEnmity(1);			-- ½ûÖ¹³ğÉ±
	ForbidChangePK(1);		  -- ½ûÖ¹¸Ä±äPK±ê¼Ç
	
	DisabledStall(1);			-- ½ûÖ¹°ÚÌ¯
	DisabledUseTownP(1);		-- ½ûÖ¹Ê¹ÓÃ»Ø³Ç
	DisabledUseHeart(1);		-- ½ûÖ¹Ê¹ÓÃĞÄĞÄÏàÓ¡·û

	LeaveTeam();				-- Àë¿ª¶ÓÎé

	-- ÉèÖÃËÀÍö½Å±¾
	SetDeathScript("\\script\\missions\\miniencounter\\playerdeath.lua");

	local szRoleName = GetName();
	local tbPlayer = self:GetPlayer(szRoleName);
	local nCamp = GetTask(DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP);
		
	if not tbPlayer then	--ÕâÊÇµÚÒ»´Î½øÈë
		tbPlayer = EncounterPlayer:new(szRoleName);
		self:AddToCamp(nCamp, tbPlayer)
		tbPlayer.nTitleLv = 1
	end

	SetTmpCamp(nCamp)
	SetCurCamp(nCamp)
	
	self.tbCurPlayerNum[nCamp] = self.tbCurPlayerNum[nCamp] + 1
	tbPlayer:RestoreAllTaskValue()
	tbPlayer.nPlayerInMap = 1

	local nX, nY = self:GetNewWorldPos(tbPlayer.nCamp)
	SetTempRevPos(self.nMapId, nX * 32, nY * 32)
	
	-- µÚÒ»´Î²ÎÈüÁì½±
	if GetTask(3999) ~= 2 then
		SetTask(3999, 1);
	end

	tbPlayer:AddTitle(tbPlayer.nCamp, tbPlayer.nTitleLv);

	-- µÚÒ»´Î½øÈëÒ²»áÍ¬²½
	self:NotifyCurrentVSScore();
	self:SendFuLiTopTenData2Client();
end

function EncounterMap:OnLeaveMap()

	SetPunish(1);			   -- ³Í·£´ò¿ª
	SetPKFlag(0);			   -- ¹Ø±ÕPK¿ª¹Ø
	SetCreateTeam(1);		   -- ´ò¿ª×é¶Ó¹¦ÄÜ
	SetFightState(0);		   -- ÉèÖÃÕ½¶·×´Ì¬
	SetDeathType(0);
	
	ForbitTrade(0);				-- ÔÊĞí½»Ò×
	ForbidEnmity(0);			-- ÔÊĞí³ğÉ±
	ForbitStamina(0);
	ForbidChangePK(0);		  -- ¿ÉÒÔ¸Ä±äPK±ê¼Ç

	DisabledStall(0);			-- ¿ÉÒÔ°ÚÌ¯
	DisabledUseTownP(0);		-- ¿ÉÒÔÊ¹ÓÃ»Ø³Ç
	DisabledUseHeart(0);		-- ¿ÉÒÔÊ¹ÓÃĞÄĞÄÏàÓ¡·û

	SetTmpCamp(0);
	SetCurCamp(GetCamp())
	LeaveTeam();				-- Àë¿ª¶ÓÎé
	SetDeathScript("");

	-- Çå³ıTitle
	local szRoleName = GetName();
	local tbPlayer   = self:GetPlayer(szRoleName);
	if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
		tbPlayer:DelTitle(tbPlayer.nCamp, tbPlayer.nTitleLv);		-- Çå³ıTitle
		tbPlayer:ClearAllSkillState();	-- Çå³ıBuff
		tbPlayer:ClearAllTaskValue();		-- Àë¿ªµØÍ¼£¬Çå¿ÕÈÎÎñ±äÁ¿
		tbPlayer.nPlayerInMap = -1;		-- ÉèÖÃ½ÇÉ«Àë¿ª×´Ì¬
	end

	if tbPlayer then
		self.tbCurPlayerNum[tbPlayer.nCamp] = self.tbCurPlayerNum[tbPlayer.nCamp] - 1;
		if self.tbCurPlayerNum[tbPlayer.nCamp] < 0 then
			self.tbCurPlayerNum[tbPlayer.nCamp] = 0;
		end

		self:NotifyCurrentVSScore();
	end
end

-- ·µ»ØÖµ£º0 ±ÈÈüÖĞ£¬1 Æ½¾Ö£¬2 ËÎ·½Ê¤Àû£¬3 ½ğ·½Ê¤Àû
function EncounterMap:JudgeWinnerWhenKillerPillar()
	local nSongScore = self.tbCampScore[1];
	local nJinScore  = self.tbCampScore[2];
	
	local strMsg = "Phe %s ®¹t ®­îc %d ®iÓm tr­íc, nhËn phÇn th¾ng trËn nµy!";
	if nSongScore >= DungeonGlobalData.MAP_WIN_SCORE and nJinScore >= DungeonGlobalData.MAP_WIN_SCORE then
		return 1;
	end

	if nSongScore >= DungeonGlobalData.MAP_WIN_SCORE and nJinScore < DungeonGlobalData.MAP_WIN_SCORE then
		strMsg = format(strMsg, DungeonGlobalData.tbCampName[1], DungeonGlobalData.MAP_WIN_SCORE);
		Msg2Map(self.nMapId, strMsg);
		return 2;
	end

	if nSongScore < DungeonGlobalData.MAP_WIN_SCORE and nJinScore >= DungeonGlobalData.MAP_WIN_SCORE then
		strMsg = format(strMsg, DungeonGlobalData.tbCampName[2], DungeonGlobalData.MAP_WIN_SCORE);
		Msg2Map(self.nMapId, strMsg);
		return 3;
	end

	return 0;
end

-- 30·ÖÖÓ±ÈÈüÕı³£½áÊøÅĞ¶ÏÊ¤Àû
-- ·µ»ØÖµ£º1 Æ½¾Ö£¬2 ËÎ·½Ê¤Àû£¬3 ½ğ·½Ê¤Àû
function EncounterMap:JudgeWinnerWhenTimeOut()
	local nSongScore = self.tbCampScore[1];
	local nJinScore  = self.tbCampScore[2];

	local strMsg = "ChiÕn ®Êu ngµy ®ªm, tØ sè 2 bªn Tèng Kim lµ %d:%d, phe %s nhËn phÇn th¾ng!";
	if nSongScore > nJinScore then
		strMsg = format(strMsg, nSongScore, nJinScore,DungeonGlobalData.tbCampName[1]);
		Msg2Map(self.nMapId, strMsg);
		return 2;
	end

	if nSongScore < nJinScore then
		strMsg = format(strMsg, nSongScore, nJinScore,DungeonGlobalData.tbCampName[2]);
		Msg2Map(self.nMapId, strMsg);
		return 3;
	end

	return 1;
end

function EncounterMap:ProcessWhenFinish(nResult)
	-- ·ÀÖ¹¶à´ÎÊÍ·Å
	if self.nGameState == 3 then
		return nil;
	end
	self.nGameState = 3;

	self.nResult = nResult;

	-- ¹Ø±ÕGSÉÏµÄµØÍ¼
	self:close();
end

-- ±ÈÈü½áÊø´¦Àí£ºself:close() ÖĞµ÷ÓÃ
function EncounterMap:OnClose()

	-- ½á¹û½áËã
	local nSongExploitValueBase = 0;
	local nJinExploitValueBase  = 0;

	if self.nResult == 2 then							   -- ËÎ·½Ê¤Àû£¬
		Msg2Map(self.nMapId, "LÇn giao tranh nµy phe Tèng dòng m·nh giÕt ®Şch, nhËn ®­îc phÇn th¾ng!");
		nSongExploitValueBase = DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE;
		nJinExploitValueBase  = DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE;
	elseif self.nResult == 3 then						   -- ½ğ·½Ê¤Àû
		Msg2Map(self.nMapId, "LÇn giao tranh nµy phe Kim dòng m·nh giÕt ®Şch, nhËn ®­îc phÇn th¾ng!");
		nJinExploitValueBase  = DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE;
		nSongExploitValueBase = DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE;
	else													-- Æ½¾Ö
		Msg2Map(self.nMapId, "LÇn giao tranh nµy 2 bªn kh«ng ph©n cao thÊp, kÕt qu¶ huÒ!");
		local nExploitBase = (DungeonGlobalData.WINNER_EXPLOIT_VALUE_BASE + DungeonGlobalData.LOSER_EXPLOIT_VALUE_BASE) / 2;
		nSongExploitValueBase = nExploitBase;
		nJinExploitValueBase  = nExploitBase;
	end

	-- ½áËã½±Àø
	self:GiveAwardWhenBattleFinish(1, nSongExploitValueBase);
	self:GiveAwardWhenBattleFinish(2, nJinExploitValueBase);

	-- ¸üĞÂÅÅÃûÊı¾İ
	self:SendRankData2Relay();
	
	-- Ìß³öËùÓĞÍæ¼Ò
	self:KickOutAllPlayer();

	-- Í¨ÖªrelayÉ¾³ıµØÍ¼£¬È»ºóÍ¨ÖªgsÉ¾³ıµØÍ¼ĞÅÏ¢
	self:NotifyRelayGameFinish();
end

function EncounterMap:free()
	if self._timer_ then
		for nTimerId, tb in self._timer_ do
			DelTimer(nTimerId);
		end

		self._timer_ = nil;
	end

	DungeonList[self.nMapId] = nil;
	if self.nTemplateMapId then
		ApplyDelDungeonMap(self.nTemplateMapId, self.nMapId);				   -- É¾³ı¸±±¾µØÍ¼£¬ÈÃËùÓĞ×ÊÔ´ÊÍ·Å
	end
end

-- gs´«¹ıÈ¥µÄÒ»³¡±ÈÈüµÄÊı¾İ¸ñÊ½Îª
-- {
--		 [szName] = nScore,
--		 ......
--		 [szName] = nScore,
-- };
function EncounterMap:SendRankData2Relay()
	local tbData = {}

	-- ËÎ·½Êı¾İ
	for i = 1, getn(self.tbCamp[1]) do
		local tbPlayer = self.tbCamp[1][i]
		tbData[tbPlayer.szRoleName] = tbPlayer.nCurrentPoint
	end
	
	-- ½ğ·½Êı¾İ
	for i = 1, getn(self.tbCamp[2]) do
		local tbPlayer = self.tbCamp[2][i]
		tbData[tbPlayer.szRoleName] = tbPlayer.nCurrentPoint
	end

	-- ÈôÒªÅÅÃû£¬ÔÚÕâÀï°ÑÊı¾İ·¢µ½RELAY
	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, tbData)
	RemoteExecute("\\script\\missions\\miniencounter\\weekly_rank.lua", "tbMiniEncounterRank:RecordResult", hObject)
	OB_Release(hObject)
end

function EncounterMap:NotifyRelayGameFinish()

	 --Í¨Öªrelay±ÈÈü½áÊø£¬É¾³ıµØÍ¼
	local hObject = OB_Create();							-- ´´½¨Ò»¸ö¶ÔÏó
	ObjBuffer:PushObject(hObject, self.nMapId);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function EncounterMap:PrintInfo()
	print("\n\n[Function Stack] - EncounterMap:PrintInfo - map.lua");
	print(">> Debug : nMapId = "..self.nMapId);
	print(">> Debug : nGameStartTime = "..self.nGameStartTime);
	print(">> Debug : nGameState = "..self.nGameState);
	print(">> Debug : tbCampScore[1] = "..self.tbCampScore[1]);
	print(">> Debug : tbCampScore[2] = "..self.tbCampScore[2]);
	print(">> Debug : Players in Camp 1:");
	for i = 1, getn(self.tbCamp[1]) do
		print (self.tbCamp[1][i].szRoleName, " ");
	end

	print(">> Debug : Players in Camp 2:");
	for i = 1, getn(self.tbCamp[2]) do
		print (self.tbCamp[2][i].szRoleName, " ");
	end
end

function EncounterMap:NotifyCurrentVSScore()
	local tbSongCamp = self.tbCamp[1];
	local tbJinCamp  = self.tbCamp[2];
	local nSongNum   = getn(tbSongCamp);
	local nJinNum	= getn(tbJinCamp);
	local nBattleLeftSecond = self.nGameStartTime + DungeonGlobalData.MAP_WAIT_TIME + DungeonGlobalData.MAP_FIGHT_TIME - GetCurrentTime();
	if nBattleLeftSecond < 0 then
		nBattleLeftSecond = 0;
	end
	

	for i = 1, nSongNum do
		local tbPlayer = tbSongCamp[i];
		if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_NUM   , self.tbCurPlayerNum[1]);	-- ËÎÈËÊı
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_NUM	, self.tbCurPlayerNum[2]);	-- ½ğÈËÊı
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_SCORE , self.tbCampScore[1]);	   -- ËÎµÃ·Ö
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_SCORE  , self.tbCampScore[2]);	   -- ½ğµÃ·Ö
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, nBattleLeftSecond);		 -- Ê±¼äÍ¬²½
		end
	end

	for i = 1, nJinNum do
		local tbPlayer = tbJinCamp[i];
		if tbPlayer and tbPlayer.nPlayerInMap ~= -1 then
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_NUM   , self.tbCurPlayerNum[1]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_NUM	, self.tbCurPlayerNum[2]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_SONG_SCORE , self.tbCampScore[1]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_JIN_SCORE  , self.tbCampScore[2]);
			tbPlayer:SetTaskValue(DungeonGlobalData.TASK_BATTLE_FINISH_TIME, nBattleLeftSecond);		 -- Ê±¼äÍ¬²½
		end
	end
end

function EncounterMap:SendData(tbData)
	local hObject = OB_Create()
	ObjBuffer:PushByType(hObject, OBJTYPE_TABLE, tbData)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_FULI_REPORT", hObject)
	OB_Release(hObject)
end

function EncounterMap:SendFuLiTopTenData2Client()
	if self.tbCurPlayerNum[1] == 0 or self.tbCurPlayerNum[2] == 0 then
		return nil;
	end

	local tbTopTen = {};
	local tbTotalPlayer = {};

	for i = 1, getn(self.tbCamp[1]) do
		tinsert(tbTotalPlayer, self.tbCamp[1][i])
	end

	for i = 1, getn(self.tbCamp[2]) do
		tinsert(tbTotalPlayer, self.tbCamp[2][i])
	end

	-- ÅÅĞò
	sort(tbTotalPlayer, function(a, b) return a.nEncounterScore > b.nEncounterScore end)

	-- ½ØÈ¡Ç°Ê®¸öÍæ¼Ò
	local nMax = getn(tbTotalPlayer);
	if nMax > 10 then
		nMax = 10
	end
	
	for i = 1, nMax do
		local tbPlayer = tbTotalPlayer[i];
		local tbRecord = {};
		tbRecord[1] = tbPlayer.nCamp;
		tbRecord[2] = tbPlayer.szRoleName;
		tbRecord[3] = tbPlayer.nEncounterScore;
		tbRecord[4] = tbPlayer.nKillEnemyNum;
		tbRecord[5] = tbPlayer.nKillMiddlePillarNum;
		tbRecord[6] = tbPlayer.nKillEnemyPillarNum;
		tbRecord[7] = tbPlayer.nMaxKillComboNum;
		print(format("%s = %d", tbRecord[2], tbRecord[3]))
		tinsert(tbTopTen, tbRecord)
	end

	-- ·¢ËÍ¸øÍæ¼Ò
	for i = 1, getn(tbTotalPlayer) do
		local szRoleName   = tbTotalPlayer[i].szRoleName;
		local nPlayerIndex = SearchPlayer(szRoleName);
		if nPlayerIndex and nPlayerIndex > 0 then
			CallPlayerFunction(nPlayerIndex, self.SendData, self, tbTopTen)
		end
	end
end

-------------------------------------------- [´Ë²¿·Ö²»¿ÉÈ±ÉÙ] --------------------------------------------
local init_map = function ()
	PreApplyDungeonMap(%EncounterMap.nTemplateMapID, 0, 0);
end

AutoFunctions:Add(init_map);
-------------------------------------------- [´Ë²¿·Ö²»¿ÉÈ±ÉÙ] --------------------------------------------

-- ½ûÖ¹ĞÄĞÄÏàÓ³·û
DynamicExecute("\\script\\item\\heart_head.lua", "add_forbit_templatemap", EncounterMap.nTemplateMapID);


