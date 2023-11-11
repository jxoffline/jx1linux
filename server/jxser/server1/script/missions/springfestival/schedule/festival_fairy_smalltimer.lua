Include([[\script\missions\springfestival\festival_head.lua]]);

function OnTimer()
	local nTimerState = GetMissionV(MS_FE_TIMERSTATE) + 1;
	SetMissionV(MS_FE_TIMERSTATE, nTimerState);	
	
	if (4 == nTimerState) then
	    festival_nianshou();
	    festival_affiche();
	end;
	
	if (nTimerState < 4) then --15ÃëÊ²Ã´ÊÂÇé¶¼²»×÷
	    return
	end;
	nTimerState = mod(nTimerState, 3);--½øÐÐ0, 1, 2Ö®¼ä×ª»»0£­Çå³ý¹Ö£¬1Ë¢¹Ö
	if (1 == nTimerState) then
		festival_putfairy();
		return
	elseif (0 == nTimerState) then
		festival_change_to_gift(FE_MAPID[2], FE_MOUSENAME);
		festival_clearfairy(FE_MOUSENAME);
		return
	elseif (2 == nTimerState) then
	    festival_givedaoju(FE_MISSIONID);
	    festival_nianshou();
	    return
	end;
end;

function festival_affiche()
    local i;
    local nCount = FE_SMALLMAPCOUNT * 2;
    for i = 1, FE_SMALLMAPCOUNT do
        Msg2MSGroup(FE_MISSIONID, "B¹n cÇn dïng 3 lo¹i '<color=yellow>Ph¸o<color>', '<color=yellow>Ph¸o chuét<color>', '<color=yellow>ph¸o th¨ng thiªn<color>' ®Ó ®uæi Qu¸i thó!", i);
    end;
    
    for i = FE_SMALLMAPCOUNT + 1, nCount do
        Msg2MSGroup(FE_MISSIONID, "HiÖn t¹i b¹n lµ Qu¸i thó, cÇn ph¶i b¾t <color=yellow>Nh÷ng ®øa bÐ ®i l¹c<color> míi nhËn ®­îc phÇn th­ëng!", i);
    end;
end;

function festival_nianshou()
    local i;
    for i = 1, FE_SMALLMAPCOUNT do
        if (GetMSPlayerCount(FE_MISSIONID, i) > 0) then
            local tabPlayers = {};
            tabPlayers = festival_getman(FE_MISSIONID, i);
            festival_make_nianshou(FE_MISSIONID, i, tabPlayers);
        end;
    end;
end;
--º¯ÊýÅÐ¶ÏÓÎÏ·ÖÐÊÇ·ñ»¹ÓÐÊÊµ±ÊýÁ¿µÄÄêÊÞ£¬·µ»ØnilÔòÄêÊÞ²»½øÐÐ±ä»¯
function festival_getman(nMissionID, nGroupID)
    local nPlayerCount = GetMSPlayerCount(nMissionID, nGroupID);
    local nNianshouCount = GetMSPlayerCount(nMissionID, nGroupID + FE_SMALLMAPCOUNT);

    local tabPlayers = {};
    local tabPlayersOne = {};
    local i;
    local idx, pidx;
    for i = 1, 2 do
        idx, pidx = GetNextPlayer(nMissionID, idx, nGroupID);
		
		if (pidx > 0) then
			tabPlayers[i] = pidx;
		end;
		
		if (idx == 0) then
			break;
		end;
    end;
    if (getn(tabPlayers) > 0) then
        tabPlayersOne[1] = tabPlayers[1];
    end;
    
    if (2 == nNianshouCount) then   --Èç¹ûÁ½¸öÄêÊÞ¶¼ÔÚ
        return nil;
    elseif (1 == nNianshouCount) then   --Èç¹ûÖ»ÓÐÒ»¸öÄêÊÞÔÚ£¬ÅÐ¶ÏÈËÊý£¬¼ÓÒ»¸öÄêÊÞ
        if (nPlayerCount >= 5) then
            return tabPlayersOne;
        end;
    elseif (0 == nNianshouCount) then   --Èç¹ûÄêÊÞ¶¼ÅÜ¹âÁË
        if (nPlayerCount >= 6) then
            return tabPlayers;
        else
            return tabPlayersOne;
        end;
    else
        return nil;
    end;
end;

function festival_make_nianshou(nMissionID, nGroupID, tabPlayers)
    if ("table" ~= type(tabPlayers)) then
        return
    end;
    local nPlayerCount = getn(tabPlayers);
    if (0 == nPlayerCount) then
        return
    end;
    local i;
    local nOldPlayer = PlayerIndex;
    for i = 1, nPlayerCount do
        PlayerIndex = tabPlayers[i];
        DelMSPlayer(nMissionID, nGroupID);
        AddMSPlayer(nMissionID, nGroupID + FE_SMALLMAPCOUNT);
        SetTask(TK_FE_GROUPID, nGroupID + FE_SMALLMAPCOUNT);
        ChangeOwnFeature(0,0,1141);  --±ä³ÉÒ¡ÆìÈË
        SetCurCamp(2);  --±ä³ÉÂÌÉ«
    end;
    PlayerIndex = nOldPlayer;
end;

--½«Ã»ÓÐµãµôµÄ×ßÊ§µÄº¢×Ó±ä³ÉÀñ°ü
function festival_change_to_gift(nMapID, szNianBoyName)
    local npcidxtab = GetMapNpcWithName(nMapID, szNianBoyName);
    if ("table" ~= type(npcidxtab)) then
        return
    end;
    local i;
    local x, y, subworld, npcidx;
    local nNPCCount = getn(npcidxtab);
    local nItemIdx = -1;
    for i = 1, nNPCCount do
        x, y, subworld = GetNpcPos(npcidxtab[i]);
        nItemIdx = DropItem(subworld, x, y, -1, 6, 1, 1050, 1, 0, 0, 0);
        if (2 >= 1) then
            SetSpecItemParam(nItemIdx, 1, 1); --1±íÊ¾ÕæµÄ£¬2±íÊ¾¼ÙµÄ
            SetSpecItemParam(nItemIdx, 2, 1); --Ö»ÈÃÒ»¸öÍæ¼Ò¼ð
        end;
    end;
end;

festival_tab_nianshou = 
{
    --{nItmeID, nItemCount},
    {1035, 0.05},
    {1036, 0.05},
    {1037, 0.05},
    {1038, 0.05},
    {1039, 0.05},
    {1040, 0.125},
    {1041, 0.2},
    {1042, 0.2},
    {1043, 0.1},
    {1044, 0.125},
    {1045, 0.05},
}

festival_tab_normal = 
{
    --{nItmeID, nItemCount},
    {1046, 0.7},
    {1047, 0.15},
    {1048, 0.15},
}

--°ÑµÀ¾ß¸øÍæ¼ÒÃÇ
function festival_givedaoju(nMissionID)
    local nOldPlayer = PlayerIndex;
    local i, j, nGroupID;
    local idx, pidx;
    idx = 0;
    local nCount = FE_SMALLMAPCOUNT * 2;
    for i = 1, nCount do
        if (GetMSPlayerCount(nMissionID, i) > 0) then
            idx = 0;
            for j = 1, 400 do
                idx, pidx = GetNextPlayer(nMissionID, idx, i);
        		if (pidx > 0) then
        		    PlayerIndex = pidx;
        		    nGroupID = GetTask(TK_FE_GROUPID);
        		    if (nGroupID <= FE_SMALLMAPCOUNT) then
        		        festival_give_Item(festival_tab_normal, 3);
        		    else
        		        festival_give_Item(festival_tab_nianshou, 3); 
        		    end;
        		end;
        		
        		if (idx == 0) then
        			break;
        		end;
    		end;
        end;
    end;
    PlayerIndex = nOldPlayer;
end;

function festival_give_Item(tabItem, nTotal) --ÆÕÍ¨Íæ¼Ò·¢µÀ¾ß
    if ("table" ~= type(tabItem)) then
        return
    end;
    
    if (0 == getn(tabItem)) then
        return
    end;
    
    local i, j;
    nTableCount = getn(tabItem);
    local nItemCount;
    local nItemID;
    for i = 1, nTableCount do
        nItemID = tabItem[i][1];
        nItemCount = tabItem[i][2] * nTotal;
        local nItemCount1 = nItemCount - floor(nItemCount);
        local nSeed = random(1, 100);
        if (nSeed <= nItemCount1 * 100) then
            nItemCount = ceil(nItemCount);
        else
            nItemCount = floor(nItemCount);
        end;
        for j = 1, nItemCount do
            AddItem(6, 1, nItemID, 1, 0, 0, 0);
        end;
    end;
end;
