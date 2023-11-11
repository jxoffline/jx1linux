Include([[\script\missions\chrismas\ch_head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_TIMERSTATE, 1);
	SetMissionS(MSS_MOUSENAME, "Bao quµ gi¸ng sinh"); --Ë¢³ö¹ÖÎïµÄÃû×Ö

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CH_MAPID[2]);
	
	StartMissionTimer(CH_MISSIONID, CH_RUNTIMERID, CH_RUNINTERVER); --
	StartMissionTimer(CH_MISSIONID, CH_SMALLTIMERID, CH_INTERVER);	--´ò¿ª¼ÆÊ±Æ÷
end;

function EndMission()
	local i;
	for i = 1, CH_SMALLMAPCOUNT do
		if (GetMSPlayerCount(CH_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	clearfairy();	--Çå³ý³¡µØÄÚËùÓÐµÄ¹Ö
	gameover();	--½«ËùÓÐÍæ¼ÒÇå³ý³öµØÍ¼
	strGlbNews = "C¸c hiÖp kh¸ch ®· trë vÒ råi."
	AddGlobalNews(strGlbNews);

	StopMissionTimer(CH_MISSIONID, CH_SMALLTIMERID);
	StopMissionTimer(CH_MISSIONID, CH_RUNTIMERID);
end;

function OnLeave()
	SetLogoutRV(0);
end

--ÅÅÐòº¯Êý(¸ù¾Ýµã»÷¸öÊýÓÉ¶àµ½ÉÙÈ·¶¨½«Ò»×é³ÉÔ±µÄÃû´Î)£»
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(CH_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, CH_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(CH_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_COUNT_ONETIME);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	
	local j;
	local temptab = {};
	local nCount = getn(tabPlayer);
	for i = 2, nCount do	--²ÉÓÃÒ»¸öÃ°ÅÝÅÅÐò
		for j = nCount, i, -1 do
			if (tabPlayer[j][2] > tabPlayer[j - 1][2]) then	--²ÉÓÃ½µÐòÅÅÐò
				temptab = tabPlayer[j];
				tabPlayer[j] = tabPlayer[j - 1];
				tabPlayer[j - 1] = temptab;
			end;
		end;
	end;
	local szMsg = ""
	local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1]
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", t×m ®­îc"..tabPlayer[i][2].."mãn quµ"
		end
	end
	--ÅÅÐòºó´ÓÇ°µ½ºó¾ÍÊÇÃû´ÎµÄÏÈºó
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_RANK, i);
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("B¹n xÕp h¹ng thø <color=yellow>"..i.."<color>, cã thÓ ®Õn gÆp <color=yellow>¤ng giµ Noel<color> l·nh th­ëng!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
