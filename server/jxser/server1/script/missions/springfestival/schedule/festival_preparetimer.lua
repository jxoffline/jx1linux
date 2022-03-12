Include([[\script\missions\springfestival\festival_head.lua]]);
fest_head_MISSIONID = FE_MISSIONID;
fest_head_GameMapID = FE_MAPID[2];
fest_head_PrepareMapID = FE_MAPID[1];

function OnTimer()
	local nNewsValue = GetMissionV(MS_FE_PREPARENEWSVALUE) + 1;
	SetMissionV(MS_FE_PREPARENEWSVALUE, nNewsValue);
	
	local nRemain = 5 - floor(nNewsValue / 2);
	if (10 == nNewsValue) then --5分钟，让玩家进场
		local OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(fest_head_GameMapID);
		OpenMission(FE_MISSIONID)
		players_entrance(fest_head_PrepareMapID, FE_PREPAREMISSIONID, FE_MAXPLAYERCOUNT, MS_FE_BEGINGMAPID, FE_SMALLMAPCOUNT)
		SubWorld = SubWorldID2Idx(fest_head_PrepareMapID);
		CloseMission(FE_PREPAREMISSIONID);
		gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
		SubWorld = OldSubWorld;
		return
	elseif (0 == mod(nNewsValue, 2)) then
		if (nRemain > 0) then
			Msg2MSAll(FE_PREPAREMISSIONID, "c遪"..nRemain.."ph髏 b総 u Thi u!");
		end;
	elseif (9 == nNewsValue) then
        Msg2MSAll(FE_PREPAREMISSIONID, "C遪 30 ph髏 n鱝 b総 u!");
	end;
end;

--一下函数只在这个文件用到所以，不写到head里
function players_entrance(nPrePareMapID, nPrePareMissionID, nMaxPlayerCount, nMIDBeginMapID, nGameCount) -- 随机让玩家进入到场地；
	local tabPlayerIdx = {};
	local pidx = 0;
	local idx = 0;
	local i;
	local j = 1;
	
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nPrePareMapID);
	if (0 >= GetMSPlayerCount(nPrePareMissionID, 0)) then
		return
	end;

	for i = 1, 500 do
		idx, pidx = GetNextPlayer(nPrePareMissionID, idx, 0);
		
		if (pidx > 0) then
			tabPlayerIdx[j] = pidx;
			j = j + 1;
		end;
		
		if (idx == 0) then
			break;
		end;
	end;
	SubWorld = OldSubWorld;
	
	--进行混乱
	local tabSubTeam = chaos(tabPlayerIdx, FE_MAXPLAYERCOUNT);
	j = getn(tabSubTeam);
	if (nMaxPlayerCount < 1) then
	    nMaxPlayerCount = 1;
	end;
	local nBeginMap = random(1, nGameCount);
	SetMissionV(nMIDBeginMapID, nBeginMap);
	for i = 1, j do
		local nGroup = i;
		local nMap = nBeginMap + i - 1;
		nMap = mod(nMap, nGameCount) + 1;
		gogamemap(tabSubTeam[i], nGroup, nMap);
	end;
end;

function chr_rand_tab(tab)
  local tab_size = getn(tab)
 for i = 1, tab_size do 
	m1 = random(1,tab_size)
	m2 = random(1,tab_size)
	m = tab[m1] ;
	tab[m1] = tab[m2]
	tab[m2] = m
 end
end

function chaos(tabPlayerIdx, nMaxPlayerCount) --打乱玩家的顺序,分成10个人的一个小分队
	if ("table" ~= type(tabPlayerIdx)) then
		error("tabPlayerIdx is not a table value!");
	end;
	chr_rand_tab(tabPlayerIdx)
	local nPCount = getn(tabPlayerIdx);
	local subTabCount = floor(nPCount / nMaxPlayerCount);
	local tabSubTeam = {};
	local i, j;
	local nIndex;
	local nBeginPlayer = random(1, nPCount);
	
	--将能筹齐10个人的入场
	for i = 1, subTabCount do
		tabSubTeam[i] = {}
		for j = 1, nMaxPlayerCount do
			local nIndex = subTabCount * (j - 1) + i + nBeginPlayer - 1;
			nIndex = mod(nIndex - 1, nPCount) + 1
			tabSubTeam[i][j] = tabPlayerIdx[nIndex];
		end;
	end;
	--不足10个人的进行轮空
	tabSubTeam[subTabCount + 1] = {};
	j = 1;
	local nBegin = nMaxPlayerCount * subTabCount + 1;
	for i = nBegin, nPCount do
		nIndex = i  + nBeginPlayer - 1; 
		nIndex = mod(nIndex - 1, nPCount) + 1;
		tabSubTeam[subTabCount + 1][j] = tabPlayerIdx[nIndex];
		j = j + 1;
	end;
	SetMissionV(MS_FE_GAMECOUNT, getn(tabSubTeam));
	return tabSubTeam;
end;

function gogamemap(tabPlayerIdx, nGroupId, nBeginMap) --
	if ("table" ~= type(tabPlayerIdx)) then
		return
	end;
	local OldSubWorld = SubWorld;
	local nPCount = getn(tabPlayerIdx);
	local OldPlayer = PlayerIndex;
	local i, j;
	SubWorld = SubWorldID2Idx(fest_head_PrepareMapID);
	for i = 1, nPCount do
		PlayerIndex = tabPlayerIdx[i];
		if (PlayerIndex > 0) then
    		SetTask(TK_FE_COUNT_ONETIME, 0);	--将一场比赛的个数清0；
    		SetTask(TK_FE_RANK, 0);	--将排名清0
    		SetTask(TK_FE_ATTACKED_TIMES, 0);
    		SetTask(TK_FE_ATTACKED_INTERVER, 0);
			SetTask(TK_FE_GROUPID, nGroupId);	--记录玩家的groupid
			local szFile = [[\settings\maps\]]..FE_MAPPOINTFLORDER..[[\player.txt]];
			local PosX, PosY = getadatabetween(szFile, 8 + 8 * nBeginMap, 15 + 8 * nBeginMap);
			NewWorld(fest_head_GameMapID, floor(PosX / 32), floor(PosY / 32));
			SubWorld = SubWorldID2Idx(fest_head_GameMapID);
			AddMSPlayer(fest_head_MISSIONID, nGroupId);
		end;
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;