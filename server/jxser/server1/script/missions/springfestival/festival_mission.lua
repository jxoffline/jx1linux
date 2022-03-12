Include([[\script\missions\springfestival\festival_head.lua]]);

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_FE_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(FE_MAPID[2]);
	
	StartMissionTimer(FE_MISSIONID, FE_FAIRY_SMALLTIMERID, FE_INTERVER);	--Ë¢¹Ö¼ÆÊ±Æ÷
	StartMissionTimer(FE_MISSIONID, FE_REPORT_SMALLTIMERID, FE_RUNINTERVER);     --±¨µÀ¼ÆÊ±Æ÷
end;

function EndMission()
	local i;
	for i = 1, FE_SMALLMAPCOUNT do
		if (GetMSPlayerCount(FE_MISSIONID, i + FE_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(FE_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	festival_gameover(FE_MAPID[2], FE_MISSIONID);	--½«ËùÓÐÍæ¼ÒÇå³ý³öµØÍ¼
	strGlbNews = "c¸c hiÖp sÜ ®i t×m"..FE_MOUSENAME.." ®· trë vÒ.";
	AddGlobalNews(strGlbNews);
	
	ClearMapObj(FE_MAPID[2]);

	StopMissionTimer(FE_MISSIONID, FE_FAIRY_SMALLTIMERID);
	StopMissionTimer(FE_MISSIONID, FE_REPORT_SMALLTIMERID);
end;

function OnLeave()
	SetLogoutRV(0);
end

--ÅÅÐòº¯Êý(¸ù¾Ýµã»÷¸öÊýÓÉ¶àµ½ÉÙÈ·¶¨½«Ò»×é³ÉÔ±µÄÃû´Î)£»
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(FE_MAPID[2]);
	
	local nGroupId_nianshou = festival_getgroupid(nGroupId);
	
	local OldPlayer = PlayerIndex;
	local tabNormalPlayer = {};
	tabNormalPlayer = festival_sort(nGroupId);
	local tabMsg = {}
	local nMsgCount;
	tabMsg, nMsgCount = festival_getsz(tabMsg, 0, tabNormalPlayer, nGroupId);
	
	local tabNianshouPlayer = {};
	tabNianshouPlayer = festival_sort(nGroupId_nianshou);
	tabMsg, nMsgCount = festival_getsz(tabMsg, nMsgCount, tabNianshouPlayer, nGroupId_nianshou);
	
	festival_broadcast(tabMsg, nMsgCount, tabNormalPlayer);
	festival_broadcast(tabMsg, nMsgCount, tabNianshouPlayer);
	
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

function festival_sort(nGroupId)
    local tabPlayer = {};
    local idx = 0;
	local pidx;
    local i;
	for i = 1, FE_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(FE_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(TK_FE_COUNT_ONETIME);
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
	return tabPlayer;
end;

function festival_getsz(tabMsg, nMsgCount, tabPlayer, nGroupId)
    local nRankCount = getn(tabPlayer);
	if (nRankCount > 3) then
		nRankCount = 3;
	end;
	local i;
	for i=1,nRankCount do
		if ( tabPlayer[i][1] ~= nil ) then
			PlayerIndex = tabPlayer[i][1];
			if (nGroupId > FE_SMALLMAPCOUNT) then
			    tabMsg[i + nMsgCount] = "<color=green>thø "..i.." "..GetName()..", b¾t ®­îc"..tabPlayer[i][2].."c¸i"..FE_MOUSENAME;
			else
			    tabMsg[i + nMsgCount] = "<color=orange>thø "..i.." "..GetName()..", ®¸nh tróng"..FE_ANIMALNAME..tabPlayer[i][2].."lÇn";
			end;
		end
	end
	nMsgCount = getn(tabMsg);
	if (nMsgCount > 0) then
	    tabMsg[nMsgCount] = tabMsg[nMsgCount];
	end;
	return tabMsg, nMsgCount;
end;

function festival_broadcast(tabMsg, nMsgCount, tabPlayer)
    nCount = getn(tabPlayer);
    local i, j;
    --ÅÅÐòºó´ÓÇ°µ½ºó¾ÍÊÇÃû´ÎµÄÏÈºó
	for i = 1, nCount do
		PlayerIndex = tabPlayer[i][1];
		SetTask(TK_FE_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
    		Msg2Player("B¹n lµ ng­êi thø <color=yellow>"..i.."<color> tho¸t khái Qu¸i thó nhËp vµo ng­êi, cã thÓ ®Õn gÆp <color=yellow>Sai dÞch Nha m«n<color> ®Ó nhËn quµ th­ëng bÊt ngê ");
    	else
    	    Msg2Player("B¹n lµ ng­êi ®¸nh tróng Qu¸i thó <color=yellow>"..i.."<color> lÇn, cã thÓ ®Õn <color=yellow>Sai dÞch Nha m«n<color> nhËn phÇn th­ëng!");
    	end;
	end;
end;