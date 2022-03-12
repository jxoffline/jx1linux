Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");

function OnTimer()
	local nNewsValue = GetMissionV(MS_SF_PREPARENEWSVALUE) + 1;
	SetMissionV(MS_SF_PREPARENEWSVALUE, nNewsValue);
	
	local nRemain = 5 - floor(nNewsValue / 2);
	if (10 == nNewsValue) then --5·ÖÖÓ£¬ÈÃÍæ¼Ò½ø³¡
		local OldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2]);
		OpenMission(SF_MISSIONID)
		SetGlbValue(GLB_SF_PHASE, 2); --½ûÖ¹ÔÙ½øÀ´±¨Ãû
		gb_SetTask(FESTIVAL_SHREWMOUSE, 1, 2);
		if (players_entrance() == 0) then
			SubWorld = SubWorldID2Idx(SF_MAPID[2]);
			CloseMission(SF_MISSIONID);
		end;
		SubWorld = SubWorldID2Idx(SF_MAPID[1]);
		CloseMission(SF_PREPAREMISSIONID);
		SubWorld = OldSubWorld;
		return
	elseif (0 == mod(nNewsValue, 2)) then
		if (nRemain > 0) then
			Msg2MSAll(SF_PREPAREMISSIONID, format("Ho¹t ®éng sÏ b¾t ®Çu sau %d phót!",nRemain));
		end;
	elseif (9 == nNewsValue) then
        Msg2MSAll(SF_PREPAREMISSIONID, "chØ cßn 30 gi©y n÷a ho¹t ®éng sÏ b¾t ®Çu!");
	end;
end;

--Ò»ÏÂº¯ÊýÖ»ÔÚÕâ¸öÎÄ¼þÓÃµ½ËùÒÔ£¬²»Ð´µ½headÀï
function players_entrance() -- Ëæ»úÈÃÍæ¼Ò½øÈëµ½³¡µØ£»
	local tabPlayerIdx = {};
	local pidx = 0;
	local idx = 0;
	local i;
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(SF_MAPID[1]);

	for i = 1, 500 do
		idx, pidx = GetNextPlayer(SF_PREPAREMISSIONID, idx, 0);
		if (pidx > 0) then
			tinsert(tabPlayerIdx, pidx);
		end;
		
		if (idx == 0) then
			break;
		end;
	end;
	SubWorld = OldSubWorld;
	if (getn(tabPlayerIdx) < 5) then
		cancelgame(SF_MAPID[1], SF_PREPAREMISSIONID);
		return 0;
	end;
	--½øÐÐ»ìÂÒ
	local tabSubTeam = chaos(tabPlayerIdx, SF_MAXPLAYERCOUNT);
	local nBeginMap = random(1, SF_SMALLMAPCOUNT);
	SetMissionV(MS_BEGINGMAPID, nBeginMap);
	SetMissionV(MS_SF_GAMECOUNT, getn(tabSubTeam));
	
--tabParam = {×¼±¸³¡ID, {ÐèÒªµÄ¹±Ï×¶È, ×ø±êÎÄ¼þ}, {ÉèÖÃÎªÁãµÄÈÎÎñ±äÁ¿...}, {groupÖµ, ¿ªÊ¼µØÍ¼map, MissionID, »î¶¯ËùÔÚmap}}
	local tabParam = {};
	for i = 1, getn(tabSubTeam) do
		local nGroup = i;
		local nMap = nBeginMap + i - 1;
		nMap = mod(nMap, SF_SMALLMAPCOUNT) + 1;
		tabParam = {SF_MAPID[1], {TONGGXD[2][1], [[\settings\maps\springfestival2006\player.txt]]}, {SF_COUNT_ONETIME, SF_TK_RANK, TK_ATTACKED_TIMES, TK_ATTACKED_INTERVER}, {nGroup, nMap, SF_MISSIONID, SF_MAPID[2]}};
		gogamemap(tabSubTeam[i], tabParam);
	end;
	return 1;
end;
