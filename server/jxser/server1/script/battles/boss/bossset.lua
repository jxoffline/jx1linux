IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")

-- ÆÕÍ¨BOSS±í: NPCID¡¢BOSSµÈ¼¶¡¢BOSSÎåÐÐ¡¢BOSSÃû³Æ¡¢BOSSÌ×ÓÃµÄÄ£°æ£¨ÎÞÊµ¼Ê×÷ÓÃ£©
BattleBoss_tbCommonBoss = 
{
	{1465,	95,	0,	" %s quèc t­íng qu©n", "V­¬ng T¸ "},
	{1466,	95,	1,	" %s quèc t­íng qu©n", "§­êng Phi YÕn"},
	{1467,	95,	1,	" %s quèc t­íng qu©n", "B¹ch Doanh Doanh"},
	{1468,	95,	2,	" %s quèc t­íng qu©n", "Thanh TuyÖt S­ Th¸i"},
	{1469,	95,	2,	" %s quèc t­íng qu©n", "Chung Linh Tó "},
	{1470,	95,	3,	" %s quèc t­íng qu©n", "Hµ Nh©n Ng· "},
	{1471,	95,	3,	" %s quèc t­íng qu©n", "§oan Méc DuÖ "},
	{1472,	95,	4,	" %s quèc t­íng qu©n", "Thanh Liªn Tö "},
	{1473,	95,	4,	" %s quèc t­íng qu©n", "§¹o Thanh Ch©n Nh©n"},
}

-- BigBOSS±í: NPCID¡¢BOSSµÈ¼¶¡¢BOSSÃû³Æ
BattleBoss_tbBigBoss = 
{
	{1474, 95, "Tèng quèc ®¹i t­íng qu©n"},
	{1475, 95, "Kim quèc ®¹i t­íng qu©n"},
}

-- Ë«·½¸÷×ÔÔö¼Ó9¸öÆÕÍ¨BOSS
function BattleBoss_AddAllCommonBoss()
	local nBossID = 0;
	for nBossPosID = 1,9 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>Tèng Kim chiÕn b¸o: Mçi bªn Tèng Kim sÏ cö ra 9 vÞ t­íng qu©n cña tõng ph¸i ®Ó tiÕp viÖn!");
end

-- Ë«·½¸÷×ÔÔÚÖÐÂ·Ôö¼Ó3¸öÆÕÍ¨BOSS
function BattleBoss_AddSomeCommonBoss()
	local nBossID = 0;
	for nBossPosID = 4,6 do
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 1, nBossPosID);
		nBossID = random(1, getn(BattleBoss_tbCommonBoss));
		BattleBoss_AddBoss(nBossID, 2, nBossPosID);
	end
	Msg2MSAll(MISSIONID, "<color=yellow>Tèng Kim chiÕn b¸o: Mçi bªn Tèng Kim sÏ cö ra 3 vÞ t­íng qu©n cña tõng ph¸i ®Ó tiÕp viÖn!");
end

-- Ö¸¶¨ÕóÓªÔö¼Ó´óBOSS
function BattleBoss_AddBigBoss(nBossCamp)
	
	if (nBossCamp == 1) then
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Tèng Kim chiÕn b¸o: CÊp b¸o! Tèng qu©n ®¹i t­íng qu©n ®· xuÊt hiÖn!")
	else
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>Tèng Kim chiÕn b¸o: CÊp b¸o! Kim qu©n ®¹i t­íng qu©n ®· xuÊt hiÖn!")
	end
	
	BattleBoss_AddBoss(0, nBossCamp, 0);
end

-- ÔÚÕ½³¡ÖÐ¼ÓÈëBoss	
-- nBossID: 	BossµÄID 0ÎªBigBoss£¬´óÓÚ0ÎªÆÕÍ¨Boss
-- nBossCamp:	BossµÄÕóÓª 1ÎªËÎ 2Îª½ð
-- nBossPosID:	BossµÄÎ»ÖÃID 0ÎªÖ÷Óª£¬1-9 ·Ö±ðÎªÓªÍâµÄ×óÖÐÓÒÈýÂ·
function BattleBoss_AddBoss(nBossID, nBossCamp, nBossPosID)
	
	if nBossID < 0 or nBossID > getn(BattleBoss_tbCommonBoss) then
		return
	end
	if nBossPosID < 0 or nBossPosID > 9 then
		return
	end
	
	local szCampName;
	local szArea    = "Area_";
	local szMapFile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));
	
	if nBossCamp == 1 then
		szArea = szArea..BT_GetGameData(GAME_CAMP1AREA);
		szCampName = "Tèng";
	elseif nBossCamp == 2 then
		szArea = szArea..BT_GetGameData(GAME_CAMP2AREA);
		szCampName = "Kim";
	else
		return		
	end
	
	-- È·¶¨BOSSµÄ×ø±ê
	local szBossPosFile = GetIniFileData(szMapFile, szArea, "bosspos");
	local nX = GetTabFileData(szBossPosFile, nBossPosID + 2, 1);
	local nY = GetTabFileData(szBossPosFile, nBossPosID + 2, 2);
	
	-- È·¶¨BOSSµÄNPCÊôÐÔ
	local nNpcID, nNpcLevel, nNpcSeries, szNpcName;
	
	if nBossID == 0 then
		-- ´óBOSS
		nNpcID     = BattleBoss_tbBigBoss[nBossCamp][1];
		nNpcLevel  = BattleBoss_tbBigBoss[nBossCamp][2];
		nNpcSeries = random(1,5)-1;
		szNpcName  = BattleBoss_tbBigBoss[nBossCamp][3];
	else
		-- ÆÕÍ¨BOSS
		nNpcID     = BattleBoss_tbCommonBoss[nBossID][1];
		nNpcLevel  = BattleBoss_tbCommonBoss[nBossID][2];
		nNpcSeries = BattleBoss_tbCommonBoss[nBossID][3];
		szNpcName  = format(BattleBoss_tbCommonBoss[nBossID][4], szCampName);	
	end
	
	-- Ôö¼ÓBOSS
	local nNpcIdx = AddNpcEx(nNpcID, nNpcLevel, nNpcSeries, SubWorld, nX*32, nY*32, 1, szNpcName, 1);
	if nNpcIdx > 0 then
		SetNpcCurCamp(nNpcIdx, nBossCamp);
		SetNpcDeathScript(nNpcIdx, "\\script\\battles\\boss\\bossset.lua");
	end
	
end

-- BOSSËÀÍö
function OnDeath(nNpcIndex)
	
	if (GetMissionV(MS_STATE) ~= 2) then
		return
	end
	
	-- Èç¹ûÊÇËÀÓÚÆäËüNpcÔò²»Í³¼ÆÅÅÐÐ
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end
	
	-- È·ÈÏÉ±ËÀµÄBOSSµÄÀà±ð 0:´íÎó 1:ÆÕÍ¨BOSS 2:BigBoss
	local nDeathBossType = 0;
	
	for i = 1,getn(BattleBoss_tbCommonBoss) do
		if GetNpcSettingIdx(nNpcIndex) == BattleBoss_tbCommonBoss[i][1] then
			nDeathBossType = 1;
			break
		end
	end
	
	for i = 1,getn(BattleBoss_tbBigBoss) do
		if GetNpcSettingIdx(nNpcIndex) == BattleBoss_tbBigBoss[i][1] then
			nDeathBossType = 2;
			break
		end
	end
	
	local nPointAward = 0;
	if nDeathBossType == 1 then
		-- ÆÕÍ¨BOSS	 
		nPointAward = 2000;
		
		if (GetCurCamp() == 1) then
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_S) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_S, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>B¸o c¸o chiÕn dÞch: Tèng binh %s võa lÊy thñ cÊp t­íng qu©n phe Kim! Sè l­îng t­íng qu©n cña phe Kim bÞ phe Tèng s¸t h¹i lµ %d.", GetName(), nNewKillBossCount));
		else
			local nNewKillBossCount = GetMissionV(MS_KILLBOSSCOUNT_J) + 1;
			SetMissionV(MS_KILLBOSSCOUNT_J, nNewKillBossCount);
			Msg2MSAll(MISSIONID, format("<color=yellow>B¸o c¸o chiÕn dÞch: Kim binh %s võa lÊy thñ cÊp t­íng qu©n phe Tèng! Sè l­îng t­íng qu©n cña phe Tèng bÞ phe Kim s¸t h¹i lµ %d.", GetName(), nNewKillBossCount));
		end
		 
	elseif nDeathBossType == 2 then
		-- ´óBOSS
		nPointAward = 4000;
		
		if GetMissionV(MS_MARSHALDEATH) == 0 then
			SetMissionV(MS_MARSHALDEATH, GetCurCamp());
		else
			SetMissionV(MS_MARSHALDEATH, 0);
		end	
		
		if (GetCurCamp() == 1) then
			Msg2MSAll(MISSIONID, format("<color=yellow>B¸o c¸o chiÕn dÞch: Tèng binh %s võa míi tiªu diÖt ®¹i t­íng qu©n phe Kim!!!", GetName()));
		else
			Msg2MSAll(MISSIONID, format("<color=yellow>B¸o c¸o chiÕn dÞch: Kim binh %s võa míi tiªu diÖt ®¹i t­íng qu©n phe Tèng!!!", GetName()));
		end
		
	else 
		 return
	end
	
	bt_addtotalpoint(nPointAward);
	mar_addmissionpoint(nPointAward);
	Msg2Player(format("§Ó tÆng th­ëng cho chiÕn c«ng giÕt BOSS, c¸c h¹ thu ®­îc phÇn th­ëng %d ®iÓm tÝch lòy!", nPointAward));
	BT_SetData(PL_KILLNPC, BT_GetData(PL_KILLNPC) + 1);
	BT_SortLadder();
	BT_BroadSelf();
	return
end

