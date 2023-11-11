Include([[\script\missions\tong\tong_disciple\head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	StartMissionTimer(DIS_MISSIONID, DIS_RUNTIMERID, DIS_RUNINTERVER); --
	StartMissionTimer(DIS_MISSIONID, DIS_SMALLTIMERID, DIS_INTERVER);	--´ò¿ª¼ÆÊ±Æ÷
end;

function EndMission()
	local i;
	for i = 1, DIS_SMALLMAPCOUNT do
		if (GetMSPlayerCount(DIS_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	clearfairy();	--Çå³ý³¡µØÄÚËùÓÐµÄ¹Ö
	gameover(DIS_MAPID[2], DIS_MISSIONID);	--½«ËùÓÐÍæ¼ÒÇå³ý³öµØÍ¼
	strGlbNews = "Nh÷ng nh©n sü ®i chiªu mé ®Ö tö ®· quay trë vÒ, c¸c ®Ö tö trÎ trung c­êng tr¸ng lµm mäi ng­êi nhí l¹i qu¸ khø hµo hïng cña m×nh, vµ còng mõng cho t­¬ng lai cña bang héi."
	AddGlobalNews(strGlbNews);

	StopMissionTimer(DIS_MISSIONID, DIS_SMALLTIMERID);
	StopMissionTimer(DIS_MISSIONID, DIS_RUNTIMERID);
	gb_SetTask(CHRISMAS_SHREWMOUSE, 1, 0);
	SetGlbValue(GLB_DIS_PHASE, 0); 
end;

function OnLeave()
	SetLogoutRV(0);
end

--ÅÅÐòº¯Êý(¸ù¾Ýµã»÷¸öÊýÓÉ¶àµ½ÉÙÈ·¶¨½«Ò»×é³ÉÔ±µÄÃû´Î)£»
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
	
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local idx = 0;
	local pidx;
	
	local i;
	for i = 1, DIS_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(DIS_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(DIS_COUNT_ONETIME);
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
			szMsg = szMsg.."<enter> <color=green>"..i.." "..GetName()..", chiªu mé ®­îc "..tabPlayer[i][2].."c¸i"..DIS_MOUSENAME
		end
	end
	--ÅÅÐòºó´ÓÇ°µ½ºó¾ÍÊÇÃû´ÎµÄÏÈºó
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(DIS_TK_RANK, i);
		if (szMsg ~= nil and szMsg ~= "") then
			Msg2Player(szMsg)
		end
		Msg2Player("B¹n xÕp h¹ng thø <color=yellow>"..i.."<color>, cã thÓ ®Õn gÆp <color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color> ®Ó nhËn th­ëng!");
	end;
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;
