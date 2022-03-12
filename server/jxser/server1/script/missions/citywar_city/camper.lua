--Èç¹ûÍæ¼ÒÊÇ½»Õ½Á½¸ö°ï»áÖ®Ò»µÄ»°£¬ÔòÔÚÈËÊıÃ»ÓĞ´ïµ½ÉÏÏŞµÄÇ°ÌáÏÂ£¬ÈÃËû½øÈëµØÍ¼
--Èç¹ûÍæ¼Ò²»ÊÇ½»Õ½Á½¸ö°ï»áÖ®Ò»µÄ»°£¬Èç¹ûÉíÉÏÓĞºÏ·¨µÄÆ±µÄ»°£¬ÈÃËû½øÈëµØÍ¼
-------------------------------------------------------------------------
--Íæ¼ÒÒªÇóÀë¿ªÓÎÏ·
function LeaveGame()
	curcamp=	GetCurCamp();
	camp = GetCamp();--»Ö¸´Ô­Ê¼ÕóÓª
	SetRevPos(GetPlayerRev())
	SetFightState(0)
	SetPunish(1)--ÉèÖÃPK³Í·£
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetCurCamp(camp);
	SetLogoutRV(0);--ÉèÖÃÖØÉúµã
	SetCreateTeam(1);
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	NewWorld(OuterPos[curcamp][1], OuterPos[curcamp][2], OuterPos[curcamp][3])
end;

function GameOver()
	local OldPlayer = PlayerIndex;
	local PTab = {};
	for i = 1, 1000 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	local PCount = getn(PTab);
	
	-- ½±ÀøËæ»ú5ÃûÍæ¼Ò»Ô»ÍÖ®¹ûÀñºĞ
	local tbRandPlayer = {};
	local nRandCount = 0;
	for i =1, PCount do
		if (nRandCount >= 5) then
			break
		end
		local nrand = random(PCount);
		if (not tbRandPlayer[nrand]) then
			nRandCount = nRandCount + 1;
			tbRandPlayer[nrand] = nrand;
		end
	end
	
	
	-- ½±ÀøÅÅĞĞ°ñÉÏÇ°10Ãû
	for i = 1, 10 do
		local szName,nZhanGong = BT_GetTopTenInfo(i, PL_TOTALPOINT);
		if szName ~= nil and szName ~= "" then
			local nTopPlayerIdx = SearchPlayer(szName);
			if (nTopPlayerIdx > 0) then
				PlayerIndex = nTopPlayerIdx;
				AddOwnExp(CITYWAR_TOP10_EXP);
				local szLog = format("%d ®iÓm kinh nghiÖm", CITYWAR_TOP10_EXP);
				szLog = format("B¹n nhËn ®­îc phÇn th­ëng C«ng thµnh chiÕn——%s", szLog);
				Msg2Player(szLog);
				WriteLog(format("[citywar_award]\t%s\tName:%s\tAccount:%s\t%s",
							GetLocalDate("%Y-%m-%d_%H:%M"),
							szName,
							GetAccount(),
							szLog
							));
			end
		end
	end
	OldPlayer = PlayerIndex;
	
	
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		
		if (tbRandPlayer[i]) then
			citywar_awardplayer();
		end
		LeaveGame()
		SetFightState(0)
	end;
	PlayerIndex = OldPlayer;
end;

function citywar_awardplayer()
	AddItem(6,1,1075,1,1,0);
	local szLog = format("B¹n nhËn ®­îc phÇn th­ëng C«ng thµnh chiÕn——%s","LÔ hép qu¶ huy hoµng")
	Msg2Player(szLog);
	WriteLog(format("[citywar_award]\t%s\tName:%s\tAccount:%s\t%s",
							GetLocalDate("%Y-%m-%d_%H:%M"),
							GetName(),
							GetAccount(),
							szLog
							));
end
-------------------------------------------------------------------------

function JoinCamp(Camp, Type)
--type == 1±íÊ¾ÊÇÕı¹æ¾ü£¬2±íÊ¾ÊÇ·ÇÕı¹æ¾ü¼´²»ÊÇ±¾°ï»áµÄ³ÉÔ±
	LeaveTeam();
	if (Type == 1) then 
		if (Camp == 1) then 
			if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_CAMP1COUNT) then
				Say("HiÖn giê sè ng­êi tham chiÕn bang héi thñ thµnh ®· ®Çy, t¹m thêi kh«ng thÓ gia nhËp!",0)
				return
			end;
		else 
			if (GetMSPlayerCount(MISSIONID, Camp) >= MAX_CAMP2COUNT) then
				Say("HiÖn giê sè ng­êi tham chiÕn bang héi c«ng thµnh ®· ®Çy,t¹m thêi kh«ng thÓ gia nhËp!",0)
				return
			end
		end;
	else
		if (Camp == 1) then 
			if (GetMSPlayerCount(MISSIONID,Camp + 2 ) >= MAX_CAMP3COUNT) then
				Say("HiÖn giê sè nghÜa sÜ gióp ®ì thñ thµnh ®· ®Çy, t¹m thêi kh«ng thÓ gia nhËp!",0)
				return
			end;
		else 
			if (GetMSPlayerCount(MISSIONID, Camp + 2) >= MAX_CAMP4COUNT) then
				Say("HiÖn giê sè nghÜa sÜ gióp ®ì c«ng thµnh ®· ®Çy, t¹m thêi kh«ng thÓ gia nhËp!",0)
				return
			end
		end;
	end;

	if (Type == 1) then 	
		AddMSPlayer(MISSIONID, Camp);
	else
		AddMSPlayer(MISSIONID, Camp + 2);
	end;
	
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);
	
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);
	
	--ÎŞËÀÍö³Í·£
	SetPunish(0);
	
	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	
	--´ò¿ªPK¿ª¹Ø
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--ÉèÖÃÖØÉúµã£¬Ò»°ãÊÇÑ¡Ôñ½øÈë¸ÃÇøµÄ³ÇÊĞ
	SetRevPos(GetPlayerRev())
	
	--ÉèÖÃµ±Ç°Íæ¼ÒµÄËÀÍö½Å±¾
	SetDeathScript("\\script\\missions\\citywar_city\\playerdeath.lua");
	
	SetFightState(0)
	--ÉèÖÃÏÂ´ÎËÀÍöµÄÖØÉúµã
	if (Camp == 1) then
		SetTempRevPos(CS_CampPos1[1], CS_CampPos1[2]*32, CS_CampPos1[3]*32);
		
		NewWorld(CS_CampPos1[1], CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(CS_CampPos2[1], CS_CampPos2[2]*32, CS_CampPos2[3]*32);
		
		NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3])
	else 
		return
	end;

	--ÏÔÊ¾¼ÆÊ±ÅÆ
	local gametime = floor(GetMSRestTime(MISSIONID, 13) / 18);	
	BT_UpdateMemberCount();
	BT_BroadView();
	BT_BroadAllLadder();
	BT_SetRestTime(gametime);
	BT_BroadGameData();
	BT_SortLadder();
	BT_BroadSelf()
	--ÏÔÊ¾¼ÆÊ±ÅÆ
	
	--¹ÙÏÎ
	bt_JudgePLAddTitle()
end;
