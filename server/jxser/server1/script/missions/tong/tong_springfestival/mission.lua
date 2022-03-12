Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function InitMission()
	local i;
	for i = 1, 40 do
		SetMissionV(i, 0);
	end;
	
	for i = 1, 10 do
		SetMissionS(i, "");
	end;
	
	SetMissionV(MS_SF_TIMERSTATE, 1);

	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[2]);
	
	StartMissionTimer(SF_MISSIONID, SF_FAIRY_SMALLTIMERID, SF_INTERVER);	--Ë¢¹Ö¼ÆÊ±Æ÷
	StartMissionTimer(SF_MISSIONID, SF_REPORT_SMALLTIMERID, SF_RUNINTERVER);     --±¨µÀ¼ÆÊ±Æ÷
end;

function EndMission()
	local i;
	for i = 1, SF_SMALLMAPCOUNT do
		if (GetMSPlayerCount(SF_MISSIONID, i + SF_SMALLMAPCOUNT) > 0 or
		    GetMSPlayerCount(SF_MISSIONID, i) > 0) then
			groupsort(i);
		end;
	end;
	festival_gameover(SF_MAPID[2], SF_MISSIONID);	--½«ËùÓÐÍæ¼ÒÇå³ý³öµØÍ¼
	strGlbNews = format("C¸c dòng sü bang héi ®i truy ®uæi %s ®· trë vÒ, lÇn nµy tuy ®· diÖt trõ ®­îc %s, nh­ng tµ khÝ cña nã vÉn cßn tån t¹i.", SF_ANIMALNAME, SF_ANIMALNAME);
	AddGlobalNews(strGlbNews);
	
	ClearMapObj(SF_MAPID[2]);

	StopMissionTimer(SF_MISSIONID, SF_FAIRY_SMALLTIMERID);
	StopMissionTimer(SF_MISSIONID, SF_REPORT_SMALLTIMERID);
	SetGlbValue(GLB_SF_PHASE, 0); 
	gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 0);
end;

function OnLeave()
	SetLogoutRV(0);
end

--ÅÅÐòº¯Êý(¸ù¾Ýµã»÷¸öÊýÓÉ¶àµ½ÉÙÈ·¶¨½«Ò»×é³ÉÔ±µÄÃû´Î)£»
function groupsort(nGroupId)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[2]);
	
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
	for i = 1, SF_MAXPLAYERCOUNT do
		idx, pidx = GetNextPlayer(SF_MISSIONID, idx, nGroupId);
		
		if (pidx > 0) then
			tabPlayer[i] = {};
			tabPlayer[i][1] = pidx;
			PlayerIndex = pidx;
			tabPlayer[i][2] = GetTask(SF_COUNT_ONETIME);
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
			if (nGroupId > SF_SMALLMAPCOUNT) then
			    tabMsg[i + nMsgCount] = format("<color=green>XÕp h¹ng %d: %s, b¾t ®­îc %d %s", i, GetName(), tabPlayer[i][2], SF_MOUSENAME);
			else
			    tabMsg[i + nMsgCount] = format("<color=orange>XÕp h¹ng %d: %s, ®¸nh tróng %s %d lÇn",i,GetName(),SF_ANIMALNAME, tabPlayer[i][2]);
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
		SetTask(SF_TK_RANK, i);
		for j = 1, nMsgCount do
		    Msg2Player(tabMsg[j]);
		end;
		if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
    		Msg2Player("B¹n lµ ng­êi thø <color=yellow>"..i.."<color> nh©n sü tham gia b¾t niªn thó cã thÓ ®Õn <color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color> ®Ó nhËn th­ëng!");
    	else
    	    Msg2Player("B¹n lµ ng­êi ®¸nh tróng Qu¸i thó <color=yellow>"..i.."<color>, cã thÓ ®Õn gÆp <color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color> ®Ó nhËn th­ëng!");
    	end;
	end;
end;