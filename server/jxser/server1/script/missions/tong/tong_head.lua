if (1) then -- not __TONG_H__) then
	__TONG_H__ = 1;
IL("TONG");
IncludeLib("FILESYS");
Include("\\script\\missions\\tong\\tong_springfestival\\file_npc_head.lua")
-- Include([[\script\tong\workshop\ws_huodong.lua]]);


SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];
HUODONG_TASKID = {{1015, 1016}, {1017, 1018}, {1019, 1020}};
TONGGXD = {{800, 4}, {500, 6}, {300, 8}};

--=========ÈÎÎñ±äÁ¿===============
TK_LEAVERMAPID = 2392;	--´æ´¢Àë¿ªÓÎÏ·µÄmapid
TK_LEAVERPOSX = 2393;	--´æ´¢Àë¿ªÓÎÏ·µÄx×ø±êµã
TK_LEAVERPOSY = 2394;	--´æ´¢Àë¿ªÓÎÏ·µÄy×ø±êµã

TK_GROUPID = 2399;	--¼ÇÂ¼Íæ¼ÒµÄGroupºÅ
TK_EXP_BEISHU = 2400; --
TK_EXP_TIME = 2401;
--================================
	
function FALSE(nParam)
	if (nParam == nil or nParam == "" or nParam == 0) then
		return 0;
	end;
	return 1;
end

function festival_tongjudge(nType, nTongID, nWorkshopID)--ÅÐ¶ÏÊÇ·ñ¾ßÓÐ×Ê¸ñnType:1-ÕÐÄ¼µÜ×Ó2-ÄêÊÞ
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID)
	local nPCount = TONG_GetMemberCount(nTongID, -1);
	if (nLevel < 1 or nLevel > 10) then
		Say("QuÝ bang vÉn ch­a x©y dùng T¸c Ph­êng nµy.", 1, "Ta biÕt råi!/OnCancel")
		return 0;
	end;
	--local njoinrate = tonumber(GetTabFileData(SFHD_DATAFILE, nLevel + 2, TONGGXD[nType][2]));
	local nMax = 20 --ceil(nPCount * njoinrate);
	local nTimes = TWS_GetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1]);
	local nDay = tonumber(GetLocalDate("%d"));
	TDay = TWS_GetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][2]);
	if (nDay ~= TDay) then
		TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][2], nDay);
		TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1], 0);
	end;
	if (nTimes >= nMax) then
		Say("Bang héi h«m nay kh«ng cã ho¹t ®éng nµo, ngµy kh¸c h·y ®Õn t×m ta.", 1, "Ta biÕt råi!/OnCancel")
		return 0;
	end;
	
	TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1], nTimes + 1);	
	
	local nGXD = GetContribution();
	if (nGXD < TONGGXD[nType][1]) then
		Say("Tæng qu¶n Ho¹t ®éng ph­êng: §iÓm cèng hiÕn cña ng­¬i kh«ng ®ñ"..TONGGXD[nType][1]..", kh«ng thÓ tham gia ho¹t ®éng.", 1, "Ta biÕt råi!/OnCancel")
		TWS_ApplySetTaskValue(nTongID, nWorkshopID, HUODONG_TASKID[nType][1], nTimes); --²»³É¹¦ÈËÊý²»¼Ó
		return 0;
	end;
	
	return 1;
end;



--Èý¸ö»î¶¯Èë³¡Ê±µÄ·Ö×é
function chaos(tabPlayerIdx, nMax) --´òÂÒÍæ¼ÒµÄË³Ðò,·Ö³É10¸öÈËµÄÒ»¸öÐ¡·Ö¶Ó
	if ("table" ~= type(tabPlayerIdx)) then
		error("tabPlayerIdx is not a table value!");
	end;
	chr_rand_tab(tabPlayerIdx)
	local nPCount = getn(tabPlayerIdx);
	local subTabCount = floor(nPCount / nMax);
	local tabSubTeam = {};
	local i, j;
	local nIndex;
	local nBeginPlayer = random(1, nPCount);
	
	--½«ÄÜ³ïÆë10¸öÈËµÄÈë³¡
	for i = 1, subTabCount do
		tabSubTeam[i] = {}
		for j = 1, nMax do
			local nIndex = subTabCount * (j - 1) + i + nBeginPlayer - 1;
			nIndex = mod(nIndex - 1, nPCount) + 1
			tabSubTeam[i][j] = tabPlayerIdx[nIndex];
		end;
	end;
	--²»×ã10¸öÈËµÄ·Åµ½ÁíÍâÒ»¸öÐ¡×éÀï
	tabSubTeam[subTabCount + 1] = {};
	j = 1;
	local nBegin = nMax * subTabCount + 1;
	for i = nBegin, nPCount do
		nIndex = i  + nBeginPlayer - 1; 
		nIndex = mod(nIndex - 1, nPCount) + 1;
		tabSubTeam[subTabCount + 1][j] = tabPlayerIdx[nIndex];
		j = j + 1;
	end;
	return tabSubTeam;
end;

function cancelgame(nMapID, nMissionID)
	local OldWorld = SubWorld;
	SubWorld = SubWorldID2Idx(nMapID);
	local pidx;
	local idx = 0;
	local OldPlayer = PlayerIndex;
	local tabPlayer = {};
	local i;
	for i = 1, 400 do
		idx, pidx = GetNextPlayer(nMissionID, idx, 0);
		if (pidx > 0) then
			tinsert(tabPlayer, pidx);
		end;
		
		if (0 == idx) then
			break;
		end;
	end;
	local nLoop = getn(tabPlayer);
	for i = 1, nLoop do
		PlayerIndex = tabPlayer[i];
		Say("Do sè ng­êi b¸o danh tham gia Ýt h¬n <color=yellow>5<color> ng­êi, ho¹t ®éng lÇn nµy bÞ hñy bá.", 1, "Ta biÕt råi!/OnCancel")
		Msg2Player("Do sè ng­êi b¸o danh tham gia Ýt h¬n <color=yellow>5<color> ng­êi, ho¹t ®éng lÇn nµy bÞ hñy bá.");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldWorld;
end;

--tabParam = {×¼±¸³¡ID, {ÐèÒªµÄ¹±Ï×¶È, ×ø±êÎÄ¼þ}, {ÉèÖÃÎªÁãµÄÈÎÎñ±äÁ¿...}, {groupÖµ, ¿ªÊ¼µØÍ¼map, MissionID, »î¶¯ËùÔÚmap}}
--tabParam = {nPrepareMapID, {nContri, szFile}, {}, 
--				{nGroupId, nBeginMap, nMissionID, nMissionMap}}
function gogamemap(tabPlayerIdx, tabParam) --
	if ("table" ~= type(tabPlayerIdx)) then
		return
	end;
	local OldSubWorld = SubWorld;
	local nPCount = getn(tabPlayerIdx);
	local OldPlayer = PlayerIndex;
	local nContri, i, PosX, PosY;
	SubWorld = SubWorldID2Idx(tabParam[1]);
	for i = 1, nPCount do
		PlayerIndex = tabPlayerIdx[i];
		if (PlayerIndex > 0) then
				--ÔÚÕâÀï¿Û³ý°ï»á¹±Ï×¶È
			nContri = GetContribution();
			if (nContri < tabParam[2][1]) then
				Say("§iÓm cèng hiÕn kh«ng ®ñ"..tabParam[2][1]..", kh«ng thÓ tham gia ho¹t ®éng.", 1, "Ta biÕt råi!/OnCancel");
				DelMSPlayer(tabParam[4][3], PlayerIndex, 0);
				Msg2Player("§iÓm cèng hiÕn kh«ng ®ñ"..tabParam[2][1]..", kh«ng thÓ tham gia ho¹t ®éng.");
				NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
			else
				Msg2Player("Tham gia ho¹t ®éng ph­êng cña bang, tiªu hao <color=red>®iÓm cèng hiÕn bang héi<color><color=yellow> "..tabParam[2][1].."<color>.")
				AddContribution(-1 * tabParam[2][1]);--½ø³¡Ê±¿Û³ý¹±Ï×¶È

				for j = 1, getn(tabParam[3]) do
					SetTask(tabParam[3][j], 0);
				end;
				SetTask(TK_GROUPID, tabParam[4][1]);	--¼ÇÂ¼Íæ¼ÒµÄgroupid

				PosX, PosY = getadatabetween(tabParam[2][2], 8 + 8 * tabParam[4][2], 15 + 8 * tabParam[4][2]);
				NewWorld(tabParam[4][4], floor(PosX / 32), floor(PosY / 32));
				SubWorld = SubWorldID2Idx(tabParam[4][4]);
				AddMSPlayer(tabParam[4][3], tabParam[4][1]);
			end;
		end;
	end;
	PlayerIndex = OldPlayer;
	SubWorld = OldSubWorld;
end;

function chr_rand_tab(tab)
	local tab_size = getn(tab);
	for i = 1, tab_size do
		m1 = random(1,tab_size);
		m2 = random(1,tab_size);
		m = tab[m1];
		tab[m1] = tab[m2];
		tab[m2] = m;
	end;
end;

function OnCancel()
end;


end; --//end of __TONG_H__