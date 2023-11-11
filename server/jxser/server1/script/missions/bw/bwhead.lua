IncludeLib("RELAYLADDER")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
--ÍË³öÓÎÏ·ºóµÄÖØÉúµãID,Ò²¾ÍÊÇ±¨ÃûµÄÄÇ¸öµØ·½°É
CS_RevId = 80;
CS_RevData = 36;

--»á³¡ÍâµÄÎ»ÖÃ
BW_COMPETEMAP = {209, 210, 211};

--¼ÓÈëË«·½ÕóÓªÊ±µÄÎ»ÖÃ
CS_CampPos = {	{209, 1620, 3202},	--×ÏÉ«
				{209, 1612, 3187}, 	--ÂÌÉ«
				{209, 1598, 3216}   --¹ÛÕ½ÕßµÄÎ»ÖÃ°×É«
			 }; 
CS_CamperPos = {
				{1599, 3202, "Tr­¬ng Tam"},
				{1608, 3211, "L?T?"},
}
FRAME2TIME = 18;
--ÓÎÏ·µÄ×î´óÈËÊı
MAX_MEMBER_COUNT = 100;
--´æ´¢Íæ¼ÒµÄÎ»ÖÃµÄÈÎÎñ±äÁ¿
BW_SIGNPOSWORLD = 300;
BW_SIGNPOSX = 301;
BW_SIGNPOSY = 302;
MS_STATE = 1;
MS_MAXMEMBERCOUNT = 2;
CITYID = 6; --³ÇÊĞID
BW_KEY = 7; -- 0-100000000µÄËæ»úÊı
MS_NEWSVALUE = 9; --ÈÎÎñÖĞ´æ·ÅĞÂÎÅ±äÁ¿µÄµØ·½
MS_TEAMKEY = {10, 11};

MSS_CAPTAIN = {1, 2};
BW_SMALLTIME_ID = 10; --¶¨Ê±´¥·¢Æ÷
BW_TOTALTIME_ID = 11;
TIMER_1 = 20 * FRAME2TIME; -- 20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 12 * 3 * TIMER_1 ; --½»Õ½×ÜÊ±¼äÎª10+2·ÖÖÓ

GO_TIME = 6; -- ±¨ÃûÊ±¼äÎª2·ÖÖÓ
BW_MISSIONID = 4;

function BW_SetRev()
	if (GetTask(BW_SIGNPOSWORLD) == 80) then
		SetRevPos(CS_RevId, CS_RevData)
	elseif (GetTask(BW_SIGNPOSWORLD) == 78) then 
		SetRevPos(29);--xy
	else
		SetRevPos(6);--cd
	end;
end;

--Íæ¼ÒÒªÇóÀë¿ªÓÎÏ·
function LeaveGame()
	camp = GetCamp();--»Ö¸´Ô­Ê¼ÕóÓª
	SetFightState(0)
	if (GetCurCamp() == 2) then
		LeaveChannel(PlayerIndex, "L«i ®µi nhiÒu ng­êi bªn Gi¸p");
	elseif (GetCurCamp() == 3) then
		LeaveChannel(PlayerIndex, "L«i ®µi nhiÒu ng­êi bªn Êt");
	end;
	SetTaskTemp(200,0);
	SetPunish(1)--ÉèÖÃPK³Í·£
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	ForbidChangePK(0);
	RestoreOwnFeature()
	--´ò¿ª½»Ò×°ÚÌ¯
	DisabledStall(0);	--°ÚÌ¯
	ForbitTrade(0);	--½»Ò×
	SetCurCamp(GetCamp());
	DisabledUseTownP(0)
	ForbidEnmity(0);
	DelMSPlayer(BW_MISSIONID, PlayerIndex);
	SetLogoutRV(0);--ÉèÖÃÖØÉúµã
	SetCreateTeam(1);
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ

end;

function GameOver()
	PTab = {};
	idx = 0;
	local i;
	local j = 1;
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(BW_MISSIONID, idx, 0);
		
		if (pidx > 0) then
			PTab[j] = pidx;
			j = j + 1;
		end;
		if (idx == 0 ) then 
			break
		end
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i];
		NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
	end;
	PlayerIndex = OldPlayer;
	
end;

function JoinCamp(Camp)
	--ÔÚµÚ¶şMissionÄÚ¼Óµ±Ç°Íæ¼Ò
	LeaveTeam()
	local Camp1;
	if (Camp == 3) then
		Camp1 = 0;
	else
		Camp1 = Camp + 1;
	end
	AddMSPlayer(BW_MISSIONID, Camp);
	SetCurCamp(Camp1)
	bw_state_joined_in(Camp1);

	if (Camp == 1) then
		NewWorld(CS_CampPos[1][1], CS_CampPos[1][2], CS_CampPos[1][3])
		EnterChannel(PlayerIndex, "L«i ®µi nhiÒu ng­êi bªn Gi¸p");
	elseif (Camp == 2) then
		NewWorld(CS_CampPos[2][1], CS_CampPos[2][2], CS_CampPos[2][3])
		EnterChannel(PlayerIndex, "L«i ®µi nhiÒu ng­êi bªn Êt");
	else 
		NewWorld(CS_CampPos[3][1], CS_CampPos[3][2], CS_CampPos[3][3])
	end;

	str = GetName().."<#> ®· vµo ®Êu tr­êng thi ®Êu."
	Msg2MSAll(BW_MISSIONID, str);
end;

function bw_state_joined_in(Camp)
--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);

	--ÉèÖÃÕ½¶·×´Ì¬
	SetFightState(0);

	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);

	--ÎŞËÀÍö³Í·£
	SetPunish(0);
	
	ForbidEnmity(1);
	
	--½ûÖ¹½»Ò×°ÚÌ¯
	DisabledStall(1);	--°ÚÌ¯
	ForbitTrade(1);	--½»Ò×
	
	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	
	--´ò¿ªPK¿ª¹Ø
	if (Camp == 0) then
		SetPKFlag(0)
		ChangeOwnFeature(0, 0, -1, -1, -1, -1, -1)
		Msg2Player("HÖ thèng: B¹n ®ang trong tr¹ng th¸i tµng h×nh.");
	else
		SetPKFlag(1)
	end;
	ForbidChangePK(1);
	DisabledUseTownP(1)
	
	--ÉèÖÃÖØÉúµã£¬Ò»°ãÊÇÑ¡Ôñ½øÈë¸ÃÇøµÄ³ÇÊĞ
	BW_SetRev()
	
	--ÉèÖÃµ±Ç°Íæ¼ÒµÄËÀÍö½Å±¾
	SetDeathScript("\\script\\missions\\bw\\bwdeath.lua");
	
	--ÉèÖÃÏÂ´ÎËÀÍöµÄÖØÉúµã

	x = GetTask(BW_SIGNPOSWORLD);
	y = GetTask(BW_SIGNPOSX);
	z = GetTask(BW_SIGNPOSY);
	SetTempRevPos(x, y * 32, z * 32);
end;

--µÃµ½Á½¸ö¶Ó³¤µÄÃû×Ö
function bw_getcaptains()
	local OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(209);
	local szCaptainName = {};
	if (idx == -1) then
		return szCaptainName;
	end;
	SubWorld = idx;
	szCaptainName[1] = GetMissionS(MSS_CAPTAIN[1]);
	szCaptainName[2] = GetMissionS(MSS_CAPTAIN[2]);
	SubWorld = OldSubWorld;
	return szCaptainName;
end;

function OnShowKey()
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(209);
	if (SubWorld < 0) then
		return
	end;
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	if (GetMissionV(MS_MAXMEMBERCOUNT) <= 1) then
		Say("Ng­¬i ®¨ng kı thi ®Êu l«i ®µi lµ §¬n ®Êu, kh«ng cÇn biÕt sè thø tù vµo ®Êu tr­êng, ng­¬i cã thÓ trùc tiÕp vµo thi ®Êu.",0);
		SubWorld = OldSubWorld;
		return
	end
	local key = 0
	if (GetName() == szCaptainName[1]) then
		key = GetMissionV(MS_TEAMKEY[1]);
	end
	
	if (GetName() == szCaptainName[2]) then 
		key = GetMissionV(MS_TEAMKEY[2]);
	end
	if (key == 0) then
		Say("Xin lçi! Ng­¬i kh«ng n»m trong sè thİ sinh thi ®Êu lÇn nµy, ta kh«ng thÓ nãi sè thø tù vµo ®Êu tr­êng.",0)
	else
		Say("Sè thø tù cña ng­¬i lµ: <color=yellow> ["..key.."]<color><#>, mau th«ng b¸o víi thµnh viªn tham gia thi ®Êu, ®éi viªn chØ viÖc nhËp sè thø tù chİnh x¸c lµ cã thÓ vµo thi ®Êu. Xin c¶m ¬n!", 0);
	end
	SubWorld = OldSubWorld;
end

function bw_branchtask_win(nGroupID)	--¸øÊ¤µÄÒ»·½×÷ÉÏ±ê¼Ç
	nOldPlayer = PlayerIndex;
	--Ê¤ÀûµÄÒ»¶Ó£»
	local idx = 0;
	local pidx;
	for i = 1, 10 do
		idx , pidx = GetNextPlayer(BW_MISSIONID, idx, nGroupID);
		if (pidx > 0) then
		   	PlayerIndex = pidx;
			branchTask_GainBW1()	--±£³ÖÈÃÃ¿Ò»¸öÍæ¼ÒÊ¤ÀûÊ±½øĞĞµÇ¼Ç£»
		end;
		if (idx == 0) then
			break;
		end;
	end
	PlayerIndex = nOldPlayer;
end;
