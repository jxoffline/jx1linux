------------------------------------------------------------------------------
--ÃÎ¾³É½¶´¶´ÖĞµÄÍæ¼ÒÕóÓªÁÙÊ±±äÎªºìÃû£¬¿ÉÒÔ×ÔÓÉPK£¬ÔÚ´Ë´¦PKÃ»ÓĞËÀÍö³Í·£¡£
--µ«É½¶´Ö»ÄÜÈİÄÉ×î¶à20ÈË£¬¶´ÖĞ´ïµ½20ÈËÒÔÉÏÊ±²»ÄÜÔÙ´«ËÍÆäËûÈË½øÈë£¨Ö»³ö²»½ø£©¡£
--Íæ¼ÒÈÏÎª×Ô¼ºÏ´µã½á¹ûÂúÒâÊ±£¬Í¨¹ıÓëÃÎ¾³ÄÚµÄÅÑÉ®¶Ô»°Àë¿ªÃÎ¾³¡£
--Àë¿ªÊ±»¹Ô­ÖØÉúµãÉèÖÃÒÔ¼°ÆäËüÏà¹Ø×´Ì¬¡£Ï´µãÍê³É£¬»Øµ½ÌÒ»¨Ô´¡£			
--1¡¢×é¶Ó½øÈë
-------------------------------------------------------------------------------
Include("\\script\\missions\\clearskill\\head.lua")

function TeamEnterHole(nTrapId)
	
	if (IsCaptain() == 0) then
		Say("Muèn vµo khu vùc thİ luyÖn nµy b¹n cÇn ph¶i tæ ®éi! ChØ cã tæ tr­ëng míi ®­îc phĞp dÉn tæ cña m×nh vµo!", 0);
		return 0
	end;

	--¶Ó³¤½ø¶´Ç°½øĞĞºÏ·¨ĞÔ¼ì²â
	-- ·Ç·¨×´Ì¬
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("TiÕn nhËp vµo §¶o TÈy Tñy mét c¸ch kh«ng b×nh th­êng. ");
		Say("GM: <color=red>B¹n kh«ng thÓ vµo ®¶o TÈy Tñy, ®· bŞ hÖ thèng ghi nhí, xin h·y ®i t×m ng­êi phôc vô ®Ó chØnh lı l¹i! <color> ", 0);
		return 0
	end

	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT or Size < 2) then
		Say("Sè ng­êi trong nhãm ph¶i tõ 2 ®Õn 8 ng­êi!" , 0);
		return 0
	end;
	
	--ÕÒ¿ÕÏĞµÄµØÍ¼
	--N¸öµØÍ¼£¬Ã¿¸öµØÍ¼¿ªÆôÒ»¸öMission
	--¶ÓÎé½øÈëµØÍ¼ºó£¬Mission×Ô¶¯¿ªÆô£¬²¢ÇÒSetMissionV(1,1)	
	--ÅĞ¶ÏµØÍ¼ÊÇ·ñ¿ÕÏĞ¾ÍÊÇ¿´Õâ¸öMissionV(1)ÊÇ·ñÎª0
	--Mission½áÊøÊ±£¬¹Ø±ÕMission ÉèMissionV(1)Îª0£¬²¢Çå¿ÕÔÚÄÚµÄËùÓĞÍæ¼Ò
	--Mission¿ªÆôÊ±ÒªÌí¼ÓÒ»¸ö¶Ô»°NpcÓÃÓÚÍæ¼ÒÊÖ¶¯ÉèÖÃÁÙÊ±ÕóÓª
	
	W,X,Y = GetWorldPos()
	nCityIndex = CSP_GetCityIndexByClearMap(W);
	if (nCityIndex <= 0 ) then
		return 0
	end;
	
	nFreeMap = CSP_GetFreeTestMapID(nCityIndex);
	if (nFreeMap <= 0 ) then 
		Say("Xin lçi! S¬n ®éng kh«ng cßn chç trèng!", 0)
		return 0
	end;
	OldSubWorld = SubWorld;
	OldPlayer = PlayerIndex;
	
	nIdx = SubWorldID2Idx(nFreeMap);
	SubWorld = nIdx;
	OpenMission(MISSIONID)
	RunMission(MISSIONID)
	
	TeamMember = {};
	nCount = 1;
	for i = 1, Size do 
		PIdx = GetTeamMember(i);
		if (PIdx > 0) then 
			TeamMember[nCount] = PIdx;
			nCount = nCount + 1;
		end
	end;
	
	for i = 1, nCount - 1 do 
		PlayerIndex = TeamMember[i];
		tW,tX,tY = GetWorldPos();
		
		--½ø¶´Ç°½øĞĞºÏ·¨ĞÔ¼ì²â
		--¼ì²â·½·¨£º
		-- 1.´ËÈËµÄ×´Ì¬ºÏ·¨(·Ç·¨£¬Ôò¿ÉÄÜÊÇÓÃÍâ¹Ò)
		-- 2.´ËÈËËù¶ÔÓ¦µÄCityIndexÓë¶Ó³¤µÄÒ»ÖÂ²Å¿É½ø¶´
		if (CSP_CheckValid() == 1 and CSP_GetCityIndexByClearMap(tW) == nCityIndex) then
			JoinHole(nFreeMap, nTrapId)
		end
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
	return 1

end;

function JoinHole(TestMap,nTrapId)
	LeaveTeam()
	
	EnterPosX = CSP_TestHoleTab[nTrapId][1];
	EnterPosY = CSP_TestHoleTab[nTrapId][2];
	NewWorld(TestMap, EnterPosX, EnterPosY)
	
	AddMSPlayer(MISSIONID, 1);
	SetTaskTemp(JOINSTATE, 1);
	
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);
	
	--ÉèÖÃÕ½¶·×´Ì¬
	SetFightState(1);
	
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);
	
	--ÎŞËÀÍö³Í·£
	SetDeathScript("\\script\\missions\\clearskill\\playerdeath.lua");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	SetPunish(0);
	SetTempRevPos(TestMap, CSP_CAMPMANX, CSP_CAMPMANY);
	ForbidChangePK(0);
	SetPKFlag(1) --´ò¿ªPK¿ª¹Ø
	return 1
end;

--Íæ¼ÒÒªÇóÀë¿ªÓÎÏ·
function LeaveGame(nTrapId)
	camp = GetCamp();--»Ö¸´Ô­Ê¼ÕóÓª
	SetFightState(1)
	SetPunish(0)--ÉèÖÃPK³Í·£
	SetTaskTemp(JOINSTATE, 0);
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(1);
	SetCurCamp(camp);
	SetLogoutRV(1);--ÉèÖÃÖØÉúµã
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	W,X,Y = GetWorldPos();
	LeaveTeam()

	local CityId = CSP_GetCityIndexByTestMap(W);
	ClearPosX = CSP_ClearHoleTab[nTrapId][1]
	ClearPosY = CSP_ClearHoleTab[nTrapId][2]
	W = CSP_GetClearMapID(CityId);
	SetRevPos(W, CSP_RevieSWID);	
	NewWorld(W, ClearPosX, ClearPosY);
end;
